//dart:html - 基于浏览器应用
import 'dart:html';
/*
要操作一个元素，你首先需要一个表示它的对象。您可以使用 query.find 一个或多个元素
来获得这个对象，使用顶级函数 queryselector ()和 queryselectorall ()。
通过 id、 class、 tag、 name 或这些的任何组合进行查询。Css 选择器规范指南定义
了选择器的格式，比如使用 # 前缀指定 id 和句点(.)函数返回与选择器匹配的第一个元素，
而 queryselectorall ()返回与选择器匹配的元素的集合。
这个 < a > > 标记指定了一个具有 href 属性的元素和一个包含字符串
“ link text”的文本节点(可通过 text 属性访问)。要更改链接所指向的 url，
可以使用 anchorement 的 href 属性:
const osList = ['macos', 'windows', 'linux'];
final userOs = determineUserOs();

// For each possible OS...
for (final os in osList) {
  // Matches user OS?
  bool shouldShow = (os == userOs);

  // Find all elements with class=os. For example, if
  // os == 'windows', call querySelectorAll('.windows')
  // to find all elements with the class "windows".
  // Note that '.$os' uses string interpolation.
  for (final elem in querySelectorAll('.$os')) {
    elem.hidden = !shouldShow; // Show or hide.
  }
}
*/


/*
可以通过创建新元素并将它们附加到 dom 中来添加到现有的 html 页面。
也可以通过解析 html 文本来创建一个元素。
var elem = ParagraphElement();
elem.text = 'Creating is easy!';
var elem2 = Element.html(
  '<p>Creating <em>is</em> easy!</p>',
);
*/
/*
To add a node as the last child of its parent, use the List add() method:

querySelector('#inputs')!.nodes.add(elem);
To replace a node, use the Node replaceWith() method:

querySelector('#status')!.replaceWith(elem);
To remove a node, use the Node remove() method:

// Find a node by ID, and remove it from the DOM if it is found.
querySelector('#expendable')?.remove();
*/
/*
要响应外部事件(如单击、焦点更改和选择) ，请添加一个事件侦听器。您可以向页面上
的任何元素添加事件侦听器。
// Find a button by ID and add an event handler.
querySelector('#submitInfo')!.onClick.listen((e) {
  // When the button is clicked, it runs this code.
  submitData();
});
*/
/*
Getting data from the server
Future<void> main() async {
  String pageHtml = await HttpRequest.getString(url);
  // Do something with pageHtml...
}
Sending data to the server
String encodeMap(Map<String, String> data) => data.entries
    .map((e) =>
        '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
    .join('&');

Future<void> main() async {
  const data = {'dart': 'fun', 'angular': 'productive'};

  var request = HttpRequest();
  request
    ..open('POST', url)
    ..setRequestHeader(
      'Content-type',
      'application/x-www-form-urlencoded',
    )
    ..send(encodeMap(data));

  await request.onLoadEnd.first;

  if (request.status == 200) {
    // Successful URL access...
  }
  // ···
}
Handling WebSocket events
void initWebSocket([int retrySeconds = 1]) {
  var reconnectScheduled = false;

  print('Connecting to websocket');

  void scheduleReconnect() {
    if (!reconnectScheduled) {
      Timer(Duration(seconds: retrySeconds),
          () => initWebSocket(retrySeconds * 2));
    }
    reconnectScheduled = true;
  }

  ws.onOpen.listen((e) {
    print('Connected');
    ws.send('Hello from Dart!');
  });

  ws.onClose.listen((e) {
    print('Websocket closed, retrying in $retrySeconds seconds');
    scheduleReconnect();
  });

  ws.onError.listen((e) {
    print('Error connecting to ws');
    scheduleReconnect();
  });

  ws.onMessage.listen((MessageEvent e) {
    print('Received message: ${e.data}');
  });
}
*/
