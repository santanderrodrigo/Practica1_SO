@echo off
setlocal enabledelayedexpansion

REM Esperamos que el usuario confirme la accion
echo Presiona una tecla para ejecutar el script...
pause > nul

REM Definimos el directorio a utilizar, Desktop en este caso
set "desktop=%USERPROFILE%\Desktop"
set "newDir=%desktop%\Proyecto"

REM Creamos el directorio principal
mkdir "%newDir%"

REM Creamos un archivo de descripcion con algo de contenido
type nul > "%newDir%\descripcion.txt"
echo Cósmico: un grupo apasionado por explorar los sistemas operativos hasta sus límites, impulsados por la curiosidad y la innovación. Nuestro objetivo es desentrañar los misterios tecnológicos. >> "%newDir%\descripcion.txt"

REM Definimos un array con los nombres de las materias
set "materias[0]=Fundamentos_Web"
set "materias[1]=Sistemas_operativos"
set "materias[2]=Programacion_c_sharp"
set "materias[3]=Ingles_comercial"

REM Definimos un array con los nombres de los integrantes y las materias que cursan
set "alumnos[0]=Rodrigo_Santander"
set "alumnos[0,materias]=0 1 2 3"
set "alumnos[1]=Paula_Riquelme"
set "alumnos[1,materias]=0 3"
set "alumnos[2]=Ivan_Ruiz"
set "alumnos[2,materias]=1 2"
set "alumnos[3]=Gonzalo_Lastra"
set "alumnos[3,materias]=0 1 3"

REM Iteramos sobre cada alumno
for /l %%i in (0,1,3) do (
    REM Creamos la carpeta del alumno
    mkdir "%newDir%\!alumnos[%%i]!"

    REM Creamos la carpeta de informacion personal del alumno y la populamos con los archivos correspondientes
    mkdir "%newDir%\!alumnos[%%i]!\Informacion_personal"	
    type nul > "%newDir%\!alumnos[%%i]!\Informacion_personal\foto.jpg"
    type nul > "%newDir%\!alumnos[%%i]!\Informacion_personal\cv.doc"
    type nul > "%newDir%\!alumnos[%%i]!\Informacion_personal\dni.pdf"

    REM Creamos la carpeta de Musica del alumno y la populamos con los archivos correspondientes
    mkdir "%newDir%\!alumnos[%%i]!\Musica"
    type nul > "%newDir%\!alumnos[%%i]!\Musica\lista1.mp3"
    type nul > "%newDir%\!alumnos[%%i]!\Musica\audio_clase_1.mp3"

    REM Obtenemos la lista de las materias del alumno del array definido mas arriba
    set "materias=!alumnos[%%i,materias]!"

    REM Recorremos las materias de manera individual separandolas
    for %%m in (!materias!) do (
        REM establecemos el nombre de la materia según el índice
        set "materia=!materias[%%m]!"
        
        mkdir "%newDir%\!alumnos[%%i]!\!materia!"
	mkdir "%newDir%\!alumnos[%%i]!\!materia!\Materia"
	
	REM Populamos con los archivos especificados
	type nul > "%newDir%\!alumnos[%%i]!\!materia!\Materia\Unidad_1.pdf"
	type nul > "%newDir%\!alumnos[%%i]!\!materia!\Materia\Unidad_2.pdf"
	type nul > "%newDir%\!alumnos[%%i]!\!materia!\Materia\Unidad_3.pdf"

	REM Creamos la carpeta practicas y la populamos con los archivos especificados
        mkdir "%newDir%\!alumnos[%%i]!\!materia!\Practicas"
	type nul > "%newDir%\!alumnos[%%i]!\!materia!\Practicas\Practica_1.doc"
	type nul > "%newDir%\!alumnos[%%i]!\!materia!\Practicas\Practica_2.doc"
	type nul > "%newDir%\!alumnos[%%i]!\!materia!\Practicas\Practica_3.doc"

	REM Creamos una carpeta Pruebas
        mkdir "%newDir%\!alumnos[%%i]!\!materia!\Pruebas"

	REM Creamos la carpeta archivos extras y la populamos con los archivos especificados
        mkdir "%newDir%\!alumnos[%%i]!\!materia!\Archivos_extras"
	type nul > "%newDir%\!alumnos[%%i]!\!materia!\Archivos_extras"\Libro_1.pdf"
	type nul > "%newDir%\!alumnos[%%i]!\!materia!\Archivos_extras"\Articulo_1.pdf"
	type nul > "%newDir%\!alumnos[%%i]!\!materia!\Archivos_extras"\Presentación.ppt"
    )
)

echo El script fue completado.
pause
