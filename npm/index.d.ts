declare module '@apiverve/pdftotext' {
  export interface pdftotextOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface pdftotextResponse {
    status: string;
    error: string | null;
    data: PDFtoTextData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface PDFtoTextData {
      text:           null | string;
      pageCount:      number | null;
      pagesExtracted: number | null;
      truncated:      boolean | null;
      hasText:        boolean | null;
      wordCount:      number | null;
      characterCount: number | null;
      pages:          Page[];
      metadata:       Metadata;
  }
  
  interface Metadata {
      title:            null | string;
      author:           null | string;
      subject:          null;
      creator:          null | string;
      producer:         null | string;
      creationDate:     Date | null;
      modificationDate: Date | null;
      pdfVersion:       null | string;
  }
  
  interface Page {
      page:      number | null;
      text:      null | string;
      wordCount: number | null;
  }

  export default class pdftotextWrapper {
    constructor(options: pdftotextOptions);

    execute(callback: (error: any, data: pdftotextResponse | null) => void): Promise<pdftotextResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: pdftotextResponse | null) => void): Promise<pdftotextResponse>;
    execute(query?: Record<string, any>): Promise<pdftotextResponse>;
  }
}
