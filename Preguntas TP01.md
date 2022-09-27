# Preguntas

¿Qué crítica le harías al protocolo de #estaHerido y #noEstaHerido? (en vez de tener solo el mensaje #estaHerido y hacer “#estaHerido not” para saber la negación)

>Como critica podemos decir que un mensaje es la negacion del otro, entonces no es necesario declarar los dos a la vez. Al fin y al cabo, estos mensajes demuestran si el combatiente esta herido o no esta herido, uno u otro estado. 

¿Qué opinan de que para algunas funcionalidades tenemos 3 tests para el mismo comportamiento pero aplicando a cada uno de los combatientes (Arthas, Mankrik y Olgra)

>Creemos que esta bien, porque cada combatiente tiene bonificadores distintos, algunos tienen agilidad, otros no y todo eso se prueba en test diferentes.

¿Cómo modelaron el resultado de haber desarrollado un combate? ¿qué opciones consideraron y por qué se quedaron con la que entregaron y por qué descartaron a las otras?

>Preferimos utilizar un objeto que tenga como colaboradores internos al equipo ganador (o sino hubo ninguno, indeterminacion) y la cantidad de rondas jugadas .Otras de las opciones que tuvimos en cuenta fue usar colecciones y strings. Preferimos la primera porque interpretando al resultado como objeto, a futuro, podemos realizar varios combates y asi tener distintos objetos como distintos resultados referenciando a las diferentes batallas. Ademas, el codigo queda bastante legible. Aunque para la implementacion elegida necesitamos hacer uso de setters, estos solamente son utilizados por el orquestador, ningun otro objeto mas. Con estas jutificaciones, decidimos descartar la otra opcion.
