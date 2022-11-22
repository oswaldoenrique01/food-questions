import 'package:flutter/material.dart';
import 'package:foodquestions/data/questions_data.dart';

class ImageItem extends StatelessWidget {
  final int index;
  const ImageItem({Key? key,this.index=0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: questionsData[index].image.isNotEmpty
              ? null
              : Colors.red,
          image: questionsData[index].image.isEmpty
              ? null
              : DecorationImage(
              image: AssetImage(
                  questionsData[index].image),
              fit: BoxFit.cover)),
    );
  }
}
