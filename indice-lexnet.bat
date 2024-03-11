@echo off

REM Instalar dependencias de Python
pip install PyQt5
pip install reportlab
pip3 install PyQt5
pip3 install reportlab

REM Ejecutar el script "indice.py"
python3 indice.py

pause

