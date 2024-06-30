import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class TaskTile extends StatelessWidget {
  final Function(BuildContext)? editTapped;
  final Function(BuildContext)? deleteTapped;
  final Function(bool?)? onChanged;
  final String title;
  final String subtitle;
  final bool value;
  const TaskTile(
      {super.key,
      required this.onChanged,
      required this.value,
      required this.title,
      required this.subtitle,
      required this.editTapped,
      required this.deleteTapped});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          //setting
          SlidableAction(
            onPressed: editTapped,
            icon: Icons.edit,
            backgroundColor: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          //delete option
          SlidableAction(
            
            onPressed: deleteTapped,
            icon: Icons.delete,
            backgroundColor: Colors.red.shade400,
            borderRadius: BorderRadius.circular(10),
          )
        ]),

        //Tile container
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20)),
          child: ListTile(
            leading: const Icon(
              Icons.change_circle,
              size: 50,
            ),
            title: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Text(title),
            ),
            trailing: Checkbox(
              value: value,
              onChanged: onChanged,
            ),
          ),
        ),
      ),
    );
  }
}
