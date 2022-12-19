import 'package:flutter/material.dart';
import 'package:learn_webdev/views/content_detail_page.dart';

class ContentListPage extends StatelessWidget {
  const ContentListPage({Key? key, required this.content, required this.title})
      : super(key: key);

  final Map<String, String> content;

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: content.isNotEmpty
          ? Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: ListView.builder(
                  itemCount: content.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContentDetailPage(
                                  contentTitle: content.keys.elementAt(index),
                                  contentDesc:
                                      content.values.elementAt(index)))),
                      child: Ink(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              content.keys.elementAt(index),
                              style: const TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          : const Center(child: Text("Under Development")),
    );
  }
}
