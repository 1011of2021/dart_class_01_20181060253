//数字--int,double
/*
void main() {
  var a=1.4;
  int x = 1;
  double y = 1.1;
  num z = 0;
  print('$x ,$y ,$z ');
  //字符串和数字之间转换
  var one = int.parse('1');
  assert(one == 1);
  var onePointOne = double.parse('1.1');
  assert(onePointOne == 1.1);
  String oneAsString = 1.toString();
  assert(oneAsString == '1');
  String piAsString = 3.14159.toStringAsFixed(2);
  assert(piAsString == '3.14');
  print('$one ,$onePointOne ,$oneAsString ,$piAsString ');
}
*/
//字符串--String
/*
void main() {
  var s = 'string interprolation';
  /*
    在字符串中,以 ${表达式} 的形式使用表达式,
    如果表达式是一个标识符，可以省略掉 {}
  */
  assert('Dart has $s, which is very handy.' ==
      'Dart has string interpolation, '
          'which is very handy.');
  //使用 + 运算符或并列放置多个字符串来连接字符串
  var s1 = 'String'
      'concatenation'
      "works even over line breaks.";
  assert(s1 ==
      'String concatenation works even over'
          'line breaks');
  var s2 = 'The+operator' + 'works,as well.';
  assert(s2 == 'The + operator works, as well.');
  //使用三个单引号或者三个双引号能创建多行字符串
  var s3 = '''
      You can create
      multi-line strings like this one.''';
  var s4 = """This is also a
      multi-line string.""";
  //字符串前加上 r 作为前缀创建 “raw” 字符串,不会被做任何处理
  var s5 = r'''在 raw 字符串中，
      转义字符串 \n 会直接输出 “\n” 
      而不是转义为换行。''';    
}
*/
//布尔
/*
不允许使用类似 if (nonbooleanValue) 或者 assert (nonbooleanValue) 
这样的代码检查布尔值,应该总是显示地检查布尔值
void main() {
  var fullName = '';
  assert(fullName.isEmpty);
  var hitPoints = 0;
  assert(hitPoints <= 0);
  var unicorn;
  assert(unicorn == null);
}
*/
//数组--list
/*
void main(){
  /*使用扩展操作符（...）
  将一个 List 中的所有元素插入到另一个 List 中
  */
  var list = [1, 2, 3];
  var list2 = [0, ...list];
  assert(list2.length == 4);
}
*/
//map --用来关联 keys 和 values 的对象
/*
void main(){
  var gifts = {
  // Key:    Value
  'first': 'partridge',
  'second': 'turtledoves',
  'fifth': 'golden rings'
  };
  //map中添加键值，.length 可以获取 Map 中键值对的数量
  gifts['fourth'] = 'calling birds';
  var nobleGases = {
  2: 'helium',
  10: 'neon',
  18: 'argon',
  };
}
*/
//函数
/*
/*required 来标识一个命名参数是必须的参数
 [] 将一系列参数包裹起来作为位置参数
*/
//为位置参数设置默认值
String say(String from, String msg,
    [String device = 'carrier pigeon']) {
  var result = '$from says $msg with a $device';
  return result;
}
/*
每个 Dart 程序都必须有一个 main() 顶级函数作为程序的
入口， main() 函数返回值为 void 并且有一个 
List<String> 类型的可选参数。
*/
void main(){
  assert(say('Bob', 'Howdy') ==
    'Bob says Howdy with a carrier pigeon');
  //匿名函数
  /*只有一个参数 item 且没有参数类型的匿名方法。 
  List 中的每个元素都会调用这个函数，
  打印元素位置和值的字符串
  0: apples
  1: bananas
  2: oranges
  */
  const list = ['apples', 'bananas', 'oranges'];
  list.forEach((item) {
      print('${list.indexOf(item)}: $item');
      });
}
//函数是一级对象,可以将函数作为参数传递给另一个函数
void printElement(int element) {
  print(element);
}
var list = [1, 2, 3];
list.forEach(printElement);
*/
//词法作用域
/*变量的作用域在写代码的时候就确定了，
大括号内定义的变量只能在大括号内访问*/
/*
bool topLevel = true;
void main() {
  var insideMain = true;

  void myFunction() {
    var insideFunction = true;

    void nestedFunction() {
      var insideNestedFunction = true;

      assert(topLevel);
      assert(insideMain);
      assert(insideFunction);
      assert(insideNestedFunction);
    }
  }
}
*/
//词法闭包
/*闭包 即一个函数对象，即使函数对象的调用在它原始作用域
之外，依然能够访问在它词法作用域内的变量。函数可以封闭定义到它作用域内的变量。
接下来的示例中，函数 makeAdder() 捕获了变量 addBy。
无论函数在什么时候返回，它都可以使用捕获的 addBy 变量。*/
/*
Function makeAdder(int addBy) {
  return (int i) => addBy + i;
}
void main() {
  // Create a function that adds 2.
  var add2 = makeAdder(2);

  // Create a function that adds 4.
  var add4 = makeAdder(4);

  assert(add2(3) == 5);
  assert(add4(3) == 7);
}
*/
//所有的函数都有返回值。没有显示返回语句的函数最后一行默认为执行 return null;
/*运算符
在 运算符表 中，运算符的优先级按先后排列，
即第一行优先级最高，最后一行优先级最低，
而同一行中，最左边的优先级最高，最右边的优先级最低。
例如：% 运算符优先级高于 == ，而 == 高于 &&。
Dart 还支持自增自减操作。
类型判断运算符
as  类型转换
is  如果对象是指定类型则返回 true
is! 如果对象是指定类型则返回 false
赋值运算符
可以使用 = 来赋值，同时也可以使用 
??= 来为值为 null 的变量赋值。
a = value;
b ??= value;
*/
/*条件表达式
Dart 有两个特殊的运算符可以用来替代 if-else 语句：
（1）条件 ? 表达式 1 : 表达式 2
如果条件为 true，执行表达式 1并返回执行结果，否则执行表达式 2 并返回执行结果。
var visibility = isPublic ? 'public' : 'private';
（2）表达式 1 ?? 表达式 2
如果表达式 1 为非 null 则返回其值，否则执行表达式 2 并返回其值。
String playerName(String? name) => name ?? 'Guest';
*/
/*级联运算符
级联运算符 (.., ?..) 可以让你在同一个对象上连续调用多个对象的变量或方法。
var paint = Paint()
  ..color = Colors.black
  ..strokeCap = StrokeCap.round
  ..strokeWidth = 5.0;
等价于
var paint = Paint();
paint.color = Colors.black;
paint.strokeCap = StrokeCap.round;
paint.strokeWidth = 5.0;
级联运算符可以嵌套
final addressBook = (AddressBookBuilder()
      ..name = 'jenny'
      ..email = 'jenny@example.com'
      ..phone = (PhoneNumberBuilder()
            ..number = '415-555-0100'
            ..label = 'home')
          .build())
    .build();
*/
/*流程控制语句
if 和 else
for 循环
while 和 do-while 循环
break 和 continue
switch 和 case
assert----断言
在开发过程中，可以在条件表达式为 false 时使用 
— assert(条件, 可选信息); — 语句来打断代码的执行
assert(text != null);
assert 的第一个参数可以是值为布尔值的任何表达式。
如果表达式的值为 true，则断言成功，继续执行。
如果表达式的值为 false，则断言失败
判断 assert 是否生效
通过在运行 Dart 程序时添加命令行参数 
--enable-asserts 使 assert 生效
*/
//异常
/*抛出异常
throw FormatException('Expected at least 1 section');
可以抛出任意的对象
throw 'Out of llamas!';
捕获异常可以避免异常继续传递（重新抛出异常除外）
try {
  breedMoreLlamas();
} on OutOfLlamasException {
  buyMoreLlamas();
}
*/
/*
try {
  breedMoreLlamas();
} on OutOfLlamasException {
  buyMoreLlamas();
} on Exception catch (e) {
  print('Unknown exception: $e');
} catch (e) {
  print('Something really unknown: $e');
}
如上述代码所示可以使用 on 或 catch 来捕获异常，使用 on
 来指定异常类型，使用 catch 来捕获异常对象，两者可同时使用。
关键字 rethrow 可以将捕获的异常再次抛出：
void misbehave() {
  try {
    dynamic foo = true;
    print(foo++); // Runtime error
  } catch (e) {
    print('misbehave() partially handled ${e.runtimeType}.');
    rethrow; // Allow callers to see the exception.
  }
}

void main() {
  try {
    misbehave();
  } catch (e) {
    print('main() finished handling ${e.runtimeType}.');
  }
}
*/
//Finally
/*无论是否抛出异常，finally 语句始终执行，如果没有指定 catch 语句来捕获异常，
则异常会在执行完 finally 语句后抛出：
try {
  breedMoreLlamas();
} finally {
  // Always clean up, even if an exception is thrown.
  cleanLlamaStalls();
}
finally 语句会在任何匹配的 catch 语句后执行：
try {
  breedMoreLlamas();
} catch (e) {
  print('Error: $e'); // Handle the exception first.
} finally {
  cleanLlamaStalls(); // Then clean up.
}
*/
//类
/*
对象的 成员 由函数和数据（即 方法 和 实例变量）组成。方法的调用要通过对象来完成，
这种方式可以访问对象的函数和数据
使用（.）来访问对象的实例变量或方法：
var p = Point(2, 2);
assert(p.y == 2);
double distance = p.distanceTo(Point(4, 4));
使用 ?. 代替 . 可以避免因为左边表达式为 null 而导致的问题：
var a = p?.y;
*/
/*
可以使用 构造函数 来创建一个对象。构造函数的命名方式可以为 类名或类名 . 标识符的形式。
var p1 = Point(2, 2);
var p2 = Point.fromJson({'x': 1, 'y': 2});
构造函数名前面的的 new 关键字是可选的
*/
/*
一些类提供了常量构造函数。使用常量构造函数，在构造函数名之前加 const 关键字，
来创建编译时常量时：
var p = const ImmutablePoint(2, 2);
两个使用相同构造函数相同参数值构造的编译时常量是同一个对象：
var a = const ImmutablePoint(1, 1);
var b = const ImmutablePoint(1, 1);
assert(identical(a, b));
在 常量上下文 场景中，可以省略掉构造函数或字面量前的 const 关键字
const pointAndLine = const {
  'point': const [const ImmutablePoint(0, 0)],
  'line': const [const ImmutablePoint(1, 10), const ImmutablePoint(-2, 11)],
};
根据上下文，你可以只保留第一个 const 关键字，其余的全部省略：
但是如果无法根据上下文判断是否可以省略 const，则不能省略掉 const 关键字，
否则将会创建一个 非常量对象
*/
//构造函数
/*
声明一个与类名一样的函数即可声明一个构造函数（对于命名式构造函数 
还可以添加额外的标识符）。大部分的构造函数形式是生成式构造函数，其用于创建一个类的实例：
class Point {
  double x = 0;
  double y = 0;

  Point(double x, double y) {
    // There's a better way to do this, stay tuned.
    this.x = x;
    this.y = y;
  }
}
*/
/*
如果你没有声明构造函数，那么 Dart 会自动生成一个无参数的构造函数并且该构造函
数会调用其父类的无参数构造方法。
子类不会继承父类的构造函数，如果子类没有声明构造函数，那么只会有一个默认无参数的
构造函数。
如果你想在子类中提供一个与父类命名构造函数名字一样的命名构造函数，
则需要在子类中显式地声明
*/
/*
调用父类非默认构造函数
默认情况下，子类的构造函数会调用父类的匿名无参数构造方法，
并且该调用会在子类构造函数的函数体代码执行前，如果子类构造函数还有一个 初始化列表，
那么该初始化列表会在调用父类的该构造函数之前被执行，总的来说，这三者的调用顺序如下：

初始化列表

父类的无参数构造函数

当前类的构造函数

如果父类没有匿名无参数构造函数，那么子类必须调用父类的其中一个构造函数，
为子类的构造函数指定一个父类的构造函数只需在构造函数体前使用（:）指定。
Employee 类的构造函数调用了父类 Person 的命名构造函数。
class Person {
  String? firstName;

  Person.fromJson(Map data) {
    print('in Person');
  }
}

class Employee extends Person {
  // Person does not have a default constructor;
  // you must call super.fromJson(data).
  Employee.fromJson(Map data) : super.fromJson(data) {
    print('in Employee');
  }
}

void main() {
  var employee = Employee.fromJson({});
  print(employee);
  // Prints:
  // in Person
  // in Employee
  // Instance of 'Employee'
}
*/ 
//初始化列表
/*
除了调用父类构造函数之外，还可以在构造函数体执行之前初始化实例变量。
每个实例变量之间使用逗号分隔。
Point.fromJson(Map<String, double> json)
    : x = json['x']!,
      y = json['y']! {
  print('In Point.fromJson(): ($x, $y)');
}
*/
//重定向构造函数
/*
有时候类中的构造函数仅用于调用类中其它的构造函数，此时该构造函数没
有函数体，只需在函数签名后使用（:）指定需要重定向到的其它构造函数 (使用 this 而非类名)：
 class Point {
  double x, y;
  Point(this.x, this.y);
  Point.alongXAxis(double x) : this(x, 0);
}
 */
//常量构造函数
/*
如果类生成的对象都是不变的，可以在生成这些对象时就将其变为编译时常量。
可以在类的构造函数前加上 const 关键字并确保所有实例变量均为 final 来实现该功能。
 class ImmutablePoint {
  static const ImmutablePoint origin = ImmutablePoint(0, 0);
  final double x, y;
  const ImmutablePoint(this.x, this.y);
}
 */
//工厂构造函数
/*使用 factory 关键字标识类的构造函数将会令该构造函数变为工厂构造函数，这将意味
着使用该构造函数构造类的实例时并非总是会返回新的实例对象。例如，工厂构造
函数可能会从缓存中返回一个实例，或者返回一个子类型的实例。
在如下的示例中， Logger 的工厂构造函数从缓存中返回对象，和 Logger.fromJson 工
厂构造函数从 JSON 对象中初始化一个最终变量。
class Logger {
  final String name;
  bool mute = false;

  // _cache is library-private, thanks to
  // the _ in front of its name.
  static final Map<String, Logger> _cache =
      <String, Logger>{};

  factory Logger(String name) {
    return _cache.putIfAbsent(
        name, () => Logger._internal(name));
  }

  factory Logger.fromJson(Map<String, Object> json) {
    return Logger(json['name'].toString());
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) print(msg);
  }
}
工厂构造函数的调用方式与其他构造函数一样：

var logger = Logger('UI');
logger.log('Button clicked');

var logMap = {'name': 'UI'};
var loggerJson = Logger.fromJson(logMap);
*/
//方法  方法是为对象提供行为的函数。
/**
 * 实例方法
 * 对象的实例方法可以访问实例变量和 this。下面的 distanceTo() 方法就是一
 * 个实例方法的例子：
 * import 'dart:math';

class Point {
  double x = 0;
  double y = 0;

  Point(this.x, this.y);

  double distanceTo(Point other) {
    var dx = x - other.x;
    var dy = y - other.y;
    return sqrt(dx * dx + dy * dy);
  }
 */
//抽象方法
/*
实例方法、Getter 方法以及 Setter 方法都可以是抽象的，定义一个接口方法而不去做
具体的实现让实现它的类去实现该方法，抽象方法只能存在于 抽象类中。
 直接使用分号（;）替代方法体即可声明一个抽象方法
 abstract class Doer {
  // Define instance variables and methods...

  void doSomething(); // Define an abstract method.
}

class EffectiveDoer extends Doer {
  void doSomething() {
    // Provide an implementation, so the method is not abstract here...
  }
}
 */
//抽象类
/* 
使用关键字 abstract 标识类可以让该类成为 抽象类，抽象类将无法被实例化。
抽象类常用于声明接口方法、有时也会有具体的方法实现。如果想让抽象类同时可被实例化，
可以为其定义 工厂构造函数。
抽象类常常会包含 抽象方法。下面是一个声明具有抽象方法的抽象类示例：
// This class is declared abstract and thus
// can't be instantiated.
abstract class AbstractContainer {
  // Define constructors, fields, methods...

  void updateChildren(); // Abstract method.
}
*/
//隐式接口
/*
每一个类都隐式地定义了一个接口并实现了该接口，这个接口包含所有这个
类的实例成员以及这个类所实现的其它接口。如果想要创建一个 A 类支持调用 B 类
的 API 且不想继承 B 类，则可以实现 B 类的接口。
 一个类可以通过关键字 implements 来实现一个或多个接口并实现每个接口定义的 API：
 // A person. The implicit interface contains greet().
class Person {
  // In the interface, but visible only in this library.
  final String _name;

  // Not in the interface, since this is a constructor.
  Person(this._name);

  // In the interface.
  String greet(String who) => 'Hello, $who. I am $_name.';
}

// An implementation of the Person interface.
class Impostor implements Person {
  String get _name => '';

  String greet(String who) => 'Hi $who. Do you know who I am?';
}

String greetBob(Person person) => person.greet('Bob');

void main() {
  print(greetBob(Person('Kathy')));
  print(greetBob(Impostor()));
}
如果需要实现多个类接口，可以使用逗号分割每个接口类：
class Point implements Comparable, Location {...}
 */
//重写类成员
/*
子类可以重写父类的实例方法（包括 操作符）、 Getter 以及 Setter 方法。
可以使用 @override 注解来表示你重写了一个成员：
class Television {
  // ···
  set contrast(int value) {...}
}

class SmartTelevision extends Television {
  @override
  set contrast(num value) {...}
  // ···
}

 */
//扩展方法
/*
扩展方法是向现有库添加功能的一种方式。你可能已经在不知道它是扩展方法的情况
下使用了它。例如，当您在 IDE 中使用代码完成功能时，它建议将扩展方法与常规方法一起使用。

 */
//枚举类型
/*
使用枚举
使用关键字 enum 来定义枚举类型：
enum Color { red, green, blue }
每一个枚举值都有一个名为 index 成员变量的 Getter 方法，该方法将会返回以 0 为基准索引的位置值。例如，第一个枚举值的索引是 0 ，
第二个枚举值的索引是 1。以此类推。
assert(Color.red.index == 0);
assert(Color.green.index == 1);
assert(Color.blue.index == 2);
 */
//使用 Mixin 为类添加功能
/*
Mixin 是一种在多重继承中复用某个类中代码的方法模式。
使用 with 关键字并在其后跟上 Mixin 类的名字来使用 Mixin 模式：
class Musician extends Performer with Musical {
  // ···
}

class Maestro extends Person
    with Musical, Aggressive, Demented {
  Maestro(String maestroName) {
    name = maestroName;
    canConduct = true;
  }
}
想要实现一个 Mixin，请创建一个继承自 Object 且未声明构造函数的类。
除非你想让该类与普通的类一样可以被正常地使用，否则请使用关键字 mixin 替代 class。例如：
mixin Musical {
  bool canPlayPiano = false;
  bool canCompose = false;
  bool canConduct = false;

  void entertainMe() {
    if (canPlayPiano) {
      print('Playing piano');
    } else if (canConduct) {
      print('Waving hands');
    } else {
      print('Humming to self');
    }
  }
}
可以使用关键字 on 来指定哪些类可以使用该 Mixin 类，比如有 Mixin 类 A，但是 A 
只能被 B 类使用，则可以这样定义 A：
class Musician {
  // ...
}
mixin MusicalPerformer on Musician {
  // ...
}
class SingerDancer extends Musician with MusicalPerformer {
  // ...
}
 */
//类变量和方法使用关键字 static 可以声明类变量或类方法。
/*
静态变量
静态变量（即类变量）常用于声明类范围内所属的状态变量和常量：
class Queue {
  static const initialCapacity = 16;
  // ···
}

void main() {
  assert(Queue.initialCapacity == 16);
}
静态变量在其首次被使用的时候才被初始化
静态方法
静态方法（即类方法）不能对实例进行操作，因此不能使用 this。但是他们可以访问静
态变量。如下面的例子所示，你可以在一个类上直接调用静态方法：
import 'dart:math';

class Point {
  double x, y;
  Point(this.x, this.y);

  static double distanceBetween(Point a, Point b) {
    var dx = a.x - b.x;
    var dy = a.y - b.y;
    return sqrt(dx * dx + dy * dy);
  }
}

void main() {
  var a = Point(2, 2);
  var b = Point(4, 4);
  var distance = Point.distanceBetween(a, b);
  assert(2.8 < distance && distance < 2.9);
  print(distance);
}
 */
//泛型