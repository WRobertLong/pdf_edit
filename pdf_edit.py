from PyPDF2 import PdfReader, PdfWriter

def extract_pages(input_pdf, output_pdf, start_page, end_page):
    reader = PdfReader(input_pdf)
    writer = PdfWriter()
    
    for i in range(start_page - 1, end_page):  # Page numbers are zero-based
        writer.add_page(reader.pages[i])
    
    with open(output_pdf, "wb") as output_file:
        writer.write(output_file)

# Example usage
input_pdf = "Almudevar_2021_Theory_of_Statistical_Inference.pdf"
output_pdf = "output.pdf"
start_page = 130  # Start from this page (1-based index)
end_page = 146   # End at this page (inclusive)

extract_pages(input_pdf, output_pdf, start_page, end_page)
