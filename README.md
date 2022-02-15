# IndiceLexnet
Script bash que genera automáticamente un índice de documentos para LexNet en PDF que enlaza directamente a los archivos, para cumplir el requisito del artículo 273.4 LEC, creado para ahorrarme tiempo y no tener que hacerlo manualmente en el Word :)

![indicelexnet-sample](https://github.com/disketteomelette/IndiceLexnet/blob/main/indicelexnet.jpg)

- Dependencias: sudo apt-get install wkhtmltopdf php
- Instrucciones: Coloque el script en la misma carpeta que los documentos, con el siguiente formato:
-   DOC 1 Poder para pleitos.pdf
-   DOC 2 Resolucion impugnada.pdf
-   DOC 3 Alegaciones.pdf [...]
- Llame al programa simplemente con ./indicelexnet.sh o sh indicelexnet.sh. El programa termina generando un PDF (indice.pdf) que enlaza a todos los PDFs listados.
