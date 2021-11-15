//dart:math - 数学和随机数
/*dart:math 库（API reference）提供通用的功能，例如，正弦和余弦，最大值和最小值，
以及数学常数，例如 pi 和 e。大多数在 Math 库中的功能是作为顶级函数实现的。
通过导入 dart:math 来引入使用该库。*/

import 'dart:math';

void main() {
//三角函数
//Math 库提供基本的三角函数,这些函数参数单位是弧度，不是角度！：
// Cosine
assert(cos(pi) == -1.0);
// Sine
var degrees = 30;
var radians = degrees * (pi / 180);
// radians is now 0.52359.
var sinOf30degrees = sin(radians);
// sin 30° = 0.5
assert((sinOf30degrees - 0.5).abs() < 0.01);

//最大值和最小值
assert(max(1, 1000) == 1000);
assert(min(1, -1000) == -1000);

//数学常数
//在 Math 库中可以找到你需要的数学常数，例如，pi， e 等等：
print(e); // 2.718281828459045
print(pi); // 3.141592653589793
print(sqrt2); // 1.4142135623730951

//随机数

//使用 Random 类产生随机数。可以为 Random 构造函数提供一个可选的种子参数。
var random = Random();
random.nextDouble(); // Between 0.0 and 1.0: [0, 1)
random.nextInt(10); // Between 0 and 9.

//也可以产生随机布尔值序列：
random.nextBool(); // true or false

}
