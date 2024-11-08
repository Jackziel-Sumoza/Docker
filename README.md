# Docker

## Entendiendo Docker, Contenedores, Repositorios y Virtualización

### Contenedores: Aislamiento en Pequeño Formato

Un **contenedor** es como un paquete autónomo que contiene todo lo necesario para ejecutar una aplicación: código, bibliotecas, herramientas y configuraciones. Estos paquetes se aíslan entre sí, lo que garantiza que una aplicación no interfiera con otra.

-   **Ventajas:**
    -   **Portabilidad:** Un contenedor puede ejecutarse en cualquier máquina con Docker instalado, sin importar el sistema operativo subyacente.
    -   **Escalabilidad:** Es fácil crear múltiples instancias de un contenedor para manejar un aumento en la carga.
    -   **Eficiencia:** Los contenedores comparten el kernel del sistema operativo host, lo que los hace más ligeros y rápidos que las máquinas virtuales.

### Repositorios de Contenedores: Almacenes de Imágenes

Un **repositorio de contenedores** es un almacén donde se guardan las imágenes de los contenedores. Estas imágenes son como plantillas a partir de las cuales se crean los contenedores.

-   **Tipos de repositorios:**

    -   **Privados:** Pertenecen a una organización y son accesibles solo para sus miembros.
    -   **Públicos:** Son de acceso libre para cualquier persona.

-   **Docker Hub:** Es el repositorio público más grande y popular para imágenes de Docker. Ofrece imágenes oficiales de sistemas operativos, lenguajes de programación (Node.js, Python, Go, etc.), bases de datos (PostgreSQL, MySQL) y muchas otras aplicaciones.

### ¿Qué reemplazaron los contenedores?

Los contenedores, especialmente Docker, han revolucionado la forma en que desplegamos y escalamos aplicaciones, en gran medida reemplazando las **máquinas virtuales**. Mientras que las máquinas virtuales virtualizan todo un sistema operativo, los contenedores solo virtualizan la aplicación, lo que los hace más ligeros y eficientes.

### El ciclo de vida de una aplicación con y sin contenedores

**Sin contenedores:**

-   **Desarrollo:** Los desarrolladores configuran sus entornos de desarrollo localmente, lo que puede llevar a inconsistencias entre entornos.
-   **Despliegue:** El código, las instrucciones y los archivos de configuración se despliegan en servidores, a menudo requiriendo actualizaciones manuales y coordinación para garantizar que todas las dependencias estén presentes.
-   **Actualizaciones:** Actualizar los servidores puede ser un proceso complejo y arriesgado, especialmente si las dependencias tienen diferentes versiones.

**Con contenedores:**

-   **Desarrollo:** Los desarrolladores construyen una imagen de Docker que contiene todas las dependencias de la aplicación.
-   **Despliegue:** La imagen se envía a un repositorio y se despliega en un entorno de producción.
-   **Actualizaciones:** Para actualizar la aplicación, se crea una nueva imagen con los cambios y se despliega.

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

### ¿Qué sigue después de aprender los conceptos básicos?

Una vez que comprendas los fundamentos de Docker, puedes profundizar en temas como:

-   **Seguridad de los contenedores:** Cómo proteger tus contenedores de vulnerabilidades y ataques.
-   **Redes de contenedores:** Cómo conectar contenedores entre sí y con el mundo exterior.
-   **Almacenamiento persistente:** Cómo gestionar el almacenamiento de datos persistentes en contenedores.
-   **Optimización de imágenes:** Cómo crear imágenes de Docker más pequeñas y eficientes.

### Comparación entre Docker y máquinas virtuales, mejores prácticas y ejemplos de uso

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

### Mejores prácticas para crear Dockerfiles

-   **BASE IMAGE:** Elegir una base image lo más pequeña posible.
-   **MULTISTAGE BUILDS:** Utilizar múltiples etapas para reducir el tamaño final de la imagen.
-   **CACHE:** Aprovechar el cache para acelerar las construcciones.
-   **NON-ROOT USER:** Ejecutar el proceso principal como un usuario no root por seguridad.
-   **HEALTHCHECK:** Definir un healthcheck para verificar el estado del contenedor.
-   **MINIMALISTA:** Incluir solo lo necesario para que la aplicación funcione.

**Ejemplo de Dockerfile:**

```dockerfile
FROM node:18-alpine as builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM node:18-alpine
WORKDIR /app
COPY --from=builder /app/build /app/build
EXPOSE 3000
CMD ["node", "app/build/index.js"]
```

### Cómo configurar redes de contenedores

-   **Bridge:** Red aislada por defecto.
-   **Host:** El contenedor comparte la red del host.
-   **None:** Sin red configurada por defecto.
-   **Overlay:** Redes multi-host para orquestración (Kubernetes).

**Configurar una red bridge:**

```bash
docker network create my-network
docker run -d --network my-network my-image
```

### Ejemplos prácticos de uso de Docker en diferentes industrias

-   **Desarrollo:** Entornos de desarrollo consistentes y reproducibles.
-   **CI/CD:** Automatización de la construcción, pruebas y despliegue.
-   **Microservicios:** Descomponer aplicaciones monolíticas en servicios más pequeños.
-   **Cloud:** Escalabilidad y alta disponibilidad de aplicaciones.
-   **IoT:** Gestión de dispositivos y aplicaciones IoT.
-   **Data Science:** Entornos de desarrollo y ejecución de modelos de machine learning.

**Ejemplo de uso en desarrollo:**

```bash
# Crear un contenedor interactivo con Bash
docker run -it --name my-container my-image bash
```