import 'dart:html';
Iterable<String> thingsTodo() sync* {  
  for (int i = 0; i < 5; i++) {
    print('hello ${i + 1}');
  }
 }
 LIElement newLI(String itemText) => LIElement()..text = itemText;
void main() {
  querySelector('#output')?.children.addAll(thingsTodo().map(newLI));
}
