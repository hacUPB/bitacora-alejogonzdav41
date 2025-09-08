***Preguntas para guiar el proceso***

1. **Exploración creativa:** ¿Qué tipo de efecto visual quieres lograr? ¿Cómo pueden ayudarte las diferentes estructuras de datos a lograr ese efecto?

El efecto visual que quiero lograr es un cielo nocturno en movimiento, donde las estrellas aparecen, se conectan formando constelaciones y después desaparecen lentamente. Las estructuras de datos me ayudan a darle vida a esa idea. Por ejemplo, la lista enlazada permite que las conexiones entre estrellas cambien sin problema cuando alguna se elimina. La pila serviría para guardar destellos que se acumulen cuando el usuario interactúa, mientras que la cola puede simular un río de estrellas que fluyen en orden. Además, un arreglo puede mantener un fondo fijo de estrellas que siempre estén presentes.

2. **Gestión de memoria:** ¿Qué consideraciones debes tener en cuenta al gestionar dinámicamente la memoria de los objetos? ¿Cómo asegurar que no haya fugas de memoria?

Al usar memoria dinámica debo tener en cuenta que cada estrella tiene un ciclo de vida: nace, se muestra en pantalla y después muere. Cuando muere, debo liberarla de la memoria, es decir, borrarla de la lista y desconectar sus enlaces. Si no lo hago, puedo tener fugas de memoria y el programa se volvería más lento con el tiempo. También debo asegurarme de no dejar referencias a estrellas que ya fueron eliminadas, porque eso puede causar errores en la aplicación.

3. **Interacción y dinamismo:** ¿Cómo puedes hacer que la interacción del usuario influya en múltiples estructuras de datos simultáneamente para crear un efecto visual coherente y dinámico?

La interacción del usuario puede influir en varias estructuras de datos al mismo tiempo. Si el usuario hace clic, se puede añadir una nueva estrella en la lista enlazada, modificando la constelación. Si presiona teclas, se puede usar una pila para que se acumulen destellos temporales. Y si mueve el mouse, una cola puede ir dejando un rastro de estrellas ordenadas. De esta forma, el cielo digital responde al usuario de manera coherente y dinámica, siempre cambiando según lo que haga.

4. **Optimización:** ¿Qué técnicas puedes implementar para optimizar la gestión de memoria y el rendimiento de tu aplicación mientras mantienes una experiencia visual rica y fluida?

Para que el programa funcione de manera fluida, es importante usar técnicas de optimización. Una de ellas es darle a cada estrella un tiempo de vida limitado para que desaparezca sola cuando se cumpla. Otra es reutilizar objetos en lugar de crear y borrar constantemente, lo que ahorra memoria y tiempo de ejecución. También es útil poner un límite a la cantidad de estrellas que pueden existir al mismo tiempo y dibujar solo las que son visibles en pantalla. Así, la experiencia visual se mantiene rica y el rendimiento del programa no se ve afectado.