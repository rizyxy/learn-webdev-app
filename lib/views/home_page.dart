import 'package:flutter/material.dart';
import 'package:learn_webdev/provider/content_provider.dart';
import 'package:learn_webdev/views/content_list_page.dart';
import 'package:learn_webdev/views/profile_page.dart';
import 'package:learn_webdev/widgets/auth_button.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<String> _imagePath = [
    'images/html.png',
    'images/css.png',
    'images/JavaScript.png',
    'images/php.png'
  ];

  final List<String> _title = ['HTML', 'CSS', 'Javascript', 'PHP'];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: ChangeNotifierProvider(
        create: (context) => ContentModel(),
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 250,
            centerTitle: true,
            title: Column(
              children: <Widget>[
                Image.asset(
                  'images/logomain.png',
                  scale: 3,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "HTML Dictionary",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ],
            ),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          body: Column(
            children: [
              Flexible(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ListView.separated(
                      itemCount: _imagePath.length,
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 20,
                        );
                      },
                      itemBuilder: (context, index) {
                        return Consumer<ContentModel>(
                          builder: (context, content, _) => ListTile(
                            onTap: () {
                              content.setContent(index);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ContentListPage(
                                            title: _title[index],
                                            content: content.contents,
                                          )));
                            },
                            leading: SizedBox(
                                height: 70,
                                width: 70,
                                child: Image.asset(
                                  _imagePath[index],
                                )),
                            title: Text(_title[index]),
                          ),
                        );
                      }),
                ),
              ),
              Flexible(
                  child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 50),
                      child: AuthButton(
                          label: "Account Page",
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfilePage()));
                          })))
            ],
          ),
        ),
      ),
    );
  }
}
