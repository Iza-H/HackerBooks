#Hacker Book

Un lector de libros para iPhone & iPad


## Modelo
**AGTBook** - representa un libro y contiene:

- *Title* - variable obligatoria, String

- *Authors* - variable obligatoria, [String]

- *Tags* - variable obligatoria, [String]

- *Img* - variable obligatoria, NSData

- *Pdf* - variable obligatoria, NSData






**AGTLibraryBook** - representa un conjunto de los libros, tiene una estructura:

- *Tags* : [String : Array<AGTBook>] - es un dicionario donde la clave es un nombre del tag y los valores (dentro de Array) son los libros que tienen este tag 

##Conroladores
**AGTBookViewController** - controlador de la vista que presenta los detalles de un libro

**AGTLibraryTableViewController** - controlador de una tabla principal con todos los libros

**AGTBookTableViewCell** - controlador de una celda personalizada de la tabla con los libros

**AGTSimplePDFViewController** - controlador de la vista con pdf reader

##Vista
La vista esta creada en el Main.storyboard


## Preguntas
**Donde guardarías los datos?**

El Fichero JSON el la carpeta Documentos, ya que es un fichero importante, con los datos necesarios para el fincionamiento de la aplicaciòn.

Los imagenes y PDF guardo en la carpeta Cache. Y sì no hay alli el fichero buscado lo descargo otra vez desde Internet.

**Como guardar una propiedad booleana isFavorite?**

He guardado esta información dentro de User Defaults, donde una clave es el titulo  del fichero y el valor - valor True. Guardo solo la información sobre los libros favoritos entonces los datos cambiados desde True a False quito desde User Deafults.

**Otras formas de guardar estos datos?**

En CoreData, o se puedría tambien añadiendo esta información al fichero JSON.

**Cómo enviar la informacion desde AGTBook al AGTLibraryTableViewController?**

Para enviar la información se puede usar Notificaciones o Delegado. Yo he usado la segunda opción. AGTBookController envia el mensaje al AGTLibraryTableViewController mediante el delegado.

**reloadData de UITableView - ¿Es esto una aberración desde el punto de rendimiento (volver a cargar los datos que ne su mayoría estaban correcos)? Explica por qué no es así. Hay una fomra alternativa? ¿Cuando crees que vale la pena usarlo?**

Se actualizan solo las celdas que estan visibles, por esto no es tanta aberraciòn. Creo que la mejor opción sería actualizar únicamente las celdas cabiadas y visibles.

**Cuando el usuario cambia en la tabla el libro seleccionado, el AGTSimplePDFViewController debe de actualizarse. ¿Cómo lo harías?**

Enviando una Notificación.

**Qué funcionalidades le añaderías antes de subirla a la App Store?**

Posibilidad de añadir otros libros, eliminar y modyficar los datos, posibilidad de añadir nuevos tags. Posibilidad de marcar los libros leidos, añadir la valuación sobre el libro.

