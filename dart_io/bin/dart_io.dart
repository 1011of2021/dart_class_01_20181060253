//dart:io - 服务器和命令行应用程序的 I/O 
import 'dart:io';
//Reading a file as text
/*
使用 readasstring ()读取整个文件内容。当每行都很重要时，可以使用 readaslines ()。
*/
  /*
  Future<void> main() async {
  var config = File('config.txt');

  // Put the whole file in a single string.
  var stringContents = await config.readAsString();
  print(
      'The file is ${stringContents.length} characters long.');

  // Put each line of the file into its own string.
  var lines = await config.readAsLines();
  print('The file is ${lines.length} lines long.');
}
*/
//Reading a file as binary readAsBytes()
/*
Future<void> main() async {
  var config = File('config.txt');

  var contents = await config.readAsBytes();
  print('The file is ${contents.length} bytes long.');
}
*/
//Handling errors
/*为了捕获错误，这样它们就不会导致未捕获的异常，您可以在将来注册一个 
catcherror 处理程序，或者(在一个异步函数中)使用 try-catch:
*/
/*
Future<void> main() async {
  var config = File('config.txt');
  try {
    var contents = await config.readAsString();
    print(contents);
  } catch (e) {
    print(e);
  }
}
*/
//Streaming file contents
/*使用流来读取文件，一次读一点。您可以使用流 api 或者 await for，
部分 dart 的异步支持。*/
/*
import 'dart:io';
import 'dart:convert';

Future<void> main() async {
  var config = File('config.txt');
  Stream<List<int>> inputStream = config.openRead();

  var lines = utf8.decoder
      .bind(inputStream)
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
*/
//Writing file contents
/*
可以用输入法把数据写到文件里。使用 openwrite ()方法获取一个可以写入的损失信息。
默认模式 filemode.write 完全覆盖文件中现有的数据。
*/
/*
var logFile = File('log.txt');
var sink = logFile.openWrite();
sink.write('FILE ACCESSED ${DateTime.now()}\n');
await sink.flush();
await sink.close();
*/
//Listing files in a directory
/*
Future<void> main() async {
  var dir = Directory('tmp');

  try {
    var dirList = dir.list();
    await for (final FileSystemEntity f in dirList) {
      if (f is File) {
        print('Found file ${f.path}');
      } else if (f is Directory) {
        print('Found dir ${f.path}');
      }
    }
  } catch (e) {
    print(e.toString());
  }
}
*/