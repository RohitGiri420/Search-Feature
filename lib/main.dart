import 'package:best_property/second_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(SecondPage());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _counter = 0.obs;

  void _incrementCounter() {
    _counter++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Obx(()=>Text(_counter.string)),

            ElevatedButton(onPressed: () {
              Get.snackbar("title", "message");
            }, child: Text('Snacbar')),
            
            ElevatedButton(onPressed: () {
              Get.defaultDialog(title: "dialog box");
            }, child: Text("alert box")),

            ElevatedButton(onPressed: () {
              Get.bottomSheet(Container(width: 400,height: 400,));
            }, child: Text("Bottom sheet")),

            ElevatedButton(onPressed: () {
              Get.to(SecondPage());
            }, child: Text("Second page")),
            ElevatedButton(onPressed: () {
              Get.changeTheme(ThemeData.dark());
            }, child: Text("Dark Mode")),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
