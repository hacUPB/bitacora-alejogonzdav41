**¿Cómo se declara un puntero en C++?**

*  `int *p;`. `p` es una variable que almacenará la dirección de un variable que almacena enteros.

**¿Cómo se define un puntero en C++?**

*  `p = &a;`. Definir el puntero es inicializar el valor del puntero, es decir, guardar la dirección de una variable. En este caso `p` contendrá la dirección de `a`.

**¿Cómo se almacena en C++ la dirección de memoria de una variable?**

* Con el operador `&`. `p = &a;`

**¿Cómo se escribe el contenido de la variable a la que apunta un puntero?**

* Con el operador . `p = 20;`. En este caso como `p` contiene la dirección de `a` entonces `p` a la izquierda del igual indica que quieres actualizar el valor de la variable `a`.