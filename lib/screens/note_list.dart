import 'package:flutter/material.dart';
import 'package:adroitnotes/utils/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:flutter/material.dart';
import 'package:adroitnotes/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:share/share.dart';




import 'note_details.dart';
import 'package:adroitnotes/models/note.dart';
List<Color> colorList1 = [
  Colors.blue.shade50,
  Colors.lightGreen.shade50,
  Colors.deepPurple.shade50,
  Colors.indigo.shade50,
  Colors.pink.shade50,
  Colors.orange.shade50,
  Colors.cyan.shade50,
  Colors.lightGreen.shade50,
  Colors.cyan.shade50,
  Colors.teal.shade50,
  Colors.orange.shade50,
  Colors.orange.shade50,
  Colors.cyan.shade50,
  Colors.lightGreen.shade50,
  Colors.lightGreen.shade50,
  Colors.indigo.shade50,
  Colors.lime.shade50,
  Colors.brown.shade50,
  Colors.blueGrey.shade50,
  Colors.cyan.shade50,
  Colors.orange.shade50,
  Colors.pink.shade50,
  Colors.lightBlue.shade50,
  Colors.deepPurple.shade50,
  Colors.lightBlue.shade50,
  Colors.deepPurple.shade50,
  Colors.green.shade50,
  Colors.cyan.shade50,
  Colors.teal.shade50,
  Colors.orange.shade50,
  Colors.green.shade50,
  Colors.deepPurple.shade50,
  Colors.green.shade50,
  Colors.teal.shade50,
  Colors.lightGreen.shade50,
  Colors.deepPurple.shade50,
  Colors.indigo.shade50,
  Colors.pink.shade50,
  Colors.orange.shade50,
  Colors.cyan.shade50,
  Colors.lightGreen.shade50,
  Colors.indigo.shade50,
  Colors.lime.shade50,
  Colors.brown.shade50,
  Colors.blueGrey.shade50,
  Colors.cyan.shade50,
  Colors.orange.shade50,
  Colors.green.shade50,
  Colors.lightBlue.shade50,
  Colors.deepPurple.shade50,
  Colors.green.shade50,
  Colors.cyan.shade50,
  Colors.lightGreen.shade50,
  Colors.deepPurple.shade50,
  Colors.indigo.shade50,
  Colors.pink.shade50,
  Colors.orange.shade50,
  Colors.cyan.shade50,
  Colors.lightGreen.shade50,
  Colors.teal.shade50,
  Colors.orange.shade50,
  Colors.green.shade50,
  Colors.deepPurple.shade50,
  Colors.green.shade50,
  Colors.teal.shade50,
  Colors.lightGreen.shade50,
  Colors.deepPurple.shade50,
  Colors.indigo.shade50,
  Colors.pink.shade50,
  Colors.orange.shade50,
  Colors.cyan.shade50,
  Colors.lightGreen.shade50,
  Colors.indigo.shade50,
  Colors.lime.shade50,
  Colors.cyan.shade50,
  Colors.orange.shade50,
  Colors.lightGreen.shade50,
  Colors.yellow.shade50,
  Colors.indigo.shade50,
  Colors.lime.shade50,
  Colors.cyan.shade50,
  Colors.orange.shade50,
  Colors.lightGreen.shade50,
  Colors.yellow.shade50,
  Colors.yellow.shade50,
  Colors.orange.shade50,
  Colors.lightGreen.shade50,
  Colors.cyan.shade50,
  Colors.lightGreen.shade50,
  Colors.yellow.shade50,
  Colors.deepPurple.shade50,
  Colors.indigo.shade50,
  Colors.lime.shade50,
  Colors.cyan.shade50,
  Colors.lightGreen.shade50,
  Colors.indigo.shade50,
  Colors.lime.shade50,
  Colors.cyan.shade50,
  Colors.orange.shade50,
  Colors.lightGreen.shade50,
  Colors.yellow.shade50,
  Colors.yellow.shade50,
  Colors.orange.shade50,
  Colors.lightGreen.shade50,
  Colors.cyan.shade50,
  Colors.lightGreen.shade50,
  Colors.yellow.shade50,
  Colors.deepPurple.shade50,
  Colors.indigo.shade50,
  Colors.lime.shade50,
  Colors.cyan.shade50,
  Colors.lightGreen.shade50,
  Colors.cyan.shade50,
  Colors.yellow.shade50,
  Colors.teal.shade50,
  Colors.lightGreen.shade50,
  Colors.deepPurple.shade50,
  Colors.lightBlue.shade50,
  Colors.indigo.shade50,
  Colors.pink.shade50,
  Colors.orange.shade50,
  Colors.cyan.shade50,
  Colors.deepPurple.shade50,
  Colors.cyan.shade50,
  Colors.yellow.shade50,
  Colors.teal.shade50,
  Colors.lightGreen.shade50,
  Colors.deepPurple.shade50,
  Colors.lightBlue.shade200,
  Colors.indigo.shade50,
  Colors.pink.shade50,
  Colors.orange.shade50,
  Colors.cyan.shade50,
  Colors.green.shade50,
  Colors.cyan.shade50,
  Colors.lightGreen.shade50,
  Colors.indigo.shade50,
  Colors.lime.shade50,
  Colors.brown.shade50,
  Colors.blueGrey.shade50,
  Colors.cyan.shade50,
  Colors.orange.shade50,
  Colors.green.shade50,
  Colors.lightBlue.shade50,
  Colors.deepPurple.shade50,
  Colors.lightBlue.shade50,
  Colors.deepPurple.shade50,
  Colors.green.shade50,
  Colors.cyan.shade50,
  Colors.lightGreen.shade50,
  Colors.deepPurple.shade50,
  Colors.indigo.shade50,
  Colors.pink.shade50,
  Colors.orange.shade50,
  Colors.cyan.shade50,
  Colors.lightGreen.shade50,
  Colors.teal.shade50,
  Colors.orange.shade50,
  Colors.green.shade50,
  Colors.purple.shade50,
  Colors.green.shade50,
  Colors.teal.shade50,
  Colors.lightGreen.shade50,
  Colors.deepPurple.shade50,
  Colors.indigo.shade50,
  Colors.pink.shade50,
  Colors.orange.shade50,
  Colors.cyan.shade50,
  Colors.lightGreen.shade50,
  Colors.green.shade50,
  Colors.indigo.shade50,
  Colors.lime.shade50,
  Colors.brown.shade50,
  Colors.blueGrey.shade50,
  Colors.cyan.shade50,
  Colors.orange.shade50,
  Colors.green.shade50,
  Colors.lightBlue.shade50,
  Colors.deepPurple.shade50,
  Colors.green.shade50,
  Colors.cyan.shade50,
  Colors.teal.shade50,
  Colors.lightGreen.shade50,
  Colors.deepPurple.shade50,
  Colors.indigo.shade50,
  Colors.pink.shade50,
  Colors.orange.shade50,
  Colors.cyan.shade50,
  Colors.lightGreen.shade50,
  Colors.orange.shade50,
  Colors.green.shade50,
  Colors.deepPurple.shade50,
  Colors.green.shade50,
  Colors.teal.shade50,


];

class NoteList extends StatefulWidget {

  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    if (noteList == null) {
      noteList = List<Note>();
      updateListView();
    }

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
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => SettingsPage()));
            },
            icon: Icon(Icons.settings),
          ),

        ],
        title: Text('AdroitNotes',
            style: TextStyle(fontFamily: 'Montserrat', fontSize: 22,fontWeight: FontWeight.w500,letterSpacing: 1),
        ),
      ),
      body: getNoteListView(),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0),),
        child: Icon(Icons.add,
        color:Colors.white70,
        ),
        backgroundColor: Colors.blue.shade800,
        tooltip: 'Add note',
        onPressed: () {
          print('FloatingActionBar clciked');
          navigateToDetails(Note('', '', 2),'Add note');
        },
      ),
    );
  }

  ListView getNoteListView() {

    // ignore: deprecated_member_use
    TextStyle titleStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: colorList1.elementAt(((this.noteList[index].title.length )) % colorList1.length),
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: getPriorityColor(this.noteList[index].priority),
              child: getPriorityIcon(this.noteList[index].priority),
            ),
            title: Text(

              this.noteList[index].title+'\t',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 20,
                color:Colors.black,
                fontWeight: FontWeight.w800,
                letterSpacing: 1,
              ),
            ),
            subtitle: Text(noteList[index].date+'\n'+'\nNote Details:\n'
                '${ noteList[index].description.trim().length <= 98 ? noteList[index].description.trim() : noteList[index].description.trim().substring(0, 98) +
                '\nRead More>\n\n'}',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 14,
                  color:Colors.black,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 1,
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.delete,
              ),
              onPressed: () {


                _delete(context,this.noteList[index]);
              },
            ),
            onTap: () {
              print('The tile has been pressed!');
              navigateToDetails(this.noteList[index],'Edit Note');
            },
          ),
        );
      },
    );
  }

  Color getPriorityColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.yellow;
        break;
      case 2:
        return Colors.green;
        break;
      default:
        return Colors.green;
    }
  }

  Icon getPriorityIcon(int priority) {
    switch (priority) {
      case 1:
        return Icon(Icons.add_alert);
        break;
      case 2:
        return Icon(Icons.keyboard_arrow_right);
        break;
      default:
        return Icon(Icons.keyboard_arrow_right);
    }
  }

  void _delete(BuildContext context, Note note) {

    // set up the buttons
    Widget cancelButton = MaterialButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.green)
      ),
      child: Text("Cancel"),

      onPressed:  () {Navigator.pop(context);},
    );
    Widget continueButton = MaterialButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.red)
      ),
      child: Text("Yes"),
      onPressed:  () {databaseHelper.deleteNote(note.id);
      _showSnackBar(context, 'Note Deleted Successfully');
      updateListView();
      Navigator.pop(context);},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.grey.shade300)
      ),
      title: Text("Are You Sure You Want to Delete the Note?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void navigateToDetails(Note note,String title) async {
    bool result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteDetails(
        note,title
      );
    }));
    if (result== true){
      updateListView();
    }
  }

  void updateListView(){
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database){
      Future<List<Note>> noteListFuture = databaseHelper.getNoteList();
      noteListFuture.then((noteList){
        setState(() {
          this.noteList = noteList;
          this.count = noteList.length;
        });
      });
    });

  }
}
