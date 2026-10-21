# PDF to Text API - Ruby Gem

PDF to Text extracts the text layer of a PDF, uploaded or fetched from a URL, and returns it as plain text with the page, word and character counts. Paid plans add the text of each page separately and the document metadata, such as title, author and creation date.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_pdftotext'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_pdftotext
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_pdftotext'

# Initialize the client
client = APIVerve::Pdftotext::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({ pdf: "https://raw.githubusercontent.com/mozilla/pdf.js/master/test/pdfs/basicapi.pdf" })

# Print the response
puts response
```

### File Upload

```ruby
# Upload a file
response = client.execute_with_file("/path/to/file.jpg")

# Or use a URL
response = client.execute_with_url("https://example.com/image.jpg")
```

### Error Handling

```ruby
begin
  response = client.execute({ pdf: "https://raw.githubusercontent.com/mozilla/pdf.js/master/test/pdfs/basicapi.pdf" })
  puts response["data"]
rescue APIVerve::Pdftotext::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Pdftotext::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Pdftotext::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
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

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/pdftotext?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/pdftotext?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/pdftotext?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
