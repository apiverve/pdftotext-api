PDF to Text API
============

PDF to Text extracts the text layer of a PDF, uploaded or fetched from a URL, and returns it as plain text with the page, word and character counts. Paid plans add the text of each page separately and the document metadata, such as title, author and creation date.


[![PyPI version](https://img.shields.io/pypi/v/apiverve-pdftotext.svg)](https://pypi.org/project/apiverve-pdftotext/)

This is a Python wrapper for the [PDF to Text API](https://apiverve.com/marketplace/pdftotext?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Installation

Using `pip`:

```bash
pip install apiverve-pdftotext
```

Using `pip3`:

```bash
pip3 install apiverve-pdftotext
```

---

## Configuration

Before using the PDF to Text API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```python
from apiverve_pdftotext.apiClient import PdftotextAPIClient

# Initialize the client with your APIVerve API key
api = PdftotextAPIClient("[YOUR_API_KEY]")

# This API requires a file upload
files = { "pdf": open("/path/to/image.jpg", "rb") }

try:
    # Make the API call
    result = api.execute_with_file(files)

    # Print the result
    print(result)
except Exception as e:
    print(f"Error: {e}")
```

---

## Usage

The PDF to Text API documentation is found here: [https://docs.apiverve.com/ref/pdftotext](https://docs.apiverve.com/ref/pdftotext?utm_source=pypi&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```python
# Import the client module
from apiverve_pdftotext.apiClient import PdftotextAPIClient

# Initialize the client with your APIVerve API key
api = PdftotextAPIClient("[YOUR_API_KEY]")
```

---

## Perform Request

Using the API client, you can perform requests to the API.

###### Define Query

```python
# This API requires a file upload
files = { "pdf": open("/path/to/image.jpg", "rb") }
```

###### Simple Request

```python
# Make a request to the API
result = api.execute_with_file(files)

# Print the result
print(result)
```

###### Example Response

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

## Error Handling

The API client provides comprehensive error handling through the `PdftotextAPIClientError` exception. Here are some examples:

### Basic Error Handling

```python
from apiverve_pdftotext.apiClient import PdftotextAPIClient, PdftotextAPIClientError

api = PdftotextAPIClient("[YOUR_API_KEY]")

# This API requires a file upload
files = { "pdf": open("/path/to/image.jpg", "rb") }

try:
    result = api.execute(query)
    print("Success!")
    print(result)
except PdftotextAPIClientError as e:
    print(f"API Error: {e.message}")
    if e.status_code:
        print(f"Status Code: {e.status_code}")
    if e.response:
        print(f"Response: {e.response}")
```

### Handling Specific Error Types

```python
from apiverve_pdftotext.apiClient import PdftotextAPIClient, PdftotextAPIClientError

api = PdftotextAPIClient("[YOUR_API_KEY]")

# This API requires a file upload
files = { "pdf": open("/path/to/image.jpg", "rb") }

try:
    result = api.execute(query)

    # Check for successful response
    if result.get('status') == 'success':
        print("Request successful!")
        print(result.get('data'))
    else:
        print(f"API returned an error: {result.get('error')}")

except PdftotextAPIClientError as e:
    # Handle API client errors
    if e.status_code == 401:
        print("Unauthorized: Invalid API key")
    elif e.status_code == 429:
        print("Rate limit exceeded")
    elif e.status_code >= 500:
        print("Server error - please try again later")
    else:
        print(f"API error: {e.message}")
except Exception as e:
    # Handle unexpected errors
    print(f"Unexpected error: {str(e)}")
```

### Using Context Manager (Recommended)

The client supports the context manager protocol for automatic resource cleanup:

```python
from apiverve_pdftotext.apiClient import PdftotextAPIClient, PdftotextAPIClientError

# This API requires a file upload
files = { "pdf": open("/path/to/image.jpg", "rb") }

# Using context manager ensures proper cleanup
with PdftotextAPIClient("[YOUR_API_KEY]") as api:
    try:
        result = api.execute(query)
        print(result)
    except PdftotextAPIClientError as e:
        print(f"Error: {e.message}")
# Session is automatically closed here
```

---

## Advanced Features

### Debug Mode

Enable debug logging to see detailed request and response information:

```python
from apiverve_pdftotext.apiClient import PdftotextAPIClient

# Enable debug mode
api = PdftotextAPIClient("[YOUR_API_KEY]", debug=True)

# This API requires a file upload
files = { "pdf": open("/path/to/image.jpg", "rb") }

# Debug information will be printed to console
result = api.execute(query)
```

### Manual Session Management

If you need to manually manage the session lifecycle:

```python
from apiverve_pdftotext.apiClient import PdftotextAPIClient

api = PdftotextAPIClient("[YOUR_API_KEY]")

# This API requires a file upload
files = { "pdf": open("/path/to/image.jpg", "rb") }

try:
    result = api.execute(query)
    print(result)
finally:
    # Manually close the session when done
    api.close()
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=pypi&utm_medium=referral&utm_content=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=pypi&utm_medium=referral&utm_content=readme) and all legal documents and agreements.

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
