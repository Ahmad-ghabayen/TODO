import 'package:flutter/material.dart';
import 'package:todo1/ui/theme.dart';

class MyButton extends StatelessWidget {
  const MyButton({Key? key, required this.lable, required this.onTab})
      : super(key: key);

  final String lable;
  final Function() onTab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        width: 100,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: primaryClr
        ),
        child: Text(
          lable,
          style: const TextStyle(color: white,),
          textAlign: TextAlign.center,

        ),
      ),
    );
  }
}
