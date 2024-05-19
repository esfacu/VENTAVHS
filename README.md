<center>
<img src="https://objetivo.news/download/multimedia.normal.bcba10cea1861629.Y29kZXJob3VzZS1xdWUtZXMtcXVlLWhhY2VuX25vcm1hbC53ZWJw.webp" style="width: 100% ; aspect-ratio:16/9">
</center>


# <center>Entrega de proyecto final</center>
Alumno: Facundo Rodríguez

Comisión: 53180
Tutor Regular: Santiago Angel Gonzalez Martin
Tutor Adjunto: Carla Palermo Palermo
Docente: Anderson Michel TORRES



---

### **Consignas:**
- La base de datos debe contener al menos:
    * ~ 15 tablas, entre las cuales debe haber al menos 1 tabla de hechos,  2 tablas transaccionales.
    * ~ 5 vistas.
    * ~ 2 stored procedure.
    * ~ 2  trigger.
    * ~ 2 funciones
    
- El documento debe contener:
    - Introducción
    - Objetivo
    - Situación problemática
    - Modelo de negocio
    - Diagrama de entidad relació
    - Listado de tablas con descripción de estructura (columna,descripción, tipo de datos, tipo de clave)
    - Scripts de creación de cada objeto de la base de datos
    - Scripts de inserción de datos
    - Informes generados en base a la información de la base
    - Herramientas y tecnologías usadas



---

## Tematica del proyecto

La idea consiste en un negocio retro tipo venta de películas(VHS). Consistirá en base de películas
con detalles del año, productor, genero. A su vez habrá base de clientes donde se almacenarán
algunos datos como nombre, edad, entre otros datos personales. El servicio se dedicará
exclusivamente a la venta de títulos en VHS. También contempla la relación con proveedores,
ordenes de compra con ellos y dicho flujo. Se Presentaran tambien tabla sobre vendedores (funcionarios).

## Modelo de negocio

Como base se trata de un negocio de venta de VHS, donde un cliente podrá elegir dentro de un catalogo, dichos VHS son reventa de los proveedores mayoristas. 

## Diagrama entidad relacion (DER)

https://github.com/esfacu/VENTAVHS/blob/proyecto-final/VENTAVHS%2BRODRIGUEZ.pdf

![Diagrama Entidad-Relación](diagrama.png)


## Listado de tablas y descripcion

https://github.com/esfacu/VENTAVHS/blob/proyecto-final/VENTAVHS%2BRODRIGUEZ.pdf

## Estructura e ingesta de datos

https://github.com/esfacu/VENTAVHS/blob/proyecto-final/Paso%20a%20Paso%20Insercion%20Datos%20%2B%20Vistas%20Script.pdf

## Objetos de la base de datos

https://github.com/esfacu/VENTAVHS/blob/proyecto-final/VENTAVHS%2BRODRIGUEZ.pdf

## Roles y permisos

Roles : Administrador y Usuario
Permisos Administrador puede SELECT, INSERT, UPDATE, DELETE en toda la base.
Usuario solo puede SELECT en toda la base

## Back up de la base de datos


## Herramientas y tecnologias usadas

## Como levantar el proyecto en CodeSpaces GitHub
* env: Archivo con contraseñas y data secretas
* Makefile: Abstracción de creacción del proyecto
* docker-compose.yml: Permite generar las bases de datos en forma de contenedores

#### Pasos para arrancar el proyecto

* En la terminal de linux escribir :
    - `make` _si te da un error de que no conexion al socket, volver al correr el comando `make`_
    - `make clean-db` limpiar la base de datos
    - `make test-db` para mirar los datos de cada tabla
    - `make backup-db` para realizar un backup de mi base de datos
    - `make access-db` para acceder a la base de datos
