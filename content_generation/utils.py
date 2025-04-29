# content_generation/utils.py
import io
from docx import Document
from docx.shared import Pt

def generate_docx(title: str, content: str) -> io.BytesIO:
    """
    Generate a DOCX document from content with proper Unicode handling.

    Args:
        title: Title for the document
        content: Content text (paragraphs separated by blank lines)

    Returns:
        BytesIO stream of the generated DOCX document
    """
    document = Document()

    # Use the existing 'Normal' style rather than adding a new one
    font_name = 'Arial'
    normal_style = document.styles['Normal']
    normal_style.font.name = font_name
    normal_style.font.size = Pt(11)

    # Ensure any auto-created paragraphs use 'Normal'
    for para in document.paragraphs:
        para.style = normal_style

    # Add title
    title_para = document.add_paragraph()
    title_run = title_para.add_run(title)
    title_run.bold = True
    title_run.font.name = font_name
    title_run.font.size = Pt(16)

    # Add content paragraphs (split on double newlines)
    for block in content.split('\n\n'):
        text = block.strip()
        if not text:
            continue
        # Directly specify style name for new paragraphs
        para = document.add_paragraph(text, style='Normal')

    # Save to a BytesIO stream and return
    stream = io.BytesIO()
    document.save(stream)
    stream.seek(0)
    return stream
