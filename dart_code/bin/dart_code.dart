void main() {
//art:core - 数字，集合，字符串等
//内置类型，集合和其他核心功能。该库会被自动导入到所有的 Dart 程序。
//控制台打印
  int m = 0;
  print('$m');
//数字
/*
dart:core 库定义了 num ，int 以及 double 类，这些类拥有一定的工具方法来处理数字。
使用 int 和 double 的 parse() 方法将字符串转换为整型或双浮点型对象：
*/
assert(int.parse('42') == 42);
assert(int.parse('0x42') == 66);
assert(double.parse('0.50') == 0.5);
//或者使用 num 的 parse() 方法，该方法可能会创建一个整型，否则为浮点型对象：

assert(num.parse('42') is int);
assert(num.parse('0x42') is int);
assert(num.parse('0.50') is double);
//通过添加 radix 参数，指定整数的进制基数：
assert(int.parse('42', radix: 16) == 66);

//字符和正则表达式
/*
使用正则表达式 (RegExp 对象) 可以在字符串内搜索和替换部分字符串。
String 定义了例如 split()， contains()， startsWith()， endsWith() 等方法。
*/
//在字符串中搜索
//可以在字符串内查找特定字符串的位置，以及检查字符串是否以特定字符串作为开头或结尾。
assert('Never odd or even'.contains('odd'));
assert('Never odd or even'.startsWith('Never'));
assert('Never odd or even'.endsWith('even'));
assert('Never odd or even'.indexOf('odd') == 6);
//从字符串中提取数据

//可以获取字符串中的子字符串或者将一个字符串分割为子字符串列表：
assert('Never odd or even'.substring(6, 9) == 'odd');

var parts = 'structured web apps'.split(' ');
assert(parts.length == 3);
assert(parts[0] == 'structured');
assert('Never odd or even'[0] == 'N');
for (final char in 'hello'.split('')) {
  print(char);
}
var codeUnitList =
    'Never odd or even'.codeUnits.toList();
assert(codeUnitList[0] == 78);

//首字母大小写转换,可以轻松的对字符串的首字母大小写进行转换：
assert('structured web apps'.toUpperCase() ==
    'STRUCTURED WEB APPS');
assert('STRUCTURED WEB APPS'.toLowerCase() ==
    'structured web apps');
    
//Trimming 和空字符串
//使用 trim() 移除首尾空格。使用 isEmpty 检查一个字符串是否为空（长度为 0）。
assert('  hello  '.trim() == 'hello');
assert(''.isEmpty);
assert('  '.isNotEmpty);

//替换部分字符串
var greetingTemplate = 'Hello, NAME!';
var greeting =
    greetingTemplate.replaceAll(RegExp('NAME'), 'Bob');

// greetingTemplate didn't change.
assert(greeting != greetingTemplate);

//构建一个字符串
/*
要以代码方式生成字符串，可以使用 StringBuffer 。在调用 toString() 之前， 
StringBuffer 不会生成新字符串对象。 */
//writeAll() 的第二个参数为可选参数，用来指定分隔符，本例中使用空格作为分隔符。
var sb = StringBuffer();
sb
  ..write('Use a StringBuffer for ')
  ..writeAll(['efficient', 'string', 'creation'], ' ')
  ..write('.');

var fullString = sb.toString();

assert(fullString ==
    'Use a StringBuffer for efficient string creation.');

//正则表达式
/*
RegExp 类提供与 JavaScript 正则表达式相同的功能。使用正则表达式可以对字符串进行
高效搜索和模式匹配。*/

// Here's a regular expression for one or more digits.
var numbers = RegExp(r'\d+');
var allCharacters = 'llamas live fifteen to twenty years';
var someDigits = 'llamas live 15 to 20 years';
// contains() can use a regular expression.
assert(!allCharacters.contains(numbers));
assert(someDigits.contains(numbers));
// Replace every match with another string.
var exedOut = someDigits.replaceAll(numbers, 'XX');
assert(exedOut == 'llamas live XX to XX years');
//集合
//Dart 附带了核心集合 API ，其中包括 list、set 和 map 类。

//Lists
var grains = <String>[];
assert(grains.isEmpty);
var fruits = ['apples', 'oranges'];
fruits.add('kiwis');
fruits.addAll(['grapes', 'bananas']);
assert(fruits.length == 5);

var appleIndex = fruits.indexOf('apples');
fruits.removeAt(appleIndex);
assert(fruits.length == 4);

fruits.clear();
assert(fruits.isEmpty);

// You can also create a List using one of the constructors.
var vegetables = List.filled(99, 'broccoli');
assert(vegetables.every((v) => v == 'broccoli'));
//使用 indexOf() 方法查找一个对象在 list 中的下标值
// Access a list item by index.
assert(fruits[0] == 'apples');
// Find an item in a list.
assert(fruits.indexOf('apples') == 0);
//Sets
/*在 Dart 中，set 是一个无序的，元素唯一的集合。因为一个 set 是无序的，所以无法
通过下标（位置）获取 set 中的元素。*/

// Create an empty set of strings.
var ingredients = <String>{};

// Add new items to it.
ingredients.addAll(['gold', 'titanium', 'xenon']);
assert(ingredients.length == 3);

// Adding a duplicate item has no effect.
ingredients.add('gold');
assert(ingredients.length == 3);

// Remove an item from a set.
ingredients.remove('gold');
assert(ingredients.length == 2);

// You can also create sets using
// one of the constructors.
var atomicNumbers = Set.from([79, 22, 54]);
 //使用 contains() 和 containsAll() 来检查一个或多个元素是否在 set 中：

ingredients.addAll(['gold', 'titanium', 'xenon']);

// Check whether an item is in the set.
assert(ingredients.contains('titanium'));

// Check whether all the items are in the set.
assert(ingredients.containsAll(['titanium', 'xenon']));
/*
//Maps
/*map 是一个无序的 key-value （键值对）集合，就是大家熟知的 dictionary
 或者 hash。 map 将 kay 与 value 关联，以便于检索。和 JavaScript 不同，Dart 对
 象不是 map。
 声明 map 可以使用简洁的字面量语法，也可以使用传统构造函数：*/

// Maps often use strings as keys.
var hawaiianBeaches = {
  'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
  'Big Island': ['Wailea Bay', 'Pololu Beach'],
  'Kauai': ['Hanalei', 'Poipu']
};

// Maps can be built from a constructor.
var searchTerms = Map();

// Maps are parameterized types; you can specify what
// types the key and value should be.
var nobleGases = Map<int, String>();
 //通过大括号语法可以为 map 添加，获取，设置元素。使用 remove() 方法从 map 中移除键值对。

var nobleGases = {54: 'xenon'};

// Retrieve a value with a key.
assert(nobleGases[54] == 'xenon');

// Check whether a map contains a key.
assert(nobleGases.containsKey(54));

// Remove a key and its value.
nobleGases.remove(54);
assert(!nobleGases.containsKey(54));
///可以从一个 map 中检索出所有的 key 或所有的 value：

var hawaiianBeaches = {
  'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
  'Big Island': ['Wailea Bay', 'Pololu Beach'],
  'Kauai': ['Hanalei', 'Poipu']
};

// Get all the keys as an unordered collection
// (an Iterable).
var keys = hawaiianBeaches.keys;

assert(keys.length == 3);
assert(Set.from(keys).contains('Oahu'));

// Get all the values as an unordered collection
// (an Iterable of Lists).
var values = hawaiianBeaches.values;
assert(values.length == 3);
assert(values.any((v) => v.contains('Waikiki')));
使用 containsKey() 方法检查一个 map 中是否包含某个key 。因为 map 中的 value 可能
会是 null ，所有通过 key 获取 value，并通过判断 value 是否为 null 来判断 key 是
否存在是不可靠的。

var hawaiianBeaches = {
  'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
  'Big Island': ['Wailea Bay', 'Pololu Beach'],
  'Kauai': ['Hanalei', 'Poipu']
};

assert(hawaiianBeaches.containsKey('Oahu'));
assert(!hawaiianBeaches.containsKey('Florida'));
如果当且仅当该 key 不存在于 map 中，且要为这个 key 赋值，可使用 putIfAbsent() 方法。
该方法需要一个方法返回这个 value。

var teamAssignments = <String, String>{};
teamAssignments.putIfAbsent(
    'Catcher', () => pickToughestKid());
assert(teamAssignments['Catcher'] != null);
 //公共集合方法
List, Set, 和 Map 共享许多集合中的常用功能。其中一些常见功能由 Iterable 类定义，
这些函数由 List 和 Set 实现。
使用 isEmpty 和 isNotEmpty 方法可以检查 list， set 或 map 对象中是否包含元素：

var coffees = <String>[];
var teas = ['green', 'black', 'chamomile', 'earl grey'];
assert(coffees.isEmpty);
assert(teas.isNotEmpty);
使用 forEach() 可以让 list， set 或 map 对象中的每个元素都使用一个方法。

var teas = ['green', 'black', 'chamomile', 'earl grey'];

teas.forEach((tea) => print('I drink $tea'));
当在 map 对象上调用 `forEach() 方法时，函数必须带两个参数（key 和 value）：

hawaiianBeaches.forEach((k, v) {
  print('I want to visit $k and swim at $v');
  // I want to visit Oahu and swim at
  // [Waikiki, Kailua, Waimanalo], etc.
});
 */
//URIs
/*
在使用 URI（可能你会称它为 URLs）时，Uri 类 提供对字符串的编解码操作。这些函数用来
处理 URI 特有的字符，例如 ＆ 和 = 。 Uri 类还可以解析和处理 URI—host，port，scheme
等组件。
//编码和解码完整合法的URI
使用 encodeFull() 和 decodeFull() 方法，对 URI 中除了特殊字符（例如 /， :， &， #）
以外的字符进行编解码，这些方法非常适合编解码完整合法的 URI，并保留 URI 中的特殊字符。

var uri = 'https://example.org/api?foo=some message';

var encoded = Uri.encodeFull(uri);
assert(encoded ==
    'https://example.org/api?foo=some%20message');

var decoded = Uri.decodeFull(encoded);
assert(uri == decoded);
//编码和解码 URI 组件
使用 encodeComponent() 和 decodeComponent() 方法，对 URI 中具有特殊含义的所有字符
串字符，特殊字符包括（但不限于）/， &，和 :。

var uri = 'https://example.org/api?foo=some message';

var encoded = Uri.encodeComponent(uri);
assert(encoded ==
    'https%3A%2F%2Fexample.org%2Fapi%3Ffoo%3Dsome%20message');

var decoded = Uri.decodeComponent(encoded);
assert(uri == decoded);
//解析 URI
使用 Uri 对象的字段（例如 path），来获取一个 Uri 对象或者 URI 字符串的一部分。
使用 parse() 静态方法，可以使用字符串创建 Uri 对象。

var uri =
    Uri.parse('https://example.org:8080/foo/bar#frag');

assert(uri.scheme == 'https');
assert(uri.host == 'example.org');
assert(uri.path == '/foo/bar');
assert(uri.fragment == 'frag');
assert(uri.origin == 'https://example.org:8080');
 //构建 URI
 使用 Uri() 构造函数，可以将各组件部分构建成 URI 。

var uri = Uri(
    scheme: 'https',
    host: 'example.org',
    path: '/foo/bar',
    fragment: 'frag');
assert(
    uri.toString() == 'https://example.org/foo/bar#frag');
  
 */
//日期和时间
/*
DateTime 对象代表某个时刻，时区可以是 UTC 或者本地时区。

DateTime 对象可以通过若干构造函数创建：

// Get the current date and time.
var now = DateTime.now();

// Create a new DateTime with the local time zone.
var y2k = DateTime(2000); // January 1, 2000

// Specify the month and day.
y2k = DateTime(2000, 1, 2); // January 2, 2000

// Specify the date as a UTC time.
y2k = DateTime.utc(2000); // 1/1/2000, UTC

// Specify a date and time in ms since the Unix epoch.
y2k = DateTime.fromMillisecondsSinceEpoch(946684800000,
    isUtc: true);

// Parse an ISO 8601 date.
y2k = DateTime.parse('2000-01-01T00:00:00Z');
日期中 millisecondsSinceEpoch 属性返回自 “Unix 纪元（January 1, 1970, UTC）”以来
的毫秒数：

// 1/1/2000, UTC
var y2k = DateTime.utc(2000);
assert(y2k.millisecondsSinceEpoch == 946684800000);

// 1/1/1970, UTC
var unixEpoch = DateTime.utc(1970);
assert(unixEpoch.millisecondsSinceEpoch == 0);
 */
//工具类
/*核心库包含各种工具类，可用于排序，映射值以及迭代。

//比较对象
如果实现了 Comparable 接口，也就是说可以将该对象与另一个对象进行比较，通常用于排序。
 compareTo() 方法在 小于 时返回 < 0，在 相等 时返回 0，在 大于 时返回 > 0。

class Line implements Comparable<Line> {
  final int length;
  const Line(this.length);

  @override
  int compareTo(Line other) => length - other.length;
}

void main() {
  var short = const Line(1);
  var long = const Line(100);
  assert(short.compareTo(long) < 0);
}
//Implementing map keys
在 Dart 中每个对象会默认提供一个整数的哈希值，因此在 map 中可以作为 key 来使用，
重写 hashCode 的 getter 方法来生成自定义哈希值。如果重写 hashCode 的 getter 方法，
那么可能还需要重写 == 运算符。相等的（通过 == ）对象必须拥有相同的哈希值。
哈希值并不要求是唯一的，但是应该具有良好的分布形态。

class Person {
  final String firstName, lastName;

  Person(this.firstName, this.lastName);

  // Override hashCode using strategy from Effective Java,
  // Chapter 11.
  @override
  int get hashCode {
    int result = 17;
    result = 37 * result + firstName.hashCode;
    result = 37 * result + lastName.hashCode;
    return result;
  }

  // You should generally implement operator == if you
  // override hashCode.
  @override
  bool operator ==(dynamic other) {
    return other is Person &&
        other.firstName == firstName &&
        other.lastName == lastName;
  }
}

void main() {
  var p1 = Person('Bob', 'Smith');
  var p2 = Person('Bob', 'Smith');
  var p3 = 'not a person';
  assert(p1.hashCode == p2.hashCode);
  assert(p1 == p2);
  assert(p1 != p3);
}
//迭代
Iterable 和 Iterator 类支持 for-in 循环。当创建一个类的时候，继承或者实现 Iterable，
可以为该类提供用于 for-in 循环的 Iterators。实现 Iterator 来定义实际的遍历操作。

如果你在 for-in 循环里要创建一个可以提供 Iterator 的类，如果可以，请选择 extend 
或者 implement Iterable 的方式。 Implement Iterator 来定义一个实际的迭代能力。

class Process {
  // Represents a process...
}

class ProcessIterator implements Iterator<Process> {
  @override
  Process get current => ...
  @override
  bool moveNext() => ...
}

// A mythical class that lets you iterate through all
// processes. Extends a subclass of [Iterable].
class Processes extends IterableBase<Process> {
  @override
  final Iterator<Process> iterator = ProcessIterator();
}

void main() {
  // Iterable objects can be used with for-in.
  for (final process in Processes()) {
    // Do something with the process.
  }
}
*/
//异常
/*
Dart 核心库定义了很多公共的异常和错误类。异常通常是一些可以预见和预知的情况。
错误是无法预见或者预防的情况。

两个最常见的错误：

NoSuchMethodError
当方法的接受对象（可能为null）没有实现该方法时抛出。

ArgumentError
当方法在接受到一个不合法参数时抛出。

通常通过抛出一个应用特定的异常，来表示应用发生了错误。
通过实现 Exception 接口来自定义异常：

class FooException implements Exception {
  final String? msg;

  const FooException([this.msg]);

  @override
  String toString() => msg ?? 'FooException';
}
*/
}
