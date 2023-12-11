# IndiceLexnet.bat - Herramienta en Windows para crear índices de documentos en PDF
# en cumplimiento de lo establecido en el artículo 273.4 de la Ley de Enjuiciamiento
# Civil. Creado por jcrueda.com (github.com/disketteomelette).

@echo off
echo [i]   IndiceLexnet.bat - un script de JCRueda.com
echo [i]   github.com/disketteomelette
echo [!]   Iniciando...
echo [!]   Advertencia: TODOS los documentos PDF de la demanda deben estar en la misma carpeta que este script. Asegúrese de ello.
pause

del temporal.txt
del temporal2.txt

for %%F in (*.pdf) do (
    set "prueba=%%~nF"
    set "prueba=!prueba: =@!"
    echo !prueba! >> temporal.txt
)

(for /f "tokens=1,* delims=_" %%A in ('type temporal.txt ^| find /i "doc" ^| sort /r') do (
    set "orden=%%B"
    set "orden=!orden:@= !"
    echo !orden! 
)) > temporal2.txt

echo ^<html^>^<head^> > indice.html
echo ^<meta http-equiv="content-type" content="text/html; charset=utf-8"/^> >> indice.html
echo ^<title^>Indice documental^</title^> >> indice.html
echo ^<style type="text/css"^>^@page { size: 21cm 29.7cm; margin: 2cm }^p { margin-bottom: 0.25cm; line-height: 115%; background: white }^a:link { color: #000080; so-language: zxx; text-decoration: none }^</style^>^</head^>^<body lang="es-ES" link="#000080" vlink="#800000" dir="ltr"^>^<p style="margin-bottom: 0cm; font-weight: normal; line-height: 100%"^><font face="Gentium Book Basic"^>^<font size="5" style="font-size: 18pt"^>Índice documental^</font^></font^></p^>^<hr/^>^<BR/^> >> indice.html

for /f "tokens=* delims=" %%A in (temporal2.txt) do (
    set "a1=%%A"
    for /f "tokens=1,* delims=@" %%B in ("!a1!") do (
        set "a2=%%C"
        set "a3=!a1:_=!"
        set "a3=!a3: =!"
        echo ^<a href=".\!a3!">- !a2!^</a^>^<br/^> >> indice.html
        echo !a3!
    )
)

echo ^</BODY^></HTML^> >> indice.html
wkhtmltopdf.exe indice.html indice.pdf
del indice.html
del temporal.txt
del temporal2.txt

echo [i] El programa ha terminado. Revise el archivo INDICE.PDF que debe haberse creado.

