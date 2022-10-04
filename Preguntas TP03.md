
En un double dispatch (DD), ¿qué información aporta cada uno de los dos llamados?
> En el primer llamado podemos conocer quien es el objeto receptor polimorfico del mensaje y en el segundo conoces el tipo del colaborador externo.

Con lo que vieron y saben hasta ahora, ¿donde les parece mejor tener la lógica de cómo instanciar un objeto? ¿por qué? ¿Y si se crea ese objeto desde diferentes lugares y de diferentes formas? ¿cómo lo resuelven?
> Para instanciar un objeto, la logica deberia de estar implementada en la clase. Porque la clase es abstracta y a ella le pedimos una instancia, desde ahi con un mensaje de clase la instanciamos. Para resolver lo de crear un objeto desde diferentes lugares con diferentes formas usamos mensasjes de instancias donde le indicamos como inicilizarce, y la super clase un mensaje de clase que instancie utilizando ese mensaje de instancia

Con lo que vieron y trabajaron hasta ahora, ¿qué criterio están usando para categorizar métodos?
>Categorizamos dependiendo de si son privados (mensajes que solo pueden responder los mismos objetos de la clase) o no.

Si todas las subclases saben responder un mismo mensaje, ¿por qué ponemos ese mensaje sólo con un “self subclassResponsibility” en la superclase? ¿para qué sirve?
> Sirve para indicar que todas las subclases tienen que implementar ese mensaje. Ademas, si nos olvidamos de implementar un mensaje con self subclassResponsibility en la superclase,
nos salta un error mas descriptivo como #mySubclassShouldHaveOverriden antes que #MessageNotUnderstood.

¿Por qué está mal/qué problemas trae romper encapsulamiento?
> Porque podrias cambiar los colaboradores internos de un objeto.
