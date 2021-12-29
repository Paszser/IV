# Docker

## Criterios

### ¿Contendores?

Para poder desplegar nuestra aplicación y poder realizar los test pertinentes y ejecutarlos, haremos uso de contenedores con los que se nos facilite el proceso de lanzamiento (incluso en la nube en un futuro) y aislar la ejecución de nuestro proyecto.

Trataremos de buscar así, un entorno de prueba y producción que no solo nos permita desplegar el proyecto, si no que cumpla una serie de requisitos para poder hacer uso de las prestaciones que cumplan los criterios pertinentes y haga una buena simbiosis con nuestra aplicación.

1. Simpleza: Desde un aspecto más general, confirmamos el uso de contenedores por encima de otro tipo de opciones por su simplicidad y el ahorro de tiempo que ello nos aporta. Una opción para el despliegue podría ser una máquina virtual, pero ello requiere de tiempo y esfuerzo cuyo valor se mide en oro. Nos concentraremos en optimizar desde el principio todo y por ello haremos uso de los contenedores.

2. Ligereza: Los contenedores tienen la ventaja del uso de pocos recursos en comparación a máquinas virtuales, por ejemplo. También hacen uso de menos espacio de memoria, lo que optimiza la ejecución cuando sea pertinente, al igual que el menor tiempo de arranque.

3. Seguridad: A su vez, podemos estar seguros que si nuestra aplicación se despliega correctamente en un contenedor, se garantiza que se hará muy seguramente en el resto de máquinas, evitando la famosa frase "funciona en mi máquina" como excusa ante fallos.

4. Extensibilidad: Si fuere necesario, es posible ampliar una imagen existente y agregar aspectos que necesite el contenedor, y así hacer que su imagen se ajuste mejor a sus requisitos. Muchas veces alguna pieza falta a la hora de montar el entorno y lo extensible que es docker facilita enormemente este aspecto.

5. La nube: Los contenedores y Cloud Computing están estrechamente ligados. De esta forma nos facilitamos cualquier error que pueda ocurrir así como problemas.

### ¿Qué contenedor?

Teniendo una idea de la importancia y ventajas que nos brindan los contenedores para el despliegue de nuestro proyecto. ¿Cuál deberíamos de escoger?

Vamos a tener en cuenta algunos aspectos de importancia desde los cuales partir para realizar una elección a posteriori.

1. Documentación: Primeramente, nos fijaremos en aquellas opciones que posean una mejor documentación. Es bien sabido que cuanta mayor información se disponga respecto a algo, mejor y más fácil será resolver problemas y obtener un mejor resultado. Así, esto va de la mano con una mayor comunidad en la que a su vez mayores sean los avances con el paso del tiempo para mejores opciones y prestaciones.

2. Portabilidad: Dentro del ámbito que nos incumbe, nos importan formas rápidas de compartir nuestra aplicación con sus dependencias hacia otros entornos. Todo lo que sea facilitar este tipo de acciones nos convendrá para el momento que despleguemos el proyecto.

3. Control de versiones: Nuestro desarrollo va de la mano con las versiones de nuestro código. Estamos en un constante avance en el que nos interesa tener cierto control sobre el estado de nuestra aplicación en ciertos momentos del desarrollo.

4. Rapidez en el despliegue: Una de las razones por las que elegimos los contenedores fue esta misma. Trataremos de optimizar al máximo tanto el tiempo como el espacio del que haremos uso, y dentro de los propios contenedores es un aspecto en el que fijarse.

5. Almacenamiento: Al igual que el apartado anterior, trataremos de optimizar este aspecto al máximo para tratar de consumir lo menos posible.


## Opciones

Varias son las opciones que se presentan ante nosotros a la hora de hacer elección del contenedor. Azure, GitHub container registry o AWS son algunas opciones que se presentan en la mesa como candidatas para hacer uso de sus características, pero la que más destaca es la conocida Docker.

1. Documentación: Comenzando con la Documentación, Docker está bastante extendida, por lo que tanto la información escrita como la cantidad de usuarios que colaboran es bastante grande. Cumple con creces por no decir que es la que más destaca en este aspecto.

2. Portabilidad: Docker proporciona un modelo de implementación basado en imágenes, lo que a su vez significa que sirve una manera sencilla de distribuir una aplicación, como buscamos en este caso.

3. Control de versiones: Una sola imagen de Docker está conformada por un conjunto de capas armonizadas. Cuando se altera una imagen se crea una capa, y Docker tiene esa funcionalidad para hacer de nuevo uso de las capas para formar nuevos contenedores. La forma en la que se intercalan dichas capas en su forma de control de versiones.

4. Rapidez en el despliegue: Una imagen puede ponerse en marcha con Docker en cuestión de segundos, y cuando ya no se precisa de la misma forma, es capaz de eliminarse rápidamente.

5. Almacenamiento: Docker no admite el almacenamiento persistente. Cuando se forma una imagen Docker, sus capas serás de solamente lectura. Mientras dure la ejecución, si se produce algún cambio en su status, la diferencia se reflejará en una nueva capa.

## Elección

Ante todas las opciones presentadas, en nuestro caso haremos uso de Docker para los contenedores del proyecto. Como hemos podido observar, cumple con creces los requisitos mínimos que hemos impuesto, y a pesar de la existencia de otras opciones, lo extendido y famoso que es nuestra elección la dota de las cualidades para ser nuestra elegida.