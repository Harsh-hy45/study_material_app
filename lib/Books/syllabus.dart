import 'package:flutter/material.dart';
import 'package:study_material_app/database/subjectCodeDatabase.dart';
import 'package:study_material_app/Animation/CustomWidgets.dart';
import 'package:study_material_app/database/Syllabus.dart';

class SyllabusScreen extends StatelessWidget {
  static const String id = 'SyllabusScreen';
  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments;
    String subject = args['Subject'];

    SubjectCode ob = new SubjectCode();
    String subjectCode = ob.subjectCode[subject];

    Syllabus ob2 = new Syllabus();
    List<Map<String, String>> list = ob2.getSyllabus(subjectCode);

    Widget data() {
      if (list.isEmpty == true) {
        return EmptyState(
          title: 'Coming soon',
          message: 'The syllabus for your subject is not available.',
        );
      } else {
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          addAutomaticKeepAlives: true,
          itemCount: list.length,
          itemBuilder: (BuildContext context, int position) => SyllabusTile(
            heading: list[position].keys.elementAt(0),
            message: list[position].values.elementAt(0),
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Background(
                height1: 280.0,
                height2: 150.0,
                height3: 100.0,
                height4: 100.0,
              ),
              SizedBox(height: 50.0),
              data(),
            ],
          ),
        ),
      ),
    );
  }
}

class ScreenArguments {
  final String subject;
  ScreenArguments(this.subject);
}
