import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class CounterCubit extends Cubit<int> {
  int initialData;

  CounterCubit({this.initialData = 0}) : super(initialData);

  
  void tambahData() {
    emit(state + 1);
  }

  void kurangData() {
    emit(state - 1);
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  CounterCubit myCounter = CounterCubit(initialData: 0);

  @override
  Widget build(BuildContext context) {
    print('Rebuild');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
            stream: myCounter.stream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                          child: Text(
                            "Loading...",
                            style: TextStyle(
                              fontSize: 50,
                            ),
                          ),
                        );
              } else {
                return Center(
                        child: Text(
                          "${snapshot.data}",
                          style: const TextStyle(
                            fontSize: 50,
                          ),
                        ),
                      );
              }
            }
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: (){
                myCounter.kurangData();
              }, icon: const Icon(Icons.remove)),
              IconButton(onPressed: (){
                myCounter.tambahData();
              }, icon: const Icon(Icons.add)),
            ],
          ),
        ],
      ),
    );
  }
}