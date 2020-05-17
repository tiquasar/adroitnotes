import 'package:flutter/material.dart';
import 'package:adroitnotes/models/note.dart';
import 'package:adroitnotes/utils/database_helper.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';

class NoteDetails extends StatefulWidget {
  final String appBarTitle;
  final Note note;

  const NoteDetails(this.note, this.appBarTitle);

  @override
  _NoteDetailsState createState() => _NoteDetailsState(note, appBarTitle);
}

class _NoteDetailsState extends State<NoteDetails> {
  final String appBarTitle;
  final Note note;

  DatabaseHelper databaseHelper = DatabaseHelper();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  static var _priorities = ['High Priority', 'Normal Priority'];

  _NoteDetailsState(this.note, this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    titleController.text = note.title;
    descriptionController.text = note.description;

    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        flexibleSpace: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
                colors: GradientColors.skyLine,
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),
        title: Text(appBarTitle,
          style: TextStyle(fontFamily: 'Montserrat', fontSize: 22,fontWeight: FontWeight.w500,letterSpacing: 1),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            SizedBox(height:10,),
            //First element
            ListTile(
              title: DropdownButton(
                dropdownColor: Colors.grey.shade500,
                items: _priorities.map((String dropDownStringItem) {
                  return DropdownMenuItem(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem,
                        style: TextStyle(fontFamily: 'Montserrat', fontSize: 22,fontWeight: FontWeight.w500,letterSpacing: 1,color:Colors.white),
                    ),
                  );
                }).toList(),
                style: textStyle,
                value: getPriorityAsString(note.priority),
                onChanged: (String value) {
                  setState(() {
                    print(value);
                    updatePriorityAsInt(value);
                  });
                },
              ),
            ),


            new DecoratedBox(

              decoration: new BoxDecoration(
                shape: BoxShape.rectangle,
                color:Colors.white30,


              ),
              child: new TextField(

                maxLines: null,
                keyboardType: TextInputType.multiline,
                controller: titleController,

                style: TextStyle(fontFamily: 'Montserrat', fontSize: 18,fontWeight: FontWeight.w500,letterSpacing: 1,color: Colors.white),
                onChanged: (value) {
                  print('Title Text Field Edited');
                  updateTitle();
                },

                decoration: InputDecoration(

                    labelText: 'Title',
                    labelStyle:  TextStyle(fontFamily: 'Montserrat', fontSize: 18,fontWeight: FontWeight.w500,letterSpacing: 1,color: Colors.white),
                    border:
                    OutlineInputBorder(

                        borderRadius: BorderRadius.circular(5.0))),
              ),

            ),
            new Container(

              decoration: new BoxDecoration(
                color:Colors.white24,



              ),

              child: TextField(
                controller: descriptionController,
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                style: TextStyle(fontFamily: 'Montserrat', fontSize: 18,fontWeight: FontWeight.w500,letterSpacing: 1,color: Colors.white),
                onChanged: (value) {
                  updateDescription();
                  print('Description Text Field Edited');
                },
                decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle: TextStyle(fontFamily: 'Montserrat', fontSize: 18,fontWeight: FontWeight.w500,letterSpacing: 1,color: Colors.white),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),

            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      color: Colors.blue.shade800,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        'Save',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        setState(() {
                          print('Saved button clicked');
                          _save();
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                      ),
                      color:Colors.blue.shade800,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        'Delete',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        setState(() {
                          _delete();
                          print('Delete button clicked');
                        });
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void updatePriorityAsInt(String value) {
    switch (value) {
      case 'High Priority':
        note.priority = 1;
        break;
      case 'Normal Priority':
        note.priority = 2;
        break;
    }
  }

  String getPriorityAsString(int value) {
    String priority;
    switch (value) {
      case 1:
        priority = _priorities[0];
        break;
      case 2:
        priority = _priorities[1];
        break;
    }
    return priority;
  }

  void updateTitle() {

    note.title = titleController.text;
  }

  void updateDescription() {
    note.description = descriptionController.text;
  }

  void _save() async {
    if (_checkNotNull() == true) {
      moveToLastScreen();
      note.date = DateFormat.yMMMd().format(DateTime.now());
      int result;
      if (note.id != null) {
        result = await databaseHelper.updateNote(note);
      } else {
        result = await databaseHelper.insertNote(note);
      }

      if (result != 0) {
        _showAlertDialog('Status', 'Note Saved Successfully');
      } else {
        _showAlertDialog('Status', 'Note Saved Successfully');
      }
    }
  }

  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }
  void _showAlertDialog1(String title, String message) {
    AlertDialog alertDialog = AlertDialog(

      title: Text(title,

        style: TextStyle(fontFamily: 'Montserrat', fontSize: 14,fontWeight: FontWeight.bold,letterSpacing: 1),
      ),
      content: Text(message+'\nClick outside AlertBox to go Back to Add Note.',
          style: TextStyle(fontFamily: 'Montserrat', fontSize: 12,fontWeight: FontWeight.w500,letterSpacing: 1,color: Colors.red.shade600),),
      );

    showDialog(context: context, builder: (_) => alertDialog);
  }

  void _delete() async {
    moveToLastScreen();
    if(note.id == null){
      _showAlertDialog('Status', 'No Note was deleted');
      return;
    }
    int result = await databaseHelper.deleteNote(note.id);
    if (result != 0){
      _showAlertDialog('Status', 'Note Deleted Successfully');
    } else {
      _showAlertDialog('Status', 'Error Occured while Deleting Note');
    }
  }
  void moveToLastScreen(){
    Navigator.pop(context, true);
  }
  bool _checkNotNull() {
    bool res;
    if (titleController.text.isEmpty && descriptionController.text.isEmpty) {
      _showAlertDialog1('Title and Description Empty', 'Title and Description cannot be Empty! ');
      res = false;
    } else if (descriptionController.text.isEmpty) {
      _showAlertDialog1('Description Empty', 'Description cannot be Empty!');
      res = false;
    } else if (titleController.text.isEmpty) {
      _showAlertDialog1('Title Empty', 'Title cannot be Empty! ');
      res = false;
    } else {
      res = true;
    }
    return res;
  }
  _showSnakbar(String msg) {
    final snackbar = SnackBar(
      content: Text(msg,
        style: TextStyle(fontFamily: 'Montserrat', fontSize: 22,fontWeight: FontWeight.w500,letterSpacing: 1),),
      backgroundColor: Colors.blueAccent,
    );

  }
}
