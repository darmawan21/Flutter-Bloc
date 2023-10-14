import 'package:flutter/material.dart';
import 'package:flutter_bloc_part1/bloc/counter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  Counter mycounter = Counter(init: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocListener<Counter, int>(
            bloc: mycounter,
            listener: (context, state) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Dijalankan")));
            },
            listenWhen: (previous, current) {
              if (current == 15) {
                return true;
              } else {
                return false;
              }
            },
            child: BlocBuilder<Counter, int>(
              bloc: mycounter,
              builder: (context, state) {
                return Text(
                  '$state',
                  style: const TextStyle(
                    fontSize: 50,
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    mycounter.decrement();
                  },
                  icon: const Icon(Icons.remove)),
              IconButton(
                  onPressed: () {
                    mycounter.increment();
                  },
                  icon: const Icon(Icons.add)),
            ],
          )
        ],
      ),
    );
  }
}
