@echo off
REM Instalar dependencias de Python
pip install PyQt5
pip install reportlab
pip3 install PyQt5
pip3 install reportlab
clear
REM Ejecutar el script "indice.py"
echo "################################################################################"
echo "# Se está ejecutando IndiceLexnet v.2 - NO CIERRE ESTA VENTANA MIENTRAS LO USA #"
echo "################################################################################"
echo.
python3 indice.py 
