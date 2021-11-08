//dart:async - 异步编程
/*
异步编程通常使用回调方法来实现，但是 Dart 提供了其他方案：Future 和 Stream 对象。 
Future 类似与 JavaScript 中的 Promise ，代表在将来某个时刻会返回一个结果。 
Stream 类可以用来获取一系列的值，比如，一系列事件。
dart:async 库可以工作在 web 应用及 command-line 应用。通过import dart:async来使用。
import 'dart:async';
//Future
在 Dart 库中随处可见 Future 对象，通常异步函数返回的对象就是一个 Future。当一个 
future 完成执行后，future 中的值就已经可以使用了。
//使用 await
在直接使用 Future API 前，首先应该考虑 await 来替代。
代码中使用 await 表达式会比直接使用 Future API 更容易理解。
代码使用 Future 的 then() 方法在同一行执行了三个异步函数，要等待上一个执行完成，再执行下一个任务。

void runUsingFuture() {
  // ...
  findEntryPoint().then((entryPoint) {
    return runExecutable(entryPoint, args);
  }).then(flushThenExit);
}
通过 await 表达式实现等价的代码，看起来非常像同步代码：

Future<void> runUsingAsyncAwait() async {
  // ...
  var entryPoint = await findEntryPoint();
  var exitCode = await runExecutable(entryPoint, args);
  await flushThenExit(exitCode);
}
async 函数能够捕获来自 Future 的异常。例如：

var entryPoint = await findEntryPoint();
try {
  var exitCode = await runExecutable(entryPoint, args);
  await flushThenExit(exitCode);
} catch (e) {
  // Handle the error...
}
 //基本用法
当 future 执行完成后，then() 中的代码会被执行。 then() 中的代码会在 future 
完成后被执行。例如，HttpRequest.getString() 返回一个 future 对象，因为 HTTP 请求
可能需要一段时间。当Future 完成并且保证字符串值有效后，使用then()来执行你需要的代码：

HttpRequest.getString(url).then((String result) {
  print(result);
});
使用 catchError() 来处理一些 Future 对象可能抛出的错误或者异常。

HttpRequest.getString(url).then((String result) {
  print(result);
}).catchError((e) {
  // Handle or ignore the error.
});
then().catchError() 组合是 try-catch 的异步版本。
 */