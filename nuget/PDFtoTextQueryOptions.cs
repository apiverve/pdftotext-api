using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.PDFtoText
{
    /// <summary>
    /// Query options for the PDF to Text API
    /// </summary>
    public class PDFtoTextQueryOptions
    {
        /// <summary>
        /// The PDF file to read (up to 10 MB), or a public PDF URL
        /// </summary>
        [JsonProperty("pdf")]
        public string Pdf { get; set; }
    }
}
