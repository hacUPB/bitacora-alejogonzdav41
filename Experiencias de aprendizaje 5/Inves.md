### Sesión 1: la naturaleza de los objetos en C++

```cpp
class Particle {
public:
    float x, y;
    void move(float dx, float dy) {
        x += dx;
        y += dy;
    }
};
```
​
¿Qué representa la clase Particle?

* La clase Particle representa un tipo de objeto que tiene dos cosas principales: posición (con los atributos x y y) y comportamiento (con el método move). Es como una plantilla que describe cómo es una partícula y qué puede hacer.

¿Cómo interactúan sus atributos y métodos?

* Los atributos y los métodos de una clase como Particle están conectados porque los métodos usan o modifican los atributos del objeto.

Prompt para ChatGPT: explícame en detalle qué es un objeto en C++ y cómo se relaciona con una clase. Usa el ejemplo de una clase Particle con atributos *x* y y *y* un método *move*.

* En C++, una clase como Particle es una plantilla que describe cómo es un tipo de objeto: en este caso, una partícula con una posición (x, y) y un comportamiento (move para moverse).

* Un objeto es una instancia real de esa clase, o sea, una partícula concreta que tiene sus propios valores para x y y.

* Cuando se llama al método move(dx, dy), ese objeto modifica sus propios atributos sumando dx a x y dy a y. Así, el objeto "se mueve".

* En memoria, cada objeto tiene su propio espacio para guardar sus x y y.

**Explorando la memoria**

**¿Los atributos están almacenados de forma contigua?**

* Sí, al imprimir las direcciones de memoria de *p1.x* y *p1.y* se puede ver que están una al lado de la otra (o con un pequeño espacio dependiendo de la alineación de memoria que use el compilador). Esto significa que los atributos del objeto se guardan en memoria de manera seguida, como si fueran “cajitas” ordenadas dentro del mismo objeto.

**¿Qué indica el tamaño del objeto sobre su estructura interna?**

* El tamaño *(sizeof(Particle))* nos dice cuántos bytes ocupa el objeto completo en memoria. Este número incluye todos los atributos y, a veces, un espacio extra de relleno (padding) que el compilador mete para que el procesador pueda acceder más rápido a los datos. O sea, no solo mide lo que pesan las variables, sino también cómo están organizadas y alineadas dentro del objeto.

***ChatGPT dijo con respecto a: ¿Cómo se almacenan los objetos en memoria en C++? Si tengo dos instancias de Particle, ¿Cómo se relacionan sus direcciones de memoria? ¿Los atributos están contiguos?***

En C++, los objetos se almacenan en memoria de acuerdo con ciertas reglas de organización que siguen el compilador y la arquitectura de la máquina:

Almacenamiento de atributos dentro de un objeto:
Los atributos de un objeto (por ejemplo, x y y en un struct Particle) se guardan de forma contigua en memoria en el mismo bloque reservado para ese objeto.

Ejemplo: si x ocupa 4 bytes y y ocupa 4 bytes, el compilador intentará colocarlos seguidos.

Sin embargo, puede haber relleno (padding) entre atributos para respetar la alineación de la CPU. Esto es lo que a veces hace que el sizeof(Particle) sea mayor que la suma de los tamaños de sus atributos.

Almacenamiento de instancias distintas:
Si declaras dos instancias en el mismo ámbito:

Particle p1;
Particle p2;


entonces el compilador reserva memoria en la pila (stack) para cada una, y sus direcciones serán diferentes pero consecutivas (o muy cercanas), porque la pila asigna memoria de manera secuencial.

Ejemplo: si sizeof(Particle) = 8, y p1 está en la dirección 0x1000, es muy probable que p2 esté en 0x1008.

Relación entre las direcciones:

Dentro de un objeto, los atributos (p1.x, p1.y) están almacenados contiguamente (con posible padding).

Entre objetos distintos (p1, p2), sus direcciones están separadas exactamente por el tamaño del objeto (sizeof(Particle)).

👉 En resumen:

Sí, los atributos de un mismo objeto están contiguos (aunque con posible relleno).

Sí, las instancias están una tras otra en memoria si se crean en el mismo ámbito (en el stack o en un array).

La distancia entre *&p1* y *&p2* es igual a *sizeof(Particle)*.

**Análisis de diferencias**

**¿Cómo afectan los datos estáticos al tamaño de la instancia?**

* Las variables estáticas no cambian el tamaño de cada objeto. Como son compartidas por toda la clase, solo hay una copia en memoria, sin importar cuántos objetos se creen. Entonces, aunque la clase tenga una variable estática, el *sizeof* del objeto no aumenta.

**¿Qué diferencias hay entre datos estáticos y dinámicos en términos de memoria?**

* Una variable estática vive en un lugar fijo de la memoria y todos los objetos usan esa misma dirección.

* Una variable dinámica se guarda con *new* en el heap, y cada objeto que cree memoria dinámica tiene su propia copia. Eso significa que cada instancia puede ocupar más memoria aparte del tamaño que dice *sizeof*, porque el puntero solo guarda la dirección, pero lo que se reserva con /8new/8 está aparte.

**Prompt para ChatGPT: explícame cómo el uso de variables estáticas y dinámicas en una clase afecta el tamaño de sus instancias. ¿Las variables estáticas ocupan espacio en cada objeto?**

***Explicación general (prompt):***

Cuando una clase usa variables estáticas, esas variables no ocupan espacio dentro de cada instancia, ya que son compartidas por todos los objetos. En cambio, cuando se usan variables dinámicas, cada objeto guarda un puntero dentro de sí (eso sí cuenta en el sizeof), y ese puntero apunta a un bloque de memoria reservado en el heap, lo cual significa que cada objeto tiene su propia parte de memoria adicional fuera del objeto.

👉 En resumen:

Estáticas: 1 sola copia para todos → no afectan el tamaño del objeto.

Dinámicas: cada objeto tiene un puntero + memoria aparte en el heap.

***Reflexión***

Documenta en tu bitácora de aprendizaje:

**¿Qué es un objeto desde la perspectiva de la memoria?**

* Un objeto en C++ es un bloque de memoria que contiene los datos de sus atributos. Cada vez que se crea una instancia de una clase, el compilador reserva un espacio en memoria para guardar esos atributos, y esa reserva es lo que realmente representa al objeto en memoria. Los métodos no se copian dentro del objeto, porque son compartidos por todas las instancias.

**¿Cómo influyen los atributos y métodos en el tamaño y estructura del objeto?**

* Los atributos determinan el tamaño real del objeto, ya que cada instancia necesita guardar sus propios valores. El compilador puede añadir espacios extra (padding) para que los datos estén bien alineados en memoria.

* Los métodos no cambian el tamaño de cada objeto, porque el código de las funciones existe solo una vez en el programa y es usado por todas las instancias.

**Conclusión: resumir los hallazgos y cómo esto impacta el diseño de clases.**

* Al analizar cómo se guardan los objetos en memoria, aprendí que el tamaño de una clase depende principalmente de sus atributos, no de sus métodos. También entendí que los datos estáticos no aumentan el tamaño de cada objeto porque son compartidos, mientras que los datos dinámicos agregan un puntero dentro del objeto pero reservan memoria aparte en el heap. Esto me muestra que, al diseñar clases, es importante pensar en la eficiencia: demasiados atributos aumentan el tamaño de cada instancia, y un mal manejo de memoria dinámica puede hacer que el programa consuma más recursos de los necesarios.

***Exploración de Métodos virtuales***

**¿Cómo afecta la presencia de métodos virtuales al tamaño del objeto?**

* Cuando una clase tiene métodos virtuales, el compilador agrega un puntero oculto dentro de cada objeto que apunta a la vtable (tabla de funciones virtuales). Ese puntero ocupa espacio extra (normalmente el tamaño de un puntero, por ejemplo 4 u 8 bytes dependiendo de la arquitectura). Por eso, los objetos de clases con métodos virtuales suelen ser un poco más grandes que los de clases sin ellos.

**¿Qué papel juegan las vtables en el polimorfismo?**

* Las vtables permiten que el programa decida en tiempo de ejecución qué versión de un método se debe ejecutar. Gracias a ellas, cuando llamamos a un método virtual a través de un puntero o referencia a la clase base, el programa puede “saltar” al método correcto de la clase derivada. Es decir, las vtables son las que hacen posible el polimorfismo dinámico en C++.

**Prompt para ChatGPT: ¿Cómo se implementan los métodos virtuales en C++? Explica el concepto de vtable y cómo se utiliza para resolver llamadas a métodos virtuales.**

* *ChatGPT dijo*
En C++, los métodos virtuales se implementan usando una estructura interna llamada vtable (virtual table).

Cuando una clase declara al menos un método virtual, el compilador crea una vtable para esa clase.

La vtable es básicamente un arreglo de punteros a funciones, donde cada posición corresponde a un método virtual.

Cada objeto de esa clase lleva consigo un puntero oculto a su vtable (llamado vptr).

Cuando se invoca un método virtual a través de un puntero o una referencia:

El programa consulta el vptr del objeto.

Va a la vtable correspondiente.

Llama a la dirección de la función que está almacenada allí.

Esto permite que, aunque tengamos una referencia de tipo Base* apuntando a un objeto de tipo Derived, el método que se ejecute sea el de Derived.

👉 En resumen:

La vtable guarda las direcciones de los métodos virtuales.

El vptr en cada objeto conecta la instancia con la vtable de su clase.

Gracias a eso, C++ puede decidir en tiempo de ejecución qué función ejecutar, implementando el polimorfismo dinámico.

***Uso de punteros y referencias***

*Reflexión Guiada:*

**¿Cuál es la relación entre los punteros a métodos y la vtable?**

* Los dos sirven para poder llamar funciones de manera “indirecta”, pero no son lo mismo. Los punteros a funciones se asignan de forma manual (yo decido qué función guardar en el puntero), mientras que la vtable se crea automáticamente cuando hay métodos virtuales en una clase. En ambos casos el programa no va directo al código de la función, sino que primero pasa por una dirección guardada en memoria.

**¿Cómo afectan estos mecanismos al rendimiento del programa?**

* El rendimiento puede bajar un poquito porque el programa necesita un paso extra: primero mirar la dirección en el puntero (o en la vtable) y luego saltar a la función. Pero en general la diferencia es muy pequeña. Lo importante es que estos mecanismos hacen que el programa sea más flexible y fácil de extender, aunque cueste un poquito de velocidad.

**Prompt para ChatGPT: ¿Qué diferencia hay entre punteros a funciones y punteros a métodos miembro en C++? ¿Cómo afectan al tamaño de los objetos y al rendimiento?**

* *ChatGPT dijo*
Punteros a funciones:

Son direcciones que apuntan a funciones “globales” o estáticas (es decir, funciones que no dependen de un objeto).

Todos los objetos que tengan un puntero a función guardan solo esa dirección.

No necesitan información adicional porque la función no depende de un contexto de objeto.

Punteros a métodos miembro:

Son más complejos, porque además de la dirección de la función deben incluir información sobre el objeto al cual aplicar la llamada.

Cuando se usa un puntero a método miembro, al invocar hay que combinar el puntero al objeto con el puntero al método.

Esto hace que la representación interna sea más grande y que la llamada sea un poco más lenta que con punteros a funciones normales.

Impacto en el tamaño de los objetos:

Un puntero a función ocupa lo mismo que un puntero normal (generalmente 4 u 8 bytes).

Un puntero a método miembro puede ocupar más espacio según la implementación del compilador, porque necesita guardar información extra.

Impacto en el rendimiento:

Llamar a través de un puntero a función es muy rápido (solo implica un salto indirecto).

Llamar a través de un puntero a método miembro es un poco más lento, porque debe ajustarse al objeto concreto (pasar el this correcto).

En la práctica, la diferencia es pequeña, pero se nota en sistemas de muy alto rendimiento o cuando se hacen millones de llamadas.

👉 En resumen:

Los punteros a funciones son simples y ligeros.

Los punteros a métodos miembro son más flexibles porque permiten polimorfismo manual, pero con mayor coste en complejidad y, a veces, en rendimiento.

*Reflexión individual:*

**¿Dónde residen los datos y métodos de una clase en la memoria?**

* Los datos (atributos) de un objeto están en la memoria de la instancia, normalmente en el stack o en el heap, dependiendo de cómo se creó el objeto.

* Los métodos no están dentro del objeto, sino en la sección de código del programa. Todos los objetos de esa clase comparten el mismo código de los métodos.

**¿Cómo interactúan las diferentes partes en tiempo de ejecución?**

* Cuando el programa corre:

- Los objetos usan su espacio en memoria para guardar sus atributos.

- Cuando se llama un método, el objeto no tiene el código dentro, sino que usa un puntero (normal o virtual) para ir al código de la función.

- Si el método es estático o normal, se llama directo. Si es virtual, se pasa primero por la vtable.

**Conclusión: cómo esta comprensión afecta el diseño de sistemas.**

* Aprendí que el diseño de clases no solo se trata de qué atributos y métodos necesito, sino también de cómo se manejan en memoria. Usar punteros a funciones o métodos virtuales da más flexibilidad, pero hace que los objetos sean un poco más grandes y las llamadas un poco más lentas. Esto significa que, al diseñar sistemas grandes, hay que balancear entre velocidad y flexibilidad.

***Profundizando en el encapsulamiento***

*ChatGPT dijo*
En C++, el encapsulamiento no significa que los datos privados desaparezcan o estén en un lugar especial de la memoria. Los miembros private, protected y public se almacenan de manera contigua dentro del objeto, todos ocupan espacio físico en memoria sin importar su nivel de acceso.

La diferencia está en que el compilador aplica reglas de acceso en tiempo de compilación:

Cuando el código intenta acceder a un atributo privado o protegido desde fuera de la clase (o sin permisos adecuados), el compilador genera un error de compilación.

Esto significa que la restricción es puramente del lenguaje y del compilador, no del hardware.

En tiempo de ejecución, no existe ninguna “barrera” física que impida llegar a esos datos (de hecho, con punteros o casts se podría forzar el acceso). Lo que protege al programador es el sistema de tipos y las verificaciones del compilador.

👉 En resumen:

Los miembros privados sí ocupan espacio en el objeto.

El compilador impide el acceso directo desde fuera de la clase aplicando las reglas de visibilidad.

La protección es lógica (en compilación), no física (en ejecución).

***Hagamos un poco de hackers y rompamos el encapsulamiento***

**¿Qué es el encapsulamiento y cuál es su propósito en la programación orientada a objetos?**

* El encapsulamiento es una forma de ocultar los datos de una clase y permitir que solo se acceda a ellos a través de métodos controlados. Su propósito es proteger la información y evitar que se modifique de manera incorrecta desde fuera de la clase.

**¿Por qué es importante proteger los datos de una clase y restringir el acceso desde fuera de la misma?**

* Porque si cualquiera pudiera cambiar los datos internos directamente, se podrían producir errores graves o inconsistencias en el programa. Al restringir el acceso, el programador tiene más control sobre cómo se usan los datos y puede asegurar que siempre tengan valores válidos.

**¿Qué significa reinterpret_cast y cómo afecta la seguridad del programa?**

* reinterpret_cast es una forma de decirle al compilador que trate una dirección de memoria como si fuera de otro tipo. Esto puede ser peligroso porque rompe las reglas de seguridad del lenguaje y permite acceder a cosas que normalmente estarían prohibidas. En este caso, se usó para meterse a los atributos privados de la clase.

**¿Por qué crees que se pudo acceder a los miembros privados de MyClass en este experimento, a pesar de que el compilador normalmente lo impediría?**

* Porque aunque el compilador prohíbe acceder directamente, en memoria los atributos privados siguen estando ahí. Con punteros y aritmética de direcciones es posible saltarse las reglas del compilador y llegar hasta esos datos. Es como “hacer trampa” y abrir la caja fuerte desde atrás.

**¿Cuáles podrían ser las consecuencias de utilizar técnicas como las mostradas en este experimento en un programa real?**

* Podrían ocurrir errores muy difíciles de detectar, como leer o escribir datos donde no se debe. Eso puede causar fallos de seguridad, pérdida de información o que el programa se caiga. Además, rompe la idea de que los objetos se deben usar de manera ordenada y segura.

**¿Qué implicaciones tiene este experimento sobre la confianza en las barreras de encapsulamiento que proporciona C++?**

* Demuestra que las barreras de encapsulamiento en C++ no son absolutas, porque en realidad son reglas que impone el compilador, no el hardware. Es decir, sirven para guiar y proteger al programador, pero si alguien quiere romperlas con punteros, puede hacerlo. Por eso, la verdadera seguridad depende más del diseño y de la disciplina del programador que del lenguaje en sí.

***Herencia y la Relación en Memoria***

**¿Cómo se organizan los atributos en memoria?**

* Cuando una clase hereda de otra, los atributos de la clase base se colocan primero en memoria dentro del objeto, y después vienen los atributos de la clase derivada. Es como si el objeto derivado tuviera “pegado” al principio un objeto base, y luego le añadiera sus propios datos. Por eso, la dirección del objeto d y la dirección de d.baseVar suelen ser la misma (porque baseVar es lo primero que aparece en el layout).

**¿Qué sucede si agregamos más niveles de herencia?**

* Si seguimos heredando, se van apilando en orden. Primero los atributos de la clase base original, después los de la siguiente clase derivada, y así sucesivamente. El objeto final contiene todos los atributos de todas las clases en la jerarquía, uno detrás del otro en memoria. Esto puede hacer que el objeto sea más grande, porque cada nivel de herencia añade sus propios atributos, pero la organización sigue siendo la misma: los de la base primero, y luego los nuevos en cada derivación.

**Prompt para ChatGPT: explícame cómo se organiza en memoria un objeto de una clase derivada en C++. ¿Cómo se almacenan los atributos de la clase base y de la derivada?**

*ChatGPT dijo*
En C++, cuando una clase deriva de otra, el objeto resultante se organiza en memoria de forma secuencial:

Atributos de la clase base:
Los miembros de la clase base se colocan primero en el layout de memoria. De hecho, se puede pensar en que el objeto derivado contiene embebido un objeto de la clase base como su primera parte.

Atributos de la clase derivada:
Después de los atributos de la base, se añaden los atributos declarados en la clase derivada. Estos siguen el mismo orden en que fueron definidos dentro de la clase.

Herencia múltiple o virtual:

En herencia simple, el layout es muy directo: base primero, luego derivada.

En herencia múltiple, el compilador coloca cada subobjeto base en el layout, lo que puede aumentar la complejidad y el tamaño del objeto.

En herencia virtual, el compilador introduce punteros ocultos para gestionar correctamente la ubicación de los subobjetos base compartidos.

Ejemplo sencillo:

class Base {
    int a;
    float b;
};
class Derived : public Base {
    char c;
    double d;
};


En memoria, un objeto Derived se vería (simplificado) como:

[Base.a][Base.b][Derived.c][padding][Derived.d]


Aquí puede haber padding para alinear los datos según las reglas de la arquitectura.

👉 En resumen:

Los atributos de la base siempre preceden a los de la derivada.

El objeto derivado se organiza como un bloque continuo que contiene primero el bloque de la base y luego sus propios datos.

El orden y alineación pueden verse afectados por padding o herencia múltiple/virtual, pero la idea central es que el objeto derivado incluye el objeto base como su primera parte.

***Polimorfismo y Vtables en detalle***

**¿Cómo utiliza el programa las vtables para el polimorfismo?**

* El programa crea una vtable (tabla virtual) para cada clase que tiene métodos virtuales. Esa tabla guarda direcciones de funciones. Cuando ejecuto un método virtual con un puntero o referencia a la clase base, el programa no llama directo a la función, sino que mira en la vtable del objeto real (por ejemplo, Dog o Cat) y allí encuentra cuál versión del método debe ejecutar. Así logra que con la misma llamada (animal->makeSound()), cada objeto haga algo distinto.

**¿Cuál es el impacto en el rendimiento?**

* El impacto es que una llamada virtual es un poquito más lenta que una normal, porque primero tiene que buscar en la vtable y después saltar a la función. Pero en realidad esa diferencia es muy pequeña, casi ni se nota a menos que hagas millones de llamadas dentro de un bucle. También ocupa un poquito más de memoria porque cada objeto guarda un puntero a su vtable.

**Prompt para ChatGPT: ¿Cómo funciona el polimorfismo en C++ a nivel interno? Explica cómo se utilizan las vtables para resolver métodos virtuales en una jerarquía de herencia.**

*ChatGPT dijo*
En C++, el polimorfismo en tiempo de ejecución se implementa principalmente a través de las tablas virtuales (vtables).

Cuando una clase declara al menos un método virtual, el compilador genera una vtable para esa clase. La vtable es básicamente un arreglo de punteros a funciones, donde cada posición corresponde a un método virtual que la clase puede sobrescribir.

Cada objeto de una clase polimórfica contiene un puntero oculto (llamado vptr) que apunta a la vtable de su tipo dinámico real.

Cuando se invoca un método virtual mediante un puntero o referencia a la clase base, el programa no llama directamente a la función. En lugar de eso:

Accede al vptr del objeto.

Usa ese vptr para encontrar la dirección de la vtable.

Consulta en la vtable qué función corresponde (según la posición en la tabla).

Salta a la dirección de esa función y la ejecuta.

Esto permite que, aunque dos objetos distintos (Dog y Cat) se manejen como Animal*, al llamar makeSound() cada uno ejecute su propia versión (Bark o Meow).

En cuanto a la herencia:

Si una clase derivada no sobrescribe un método virtual, en su vtable se copia la entrada de la clase base.

Si lo sobrescribe, en esa posición de la vtable se pone la nueva dirección de la función.

En resumen:
El polimorfismo en C++ funciona gracias al mecanismo de vptr + vtable, que actúa como una especie de "tabla de consulta" en tiempo de ejecución para decidir cuál versión de un método virtual ejecutar, dependiendo del tipo dinámico real del objeto.

*Reflexión Individual:*

**¿Cómo se implementan internamente el encapsulamiento, la herencia y el polimorfismo?**

* Encapsulamiento: el compilador controla qué miembros puedes acceder desde fuera. Aunque los datos privados están en memoria, el compilador no te deja usarlos directamente.

* Herencia: en memoria, la parte de la clase base va primero y después los datos de la derivada. Así un puntero a Base puede apuntar a un Derived sin problema.

* Polimorfismo: se implementa con punteros a vtables que dirigen las llamadas de métodos virtuales a la función correcta según el tipo real del objeto.

**Análisis: ventajas y desventajas en términos de eficiencia y complejidad.**

* ¿Ventajas y desventajas en términos de eficiencia y complejidad?

*Ventajas:*

- Reutilización de código.

- Posibilidad de trabajar con interfaces comunes.

- Facilita el diseño de programas grandes.

*Desventajas:*

- Un poco más de uso de memoria (puntero a vtable).

- Llamadas virtuales un poco más lentas que las normales.

- Si abusamos de herencia y polimorfismo, el código se vuelve difícil de entender y mantener.