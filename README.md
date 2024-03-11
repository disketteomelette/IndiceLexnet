# IndiceLexnet v2

Aplicativo multiplataforma escrito en Python que genera un índice de documentos para LexNet en PDF, que a su vez, enlaza directamente a las pruebas, para cumplir el requisito del artículo 273.4 de la Ley de Enjuiciamiento Civil (España). Creado por J. Carlos Rueda (www.jcrueda.com).

LIMITACIONES (TO DO's): El programa únicamente funcionará si el nombre de los documentos utiliza carácteres alfanuméricos y espacios. Por tanto, **en los nombres de los archivos de los documentos no deben usarse eñes, cedillas, vocales acentuadas, símbolos extraños, puntos y comas, etc. o los enlaces del índice no funcionarán**.

# Historial de versiones

- V. 2.0 (11-3-24) - Versión actual -
* Se pasa de bash/batch a Python 3.
* Ahora se puede ejecutar tanto en Windows como en Linux.
* Se crea un entorno gráfico que permite seleccionar los archivos.
* Más rápido, menos dependencias, funcional al 100%.

- V. 1.2 (1-1-24)
* Se crea versión para Windows en batch.

- V. 1.0 (2023)
* Primera versión del programa, únicamente funcional en Linux.

# Cómo usarlo en Windows
1. Descarga e instala Python 3 desde Microsoft Apps: https://apps.microsoft.com/detail/9pjpw5ldxlz5?hl=en-US&gl=US
2. Descarga el contenido de este repositorio en tu disco duro.
3. Inicia el archivo "indice-lexnet.bat".

La primera vez que se inicia el programa, tardará un minuto en instalar dependencias necesarias (verás una consola negra). Espera hasta que se instalen todas y luego el programa se abrirá.
La siguiente vez que lo ejecutes, se hará inmediatamente. Ignora los mensajes de error que pudieran aparecer.  

Tras generar el índice, debe colocarse en la misma carpeta que los documentos enlazados para que funcione correctamente.

# Cómo usarlo en Linux
1. Descarga e instala Python 3 y Git: **sudo apt-get install -y python3 git**
2. Instala las dependencias: **python3 -m pip3 install PyQt5 reportlab**
3. Clona este repositorio y sitúate en él: **git clone https://github.com/disketteomelette/IndiceLexnet.git; cd IndiceLexnet**
4. Ejecuta el script: **python3 indice.py**

Tras generar el índice, debe colocarse en la misma carpeta que los documentos enlazados para que funcione correctamente. "Indice-lexnet.bat" es un archivo para ejecutar el script en Windows, por lo que lo puedes borrar.

# Licencia
IndiceLexnet 2 se distribuye bajo la Licencia Creative Commons Atribución (CC BY). Esta licencia otorga a los usuarios la libertad de compartir, adaptar y utilizar el software para sus propios fines, incluso con fines comerciales, siempre y cuando se atribuya adecuadamente la autoría original. Esto fomenta la colaboración y la innovación, al tiempo que garantiza el reconocimiento del trabajo del autor original en cualquier derivado o aplicación del software. Sírvete de utilizar este código a tu antojo, siempre que incluyas mi autoría en tus créditos.
