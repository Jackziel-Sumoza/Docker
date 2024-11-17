# Django

## Curso avanzado de Django

### Pasos para utilizar django:

1. Descargar e instalar python [www.python.org/downloads](https://www.python.org/downloads/).
2. Verificar la instalación por consola, entrar en la terminal y escribir `python --version`. Debe de retornar la versión de python.
3. Descargar e inicializar un entorno virtual
    1. Utilizar `pip install virtualenv`.
    2. Dirigirse al directorio del proyecto y ejecutar `virtualenv venv`
    3. Activar el entorno virtual `.\venv\Scripts\activate`
        Acabas de instalar virtualenv; crear una carpeta llamada venv, que contiene todo el entorno virtual y activar el entorno virtual.
4. Descargar django en el entorno virtual con `pip install django`.
    1. Verificar la instalación con `django-admin --version`
5. Crear un proyecto en django con `django-admin startproject <nombre del p .`, el **.** indica que se debe de crear en esta misma carpeta.
6. Inicializar el proyecto o correr el proyecto en el servidor con el comando `python manage.py runserver <puerto-deseado>`, hacer clic en la url que da el valor y listo, estamos corriendo django.

### Estructura proyectos de django:

1. **pycache/:**
2. **\_\_init\_\_.py:**
3. **asgi.py:**
4. **settings.py:**
5. **urls.py:**
6. **wsgi.py:**

### Crear aplicaciones dentro de los proyectos

Para crear aplicaciones dentro de los proyectos utilizamos el comando `python manage.py startapp <nombre_app>` una vez creada la app, se creara una carpeta con el nombre de la app y dentro multiples archivos.

### Estructura aplicaciones de django:

1. **migrations/:** 
3. **admin.py:**
4. **apps.py:**
5. **models.py:**
6. **tests.py:**
7. **views.py:**

### Migraciones:

Primero debemos ejecutar `python manage.py makemigrations` para tomar las migraciones y luego ejecutar `python manage.py migrate` para bajar todas las migraciones.

Con esto tendremos las configuraciones por defecto que nos brinda django para las bases de datos y nos facilitan el proceso de desarrollo con funciones ya integradas para manejar estos datos.