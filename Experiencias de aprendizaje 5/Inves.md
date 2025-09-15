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