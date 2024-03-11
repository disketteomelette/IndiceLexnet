import sys
import os
from PyQt5.QtWidgets import QApplication, QWidget, QFileDialog, QVBoxLayout, QPushButton, QLabel
from reportlab.lib.pagesizes import letter
from reportlab.platypus import SimpleDocTemplate, Paragraph
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.lib import colors
from reportlab.platypus import Spacer

class IndexGenerator(QWidget):
    def __init__(self):
        super().__init__()
        self.initUI()

    def initUI(self):
        self.setWindowTitle('IndiceLexnet 2.0 - Generador de Índice Documental')
        self.setGeometry(100, 100, 400, 250)
        self.warning_label = QLabel('<b>ADVERTENCIA:</b> El índice no funcionará si los nombres de los archivos contienen eñes, vocales acentuadas o cualquier símbolo. Usa sólo letras, números y espacios.', self)
        self.file_button = QPushButton('Seleccionar documentos por orden', self)
        self.file_button.clicked.connect(self.select_files)
        self.generate_button = QPushButton('Generar índice de documentos', self)
        self.generate_button.clicked.connect(self.generate_index)
        self.copyright_label = QLabel("2024 (cc) José Carlos Rueda - jcrueda.com", self)
        layout = QVBoxLayout()
        layout.addWidget(self.warning_label)
        layout.addWidget(self.file_button)
        layout.addWidget(self.generate_button)
        layout.addWidget(self.copyright_label)
        self.setLayout(layout)
                
    def select_files(self):
        options = QFileDialog.Options()
        options |= QFileDialog.DontUseNativeDialog
        self.files, _ = QFileDialog.getOpenFileNames(self, "Seleccionar documentos", "", "Archivos PDF (*.pdf)", options=options)

    def generate_index(self):
        index_name, _ = QFileDialog.getSaveFileName(self, "Guardar Índice", "", "PDF Files (*.pdf)")
        if index_name:
            doc = SimpleDocTemplate(index_name, pagesize=letter)
            styles = getSampleStyleSheet()
            copyright_style = ParagraphStyle(name='CopyrightStyle', parent=styles['Normal'], textColor=colors.lightgrey)
            flowables = []
            flowables.append(Paragraph("<h1>Índice documental</h1>", styles['Title']))
            flowables.append(Spacer(1, 12))
            for file in self.files:
                file_name = os.path.basename(file)
                file_name_without_extension = file_name.split('.')[0]
                flowables.append(Paragraph(f"<a href='{file_name}'>{file_name_without_extension.upper()}</a>", styles['Normal']))

            flowables.append(Spacer(1, 12))
            flowables.append(Spacer(1, 12))
            flowables.append(Paragraph("<para align=center>- </para>", styles['Normal']))
            flowables.append(Spacer(1, 12))
            flowables.append(Paragraph("<para align=center>2024 (cc) IndiceLexnet</para>", copyright_style))
            doc.build(flowables)
            sys.exit(0)

if __name__ == '__main__':
    app = QApplication(sys.argv)
    window = IndexGenerator()
    window.show()
    sys.exit(app.exec_())


