import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example_131/counter_provider.dart';
import 'package:provider_example_131/second_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: ChangeNotifierProvider(
        create: (context) => CounterProvider(),
        child: const MyApp(),
      ),
    )
  );
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
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print("Home Page built");
   return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Provider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              //get (listen)
              '${context.watch<CounterProvider>().getCountValue()}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage(),));
            }, child: Text('Next Page'))
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: (){
              //set
              context.read<CounterProvider>().decrementCount();
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),

          FloatingActionButton(
            onPressed: (){
              //set
              Provider.of<CounterProvider>(context, listen: false).incrementCount();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      )
    );
  }
}
