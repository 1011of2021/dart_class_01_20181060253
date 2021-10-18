//number--int,double

void main() {
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
