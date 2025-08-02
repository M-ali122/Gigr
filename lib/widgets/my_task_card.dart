import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/my_task_model.dart';
import '../resources/color.dart';
import '../resources/images.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;

   TaskCard({required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromRGBO(245, 245, 245, 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                border: Border.all(color: appPrimaryColor),
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(image: AssetImage(resume),fit: BoxFit.cover)
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(task.title!, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp)),
                  const SizedBox(height: 4),
                  Text(task.subtitle!, style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400, fontSize: 13.sp)),
                  const SizedBox(height: 4),
                  Text(task.price!, style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400, fontSize: 13.sp)),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(task.trailingInfo!, style:TextStyle(fontWeight: FontWeight.bold,color: Color(0xff0000ff),)),
                if (task.tag!.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: appSeColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(task.tag!, style: TextStyle(fontSize: 12, color: appPrimaryColor)),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}