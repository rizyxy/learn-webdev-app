import 'package:flutter/material.dart';

class ContentDetailPage extends StatelessWidget {
  const ContentDetailPage(
      {Key? key, required this.contentTitle, required this.contentDesc})
      : super(key: key);

  final String contentTitle;
  final String contentDesc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(contentTitle),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Text(
                  contentTitle,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w700),
                ),
              ),
              Text(contentDesc),
            ],
          ),
        ),
      ),
    );
  }
}
