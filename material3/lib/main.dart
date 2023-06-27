import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'dart:io' show Platform;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final _defaultLightColorScheme =
  ColorScheme.fromSwatch(primarySwatch: Colors.blue);

  static final _defaultDarkColorScheme = ColorScheme.fromSwatch(
      primarySwatch: Colors.blue, brightness: Brightness.dark);


  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightColorScheme,darkColorScheme){
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: lightColorScheme ?? _defaultLightColorScheme,
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: darkColorScheme?? _defaultDarkColorScheme,
            useMaterial3: true,
          ),
          home: const MyHomePage(title: 'Material Dynamic Color App'),
          debugShowCheckedModeBanner: Platform.isAndroid ? true:false,
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    if(Platform.isAndroid || Platform.isIOS){
      return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Column(

            children: [
              const Padding(padding: EdgeInsets.all(5)),
              Column(
                children: [
                  const Padding(padding: EdgeInsets.all(15)),
                  const Text("Primary Color"),
                  const Padding(padding: EdgeInsets.all(3)),
                  Container(
                    color: Theme.of(context).colorScheme.primary,
                    height: 40,
                    width: 40,
                  ),
                  const Padding(padding: EdgeInsets.all(15)),
                  const Text("Secondary Color"),
                  const Padding(padding: EdgeInsets.all(3)),
                  Container(
                    color: Theme.of(context).colorScheme.secondary,
                    height: 40,
                    width: 40,
                  ),
                  const Padding(padding: EdgeInsets.all(15)),
                  const Text("Ternary Color"),
                  const Padding(padding: EdgeInsets.all(3)),
                  Container(
                    color: Theme.of(context).colorScheme.tertiary,
                    height: 40,
                    width: 40,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60,left: 20,right: 20,),
                  child: Text("Try changing your wallpaper or theme and see the magic 🪄 ",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.inversePrimary),textAlign: TextAlign.center,),),
            ],
          )
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(

        children: [
          const Padding(padding: EdgeInsets.all(15)),
          Row(
            children: [
              const Padding(padding: EdgeInsets.all(15)),
              const Text("Primary Color"),
              const Padding(padding: EdgeInsets.all(3)),
              Container(
                color: Theme.of(context).colorScheme.primary,
                height: 40,
                width: 40,
              ),
              const Padding(padding: EdgeInsets.all(15)),
              const Text("Secondary Color"),
              const Padding(padding: EdgeInsets.all(3)),
              Container(
                color: Theme.of(context).colorScheme.secondary,
                height: 40,
                width: 40,
              ),
              const Padding(padding: EdgeInsets.all(15)),
              const Text("Ternary Color"),
              const Padding(padding: EdgeInsets.all(3)),
              Container(
                color: Theme.of(context).colorScheme.tertiary,
                height: 40,
                width: 40,
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.all(50)),
          Text("Try change your appearance accent and theme and see the magic 🪄 ",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.inversePrimary),),
        ],
      )
    );
  }
}
