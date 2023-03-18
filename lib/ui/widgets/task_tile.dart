import 'package:flutter/material.dart';
import 'package:todo1/models/task.dart';
import 'package:todo1/ui/size_config.dart';
import 'package:todo1/ui/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskTile extends StatelessWidget {
  const TaskTile(this.task, {Key? key}) : super(key: key);
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(
              SizeConfig.orientation == Orientation.landscape ? 4 : 20)),

      width: SizeConfig.orientation == Orientation.landscape
          ? SizeConfig.screenWidth / 2
          : SizeConfig.screenWidth,
      margin: EdgeInsets.only(bottom: getProportionateScreenWidth(12)),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: _BGClr(task.color!),
        ),
        child: Row(
          children: [
            Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(task.title!,
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  color: white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold))),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.access_time_rounded,
                            color: Colors.grey[200],
                            size: 18,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text('${task.startTime} - ${task.endTime}',
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                    color: Colors.grey[100],
                                    fontSize: 13,
                                  ))),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(task.note!,
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: Colors.grey[100],
                                fontSize: 15,
                              ))),
                    ],
                  ),
                )),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 60,
              width: 0.5,
              color: Colors.grey[200]!.withOpacity(0.7),
            ),
            RotatedBox(
              quarterTurns: 3,
              child: Text(
                task.isCompleted == 0 ? 'TODO' : 'Completed',
                style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        color: white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ), 
    );
  }

  // ignore: non_constant_identifier_names
  _BGClr(int color) {
    switch (color) {
      case 0:
        return bluishClr;
      case 1:
        return pinkClr;
      case 2:
        return orangeClr;
    }
  }
}
