# PDF to Text API - PHP Package

PDF to Text extracts the text layer of a PDF, uploaded or fetched from a URL, and returns it as plain text with the page, word and character counts. Paid plans add the text of each page separately and the document metadata, such as title, author and creation date.

## Installation

Install via Composer:

```bash
composer require apiverve/pdftotext
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Pdftotext\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute(['pdf' => 'https://raw.githubusercontent.com/mozilla/pdf.js/master/test/pdfs/basicapi.pdf']);

// Print the response
print_r($response);
```

### File Upload

```php
// Upload a file
$response = $client->executeWithFile('/path/to/file.jpg');

// Or use a URL
$response = $client->executeWithUrl('https://example.com/image.jpg');
```

### Error Handling

```php
use APIVerve\Pdftotext\Client;
use APIVerve\Pdftotext\Exceptions\APIException;
use APIVerve\Pdftotext\Exceptions\ValidationException;

try {
    $response = $client->execute(['pdf' => 'https://raw.githubusercontent.com/mozilla/pdf.js/master/test/pdfs/basicapi.pdf']);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
```

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

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/pdftotext?utm_source=packagist&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/pdftotext?utm_source=php&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/pdftotext?utm_source=php&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
