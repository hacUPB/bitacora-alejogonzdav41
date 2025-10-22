### Actividad 1

**¿Qué son los vértices?**

Los vértices son puntos que marcan las esquinas de una figura en 3D. Cada triángulo, cubo o cualquier forma está hecha por varios vértices conectados entre sí.

**¿Con qué figura geométrica se dibuja en 3D?**

En 3D todo se dibuja con triángulos. Las formas más complejas se construyen uniendo muchos triángulos pequeños.

**¿Qué es un shader?**

Un shader es un programa que corre en la GPU y le dice cómo deben verse las cosas. Por ejemplo, puede controlar los colores, las luces o las texturas de un objeto.

**¿Cómo se le llaman a los grupos de píxeles de un mismo triángulo?**

A esos grupos se les llama fragmentos o fragments. Cada fragmento representa un posible píxel en pantalla del triángulo.

**¿Qué es un fragment shader?**

Es un tipo de shader que se encarga de decidir el color final de cada fragmento (píxel). Aquí se aplican efectos como sombras, brillos o texturas.

**¿Qué es un vertex shader?**

Es un shader que trabaja con los vértices. Se encarga de moverlos, rotarlos o escalarlos para que el objeto se vea en la posición correcta en la pantalla.

**¿Al proceso de determinar qué píxeles del display va a cubrir cada triángulo de una mesh se le llama?**

Ese proceso se llama rasterización. Es cuando los triángulos se transforman en píxeles visibles.

**¿Qué es el render pipeline?**

Es el camino o proceso que sigue la información desde que se crean los vértices hasta que se muestra la imagen final en la pantalla. Incluye varias etapas como los shaders, la rasterización y el pintado.

**¿Hay alguna diferencia entre aplicar un color a una superficie de una mesh o aplicar una textura?**

Sí. Aplicar un color es algo fijo (todo el objeto se ve igual), mientras que una textura es una imagen que se “pega” sobre la superficie para darle más detalle.

**¿Cuál es la diferencia entre una textura y un material?**

Una textura es solo una imagen, pero un material puede incluir más propiedades, como el color base, el brillo, la transparencia o cómo refleja la luz.

**¿Qué transformaciones se requieren para mover un vértice del 3D world al View Screen?**

Se hacen tres transformaciones principales:

World transform: mueve el objeto dentro del mundo 3D.

View transform: cambia la vista según la cámara.

Projection transform: convierte la escena 3D en una vista 2D que se puede mostrar en pantalla.

**¿Al proceso de convertir los triángulos en fragmentos se le llama?**

Se le llama rasterización (igual que antes). Es cuando el triángulo se convierte en muchos fragmentos o píxeles.

**¿Qué es el framebuffer?**

Es una parte de la memoria donde se guarda la imagen final antes de mostrarse en la pantalla. Es como el “borrador” donde la GPU pinta todo.

**¿Para qué se usa el Z-buffer o depth buffer en el render pipeline?**

Sirve para saber qué objetos están más cerca o más lejos de la cámara. Así, si un objeto está detrás de otro, no se dibuja encima por error.

### Actividad 2


#### Ejemplo 1

**¿Cómo funciona?**

El programa carga un shader y lo aplica a un rectángulo que cubre toda la pantalla. En el método draw(), el shader se activa, se dibuja el rectángulo y luego se desactiva. Todo lo que se dibuje entre shader.begin() y shader.end() es procesado por la GPU y se modifica según las instrucciones del shader.

**¿Qué resultados obtuviste?**

![alt text](<Screenshot 2025-10-22 150035.png>)

**¿Estás usando un vertex shader?**

Sí, se utiliza un vertex shader para determinar la posición de cada vértice del modelo en la pantalla.

**¿Estás usando un fragment shader?**

Sí, se está usando un fragment shader para decidir el color y la apariencia de cada píxel en la pantalla.

**Analiza el código de los shaders. ¿Qué hace cada uno?**

El vertex shader se encarga de indicar al programa la posición exacta de los puntos del rectángulo para que se dibuje correctamente. En cambio, el fragment shader determina el color que tendrá cada parte del dibujo.

#### Ejemplo 2

**¿Cómo funciona?**

Genera un plano 3D en el centro de la pantalla que se va deformando mediante el shader. El color varía dependiendo de la posición del mouse en el eje X (pasando de rosado a azul), y el plano rota cuando se mueve el mouse en el eje Y.

**¿Qué resultados obtuviste?**

![alt text](<Screenshot 2025-10-22 145734.png>)

**¿Estás usando un vertex shader?**

Sí, se está utilizando un vertex shader para calcular la posición de los vértices del plano.

**¿Estás usando un fragment shader?**

Sí, se está utilizando un fragment shader para definir los colores que aparecen en el plano.

**Analiza el código de los shaders. ¿Qué hace cada uno?**

El vertex shader modifica la posición de los puntos del plano para generar la deformación, mientras que el fragment shader aplica los colores, haciendo que varíen de rosado a azul según la posición del mouse.

#### Ejemplo 3

**¿Cómo funciona?**

El programa dibuja un plano grande en la pantalla y le aplica un shader que reacciona al movimiento del mouse. Según la dirección en que se mueva, los colores cambian entre rosado, morado y azul. Además, al mover el mouse, el plano se deforma visualmente, creando un efecto similar al de una burbuja.

**¿Qué resultados obtuviste?**

![alt text](<Screenshot 2025-10-22 150557.png>)

**¿Estás usando un vertex shader?**

Sí, se está utilizando un vertex shader para controlar los puntos del plano y generar la deformación que le da el efecto de burbuja.

**¿Estás usando un fragment shader?**

Sí, se está utilizando un fragment shader para generar los colores del plano y hacer que varíen según la posición del mouse en el eje X.

**Analiza el código de los shaders. ¿Qué hace cada uno?**

El vertex shader modifica la forma o posición del plano según los valores que recibe, como la ubicación del mouse, mientras que el fragment shader se encarga de colorearlo, haciendo que el tono cambie de magenta a azul según la posición del cursor.

#### Ejemplo 4

**¿Cómo funciona?**

Se carga una imagen de rectangulos raros de colores sobre un plano, y el shader se encarga de detectar y seguir el movimiento del mouse para mover el plano en pantalla.

**¿Qué resultados obtuviste?**

![alt text](<Screenshot 2025-10-22 151200.png>)

**¿Estás usando un vertex shader?**

Sí, se utiliza un vertex shader para mover los puntos del plano y ajustar su apariencia según la posición del mouse.

**¿Estás usando un fragment shader?**

Sí, también se utiliza un fragment shader para modificar los colores y aplicar efectos visuales a la imagen.

**Analiza el código de los shaders. ¿Qué hace cada uno?**

El vertex shader ajusta la posición del plano y la textura de acuerdo con el movimiento del mouse, mientras que el fragment shader se encarga de dibujar la imagen y aplicar los efectos visuales que se observan en pantalla.

#### Ejemplo 5

**¿Cómo funciona?**


**¿Qué resultados obtuviste?**



**¿Estás usando un vertex shader?**


**¿Estás usando un fragment shader?**


**Analiza el código de los shaders. ¿Qué hace cada uno?**

#### Ejemplo 6

**¿Cómo funciona?**


**¿Qué resultados obtuviste?**



**¿Estás usando un vertex shader?**


**¿Estás usando un fragment shader?**


**Analiza el código de los shaders. ¿Qué hace cada uno?**

#### Ejemplo 7

**¿Cómo funciona?**


**¿Qué resultados obtuviste?**



**¿Estás usando un vertex shader?**


**¿Estás usando un fragment shader?**


**Analiza el código de los shaders. ¿Qué hace cada uno?**

#### Ejemplo 8

**¿Cómo funciona?**


**¿Qué resultados obtuviste?**



**¿Estás usando un vertex shader?**


**¿Estás usando un fragment shader?**


**Analiza el código de los shaders. ¿Qué hace cada uno?**

#### Ejemplo 9

**¿Cómo funciona?**


**¿Qué resultados obtuviste?**



**¿Estás usando un vertex shader?**


**¿Estás usando un fragment shader?**


**Analiza el código de los shaders. ¿Qué hace cada uno?**