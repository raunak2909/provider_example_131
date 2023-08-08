import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example_131/providers/counter_provider.dart';
import 'package:provider_example_131/providers/list_data_provider.dart';
import 'package:provider_example_131/second_page.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=>CounterProvider()),
      ChangeNotifierProvider(create: (context)=>ListDataProvider()),
      ///
      ///
      ///
      ///
      ///
    ], child: const MyApp(),)
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
  var nameController = TextEditingController();
  var classController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("Home Page built");
   return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Provider'),
      ),
      body: Consumer<ListDataProvider>(
        builder: (_, provider, __){
          List<Map<String,dynamic>> data = provider.getMyListData();
          return ListView.builder(
            itemCount: data.length,
              itemBuilder: (ctx, index){
            return InkWell(
              onTap: (){
                nameController.text = data[index]['Name'];
                classController.text = data[index]['Class'];

                showModalBottomSheet(context: context, builder: (_){
                  return Container(
                    height: 250,
                    child: Column(
                      children: [
                        Text('Update Data'),
                        SizedBox(
                          height: 21,
                        ),
                        TextField(
                          controller: nameController,
                        ),
                        SizedBox(
                          height: 11,
                        ),
                        TextField(
                          controller: classController,
                        ),
                        ElevatedButton(onPressed: (){
                          var dataToBeUpdated = {
                            "Name": nameController.text.toString(),
                            "Class": classController.text.toString()
                          };
                          context.read<ListDataProvider>().updateData(dataToBeUpdated, index);
                        }, child: Text('Update'))
                      ],
                    ),
                  );
                });
              },
              child: ListTile(
                title: Text('${data[index]['Name']}'),
                subtitle: Text('Class: ${data[index]['Class']}'),
                trailing: InkWell(
                  onTap: (){
                    context.read<ListDataProvider>().removeData(index);
                  },
                    child: Icon(Icons.delete, color: Colors.red,)),
              ),
            );
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Map<String, dynamic> newData = {
            "Name": "Raman",
            "Class": "X"
          };
          context.read<ListDataProvider>().addData(newData);
        },
        child: Icon(Icons.add),
      )
    );
  }
}
