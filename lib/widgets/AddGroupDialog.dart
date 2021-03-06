import 'package:flutter/material.dart';
import 'package:recase/recase.dart';
import '../Store.dart';

class AddGroupDialog extends StatefulWidget {
  AddGroupDialog({ Key key/*, this.flowType*/ }) : super(key: key);
  // FlowType flowType;

  @override
  _AddGroupDialogState createState() => _AddGroupDialogState();
}

class _AddGroupDialogState extends State<AddGroupDialog> {
  final controller = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    this.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AlertDialog(
          title: Text('Add a Group'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Group Title',
            ),
          ),
          actions: [
            FlatButton(
              child: Text('Cancel'),
              onPressed:  () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Add'),
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  Navigator.of(context).pop();

                  if (S().sharedFlow != null) {
                    if (!S().sharedFlow.containsKey(controller.text.pascalCase)) {
                      S().addGroup(controller.text.pascalCase);
                    }
                  } else {
                    S().addGroup(controller.text.pascalCase);
                  }
                }
              },
            ),
          ],
        ),
        if (S().sharedFlow != null)
        if (S().sharedFlow.containsKey(controller.text.pascalCase))
        Container(
          margin: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.red[200]
          ),
          padding: EdgeInsets.all(20),
          child: Text("A group with this name is already present the in the behavior chart. If there is already too many actions present this group's timeline, please consider grouping groups.",
            style: TextStyle(color: Colors.white),
          )
        )
      ],
    );
  }
}