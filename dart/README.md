# PDF to Text API - Dart/Flutter Client

PDF to Text extracts the text layer of a PDF, uploaded or fetched from a URL, and returns it as plain text with the page, word and character counts. Paid plans add the text of each page separately and the document metadata, such as title, author and creation date.

[![pub package](https://img.shields.io/pub/v/apiverve_pdftotext.svg)](https://pub.dev/packages/apiverve_pdftotext)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [PDF to Text API](https://apiverve.com/marketplace/pdftotext?utm_source=dart&utm_medium=referral&utm_content=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_pdftotext: ^1.2.5
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_pdftotext/apiverve_pdftotext.dart';

void main() async {
  final client = PdftotextClient('YOUR_API_KEY');

  try {
    // This API requires a file upload — a JSON body is rejected with a 400.
    final response = await client.executeWithFile('/path/to/your-file');

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

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

## API Reference

- **API Home:** [PDF to Text API](https://apiverve.com/marketplace/pdftotext?utm_source=dart&utm_medium=referral&utm_content=readme)
- **Documentation:** [docs.apiverve.com/ref/pdftotext](https://docs.apiverve.com/ref/pdftotext?utm_source=dart&utm_medium=referral&utm_content=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme)
