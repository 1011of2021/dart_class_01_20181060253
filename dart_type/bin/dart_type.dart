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
void main() {
  var s = 'string interprolation';
  /*
    在字符串中,以 ${表达式} 的形式使用表达式,
    如果表达式是一个标识符，可以省略掉 {}
  */
  print('Dart has $s,which is very handy.');
}
