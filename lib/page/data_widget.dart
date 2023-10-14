import 'package:flutter/material.dart';
import 'package:flutter_bloc_part1/bloc/counter.dart';
import 'package:flutter_bloc_part1/page/center_widget.dart';

class DataWidget extends StatelessWidget {
  const DataWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 200,
      color: Colors.red,
      child: CenterWidget(),
    );
  }
}
