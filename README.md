# Docker

## Tabla de Contenidos

- [Docker](#docker)
  - [Tabla de Contenidos](#tabla-de-contenidos)
  - [Conceptos importantes](#conceptos-importantes)
    - [Contenedores: Aislamiento en Pequeño Formato](#contenedores-aislamiento-en-pequeño-formato)
    - [Almacenes de Imágenes](#almacenes-de-imágenes)
    - [¿Qué reemplazaron los contenedores?](#qué-reemplazaron-los-contenedores)
    - [**Comparación entre usar o no usar contenedores:**](#comparación-entre-usar-o-no-usar-contenedores)
    - [Construyendo una imagen de Docker](#construyendo-una-imagen-de-docker)
    - [Virtualización: Completa vs. Parcial](#virtualización-completa-vs-parcial)
    - [Docker Desktop y WSL2](#docker-desktop-y-wsl2)
    - [Herramientas adicionales](#herramientas-adicionales)
    - [¿Por qué Docker ha revolucionado el desarrollo y despliegue de aplicaciones?](#por-qué-docker-ha-revolucionado-el-desarrollo-y-despliegue-de-aplicaciones)
    - [Escenarios de uso más allá de los básicos](#escenarios-de-uso-más-allá-de-los-básicos)
    - [Conceptos avanzados y herramientas relacionadas](#conceptos-avanzados-y-herramientas-relacionadas)
    - [Docker vs. Máquinas Virtuales](#docker-vs-máquinas-virtuales)
  - [APRENDE DOCKER AQUÍ](#aprende-docker-aquí)
    - [Ver las imágenes:](#ver-las-imágenes)
    - [Descargar una imagen:](#descargar-una-imagen)
      - [**¿Cómo encontrar y descargar imágenes de Docker Hub?**](#cómo-encontrar-y-descargar-imágenes-de-docker-hub)
      - [**¿Como descarga una imagen?**](#como-descarga-una-imagen)
      - [**Consejos**](#consejos)
    - [Eliminar una imagen:](#eliminar-una-imagen)
    - [Crear una Imagen de Docker](#crear-una-imagen-de-docker)
    - [Crear un Contenedor con una Imagen](#crear-un-contenedor-con-una-imagen)
    - [Iniciar un Contenedor](#iniciar-un-contenedor)
      - [`docker start <id-del-contenedor>`](#docker-start-id-del-contenedor)
    - [Verificar los Contenedores en Ejecución](#verificar-los-contenedores-en-ejecución)
      - [`docker ps`](#docker-ps)
    - [Detener un Contenedor](#detener-un-contenedor)
      - [`docker stop <id-del-contenedor>`](#docker-stop-id-del-contenedor)
    - [Eliminar un Contenedor](#eliminar-un-contenedor)
      - [`docker rm <nombre-del-contenedor>`](#docker-rm-nombre-del-contenedor)
    - [Crear un Contenedor con Nombre y Configuraciones Adicionales](#crear-un-contenedor-con-nombre-y-configuraciones-adicionales)
      - [`docker container create --name <nombre> --network <red> -p <puerto-local>:<puerto-contenedor> <imagen>`](#docker-container-create---name-nombre---network-red--p-puerto-localpuerto-contenedor-imagen)
    - [Ver los Logs de un Contenedor](#ver-los-logs-de-un-contenedor)
      - [`docker logs <nombre o id-del-contenedor>`](#docker-logs-nombre-o-id-del-contenedor)
    - [Ejecutar una Imagen Todo-en-Uno](#ejecutar-una-imagen-todo-en-uno)
      - [`docker run <nombre-imagen>`](#docker-run-nombre-imagen)
    - [Redes en Docker](#redes-en-docker)
      - [`docker network create <nombre>`](#docker-network-create-nombre)
    - [Docker Compose](#docker-compose)
      - [Archivo `docker-compose.yml`](#archivo-docker-composeyml)
      - [Comando para Iniciar con Docker Compose](#comando-para-iniciar-con-docker-compose)
    - [Volúmenes en Docker](#volúmenes-en-docker)
      - [Volumen Nombrado en Docker Compose](#volumen-nombrado-en-docker-compose)
    - [Dockerfile y Docker Compose para Desarrollo](#dockerfile-y-docker-compose-para-desarrollo)
      - [Ejemplo de Dockerfile.dev](#ejemplo-de-dockerfiledev)
      - [Ejemplo de docker-compose-dev.yml](#ejemplo-de-docker-compose-devyml)
      - [Comando para Levantar el Entorno de Desarrollo](#comando-para-levantar-el-entorno-de-desarrollo)

## Conceptos importantes

### Contenedores: Aislamiento en Pequeño Formato

Un **contenedor** es como un paquete autónomo que contiene todo lo necesario para ejecutar una aplicación: código, bibliotecas, herramientas y configuraciones. Estos paquetes se aíslan entre sí, lo que garantiza que una aplicación no interfiera con otra.

-   **Ventajas:**
    -   **Portabilidad:** Un contenedor puede ejecutarse en cualquier máquina con Docker instalado, sin importar el sistema operativo subyacente.
    -   **Escalabilidad:** Es fácil crear múltiples instancias de un contenedor para manejar un aumento en la carga.
    -   **Eficiencia:** Los contenedores comparten el kernel del sistema operativo host, lo que los hace más ligeros y rápidos que las máquinas virtuales.

### Almacenes de Imágenes

Un **repositorio de contenedores** es un almacén donde se guardan las imágenes de los contenedores. Estas imágenes son como plantillas a partir de las cuales se crean los contenedores.

-   **Tipos de repositorios:**

    -   **Privados:** Pertenecen a una organización y son accesibles solo para sus miembros.
    -   **Públicos:** Son de acceso libre para cualquier persona.

-   **Docker Hub:** Es el repositorio público más grande y popular para imágenes de Docker. Ofrece imágenes oficiales de sistemas operativos, lenguajes de programación (Node.js, Python, Go, etc.), bases de datos (PostgreSQL, MySQL) y muchas otras aplicaciones.

### ¿Qué reemplazaron los contenedores?

Los contenedores, especialmente Docker, han revolucionado la forma en que desplegamos y escalamos aplicaciones, en gran medida reemplazando las **máquinas virtuales**. Mientras que las máquinas virtuales virtualizan todo un sistema operativo, los contenedores solo virtualizan la aplicación, lo que los hace más ligeros y eficientes.

### **Comparación entre usar o no usar contenedores:**

**Sin contenedores:**

|                      | CON CONTENEDORES                                                                                          | SIN CONTENEDORES                                                                                                                                                                                                   |
| -------------------- | --------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Desarrollo:**      | Los desarrolladores construyen una imagen de Docker que contiene todas las dependencias de la aplicación. | Los desarrolladores configuran sus entornos de desarrollo localmente, lo que puede llevar a inconsistencias entre entornos.                                                                                        |
| **Despliegue:**      | La imagen se envía a un repositorio y se despliega en un entorno de producción.                           | El código, las instrucciones y los archivos de configuración se despliegan en servidores, a menudo requiriendo actualizaciones manuales y coordinación para garantizar que todas las dependencias estén presentes. |
| **Actualizaciones:** | Para actualizar la aplicación, se crea una nueva imagen con los cambios y se despliega.                   | Actualizar los servidores puede ser un proceso complejo y arriesgado, especialmente si las dependencias tienen diferentes versiones.                                                                               |

### Construyendo una imagen de Docker

Una **imagen** es un archivo estático que contiene todo lo necesario para ejecutar una aplicación. Se construye a partir de un Dockerfile, que es un archivo de texto que contiene una serie de instrucciones.

-   **Capas:** Las imágenes de Docker están compuestas de capas, lo que permite compartir componentes comunes entre múltiples imágenes y optimizar el almacenamiento.
-   **Alpine:** Es una distribución de Linux muy ligera que se utiliza comúnmente como base para las imágenes de Docker, ya que reduce el tamaño final de la imagen.

### Virtualización: Completa vs. Parcial

-   **Virtualización completa:** Una máquina virtual emula todo el hardware de una computadora, incluyendo el procesador, la memoria y los dispositivos de almacenamiento.
-   **Virtualización parcial:** Los contenedores solo virtualizan el sistema operativo, compartiendo el kernel del sistema operativo host con otras aplicaciones.

### Docker Desktop y WSL2

-   **Docker Desktop:** Es una aplicación que permite a los desarrolladores ejecutar Docker en sus máquinas Windows y macOS. Internamente, Docker Desktop utiliza una máquina virtual Linux para ejecutar los contenedores.
-   **WSL2:** Es una subsistema de Windows que permite ejecutar aplicaciones Linux directamente en Windows. Docker puede ejecutarse de forma nativa en WSL2, lo que mejora el rendimiento.

### Herramientas adicionales

-   **Docker Compose:** Permite definir y ejecutar aplicaciones multi-contenedor usando un solo archivo YAML.
-   **Docker CLI:** Es la interfaz de línea de comandos para interactuar con Docker.

### ¿Por qué Docker ha revolucionado el desarrollo y despliegue de aplicaciones?

-   **Aislamiento a nivel de sistema operativo:** Los contenedores Docker aíslan aplicaciones a nivel de sistema operativo, lo que significa que cada aplicación tiene su propio entorno, incluyendo procesos, bibliotecas y configuraciones. Esto evita conflictos entre aplicaciones y garantiza un entorno de ejecución consistente.
-   **Portabilidad excepcional:** Una vez creada una imagen de Docker, puedes ejecutarla en cualquier máquina con Docker instalado, sin importar la distribución de Linux o la infraestructura en la nube. Esto facilita el desarrollo y despliegue en diferentes entornos.
-   **Gestión eficiente de recursos:** Los contenedores comparten el kernel del host, lo que los hace más ligeros que las máquinas virtuales. Esto permite ejecutar más aplicaciones en un mismo servidor físico, optimizando el uso de recursos.
-   **Escalabilidad sin esfuerzo:** Puedes escalar vertical u horizontalmente tus aplicaciones simplemente añadiendo o quitando contenedores. Esto te permite ajustar la capacidad de tu aplicación según la demanda.
-   **Ciclo de vida de desarrollo acelerado:** Docker agiliza el ciclo de desarrollo al permitir a los desarrolladores crear entornos de desarrollo consistentes y reproducibles. Además, facilita la automatización de procesos como la construcción, pruebas y despliegue de aplicaciones.

### Escenarios de uso más allá de los básicos

-   **Desarrollo de aplicaciones en equipos distribuidos:** Docker permite a equipos distribuidos colaborar de forma más eficiente, ya que cada desarrollador puede trabajar en su propio entorno de desarrollo local, pero con la garantía de que la aplicación se ejecutará de la misma manera en producción.
-   **Ciudades inteligentes:** Docker se utiliza para crear aplicaciones IoT que gestionan dispositivos y sensores en entornos urbanos, como sistemas de iluminación inteligente, gestión del tráfico y monitoreo de la calidad del aire.
-   **Finanzas:** Las instituciones financieras utilizan Docker para desplegar aplicaciones de trading de alta frecuencia, sistemas de detección de fraudes y plataformas de banca en línea.
-   **Ciencia de datos:** Los científicos de datos utilizan Docker para crear entornos de análisis de datos reproducibles, lo que facilita la colaboración y la comparación de resultados.

### Conceptos avanzados y herramientas relacionadas

-   **Docker Compose:** Permite definir y ejecutar aplicaciones multi-contenedor usando un solo archivo YAML.
-   **Docker Swarm:** Es una herramienta de orquestación de contenedores nativa de Docker, que permite gestionar clústeres de contenedores de forma sencilla.
-   **Kubernetes:** Es una plataforma de orquestación de contenedores de código abierto más avanzada y flexible que Docker Swarm, ampliamente utilizada en entornos de producción.

### Docker vs. Máquinas Virtuales

Docker y las máquinas virtuales (VM) son tecnologías que permiten aislar aplicaciones, pero lo hacen de manera diferente:

-   **Máquinas Virtuales:**

    -   Virtualizan el hardware completo de una máquina.
    -   Cada VM (virtual machine) tiene su propio sistema operativo.
    -   Son más pesadas y requieren más recursos.
    -   Ideal para aislar sistemas operativos completos o aplicaciones que requieren un alto grado de aislamiento.

-   **Docker:**
    -   Virtualizan el sistema operativo, compartiendo el kernel del host.
    -   Los contenedores son más ligeros y se inician más rápido.
    -   Ideal para micro-servicios y aplicaciones distribuidas.

**Tabla comparativa:**

| Característica | Máquinas Virtuales                        | Docker                            |
| -------------- | ----------------------------------------- | --------------------------------- |
| Aislamiento    | Completo (hardware y software)            | Parcial (software)                |
| Rendimiento    | Menor                                     | Mayor                             |
| Recursos       | Más                                       | Menos                             |
| Uso típico     | Servidores completos, aplicaciones legacy | Microservicios, desarrollo, CI/CD |

## APRENDE DOCKER AQUÍ

**Pasos Indispensables:**

1. Instalar docker-desktop, en [www.docker.com](https://www.docker.com/products/docker-desktop/).
2. Verificar si tienes habilitado la virtualización:
    1. Dirígete a el administrador de tareas de tu pc.
    2. Entra en la ventana de rendimiento.
    3. Selecciona CPU.
    4. Verifica que la virtualización salga HABILITADA.
        1. **Si no esta habilitada, investiga como puedes habilitarla en tu sistema operativo**
3. Abre docker-desktop y regístrate.
4. Termina los proceso adicionales.
5. Deja abierta la ventana de Docker.

> Debes de abrir y mantener abierto docker en tu computador para poder ejecutar los siguientes comandos.
> Para tener mejor fluidez, primero lee los conceptos importantes, -> [Conceptos IMPORTANTES](#conceptos-importantes)

### Ver las imágenes:

`> docker images` comando se utiliza para listar todas las imágenes de Docker que están almacenadas en tu sistema local.

    REPOSITORY   TAG       IMAGE ID   CREATED   SIZE

-   **REPOSITORY:** Nombre del repositorio de donde se obtuvo la - imagen (puede ser local o remoto).
-   **TAG:** Etiqueta o versión de la imagen.
-   **IMAGE ID:** Identificador único de la imagen.
-   **CREATED:** Fecha y hora en que se creó la imagen.
-   **SIZE:** Tamaño de la imagen.

### Descargar una imagen:

#### **¿Cómo encontrar y descargar imágenes de Docker Hub?**

1.  **Busca la imagen:**

    -   **Interfaz web:** Visita [https://hub.docker.com/](https://hub.docker.com/). Utiliza la barra de búsqueda para encontrar la imagen que necesitas. Puedes buscar por nombre de imagen, descripción o por el software que deseas ejecutar.
    -   **Línea de comandos:** Utiliza el comando `docker search` para buscar imágenes desde tu terminal. Por ejemplo: `> docker search node`; esto te mostrará una lista de imágenes relacionadas con Node.js.

2.  **Selecciona la imagen:** Una vez que encuentres la imagen deseada, verás detalles como:

    -   **Nombre:** El nombre único de la imagen.
    -   **Descripción:** Una breve descripción de la imagen y su propósito.
    -   **Etiquetas:** Versiones o variantes de la imagen.

#### **¿Como descarga una imagen?**

-   **Línea de comandos:** Utiliza el comando `docker pull` seguido del nombre completo de la imagen (incluyendo la etiqueta si es necesario). Por ejemplo: `docker pull imagen_deseada`; si no incluyes la versión se descargara la versión más actualizada (se recomienda seleccionar la versión); ejemplo: `docker pull imagen_deseada:etiqueta` importante, no debe omitir los **:**, esta es la forma de identificar la versión.

#### **Consejos**

-   **Utiliza etiquetas:** Las etiquetas te permiten seleccionar diferentes versiones o configuraciones de una misma imagen.
-   **Explora los repositorios oficiales:** Docker Hub alberga muchos repositorios oficiales de software popular, como Ubuntu, Nginx, MySQL, etc.
-   **Lee las descripciones:** Antes de descargar una imagen, lee detenidamente su descripción para asegurarte de que cumple con tus requisitos.
-   **Considera las estrellas y comentarios:** Las valoraciones de la comunidad pueden ayudarte a elegir la mejor imagen.

### Eliminar una imagen:

Para eliminar una imagen en Docker, utilizamos el comando `docker rmi` seguido del ID o nombre de la imagen. Para saber estos datos de la imagen debemos ejecutar el comando anterior `docker images`

**Ejemplo:**

    docker rmi <image_id/name_image:versión>

Puedes eliminar múltiples imágenes en una sola línea separando los IDs o nombres con espacios entre si.

    docker rmi <image_id/name_image:versión> <image_id/name_image:versión>

Aquí tienes una guía detallada para los comandos de Docker mencionados. Cada comando está acompañado de su descripción, ejemplo, y puntos clave para su uso.

### Crear una Imagen de Docker

Antes de crear un contenedor, es necesario tener una imagen que servirá como base; `docker pull imagen_deseada:etiqueta`

### Crear un Contenedor con una Imagen

Una vez creada la imagen, se puede crear el contenedor.

`docker container create <nombre-imagen>`

-   **Descripción**: Crea un contenedor basado en una imagen.
-   **Ejemplo**: `docker container create mongo`
-   **Puntos Clave**:
    -   No inicia el contenedor, solo lo crea.
    -   Es posible asignar un nombre, red y otras configuraciones al crearlo.

### Iniciar un Contenedor

Para iniciar un contenedor que ha sido creado.

#### `docker start <id-del-contenedor>`

-   **Descripción**: Inicia un contenedor existente usando su ID o nombre.
-   **Ejemplo**: `docker start contenedor1`
-   **Puntos Clave**:
    -   Si se quiere iniciar un contenedor de manera interactiva, puede usarse `docker start -i <id>`.

### Verificar los Contenedores en Ejecución

Para ver los contenedores que están en funcionamiento.

#### `docker ps`

-   **Descripción**: Muestra una lista de los contenedores activos.
-   **Ejemplo**: `docker ps`
-   **Puntos Clave**:
    -   Para ver todos los contenedores (activos e inactivos), usar `docker ps -a`.

### Detener un Contenedor

Para detener un contenedor en ejecución.

#### `docker stop <id-del-contenedor>`

-   **Descripción**: Detiene un contenedor en ejecución.
-   **Ejemplo**: `docker stop contenedor1`
-   **Puntos Clave**:
    -   El contenedor puede reiniciarse más tarde con `docker start`.

### Eliminar un Contenedor

Si ya no necesitas un contenedor, puedes eliminarlo.

#### `docker rm <nombre-del-contenedor>`

-   **Descripción**: Elimina un contenedor específico.
-   **Ejemplo**: `docker rm contenedor1`
-   **Puntos Clave**:
    -   El contenedor debe estar detenido para poder eliminarlo.

### Crear un Contenedor con Nombre y Configuraciones Adicionales

Puedes asignar un nombre al contenedor y especificar puertos y redes.

#### `docker container create --name <nombre> --network <red> -p <puerto-local>:<puerto-contenedor> <imagen>`

-   **Descripción**: Crea un contenedor con un nombre personalizado, configuración de red y mapeo de puertos.
-   **Ejemplo**: `docker container create --name monguito --network mi-red -p 27017:27017 mongo`
-   **Puntos Clave**:
    -   Puedes asignar variables de entorno con `-e <clave>=<valor>` para configurar el contenedor.

### Ver los Logs de un Contenedor

Para ver la salida generada por el contenedor.

#### `docker logs <nombre o id-del-contenedor>`

-   **Descripción**: Muestra los logs del contenedor especificado.
-   **Ejemplo**: `docker logs monguito`
-   **Puntos Clave**:
    -   Usa `docker logs --follow <nombre>` para ver los logs en tiempo real.

### Ejecutar una Imagen Todo-en-Uno

Este comando busca la imagen, la descarga si no existe, crea el contenedor, y lo inicia.

#### `docker run <nombre-imagen>`

-   **Descripción**: Realiza todos los pasos para crear e iniciar un contenedor de forma automática.
-   **Ejemplo**: `docker run mongo`
-   **Puntos Clave**:
    -   El flag `-d` ejecuta el contenedor en segundo plano.
    -   Usa `--name` para darle un nombre y `-p` para mapear puertos.

### Redes en Docker

Para gestionar redes en Docker.

#### `docker network create <nombre>`

-   **Descripción**: Crea una red que puedes asignar a contenedores.
-   **Ejemplo**: `docker network create mi_red`
-   **Puntos Clave**:
    -   Usa `docker network ls` para ver las redes disponibles.
    -   Asigna la red a un contenedor con `--network`.

### Docker Compose

Usar Docker Compose simplifica el proceso de creación de múltiples contenedores.

#### Archivo `docker-compose.yml`

```yaml
version: "3.9"
services:
    mi_app:
        image: mongo
        ports:
            - "27017:27017"
        environment:
            - MONGO_INITDB_ROOT_USERNAME=root
            - MONGO_INITDB_ROOT_PASSWORD=example
```

#### Comando para Iniciar con Docker Compose

-   **Descripción**: Crea y ejecuta todos los servicios especificados en `docker-compose.yml`.
-   **Ejemplo**: `docker compose up`
-   **Puntos Clave**:
    -   Usa `docker compose down` para detener y eliminar los contenedores y redes creados.

### Volúmenes en Docker

Los volúmenes permiten persistir datos fuera del ciclo de vida de un contenedor.

#### Volumen Nombrado en Docker Compose

```yaml
volumes:
    mongo-data:
```

-   **Descripción**: Define volúmenes en un archivo Docker Compose.
-   **Ejemplo**: El volumen `mongo-data` se puede usar en varios servicios dentro del mismo archivo de configuración.
-   **Puntos Clave**:
    -   Volúmenes anónimos no tienen un nombre y solo se especifica la ruta.

### Dockerfile y Docker Compose para Desarrollo

Para crear un entorno de desarrollo con `Dockerfile` y `docker-compose`.

#### Ejemplo de Dockerfile.dev

```Dockerfile
FROM node:18

RUN npm install -g nodemon
RUN mkdir -p /home/app

WORKDIR /home/app

EXPOSE 3000

CMD ["nodemon", "index.js"]
```

#### Ejemplo de docker-compose-dev.yml

```yaml
version: "3.9"
services:
    app:
        build:
            context: .
            dockerfile: Dockerfile.dev
        ports:
            - "3000:3000"
        volumes:
            - .:/home/app
        links:
            - db
    db:
        image: mysql
        environment:
            - MYSQL_ROOT_PASSWORD=example
        ports:
            - "3306:3306"
        volumes:
            - mysql-data:/var/lib/mysql

volumes:
    mysql-data:
```

#### Comando para Levantar el Entorno de Desarrollo

-   **Ejemplo**: `docker compose -f docker-compose-dev.yml up`
-   **Puntos Clave**:
    -   Usa `-f` para especificar el archivo Docker Compose
