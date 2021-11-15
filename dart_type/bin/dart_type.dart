
void enableFlags({bool? bold, bool? hidden}) {}
Function makeAdder(int addBy) {
  return (int i) => addBy + i;
}
foo() {}

void main() {
//数字--int,double

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


//字符串--String

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

//布尔

/*不允许使用类似 if (nonbooleanValue) 或者 assert (nonbooleanValue) 
这样的代码检查布尔值,应该总是显示地检查布尔值*/

  var fullName = '';
  assert(fullName.isEmpty);
  var hitPoints = 0;
  assert(hitPoints <= 0);
  var unicorn;
  assert(unicorn == null);

//数组--list

  /*使用扩展操作符（...）
  将一个 List 中的所有元素插入到另一个 List 中
  */
  var list = [1, 2, 3];
  var list2 = [0, ...list];
  assert(list2.length == 4);

//map --用来关联 keys 和 values 的对象
  var gifts = {
  // Key:    Value
  'first': 'partridge',
  'second': 'turtledoves',
  'fifth': 'golden rings'
  };
  //使用 Map 的构造器创建 Map：
  var gifts1 = Map<String, String>();
  gifts1['first'] = 'partridge';
  gifts1['second'] = 'turtledoves';
  gifts1['fifth'] = 'golden rings';
  gifts1['fourth'] = 'calling birds';
  //Map 中添加键值对
  gifts['fourth'] = 'calling birds';
  //从一个 Map 中获取一个值
  assert(gifts['first'] == 'partridge');
  //.length 可以获取 Map 中键值对的数量
  assert(gifts.length == 4);
  // Map 字面量前添加 const 关键字可以创建一个 Map 编译时常量：
  final constantMap = const {
  2: 'helium',
  10: 'neon',
  18: 'argon',
};
//函数
/*
Dart 是一种真正面向对象的语言，所以即便函数也是对象并且类型为 Function,
这意味着函数可以被赋值给变量或者作为其它函数的参数
*/
//当你调用函数时，可以使用 参数名: 参数值 的形式来指定命名参数。

enableFlags(bold: true, hidden: false);
/*
命名参数默认为可选参数，除非他们被特别标记为 required。
required 来标识一个命名参数是必须的参数，此时调用者必须为该参数提供一个值
*/

 //[] 将一系列参数包裹起来作为位置参数
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
//可以将函数作为参数传递给另一个函数,也可以将函数赋值给一个变量
  //匿名函数
  /*
  大多数方法都是有名字的，比如 main() 或 printElement()。
  你可以创建一个没有名字的方法
  匿名方法看起来与命名方法类似，在括号之间可以定义参数，参数之间用逗号分割。
  后面大括号中的内容则为函数体：
([[类型] 参数[, …]]) {
  函数体;
};
  */
  //下面代码定义了只有一个参数 item 且没有参数类型的匿名方法
  list.forEach((item) {
    print('${list.indexOf(item)}: $item');
  });
  /*只有一个参数 item 且没有参数类型的匿名方法。 
  List 中的每个元素都会调用这个函数，
  打印元素位置和值的字符串
  0: apples
  1: bananas
  2: oranges
  */
}

//词法作用域,与 Java 类似

//词法闭包
/*
一个函数对象，即使函数对象的调用在它原始作用域之外，依然能够访问在它词法作用域
内的变量。
*/
/*
接下来的示例中，函数 makeAdder() 捕获了变量 addBy。
无论函数在什么时候返回，它都可以使用捕获的 addBy 变量。
*/
  var add2 = makeAdder(2);
//所有的函数都有返回值。没有显示返回语句的函数最后一行默认为执行 return null;
  //assert(foo() == null);
///运算符
/*
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
*/
//var visibility = isPublic ? 'public' : 'private';
/*
（2）表达式 1 ?? 表达式 2
如果表达式 1 为非 null 则返回其值，否则执行表达式 2 并返回其值。
*/
String playerName(String? name) => name ?? 'Guest';
/*级联运算符
级联运算符 (.., ?..) 可以让你在同一个对象上连续调用多个对象的变量或方法。
*/
/*
var paint = Paint()
  ..color = Colors.black
  ..strokeCap = StrokeCap.round
  ..strokeWidth = 5.0;
//等价于
var paint1 = Paint();
paint1.color = Colors.black;
paint1.strokeCap = StrokeCap.round;
paint1.strokeWidth = 5.0;
//级联运算符可以嵌套
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
//抛出异常
/*throw FormatException('Expected at least 1 section');
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
/*
泛型常用于需要要求类型安全的情况，但是它也会对代码运行有好处：
适当地指定泛型可以更好地帮助代码生成。
使用泛型可以减少代码重复。
比如你想声明一个只能包含 String 类型的数组，你可以将该数组声明为 List<String>
（读作“字符串类型的 list”），这样的话就可以很容易避免因为在该数组放入非 String 类变量而导致的诸多问题，同时编译器以及其他阅读代码的人都可以很容易地发现并定位问题：
 var names = <String>[];
names.addAll(['Seth', 'Kathy', 'Lars']);
names.add(42); // Error
另一个使用泛型的原因是可以减少重复代码。泛型可以让你在多个不同类型实现之间共享同一个接口声明，比如下面的例子中声明了一个类用于缓存对象的接口：
abstract class ObjectCache {
  Object getByKey(String key);
  void setByKey(String key, Object value);
}
 不久后你可能又会想专门为 String 类对象做一个缓存，于是又有了专门为 String 做缓存的类
 abstract class StringCache {
  String getByKey(String key);
  void setByKey(String key, String value);
}
如果过段时间你又想为数字类型也创建一个类，那么就会有很多诸如此类的代码……

这时候可以考虑使用泛型来声明一个类，让不同类型的缓存实现该类做出不同的具体实现即可：
abstract class Cache<T> {
  T getByKey(String key);
  void setByKey(String key, T value);
}
 */
//使用集合字面量
/*
List、Set 以及 Map 字面量也可以是参数化的。定义参数化的 List 只需在中括号
前添加 <type>；定义参数化的 Map 只需要在大括号前添加 <keyType, valueType>：
var names = <String>['Seth', 'Kathy', 'Lars'];
var uniqueNames = <String>{'Seth', 'Kathy', 'Lars'};
var pages = <String, String>{
  'index.html': 'Homepage',
  'robots.txt': 'Hints for web robots',
  'humans.txt': 'We are people, not machines'
};
 */
//使用类型参数化的构造函数
/*
在调用构造方法时也可以使用泛型，只需在类名后用尖括号（<...>）将一个或多个类型包裹即可：

var nameSet = Set<String>.from(names);
 */
//泛型集合以及它们所包含的类型
/*
Dart的泛型类型是 固化的，这意味着即便在运行时也会保持类型信息
var names = <String>[];
names.addAll(['Seth', 'Kathy', 'Lars']);
print(names is List<String>); // true

 */
//限制参数化类型
/*有时使用泛型的时候，你可能会想限制可作为参数的泛型范围，也就是参数必须是指定类型的
子类，这时候可以使用 extends 关键字。

一种常见的非空类型处理方式，是将子类限制继承 Object （而不是默认的 Object?）。
class Foo<T extends Object> {
  // Any type provided to Foo for T must be non-nullable.
}
*/
//使用泛型方法
/*
起初 Dart 只支持在类的声明时指定泛型，现在同样也可以在方法上使用泛型，称之为 泛型方法：
T first<T>(List<T> ts) {
  // Do some initial work or error checking, then...
  T tmp = ts[0];
  // Do some additional checking or processing...
  return tmp;
}
方法 first<T> 的泛型 T 可以在如下地方使用：

函数的返回值类型 (T)。

参数的类型 (List<T>)。

局部变量的类型 (T tmp)。
 */
//库和可见性
/*
import 和 library 关键字可以帮助你创建一个模块化和可共享的代码库。代码库不仅只
是提供 API 而且还起到了封装的作用：以下划线（_）开头的成员仅在代码库中可见。 
每个 Dart 程序都是一个库，即便没有使用关键字 library 指定。

Dart 的库可以使用 包工具 来发布和部署。
 */
//使用库
/*
使用 import 来指定命名空间以便其它库可以访问。

比如你可以导入代码库 dart:html 来使用 Dart Web 中相关 API：

import 'dart:html';

 */
//指定库前缀
/*
如果你导入的两个代码库有冲突的标识符，你可以为其中一个指定前缀。比如如果 library1 
和 library2 都有 Element 类，那么可以这么处理：

import 'package:lib1/lib1.dart';
import 'package:lib2/lib2.dart' as lib2;

// Uses Element from lib1.
Element element1 = Element();

// Uses Element from lib2.
lib2.Element element2 = lib2.Element();
 */
//导入库的一部分
/*
如果你只想使用代码库中的一部分，你可以有选择地导入代码库。例如：

// Import only foo.
import 'package:lib1/lib1.dart' show foo;

// Import all names EXCEPT foo.
import 'package:lib2/lib2.dart' hide foo;

 */
//延迟加载库
/*
延迟加载（也常称为 懒加载）允许应用在需要时再去加载代码库，下面是可能使用到延迟加载
的场景：

为了减少应用的初始化时间。

处理 A/B 测试，比如测试各种算法的不同实现。

加载很少会使用到的功能，比如可选的屏幕和对话框。
使用 deferred as 关键字来标识需要延时加载的代码库：

import 'package:greetings/hello.dart' deferred as hello;
当实际需要使用到库中 API 时先调用 loadLibrary 函数加载库：

Future<void> greet() async {
  await hello.loadLibrary();
  hello.printGreeting();
}
 */
//实现库
//异步支持
/*
Dart 代码库中有大量返回 Future 或 Stream 对象的函数，这些函数都是 异步 的，它们
会在耗时操作（比如I/O）执行完毕前直接返回而不会等待耗时操作执行完毕。

async 和 await 关键字用于实现异步编程，并且让你的代码看起来就像是同步的一样。
 */
//处理 Future
/*
可以通过下面两种方式，获得 Future 执行完成的结果：

使用 async 和 await，在 异步编程 codelab 中有更多描述；

使用 Future API，具体描述参考 库概览。

使用 async 和 await 的代码是异步的，但是看起来有点像同步代码。例如，下面的代码使
用 await 等待异步函数的执行结果。

await lookUpVersion();
必须在带有 async 关键字的 异步函数 中使用 await：

Future<void> checkVersion() async {
  var version = await lookUpVersion();
  // Do something with version
}
使用 try、catch 以及 finally 来处理使用 await 导致的异常：

try {
  version = await lookUpVersion();
} catch (e) {
  // React to inability to look up the version
}
可以在异步函数中多次使用 await 关键字
如果在使用 await 时导致编译错误，请确保 await 在一个异步函数中使用。例如，如果想在 
main() 函数中使用 await，那么 main() 函数就必须使用 async 关键字标识。

Future<void> main() async {
  checkVersion();
  print('In main: version is ${await lookUpVersion()}');
}
 */
//声明异步函数
/*
异步函数 是函数体由 async 关键字标记的函数。

将关键字 async 添加到函数并让其返回一个 Future 对象。假设有如下返回 String 对象的方法：

String lookUpVersion() => '1.0.0';
将其改为异步函数，返回值是 Future：

Future<String> lookUpVersion() async => '1.0.0';
注意，函数体不需要使用 Future API。如有必要，Dart 会创建 Future 对象。

如果函数没有返回有效值，需要设置其返回类型为 Future<void>。

 */
//处理 Stream
/*
如果想从 Stream 中获取值，可以有两种选择：

使用 async 关键字和一个 异步循环（使用 await for 关键字标识）。

使用 Stream API。

使用 await for 定义异步循环看起来是这样的：

await for (varOrType identifier in expression) {
  // Executes each time the stream emits a value.
}
表达式 的类型必须是 Stream。执行流程如下：

等待直到 Stream 返回一个数据。

使用 1 中 Stream 返回的数据执行循环体。

重复 1、2 过程直到 Stream 数据返回完毕。
使用 break 和 return 语句可以停止接收 Stream 数据，这样就跳出了循环并取消注册
监听 Stream。

**如果在实现异步 for 循环时遇到编译时错误，请检查确保 await for 处于异步函数中。
 ** 例如，要在应用程序的 main() 函数中使用异步 for 循环，main() 函数体必须标记为 async：

Future<void> main() async {
  // ...
  await for (final request in requestServer) {
    handleRequest(request);
  }
  // ...
}
 */
//生成器
/*
当你需要延迟地生成一连串的值时，可以考虑使用 生成器函数。Dart 内置支持两种形式
的生成器方法：

同步 生成器：返回一个 Iterable 对象。

Synchronous generator: Returns an Iterable object.

异步 生成器：返回一个 Stream 对象。

通过在函数上加 sync* 关键字并将返回值类型设置为 Iterable 来实现一个 同步 生成器函数
，在函数中使用 yield 语句来传递值：

Iterable<int> naturalsTo(int n) sync* {
  int k = 0;
  while (k < n) yield k++;
}
实现 异步 生成器函数与同步类似，只不过关键字为 async* 并且返回值为 Stream：

Stream<int> asynchronousNaturalsTo(int n) async* {
  int k = 0;
  while (k < n) yield k++;
}
如果生成器是递归调用的，可是使用 yield* 语句提升执行性能：

Iterable<int> naturalsDownFrom(int n) sync* {
  if (n > 0) {
    yield n;
    yield* naturalsDownFrom(n - 1);
  }
}

 */
//可调用类
/*
通过实现类的 call() 方法，允许使用类似函数调用的方式来使用该类的实例。

在下面的示例中，WannabeFunction 类定义了一个 call() 函数，函数接受三个字符串参
数，函数体将三个字符串拼接，字符串间用空格分割，并在结尾附加了一个感叹号。
class WannabeFunction {
  String call(String a, String b, String c) => '$a $b $c!';
}

var wf = WannabeFunction();
var out = wf('Hi', 'there,', 'gang');

void main() => print(out);
 */
//隔离区
/*
大多数计算机中，甚至在移动平台上，都在使用多核 CPU。为了有效利用多核性能，开发者
一般使用共享内存的方式让线程并发地运行。然而，多线程共享数据通常会导致很多潜在的问
题，并导致代码运行出错。

为了解决多线程带来的并发问题，Dart 使用 isolate 替代线程，所有的 Dart 代码均运行在
一个 isolate 中。每一个 isolate 有它自己的堆内存以确保其状态不被其它 isolate 访问。
 */
//Typedefs
/*
类型别名是引用某一类型的简便方法，因为其使用关键字 typedef，因此通常被称作 typedef。
下面是一个使用 IntList 来声明和使用类型别名的例子:
 typedef IntList = List<int>;
IntList il = [1, 2, 3];
类型别名可以有类型参数:

typedef ListMapper<X> = Map<X, List<X>>;
Map<String, List<String>> m1 = {}; // Verbose.
ListMapper<String> m2 = {}; // Same thing but shorter and clearer.
 针对函数，在大多数情况下，我们推荐使用 内联函数类型 替代 typedefs。然而，函数的 typedefs 仍然是有用的:

typedef Compare<T> = int Function(T a, T b);

int sort(int a, int b) => a - b;

void main() {
  assert(sort is Compare<int>); // True!
}
 */
//元数据
/*
使用元数据可以为代码增加一些额外的信息。元数据注解以 @ 开头，其后紧跟一个编译时
常量（比如 deprecated）或者调用一个常量构造函数。

Dart 中有两个注解是所有代码都可以使用的： @deprecated、@Deprecated 和 @override。
你可以查阅 扩展一个类 获取有关 @override 的使用示例。下面是使用 @deprecated 的示例：
class Television {
  /// Use [turnOn] to turn the power on instead.
  @Deprecated('Use turnOn instead')
  void activate() {
    turnOn();
  }

  /// Turns the TV's power on.
  void turnOn() {...}
  // ···
}
可以自定义元数据注解。下面的示例定义了一个带有两个参数的 @todo 注解：

library todo;

class Todo {
  final String who;
  final String what;

  const Todo(this.who, this.what);
}

 */
//注释
//单行注释//
//多行注释/* */
//文档注释  文档注释以 /// 或者 /** 开始

