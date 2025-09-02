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