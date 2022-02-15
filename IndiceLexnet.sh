# IndiceLexnet.sh - Herramienta en linux para crear índices de documentos en PDF
# en cumplimiento de lo establecido en el artículo 273.4 de la Ley de Enjuiciamiento
# Civil. Creado por jcrueda.com (github.com/disketteomelette).
#
# Dependencias: sudo apt-get install wkhtmltopdf php
#
# Instrucciones: Coloque el script en la misma carpeta que los documentos, con el siguiente formato:
#   DOC 1 Poder para pleitos.pdf
#   DOC 2 Resolucion impugnada.pdf
#   DOC 3 Alegaciones.pdf [...]
# Llame al programa simplemente con ./indicelexnet.sh o sh indicelexnet.sh
# El programa termina generando un PDF (indice.pdf) que enlaza a todos los PDFs listados
#
echo "[i]   IndiceLexnet.sh - un script de JCRueda.com"
echo "[i]   github.com/disketteomelette"
echo "[!]   Iniciando...";
rm temporal temporal2; 
for prueba in `ls *.pdf | grep "doc" | tr " " "@"`; 
    do orden=$(echo $prueba | cut -f2 -d"@"); 
    echo "$orden;$prueba" >> temporal; 
done; 
cat temporal | sort -k1 -n | cut -f2 -d";" | tr "@" " " > temporal2
rm temporal
echo '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"><html><head>' > indice.html; 
echo '<meta http-equiv="content-type" content="text/html; charset=utf-8"/><title>Indice documental</title>' >> indice.html; 
echo '<style type="text/css">		@page { size: 21cm 29.7cm; margin: 2cm }		p { margin-bottom: 0.25cm; line-height: 115%; background: white }" ' >> indice.html;
echo ' 		a:link { color: #000080; so-language: zxx; text-decoration: none }	</style></head><body lang="es-ES" link="#000080" vlink="#800000" ' >> indice.html; 
echo ' dir="ltr"><p style="margin-bottom: 0cm; font-weight: normal; line-height: 100%"><font face="Gentium Book Basic">' >> indice.html; 
echo '<font size="5" style="font-size: 18pt">Índice documental</font></font></p><hr/><BR>' >> indice.html; 

for line in `cat temporal2 | tr " " "@"`; 
    do a1=$(echo $line | tr "@" " " );  
    a2=$(echo $a1 | cut -f1 -d"_" | cut -f2 -d'"'); 
    a3=$(php -r "echo rawurlencode('$a1');");
    echo "<a href="./$a3">- $a2</a><br>" >> indice.html; 
    echo "$a3";
done; 
echo "</BODY></HTML>" >> indice.html; 
wkhtmltopdf indice.html indice.pdf;  
rm indice.html; rm temporal; rm temporal2;
echo "[i] El programa ha terminado. Revise el archivo INDICE.PDF que debe haberse creado."

