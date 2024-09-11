@echo off
echo --- Comprobando dependencias...
python3 -m pip install PyQt5 reportlab 
echo "################################################################################"
echo "# Se esta ejecutando IndiceLexnet v.2 - NO CIERRE ESTA VENTANA MIENTRAS LO USA #"
echo "################################################################################"
echo.
python3 indice.py 
