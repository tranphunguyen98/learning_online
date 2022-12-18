import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:learning_online/features/course_list/data/course.dart';

class TopicDetailPage extends StatefulWidget {
  final Topics topic;

  const TopicDetailPage({Key? key, required this.topic}) : super(key: key);

  @override
  State<TopicDetailPage> createState() => _TopicDetailPageState();
}

class _TopicDetailPageState extends State<TopicDetailPage> {
  late Future<PDFDocument> getDoc;

  @override
  void initState() {
    getDoc = PDFDocument.fromURL(widget.topic.nameFile ?? '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.topic.name ?? ''),
        ),
        body: FutureBuilder<PDFDocument>(
          future: getDoc,
          builder: (_, snapshot) {
            if(snapshot.hasData) {
              return PDFViewer(document: snapshot.data!,);
            }
            return Center(child: CircularProgressIndicator(),);
          },
        )
    );
  }
}
