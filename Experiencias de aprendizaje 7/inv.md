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

Se cargan dos imágenes: una con los diamantes de colores originales y otra que funciona como máscara. Luego, un shader combina ambas para generar un efecto de “masking”, donde una imagen se muestra solo en las partes definidas por la máscara.

**¿Qué resultados obtuviste?**

![alt text](<Screenshot 2025-10-22 151721.png>)

**¿Estás usando un vertex shader?**

Sí, se utiliza un vertex shader, que se encarga de organizar los puntos de la imagen y enviarlos a la siguiente etapa del proceso de renderizado.

**¿Estás usando un fragment shader?**

Sí, se utiliza un fragment shader, ya que es el encargado de colorear los píxeles y combinar la imagen original con la máscara para crear el efecto visual final.

**Analiza el código de los shaders. ¿Qué hace cada uno?**

El vertex shader ajusta la forma y posición de la imagen, mientras que el fragment shader mezcla los colores de las dos imágenes para generar el efecto de máscara, mostrando únicamente las zonas que la máscara permite ver.

#### Ejemplo 6

**¿Cómo funciona?**

El programa utiliza una cámara, un video y una imagen, y los combina mediante una máscara que se mueve con el mouse. El shader se encarga de fusionar estos elementos y mostrar el resultado final dentro de un recuadro en pantalla.

**¿Qué resultados obtuviste?**

![alt text](<Screenshot 2025-10-22 151901.png>)

**¿Estás usando un vertex shader?**

Sí, se utiliza un vertex shader para controlar la posición de los vértices, es decir, para definir cómo se dibujan y colocan las formas en la pantalla.

**¿Estás usando un fragment shader?**

Sí, se utiliza un fragment shader, ya que es el encargado de asignar los colores finales a cada píxel y de combinar las texturas (imagen, video y cámara) de acuerdo con la máscara.

**Analiza el código de los shaders. ¿Qué hace cada uno?**

El vertex shader define la forma y el tamaño de la imagen en pantalla, mientras que el fragment shader combina los colores de las tres fuentes (cámara, video e imagen) aplicando la máscara para generar el efecto visual final.

#### Ejemplo 7

**¿Cómo funciona?**

El programa permite pintar en la pantalla con una brocha, y lo que se dibuja funciona como una máscara. Un shader combina varias imágenes y muestra únicamente las zonas donde se ha pintado. Además, es posible borrar, modificar el tamaño del pincel y ponerlo como en una camara termica.

**¿Qué resultados obtuviste?**

![alt text](<Screenshot 2025-10-22 152117.png>)
![alt text](<Screenshot 2025-10-22 152039.png>)

**¿Estás usando un vertex shader?**

Sí, se utiliza un vertex shader para organizar los puntos donde se dibujan las imágenes en la pantalla y definir su posición dentro del espacio visual.

**¿Estás usando un fragment shader?**

Sí, se utiliza un fragment shader, ya que es el encargado de aplicar los colores y combinar las texturas según las zonas que se pintan con la máscara.

**Analiza el código de los shaders. ¿Qué hace cada uno?**

El vertex shader organiza la forma y posición donde se dibuja todo, mientras que el fragment shader combina las imágenes y genera el efecto visual final que aparece al pintar.

#### Ejemplo 8

**¿Cómo funciona?**

El programa genera una imagen en blanco y negro con un patrón de ruido que varía con el tiempo y según el movimiento del mouse. Esta imagen se utiliza como textura sobre un plano 3D que rota al mover el cursor.

**¿Qué resultados obtuviste?**

![alt text](<Screenshot 2025-10-22 152327.png>)

**¿Estás usando un vertex shader?**

Sí, se utiliza un vertex shader para mover y rotar los puntos del plano dentro del espacio 3D.

**¿Estás usando un fragment shader?**

Sí, se utiliza un fragment shader, ya que es el encargado de aplicar los colores y mostrar la textura del ruido sobre la superficie del plano.

**Analiza el código de los shaders. ¿Qué hace cada uno?**

El vertex shader ajusta la forma y la rotación del plano, mientras que el fragment shader colorea los píxeles con la textura cambiante, generando el efecto de movimiento.

#### Ejemplo 9

**¿Cómo funciona?**

El programa carga una imagen y le aplica un efecto de desenfoque. Utiliza dos shaders: uno realiza el desenfoque en dirección horizontal y el otro en dirección vertical. Además, el nivel de desenfoque varía según el movimiento del mouse.

**¿Qué resultados obtuviste?**

![alt text](<Screenshot 2025-10-22 152434.png>)

**¿Estás usando un vertex shader?**

Sí, se utiliza un vertex shader, aunque en este caso solo cumple la función de posicionar correctamente la imagen en la pantalla.

**¿Estás usando un fragment shader?**

Sí, se utiliza un fragment shader, que es el encargado de realizar el desenfoque mezclando los colores de los píxeles para producir el efecto borroso.

**Analiza el código de los shaders. ¿Qué hace cada uno?**

- El shaderBlurX aplica el desenfoque en el eje horizontal (X), mezclando varios píxeles vecinos de izquierda a derecha para generar un efecto borroso en esa dirección.

- El shaderBlurY realiza el mismo proceso pero en el eje vertical (Y), combinando los píxeles de arriba a abajo.
Al trabajar juntos, ambos shaders producen un desenfoque uniforme en todas las direcciones de la imagen.

### Actividad 3

**¿Qué es un uniform?**

Variable global y constante que se envia de la CPU a la GPU