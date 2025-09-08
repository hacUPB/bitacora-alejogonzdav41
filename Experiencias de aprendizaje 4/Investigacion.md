### Actividad 1

**3. ¿Qué es una lista enlazada y en qué se diferencia de un arreglo en memoria?**

* Una lista enlazada guarda cada dato en un “nodo” separado, y cada nodo tiene un puntero que indica dónde está el siguiente.

* Un arreglo guarda todos los datos seguidos, uno al lado del otro en memoria.

**4. ¿Cómo se vinculan los nodos en una lista enlazada?**

* Se conectan con un puntero (next) que apunta al siguiente nodo de la lista.

**5. ¿Cómo se gestiona la memoria en una lista enlazada?**

* Cada nodo se crea con new (reserva espacio en memoria) y se elimina con delete (libera ese espacio).

**6. ¿Qué ventajas ofrece una lista enlazada frente a un arreglo para insertar o eliminar en medio?**

* En una lista enlazada insertar o borrar es rápido (solo cambias punteros).

* En un arreglo es más lento porque hay que mover muchos elementos.

**7. ¿Cómo se evita que haya fugas de memoria en este código?**

* El destructor (~LinkedList) llama a clear(), que borra todos los nodos uno por uno.

**8. ¿Qué pasa en memoria al usar clear()?**

* Cada nodo se borra con delete, uno tras otro, hasta que no queda ninguno.

* Al final, head y tail quedan en nullptr y el tamaño es 0.

**9. ¿Qué pasa en memoria al agregar un nodo al final?**

* Se crea un nodo nuevo en el heap, tail->next apunta a él y tail se actualiza.

* Esto es rápido porque no se recorre toda la lista.

**10. ¿Cuándo conviene usar una lista enlazada en lugar de un arreglo?**

* Cuando vas a insertar o eliminar muchos elementos en medio de la estructura, porque ahí la lista es más eficiente.

**11. ¿Cómo aplicarías lo aprendido para diseñar otra estructura de datos?**

* Crearía mis nodos con cuidado y siempre los borraría con delete al final.

* También pensaría en cómo evitar fugas de memoria y en que las operaciones sean rápidas.

**12. Diferencia de memoria entre C++ y C#:**

* En C++ tú controlas cuándo reservas y borras memoria.

* En C# la memoria se limpia sola con el recolector de basura.

* Ventaja de C++: más control.

* Riesgo: te puedes equivocar y causar fugas.

**13. Arte generativo con listas enlazadas: ¿qué cuidarías?**

* No crear ni borrar nodos en exceso cada frame.

* Reusar nodos ya creados.

* Revisar que siempre se libere la memoria al terminar.

**14. ¿Cómo probar el programa?**

*Lo que me dijo ChatGPT:*

* Verifica que al inicio aparezcan 11 círculos.

* Mueve el mouse y observa que la “serpiente” sigue la posición.

* Presiona la tecla c y la lista se borra (los círculos desaparecen).

* Comprueba que no hay errores al cerrar el programa.

*Por medio de mis pruebas:*

* Me di cuenta de que funciona correctamente y haciendolo por medio de lo que dijo GPT (mi mejor amigo) fue acertado.

### Actividad 2

***Preguntas de reflexión para el stack:***

**1. ¿Cómo se gestiona la memoria en una implementación manual de un stack en C++? Reflexiona sobre cómo el uso de new y delete en la creación y destrucción de nodos afecta el rendimiento y la seguridad de tu programa.**

* En una implementación manual, cada vez que se hace *push* se reserva memoria dinámicamente con *new* para un nuevo nodo. Al hacer *pop*, se libera con *delete*. Esto te da control total sobre la memoria, pero también te obliga a ser muy cuidadoso:

Si olvidas *delete*, tendrás fugas de memoria.

Si borras mal un puntero, puedes tener errores de acceso (dangling pointers).

El rendimiento se ve afectado porque cada *new* y *delete* son operaciones relativamente costosas.

**2. ¿Por qué es importante liberar la memoria cuando se desapila un nodo en un stack? Considera las consecuencias de no liberar memoria en términos de fugas de memoria y cómo esto puede impactar aplicaciones de largo tiempo de ejecución.**

* Si no liberas la memoria al desapilar:

Los nodos eliminados siguen ocupando espacio en el heap.

Esto causa fugas de memoria, que en programas largos o interactivos (como arte generativo en openFrameworks) pueden hacer que el programa se vuelva lento o incluso se bloquee.

En aplicaciones críticas, puede comprometer la estabilidad y seguridad del sistema.

**3. ¿Qué diferencias existen entre usar un stack de la STL (std::stack) y crear un stack manualmente? Explora cómo la abstracción que proporciona la STL puede simplificar la implementación, pero también cómo una implementación manual ofrece mayor control sobre la gestión de recursos.**

* **STL (std::stack):**

Maneja memoria automáticamente.

Evita fugas de memoria y errores de punteros.

Es más sencillo y seguro de usar.

**Stack manual:**

Permite tener control absoluto de cómo se crean, destruyen y recorren los nodos.

Es útil cuando quieres personalizar el comportamiento (por ejemplo, dibujar círculos como en tu código).

Requiere más responsabilidad para evitar errores.

**4. ¿Cómo afecta la estructura de un stack al orden de acceso y eliminación de elementos? Analiza cómo la naturaleza LIFO (Last In, First Out) del stack influye en los tipos de problemas que esta estructura de datos puede resolver eficientemente.**

* Un stack sigue la regla LIFO (Last In, First Out):

El último elemento en entrar es el primero en salir.

Esto lo hace ideal para problemas como:

Deshacer acciones (Ctrl+Z en un editor).

Evaluación de expresiones matemáticas.

Recorridos en profundidad (DFS).

En el codigo que estamos manejando, significa que el último círculo dibujado es el primero en desaparecer al presionar la tecla d.

**5. ¿Cómo podrías modificar el stack para almacenar tipos de datos más complejos (e.g., objetos con múltiples atributos) sin causar problemas de memoria? Reflexiona sobre cómo gestionar adecuadamente la memoria para objetos más complejos y cómo esto afectaría tu implementación actual.**

* Le pregunte a ChatGPT y me dijo que podria ampliar la clase Node para que guarde atributos adicionales (ejemplo: color, tamaño, velocidad). Esto afectaría la implementación actual porque se tendria que modificar el constructor y destructor del nodo para asegurarnos de que cada atributo se inicialice y libere correctamente.

***Preguntas de reflexión para la queue:***

**1. ¿Cómo se maneja la memoria en una implementación manual de una queue en C++? Reflexiona sobre cómo se gestionan los nodos al encolar y desencolar elementos y las implicaciones en términos de eficiencia y seguridad.**

* En una queue manual, cada vez que se encola un elemento se crea un nuevo nodo en memoria dinámica usando *new*. Ese nodo queda enlazado al final de la lista mediante el puntero *rear*. Cuando se desencola, el nodo al frente (*front*) se elimina con *delete*.

**2. ¿Qué desafíos específicos presenta la implementación de una queue en comparación con un stack en términos de gestión de memoria? Considera las diferencias en el manejo de punteros front y rear, y cómo estos afectan el proceso de encolado y desencolado.**

* En un stack solo se maneja un puntero (*top*) mientras que en una queue se requieren dos punteros (*front* y *rear*)

**3. ¿Cómo afecta la estructura FIFO (First In, First Out) de una queue a su uso en diferentes tipos de problemas? Analiza cómo la estructura FIFO influye en la resolución de problemas donde el orden de procesamiento es crucial, como en sistemas de colas de espera.**

* La regla FIFO significa que el primer elemento en entrar es el primero en salir.
Esto es útil en problemas donde el orden de llegada es fundamental:

Sistemas de colas de espera (personas en una fila).

Procesamiento de tareas en orden de llegada (schedulers de sistemas operativos).

Algoritmos de recorrido en anchura (BFS).

En el codigo que estamos usando significa que el primer círculo encolado es el primero que desaparece al presionar la tecla d.

**4. ¿Cómo podrías implementar una queue circular y cuál sería su ventaja respecto a una queue lineal en términos de uso de memoria? Reflexiona sobre cómo una queue circular puede mejorar la eficiencia en ciertos contextos y qué cambios serían necesarios en la implementación.**

* Una queue lineal puede desperdiciar memoria si se implementa con arreglos, porque al avanzar *front*, las posiciones anteriores ya no se reutilizan.

Una queue circular “recicla” los espacios: cuando *rear* llega al final del arreglo, vuelve al inicio si hay espacio disponible.

Esto ayudaria a tener un mejor aprovechamiento de la memoria, lo que es ideal cuando se conoce un límite máximo de elementos.

**5. ¿Qué problemas podrían surgir si no se gestionan correctamente los punteros front y rear en una queue, y cómo podrías evitarlos? Considera posibles errores como la pérdida de referencias a nodos y cómo una gestión cuidadosa de los punteros puede prevenir estos problemas.**

* Pérdida de referencias, punteros colgantes o cola vacía mal manejada.

***De Manera General***

Conceptos teóricos

Pila (stack): funciona con la regla LIFO (Last In, First Out). El último que entra es el primero que sale.

Cola (queue): funciona con la regla FIFO (First In, First Out). El primero que entra es el primero que sale.

Nodo: cada elemento de la pila/cola (en este caso, un círculo). Tiene datos y un puntero al siguiente nodo.

Punteros importantes:

top → indica la parte superior de la pila.

front → indica el frente de la cola (el que sale primero).

rear → indica el final de la cola (donde se insertan los nuevos elementos).

2. Operaciones

Push: agrega un nodo a la pila.

Pop: quita el nodo que está arriba de la pila.

Enqueue: agrega un nodo al final de la cola.

Dequeue: quita el nodo que está al frente de la cola.

3. Memoria y depuración

Cada nodo se guarda en memoria dinámica (new en C++).

Cuando quitas un nodo (pop o dequeue), usas delete para liberar memoria.

Si no liberas memoria, pasa una fuga de memoria (memory leak).

4. Manejo de casos especiales

Stack vacío: top apunta a nullptr.

Queue vacía: tanto front como rear apuntan a nullptr.

Un solo elemento en la cola: front y rear apuntan al mismo nodo.

5. Visualización en el programa

Los círculos que ves en la pantalla representan los nodos.

Con la tecla a los agregas.

Con la tecla d los quitas.

Según estés en modo stack o queue, se comportan distinto (LIFO o FIFO).