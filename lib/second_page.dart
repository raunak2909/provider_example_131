import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_provider.dart';

class SecondPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    print("Second Page built");
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
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
                '${Provider.of<CounterProvider>(context).getCountValue()}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              onPressed: (){
                //set
                Provider.of<CounterProvider>(context, listen: false).decrementCount();
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