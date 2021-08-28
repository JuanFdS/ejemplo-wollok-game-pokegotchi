# Clase herencia vs. composición

El código en este repo es una posible solución del siguiente ejercicio:
https://docs.google.com/document/d/1F41uHf4NQ1FIxCszKzTkWjIrhqC-8jzSXe8rRps-QFE/edit?usp=sharing

## Desafío

Queremos agregar un nuevo pokémon, jigglypuff, que se comporta de la siguiente manera:

Como a jigglypuff le gusta que escuchen su canto, usar su habilidad hace que aumente su alegria en 1 por cada otro pokemon del equipo del entrenador, y le da 1 de hambre usarla. Pero, cuando jigglypuff canta los pokemones se duermen, entonces usar la habilidad de un jigglypuff va a tener como resultado (además de lo descripto anteriormente) que todos los demás pokemones del entrenador se queden dormidos.

Cuando un pokemon está dormido, no puede ni comer bayas ni evolucionar, la única forma de despertarse es intentando usar su habilidad. Un pokemon dormido que intenta usar su habilidad se despierta (pero no se produce el efecto de la habilidad en ese uso).

Nota1: en la línea 55 del archivo displays.wlk, hay un bloque con un TODO donde se puede completar con código que devuelva true si un pokemon está dormido y false si no. Si se hace eso, se va a poder visualizar que el pokemon está dormido en el juego.

Nota2: para que jigglypuff se pueda ver en el juego, basta con definirle los mensajes `nombre`, `quantityOfFrames` y `sonidoHabilidad`, las imagenes y sonidos que se van a mostrar ya están en las carpetas correspondientes.
