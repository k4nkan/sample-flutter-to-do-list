import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
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

class MyHomePage extends  HookConsumerWidget{
  MyHomePage({Key? key}) : super(key: key);
  
  // String title = "hello world";

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  final title = useState<String>('hello world');

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(
              style: const TextStyle(fontSize: 10),
              controller: controller,
            ),
            ElevatedButton(onPressed: (){
              title.value = controller.value.text;
            }, child: Text('aaaa'))
,
             Text(
              title.value,
              // style: const TextStyle(fontSize: 10.0),
            ),
          ],
        ),
      ),
    );
  }
}

