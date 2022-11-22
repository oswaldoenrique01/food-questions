import 'package:flutter/material.dart';
import 'package:foodquestions/data/questions_data.dart';

class ButtonAnswer extends StatelessWidget {
  final GestureTapCallback? onTap;
  final int index;
  final String? answer;
  final String? answerSelect;
  final Color? borderColor;
  final Color? buttonColor;

  const ButtonAnswer(
      {Key? key,
      this.onTap,
      this.index = 0,
      this.answer,
      this.answerSelect,
      this.borderColor,
      this.buttonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        height: 49,
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: buttonColor,
            border: Border.all(color: borderColor!, width: 1),
            borderRadius: BorderRadius.circular(12)),
        child: SizedBox(
          width: double.maxFinite,
          height: 55,
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Text(
                answer!,
                style:  const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              Positioned(
                left: 16,
                child: Text(
                  answerSelect!,
                  style:  const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
