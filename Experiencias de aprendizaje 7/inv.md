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

**¿Cómo funciona?**
El programa usa shaders para cambiar cómo se dibuja el rectángulo en pantalla. El shader toma cada fragmento (píxel) del rectángulo y decide su color según el código del fragment shader. Cuando el shader está activo, la GPU se encarga de aplicar esas instrucciones directamente mientras dibuja.

**¿Qué resultados obtuviste?**

Cuando comenté las líneas del shader.begin() y shader.end(), el rectángulo se dibujó normal, de color blanco (el color por defecto de ofSetColor(255)).
Cuando volví a activar el shader, la pantalla cambió: se llenó de colores que variaban según las coordenadas, mostrando un efecto visual generado por el shader. En resumen, con el shader activo se ve una imagen generada por GPU, sin él solo se ve el rectángulo blanco.

**¿Estás usando un vertex shader?**

Sí. El vertex shader está activo y se ejecuta sobre los vértices del rectángulo (las esquinas). En este caso, probablemente no cambia su posición, pero igual pasa los datos necesarios al fragment shader.

**¿Estás usando un fragment shader?**

Sí. El fragment shader es el que realmente genera los colores que se ven en pantalla. Es el encargado de decidir el color final de cada píxel, por eso es el que produce el efecto visual.

**Analiza el código de los shaders. ¿Qué hace cada uno?**

- Vertex shader:

Recibe las coordenadas de los vértices del rectángulo y las transforma a la posición correcta para mostrarlas en pantalla. En este ejemplo, solo pasa la información sin cambiarla mucho (usa las transformaciones por defecto).

- Fragment shader:

Se ejecuta por cada píxel del rectángulo y calcula el color. En el ejemplo del tutorial, usa las coordenadas del píxel (gl_FragCoord) para generar un color que cambia dependiendo de la posición, creando un degradado o patrón visual.