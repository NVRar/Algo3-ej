En los test 01 y 02 hay código repetido. Cuando lo extrajeron crearon algo nuevo. Eso es algo que estaba en la realidad y no estaba representado en nuestro código, por eso teníamos código repetido. ¿Cuál es esa entidad de la realidad que crearon?

>Esa entidad es un cronometro. Aunque nosotros al fin y al cabo no la hayamos hecho porque descubrimos que ya estaba implementado, el mensaje should:NotTakeMoreThan compara el tiempo que tarda en ejecutarse un bloque con un tiempo determinado.

¿Cuáles son las formas en que podemos representar entes de la realidad en Smalltalk que conocés? Es decir, ¿qué cosas del lenguaje Smalltalk puedo usar para representar entidades de la realidad?

>Un ente se puede representar mediante instancias de una clase. En Smalltalk, se crean mediante el mensaje new.

¿Qué relación hay entre sacar código repetido (creando abstracciones) y la teoría del modelo/sistema (del paper de Naur)?

> La teoria de modelo/sistema implica tener un dominio del sistema y para cada parte del texto del programa como para cada característica de su estructura, poder entender con qué aspecto del mundo real se relacionan. Para poder crear abstracciones, el programador debe tener un completo conocimiento del dominio para asi crear estructuras que no son tangibles en la realidad, sino que son conceptos que ayudan a entender mejor y simplificar codigo.
