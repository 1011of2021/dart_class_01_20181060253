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