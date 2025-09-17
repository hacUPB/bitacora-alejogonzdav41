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