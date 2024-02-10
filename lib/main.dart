import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _controller = useTextEditingController();
    final _text = useState<String>('');
    final todos = useState<List<String>>([]);
    return Scaffold(
      appBar: AppBar(
        title: Text('こんちくわ'),
      ),
      body: Column(
        children: [
          Text('Hello, world!'),
          TextField(
            controller: _controller,
          ),
          ElevatedButton(
            onPressed: () {
              todos.value = [
                ...todos.value,
                _controller.value.text
              ]; // 状態を更新してUIを再描画
              _controller.clear(); // テキストフィールドをクリア
            },
            child: const Text('追加'),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: todos.value.length,
              itemBuilder: (context, index) {
                // return Text(todos.value[index]);
                return Card(
                  child: ListTile(
                    title: Text(todos.value[index]),
                  ),
                );
              })
        ],
      ),
    );
  }
}

final todoListProvider = StateNotifierProvider<TodoListNotifier, List<String>>(
  (ref) => TodoListNotifier(),
);

class TodoListNotifier extends StateNotifier<List<String>> {
  TodoListNotifier(): super([]);

  void add(String todo) {
    state = [...state, todo];
  }

  void remove(String todo) {
    state = [
      for(final item in state)
      if(item != todo) item,
    ];
  }
}