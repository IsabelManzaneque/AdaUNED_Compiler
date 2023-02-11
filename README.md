# Compilador AdaUNED


## Tabla de contenidos
* [Información general](#información-general)
* [Aspectos léxicos](#aspectos-léxicos)
* [Aspectos sintácticos](#aspectos-sintácticos)
* [Tecnologías](#tecnologías)


## Información general

Analizador léxico y sintáctico de un compilador del lenguaje AdaUNED, basado en el lenguaje Ada. 
A continuación, se presenta una descripción del lenguaje y su características: la estructura general de los programas escritos 
en dicho lenguaje describiendo sus componentes léxicos y cómo éstos se organizan sintácticamente para formar construcciones
válidas del lenguaje.


## Aspectos léxicos

Es posible distinguir diferentes TOKENS: operadores aritméticos, relacionales y lógicos, delimitadores, identificadores, constantes, 
tipos definidos por el usuario, nombres de procedimientos, o palabras reservadas del lenguaje son algunos ejemplos significativos. 

### Comentarios

Secuencia de caracteres que se encuentra a continuación del limitador de principio de comentario “--”:

-- Este es un comentario correcto

### Constantes literales

Se distinguen los siguientes tipos de constantes literales:

• Enteras: Valores enteros no negativos como 0, 32, 127, etc. No es posible escribir expresiones como -2 ya que el operador unario “–“
  no existe en este lenguaje. Para representar una cantidad negativa hay que hacerlo mediante una expresión cuyo resultado sea el valor 
  deseado. Por ejemplo, – 2 podría escribirse como 0 – 2
  
• Lógicas: True y False utilizados dentro de expresiones lógica.

• Cadenas de caracteres: Secuencia ordenada de caracteres delimitadas por las comillas dobles, por ejemplo: “ejemplo de cadena”. 

### Identificadores

Secuencia ordenada de caracteres y dígitos que comienzan obligatoriamente por una letra. Se usan para nombrar entidades del programa 
como las constantes, los tipos definidos por el usuario, las variables o los subprogramas. El lenguaje no es case sensitive. La longitud 
de los identificadores no está restringida.

### Palabras reservadas

Tokens del lenguaje que, a nivel léxico, tienen un significado especial de manera que no pueden ser utilizadas para nombrar otras entidades como
variables, constantes, tipos definidos por el usuario o subprogramas.
<pre>
and           Operador lógico
begin         Comienzo de un bloque de sentencias en un subprograma
Boolean       Tipo lógico
constant      Declaración de constantes simbólicas
else          Comienzo del cuerpo de alternativa de un if
end           Final de subprograma o de una estructura de control
False         Constante lógica que representa falso
function      Comienzo de una función
if            Comienzo de una sentencia condicional if
Integer       Tipo entero
is            Comienzo del cuerpo de un subprograma y parte de la declaración de un registro
loop          Comienzo/fin del bloque de sentencias de un bucle while
out           Indica paso por referencia
procedure     Comienzo de un procedimiento
Put_line      Procedimiento predefinido para mostrar información por pantalla
record        Declaración de un registro
return        Parte de la declaración de una función y sentencia de retorno
then          Comienzo de bloque de sentencias en un if
True          Constante lógica
type          Declaración de un tipo estructurado
while         Comienzo de un bucle while
</pre>

### Delimitadores
<pre>
“      Delimitador de constante literal de cadena
( )    Delimitadores de expresiones y de parámetros
--     Delimitadores de comentario
,      Delimitador en listas de identificadores
;      Delimitador en secuencias de sentencias y secuencias de parámetros
:      Delimitador de tipo en una declaración de variable o constante y en parámetros 
</pre>

### Operadores
Para construir expresiones por combinación de otras más sencillas:
<pre>
-      Resta aritmética
*      Multiplicación
>      Mayor
/=     Distinto
and    Conjunción lógica
:=     Asignación
.      Acceso al campo de un registro
</pre>

## Aspectos sintácticos

Especificaciones sintácticas que permiten escribir programas correctos

### Estructura de un programa y ámbitos de visibilidad

El esquema general de la estructura de un programa es el siguiente:

<pre>
procedure nombrePrograma () is
    -- Declaración de constantes simbólicas
    -- Declaración de tipos globales
    -- Declaración de variables globales
    -- Declaración de subprogramas
begin
    -- Lista sentencias
end nombrePrograma;
</pre>

Un programa en AdaUNED comienza con la declaración de un procedimiento principal nombrePrograma que no recibe ningún parámetro. A continuación,
se declaran opcionalmente, pero en este orden, las constantes simbólicas, los tipos y las variables globales, terminando con los subprogramas (funciones y 
procedimientos). A partir de la palabra reservada begin se insertará la lista de sentencias por las que comenzará a ejecutarse el programa. Esta lista de 
sentencias puede ser vacía.

### Declaraciones de constantes simbólicas 
Representación de datos constantes, cuyo valor permanecer inalterado a lo largo de la ejecución del programa. Únicamente pueden declararse al inicio del 
programa y no es posible su declaración dentro de otros ámbitos distintos al global. Representan literales de valor entero y positivo o de tipo lógico. 
La sintaxis para su declaración es la siguiente:

**nombre: constant := valor;**

Ejemplos de constantes:
<pre>
CIERTO: constant := True;
FALSO: constant := False;
</pre>
### Declaración de tipos

#### Tipos primitivos

Se encuentran disponibles directamente para que el programador tipifique las variables de su programa

• Tipo entero (Integer): Representa valores enteros positivos y negativos. Se representa con la palabra reservada Integer. 
<pre>
  x : Integer;
</pre>
• Tipo Lógico (Boolean): El tipo lógico representa valores de verdad, representados por las constantes literales True y False. 
  Para referirse a este tipo de datos se utiliza la palabra reservada Boolean.
<pre>
  esMayor : Boolean; 
</pre>
#### Tipos estructurados
permiten al programador definir estructuras de datos complejas y establecerlas como un tipo del lenguaje

• Tipo Registro (Record): Permite agrupar varios elementos de distinto tipo.
<pre>
type nombre is record
    nombreCampo1: TipoCampo1;
    nombreCampo2: TipoCampo2;
    ...
end record;

type Tpersona is record
    dni: Integer;
    edad : Integer;
    casado : Boolean;
end record;
</pre>

### Declaraciones de variables

Es necesario declarar las variables antes de utilizarlas. Se utiliza la siguiente sintaxis, dentro de las áreas de declaración de variables:

**nombre1, nombre2 : tipo;**
<pre>
x,y : Integer;
a : Boolean;
p1,p2: Tpersona;
</pre>


### Declaraciones de subprogramas

Un subprograma es una secuencia de instrucciones encapsuladas bajo un nombre con un conjunto de parámetros (opcionalmente ninguno) y, en el caso de
funciones, un valor de retorno. Los procedimientos no devuelven ningún valor. 

#### Funciones
Sintáxis de la declaración de funciones:
<pre>
function nombre (param1, param11…:tipo1; para2, param21…:tipo2)
return tipoRetorno is
    -- Declaración de tipos locales
    -- Declaración de variables
    -- Declaración de subprogramas anidados
begin
    -- Bloque de sentencias. Debe incluir la sentencia return
end nombre;
</pre>

Ejemplo de declaración de una función:
<pre>
function suma (x, y: Integer) return Integer is
    z: Integer;
begin
    z:= x+y;
    return z;
end suma;
</pre>

#### Procedimientos
Similares a las funciones pero no devuelven ningún valor, por lo que no contienen la sentencia return:
<pre>
procedure nombre (param1,param11…:tipo1;para2,param21…:tipo2) is
    -- Declaración de tipos locales
    -- Declaración de variables
    -- Declaración de subprogramas anidados
begin
    -- Bloque de sentencias
end nombre;
</pre>

Ejemplo de declaración de un procedimiento:
<pre>
procedure resta (x, y, z: out Integer) is
    -- parametros pasados por referencia
begin
    z:= x-y;
end resta;
</pre>

### Paso de parámetros

El paso de parámetros a un subprograma puede ser por valor o por referencia. En el paso por valor, el compilador realiza una copia del argumento a 
otra zona de memoria para que el subprograma pueda trabajar con él sin modificar el valor del argumento tras la ejecución de la invocación. En el 
paso por referencia, el parámetro es una referencia y el compilador transmite al subprograma la dirección de memoria donde está almacenado el parámetro 
actual, de forma que las modificaciones al parámetro tendrán efecto sobre el argumento una vez terminada la ejecución.  Para indicar que un parámetro 
se pasa por referencia debe precederse su tipo con la palabra reservada out. 

<pre>
-- Paso por valor
function resta (a,b:Integer) return Integer is
begin
    z:= x-y;
return z;
end resta;

-- Paso por referencia
procedure mayor (x, y: out Integer; a: out Boolean) is
begin
    a:=x>y
end mayor;
</pre>

### Expresiones

Construcción del lenguaje que devuelve un valor de retorno. Las expresiones no deben aparecer de forma aislada en el código, 
han de estar incluidas como parte de una sentencia.

• Expresiones	aritméticas: Devuelve un valor de tipo entero al contexto de evaluación.

• Expresiones lógicas: Devuelve un valor de tipo lógico al contexto de evaluación.

• Expresiones	de	acceso	a	campos	de	registros: Para acceder a los campos de un registro se utiliza el operador de acceso a registro “.”

• Invocación	de	funciones: Para llamar a un subprograma ha de escribirse su identificador indicando entre paréntesis los parámetros actuales de la llamada.

#### Precedencia	y	asociatividad	de	operadores
En la siguiente tabla la prioridad decrece por filas. Los operadores en la misma fila tienen igual precedencia:

<pre>
Precedencia    Asociatividad

. ( )            Izquierda
*                Izquierda
-                Izquierda
>                Izquierda
/=               Izquierda
and              Izquierda
</pre>

### Sentencias

## Tecnologías

* IDE: Eclipse 2021 – 03
* Java version "18" 2022-03-22
* Java(TM) SE Runtime Environment (build 18+36-2087)
* Java HotSpot(TM) 64-Bit Server VM (build 18+36-2087, mixed mode, sharing)



