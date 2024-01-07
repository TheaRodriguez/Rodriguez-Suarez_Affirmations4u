import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';


class JournalEntryTile extends StatelessWidget {
  final String taskName;
  Function(BuildContext)? deleteFunction;

  JournalEntryTile({
    super.key,
    required this.taskName,
    required this.deleteFunction
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 20, right: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.check_box,
              backgroundColor: Colors.pinkAccent,
              borderRadius: BorderRadius.circular(25),
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
              color: Colors.teal[100],
              borderRadius: BorderRadius.circular(25)
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  taskName,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.dmSans(
                    fontSize: 20
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
