# ComparerApp 🎮

## Idea Inicial 💡
Comparador de precios de videojuegos en diferentes tiendas web. Los precios se actualizarán de forma diaria teniendo en cuenta los diversos cambios que se pueden producir en sus correspondientes sitios web en diversos momentos (en el momento en el que se refresque la página para el user), así como tratar de predecir tanto el precio, como el momento en el que se producirá la rebaja teniendo en cuenta datos estadísticos pasados. Este análisis se realizará sobre una gama de videojuegos bastante alta, siendo aquellos que se encuentran disponibles en las tiendas web de mayor referencia, independientemente de la antigüedad, el precio, importancia o género.


## Motivación 👏
La idea del proyecto viene dada para dar una herramienta a aquellas personas, desde estudiantes aficionados a los videojuegos, hasta aquellos más veteranos, que buscan poder adquirir de forma legal a un precio asequible sus juegos favoritos.

## Documentación 📂
Se tiene acceso a la documentación del proyecto en [este enlace.](https://github.com/Paszser/ComparerApp/tree/main/docs)

* En el archivo [Issues](https://github.com/Paszser/ComparerApp/blob/main/docs/ISSUES.md) se describen los tipos de usuario así como las historias de los mismos que derivan en la creación de los milestones para conseguir esas funcionalidades.
* En el archivo [User Journey](https://github.com/Paszser/ComparerApp/tree/main/docs) se realiza el ejemplo del recorrido del usuario al hacer uso de la aplicación funcional.

## Automatizacion de testeo 📋

### Instalación y tests
Para el desarrollo de estas comprobaciones, va a ser necesario poseer en nuestra máquina, y así poder ejecutar, comandos pertenecientes a 'rake', 'ruby' y 'gem'.

Primeramente, comprobaremos si tenemos los comandos mencionados anteriormente instalados:

```shell
rake --version
gem --version
ruby --version

```

A continuación y para facilitar la administración de la instalación de lo que se necesita de Ruby, recomendamos seguir las pautas que se indican en la página oficial: [RVM](https://rvm.io/rvm/install)

Procedemos a instalar aquel que no tengamos en nuestro PC. En caso de necesitar la última versión de Ruby usaremos el siguiente comando. Con este comando se incluye la instalación de gem si no se tuviera en la máquina:

```shell
rvm install ruby
rvm --default use ruby
```

Para manejar e instalar algunas dependencias, haremos uso de un manejador para ello, conocido como bundler y el cual instalaremos en nuestra máquina:
```shell
gem install bundler
```

Así obtendremos un manejador que nos ayudará a instalar las dependencias precisas para el proyecto, el cual culminará cuando ejecutemos (el cual incluye rake), especificado en el archivo Gemfile:
```shell
rake installdeps
```

Tras este comando se generará un archivo "Gemfile.lock" el cual recoge las versiones instaladas mediando el comando de las dependencias.

Tras tener todas las herramientas de las que disponemos, podremos comenzar a hacer uso de las tareas creadas para la automatización y las comprobaciones que se requieren:

### Realización de los test pertinentes
Se realizarán los test con:

```shell
rake test
```

### Comprobación de la sintaxis
Se realizarán comprobaciones de la sintaxis de los ficheros del proyecto con:

```shell
rake check
```

## Tests
Para la realización de pruebas de nuestro código, haremos uso de la herramienta RSpec. Primeramente, comprobaremos si la poseemos:

```shell
rspec --version
```

En caso negativo, procederemos a ejecutar el siguiente comando, (tras la inclusión en el Gemfile de la gema correspondiente a RSpec):

```shell
bundle binstubs rspec-core
```
Este comando instala rspec y crea un ejecutable de nombre *rspec* en nuestro directorio *./bin/*. Así no será necesario ejecutar continuamente el comando *bundle exec rspec* cuando queramos hacer uso de la herramienta, y solo nos será necesario acceder a *./bin/rspec*

El comando que muchos tutoriales recomiendan es directamente hacer uso de:

```shell
bundle install --binstubs
```

Pero muchos expertos lo consideran como obsoleto en contraposición al comando que hemos optado por usar, el cual es más recomendado.

Seguidamente, usaremos el comando:

```shell
bin/rspec --init
```

Con el cual generaremos el directorio *./spec* con el archivo *spec_helper.rb* en su interior y que contendrá diversas utilidades en él de cara a nuestras pruebas, como por ejemplo, la configuración. Y además nos creará un archivo de nombre *.rspec*.

Finalmente como en momentos previos usamos Rake para automatizar el proyecto. Podremos hacer uso del siguiente comando para testear nuestro código:

```shell
rake test
```
## Docker

### Dockerfile

En la creación de contenedores para el despliegue futuro de nuestra aplicación, vamos a hacer uso de Docker. Vamos a aplicar los conocimientos adquiridos en las clases de la asignatura así como en las prácticas de asignaturas paralelas y colindantes a ésta.

Primeramente, hemos indagado [aquí](https://hub.docker.com/_/ruby) para la versión de ruby a utilizar en nuestro Dockerfile como imagen.

Tras incluir algunos metadatos de información, hemos proseguido aplicando buenas metodologías y prácticas para la creación del Dockerfile, creando variables de entorno tanto para el directorio de trabajo donde se ejecutarán los tests como para el directorio home del user sin privilegios que vamos a añadir.

Después de añadir al susodicho usuario, damos privilegios de usuario a nuestro GEM_HOME, el cual es /usr/local/bundle, y cambiamos a dicho usuario. Copiaremos tanto el Gemfile, como el Gemfile.lock al home del user e instalamos las dependencias que se incluyen en el Gemfile, borrando los ficheros de dependencias generados y que no nos serán de provecho. 

Finalmente cambiamos al directorio de trabajo para ejecuat los tests con el task runner que poseemos y ejecutamos en la terminal el comando con el que se procesan los tests que hemos programado.

### Dockerhub

A su vez haremos uso de Dockerhub, el registro de repositorios facilitado por Docker para extraer y enviar las imágenes, y para lo que hemos tenido que seguir una serie de pasos para su set up.

#### Preparación

Tras crear nuestra cuenta en Dockerhub y crear nuestro repositorio de nombre igual al de nuestro proyecto, hemos accedido al apartado de seguridad en la configuración del perfil para general un token de seguridad.

Dicho token se ha añadido como secreto de nuestro repositorio como token de acceso, que en consonancia al token de nuestro usuario de dockerhub, serán los dos secretos enlazados a nuestro repositorio de GitHub.

#### Dockerhub.yml

Para la automatización de esto, hemos creado un archivo .yml: *.github/workflows/dockerhub.yml* en el que hemos añadido las diferentes opciones y configuraciones de nuestro interés.

Indicamos la activación del archivo cuando se envía a la main brach del repositorio, especificando posteriormente lo que queremos que ocurra en el workflow. También indicamos que se active con el push al main o un pull request a la rama main.

Añadimos en general todo aquello que nos parezca conveniente, tanto lo explicado en clase como lo que se indica [aquí](http://jj.github.io/IV/documentos/proyecto/5.Docker) incluyendo la ejecución de la orden para testear el contenedor que se facilita.