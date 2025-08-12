**Actividad 1**

Al ejecutar el programa se crea una ventana de fondo negro y se genera un circulo de radio 20 y de color blanco que sigue el mouse.

**Actividad 2**

* ¿Qué fue lo que incluimos en el archivo .h?

Definimos la clase ofApp, que hereda de ofBaseApp y que contiene unas funciones publicas (setup(), update(), draw(), mouseMoved(int x, int y) y mousePressed(int x, int y, int button)) y unos atributos privados (vector<ofVec2f> particles; y ofColor particleColor;).

* ¿Cómo funciona la aplicación?

Genera un fondo negro y pinta varios circulos que siguen el mouse de color blanco, pero si se da click los circulos cambiaran de color y ademas los que queden atras se borraran.

* ¿Qué hace la función mouseMoved?

Elimina los circulos que quedan atras si se excede el tamaño del vector.

* ¿Qué hace la función mousePressed?

Cambia el color asignando un valor aleatorio de RGB.

* ¿Qué hace la función setup?

Fija el fondo negro e inicializa con las "particulas" de color blanco.

* ¿Qué hace la función update?

No logro ver si realiza alguna accion.

* ¿Qué hace la función draw?

Establece el color actual y dibuja el circulo.