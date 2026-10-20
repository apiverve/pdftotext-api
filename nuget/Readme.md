PDF to Text API
============

PDF to Text extracts the text layer of a PDF, uploaded or fetched from a URL, and returns it as plain text with the page, word and character counts. Paid plans add the text of each page separately and the document metadata, such as title, author and creation date.


[![NuGet version](https://img.shields.io/nuget/v/APIVerve.API.PDFtoText.svg)](https://www.nuget.org/packages/APIVerve.API.PDFtoText)

This is a .NET wrapper for the [PDF to Text API](https://apiverve.com/marketplace/pdftotext?utm_source=nuget&utm_medium=referral&utm_content=readme)

---

## Installation

Using the .NET CLI:
```
dotnet add package APIVerve.API.PDFtoText
```

Using the Package Manager:
```
nuget install APIVerve.API.PDFtoText
```

Using the Package Manager Console:
```
Install-Package APIVerve.API.PDFtoText
```

From within Visual Studio:

1. Open the Solution Explorer
2. Right-click on a project within your solution
3. Click on Manage NuGet Packages
4. Click on the Browse tab and search for "APIVerve.API.PDFtoText"
5. Click on the APIVerve.API.PDFtoText package, select the appropriate version in the right-tab and click Install

---

## Configuration

Before using the PDF to Text API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=nuget&utm_medium=referral&utm_content=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```csharp
using System;
using System.IO;
using System.Net.Http;
using APIVerve.API.PDFtoText;

class Program
{
    static async Task Main(string[] args)
    {
        // Initialize the API client
        var apiClient = new PDFtoTextAPIClient("[YOUR_API_KEY]");

        // This API requires a file upload
        using var content = new MultipartFormDataContent();
        using var fileStream = File.OpenRead("/path/to/image.jpg");
        content.Add(new StreamContent(fileStream), "pdf", "image.jpg");

        // Make the API call
        try
        {
            var response = await apiClient.ExecuteWithFileAsync(content);

            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
            }
            else
            {
                Console.WriteLine("Success!");
                // Access response data using the strongly-typed ResponseObj properties
                Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Exception: {ex.Message}");
        }
    }
}
```

---

## Usage

The PDF to Text API documentation is found here: [https://docs.apiverve.com/ref/pdftotext](https://docs.apiverve.com/ref/pdftotext?utm_source=nuget&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

###### Authentication
PDF to Text API uses API Key-based authentication. When you create an instance of the API client, you can pass your API Key as a parameter.

```csharp
// Create an instance of the API client
var apiClient = new PDFtoTextAPIClient("[YOUR_API_KEY]");
```

---

## Usage Examples

### Basic Usage (Async/Await Pattern - Recommended)

The modern async/await pattern provides the best performance and code readability:

```csharp
using System;
using System.IO;
using System.Net.Http;
using System.Threading.Tasks;
using APIVerve.API.PDFtoText;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new PDFtoTextAPIClient("[YOUR_API_KEY]");

        // This API requires a file upload
        using var content = new MultipartFormDataContent();
        using var fileStream = File.OpenRead("/path/to/image.jpg");
        content.Add(new StreamContent(fileStream), "pdf", "image.jpg");

        var response = await apiClient.ExecuteWithFileAsync(content);

        if (response.Error != null)
        {
            Console.WriteLine($"Error: {response.Error}");
        }
        else
        {
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
    }
}
```

### Synchronous Usage

If you need to use synchronous code, you can use the `Execute` method:

```csharp
using System;
using System.IO;
using System.Net.Http;
using APIVerve.API.PDFtoText;

public class Example
{
    public static void Main(string[] args)
    {
        var apiClient = new PDFtoTextAPIClient("[YOUR_API_KEY]");

        // This API requires a file upload
        using var content = new MultipartFormDataContent();
        using var fileStream = File.OpenRead("/path/to/image.jpg");
        content.Add(new StreamContent(fileStream), "pdf", "image.jpg");

        var response = apiClient.ExecuteWithFile(content);

        if (response.Error != null)
        {
            Console.WriteLine($"Error: {response.Error}");
        }
        else
        {
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
    }
}
```

---

## Error Handling

The API client provides comprehensive error handling. Here are some examples:

### Handling API Errors

```csharp
using System;
using System.IO;
using System.Net.Http;
using System.Threading.Tasks;
using APIVerve.API.PDFtoText;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new PDFtoTextAPIClient("[YOUR_API_KEY]");

        // This API requires a file upload
        using var content = new MultipartFormDataContent();
        using var fileStream = File.OpenRead("/path/to/image.jpg");
        content.Add(new StreamContent(fileStream), "pdf", "image.jpg");

        try
        {
            var response = await apiClient.ExecuteWithFileAsync(content);

            // Check for API-level errors
            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
                Console.WriteLine($"Status: {response.Status}");
                return;
            }

            // Success - use the data
            Console.WriteLine("Request successful!");
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
        catch (ArgumentException ex)
        {
            // Invalid API key or parameters
            Console.WriteLine($"Invalid argument: {ex.Message}");
        }
        catch (System.Net.Http.HttpRequestException ex)
        {
            // Network or HTTP errors
            Console.WriteLine($"Network error: {ex.Message}");
        }
        catch (Exception ex)
        {
            // Other errors
            Console.WriteLine($"Unexpected error: {ex.Message}");
        }
    }
}
```

### Comprehensive Error Handling with Retry Logic

```csharp
using System;
using System.IO;
using System.Net.Http;
using System.Threading.Tasks;
using APIVerve.API.PDFtoText;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new PDFtoTextAPIClient("[YOUR_API_KEY]");

        // Configure retry behavior (max 3 retries)
        apiClient.SetMaxRetries(3);        // Retry up to 3 times (default: 0, max: 3)
        apiClient.SetRetryDelay(2000);     // Wait 2 seconds between retries

        // This API requires a file upload
        using var content = new MultipartFormDataContent();
        using var fileStream = File.OpenRead("/path/to/image.jpg");
        content.Add(new StreamContent(fileStream), "pdf", "image.jpg");

        try
        {
            var response = await apiClient.ExecuteWithFileAsync(content);

            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
            }
            else
            {
                Console.WriteLine("Success!");
                Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Failed after retries: {ex.Message}");
        }
    }
}
```

---

## Advanced Features

### Custom Headers

Add custom headers to your requests:

```csharp
var apiClient = new PDFtoTextAPIClient("[YOUR_API_KEY]");

// Add custom headers
apiClient.AddCustomHeader("X-Custom-Header", "custom-value");
apiClient.AddCustomHeader("X-Request-ID", Guid.NewGuid().ToString());

// This API requires a file upload
using var content = new MultipartFormDataContent();
using var fileStream = File.OpenRead("/path/to/image.jpg");
content.Add(new StreamContent(fileStream), "pdf", "image.jpg");

var response = await apiClient.ExecuteWithFileAsync(content);

// Remove a header
apiClient.RemoveCustomHeader("X-Custom-Header");

// Clear all custom headers
apiClient.ClearCustomHeaders();
```

### Request Logging

Enable logging for debugging:

```csharp
var apiClient = new PDFtoTextAPIClient("[YOUR_API_KEY]", isDebug: true);

// Or use a custom logger
apiClient.SetLogger(message =>
{
    Console.WriteLine($"[LOG] {DateTime.Now:yyyy-MM-dd HH:mm:ss} - {message}");
});

// This API requires a file upload
using var content = new MultipartFormDataContent();
using var fileStream = File.OpenRead("/path/to/image.jpg");
content.Add(new StreamContent(fileStream), "pdf", "image.jpg");

var response = await apiClient.ExecuteWithFileAsync(content);
```

### Retry Configuration

Customize retry behavior for failed requests:

```csharp
var apiClient = new PDFtoTextAPIClient("[YOUR_API_KEY]");

// Set retry options
apiClient.SetMaxRetries(3);           // Retry up to 3 times (default: 0, max: 3)
apiClient.SetRetryDelay(1500);        // Wait 1.5 seconds between retries (default: 1000ms)

// This API requires a file upload
using var content = new MultipartFormDataContent();
using var fileStream = File.OpenRead("/path/to/image.jpg");
content.Add(new StreamContent(fileStream), "pdf", "image.jpg");

var response = await apiClient.ExecuteWithFileAsync(content);
```

### Dispose Pattern

The API client implements `IDisposable` for proper resource cleanup:

```csharp
// This API requires a file upload
using var content = new MultipartFormDataContent();
using var fileStream = File.OpenRead("/path/to/image.jpg");
content.Add(new StreamContent(fileStream), "pdf", "image.jpg");

using (var apiClient = new PDFtoTextAPIClient("[YOUR_API_KEY]"))
{
    var response = await apiClient.ExecuteWithFileAsync(content);
    Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
}
// HttpClient is automatically disposed here
```

---

## Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "text": "Table Of Content\nChapter 1 .......................................................... 2\nParagraph 1.1 ...................................................... 3\npage 1 / 3\n\nChapter 1\npage 2 / 3\n\nParagraph 1.1\nPowered by TCPDF (www.tcpdf.org)\npage 3 / 3",
    "pageCount": 3,
    "pagesExtracted": 3,
    "truncated": false,
    "hasText": true,
    "wordCount": 31,
    "characterCount": 250,
    "pages": [
      {
        "page": 1,
        "text": "Table Of Content\nChapter 1 .......................................................... 2\nParagraph 1.1 ...................................................... 3\npage 1 / 3",
        "wordCount": 15
      },
      {
        "page": 2,
        "text": "Chapter 1\npage 2 / 3",
        "wordCount": 6
      },
      {
        "page": 3,
        "text": "Paragraph 1.1\nPowered by TCPDF (www.tcpdf.org)\npage 3 / 3",
        "wordCount": 10
      }
    ],
    "metadata": {
      "title": "Basic API Test",
      "author": "Brendan Dahl",
      "subject": null,
      "creator": "pdf.js",
      "producer": "TCPDF 5.9.133 (http://www.tcpdf.org)",
      "creationDate": "2012-04-10T21:30:26.000Z",
      "modificationDate": "2012-04-10T21:30:26.000Z",
      "pdfVersion": "1.7"
    }
  }
}
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=nuget&utm_medium=referral&utm_content=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=nuget&utm_medium=referral&utm_content=readme) and all legal documents and agreements.

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
