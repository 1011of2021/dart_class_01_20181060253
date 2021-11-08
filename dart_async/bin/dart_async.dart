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
//链式异步编程
then() 方法返回一个 Future 对象，这样就提供了一个非常好的方式让多个异步方法按顺序
依次执行。如果用 then() 注册的回调返回一个 Future ，那么 then() 返回一个等价的 
Future 。如果回调返回任何其他类型的值，那么 then() 会创建一个以该值完成的新 Future 。

Future result = costlyQuery(url);
result
    .then((value) => expensiveWork(value))
    .then((_) => lengthyComputation())
    .then((_) => print('Done!'))
    .catchError((exception) {
  /* Handle exception... */
});
在上面的示例中，方法按下面顺序执行：

costlyQuery()
expensiveWork()
lengthyComputation()
//等待多个 Future
有时代码逻辑需要调用多个异步函数，并等待它们全部完成后再继续执行。使用 Future.wait()
 静态方法管理多个 Future 以及等待它们完成：

Future<void> deleteLotsOfFiles() async =>  ...
Future<void> copyLotsOfFiles() async =>  ...
Future<void> checksumLotsOfOtherFiles() async =>  ...

await Future.wait([
  deleteLotsOfFiles(),
  copyLotsOfFiles(),
  checksumLotsOfOtherFiles(),
]);
print('Done with all the long steps!');
//Stream
/*在 Dart API 中 Stream 对象随处可见，Stream 用来表示一系列数据。例如，HTML 中的
按钮点击就是通过 stream 传递的。同样也可以将文件作为数据流来读取。*/
//异步循环
有时，可以使用异步 for 循环 await for ，来替代 Stream API 。
下面示例函数使用 Stream 的 listen() 方法来订阅文件列表，传入一个搜索文件或目录的函数
void main(List<String> arguments) {
  // ...
  FileSystemEntity.isDirectory(searchPath).then((isDir) {
    if (isDir) {
      final startingDir = Directory(searchPath);
      startingDir.list().listen((entity) {
        if (entity is File) {
          searchFile(entity, searchTerms);
        }
      });
    } else {
      searchFile(File(searchPath), searchTerms);
    }
  });
}
//监听流数据（stream data）
使用 await for 或者使用 listen() 方法监听 stream，来获取每个到达的数据流值：

// Add an event handler to a button.
submitButton.onClick.listen((e) {
  // When the button is clicked, it runs this code.
  submitData();
});
//传递流数据（stream data）
在使用流数据前需要改变数据的格式。使用 transform()方法生成具有不同类型数据的流：
var lines = inputStream
    .transform(utf8.decoder)
    .transform(const LineSplitter());
上面例子中使用了两个 transformer 。第一个使用 utf8.decoder 将整型流转换为字符串流。
接着，使用了 LineSplitter 将字符串流转换为多行字符串流。
//处理错误和完成
处理错误和完成代码方式，取决于使用的是异步 for 循环（await for）还是 Stream API 。

如果使用的是异步 for 循环，那么通过 try-catch 来处理错误。代码位于异步 for 循环之后，
会在 stream 被关闭后执行。

Future<void> readFileAwaitFor() async {
  var config = File('config.txt');
  Stream<List<int>> inputStream = config.openRead();

  var lines = inputStream
      .transform(utf8.decoder)
      .transform(const LineSplitter());
  try {
    await for (final line in lines) {
      print('Got ${line.length} characters from stream');
    }
    print('file is now closed');
  } catch (e) {
    print(e);
  }
}
如果使用的是 Stream API，那么通过注册 onError 监听来处理错误。
代码位于注册的 onDone 中，会在 stream 被关闭后执行。

var config = File('config.txt');
Stream<List<int>> inputStream = config.openRead();

inputStream
    .transform(utf8.decoder)
    .transform(const LineSplitter())
    .listen((String line) {
  print('Got ${line.length} characters from stream');
}, onDone: () {
  print('file is now closed');
}, onError: (e) {
  print(e);
});
 */