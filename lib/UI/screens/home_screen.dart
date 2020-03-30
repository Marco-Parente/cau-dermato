import 'dart:math';

import 'package:cau_dermato/UI/screens/content_page.dart';
import 'package:flutter/material.dart';

import 'package:cau_dermato/UI/components/app_drawer.dart';
import 'package:cau_dermato/UI/components/info_card.dart';
import 'package:lipsum/lipsum.dart' as lipsum;

class HomeScreen extends StatelessWidget {
  static const routeName = "/Home";

  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("Dra. Claudia Cherin"),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.landscape) {
            return Center(
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width / 1.375),
                  child: _PostList()),
            );
          }
          return _PostList();
        },
      ),
    );
  }
}

class _PostList extends StatelessWidget {
  const _PostList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    return Container(
      child: ListView(
        children: <Widget>[
          SizedBox(height: 15),
          for (var i = 0; i < 10; i++)
            InfoCard(
              arguments: InfoCardArguments(
                  id: i,
                  imageUrl:
                      "https://images.dog.ceo/breeds/terrier-westhighland/n02098286_275.jpg",
                  title: lipsum.createWord(numWords: 5 + random.nextInt(20)),
                  content: lipsum.createWord(numWords: random.nextInt(50)),
                  date: "19/03/2020",
                  tags: List<String>.generate(
                    random.nextInt(3),
                    (_) => lipsum.createWord(),
                  ),
                  onTap: (_) {
                    Navigator.pushNamed(
                      context,
                      ContentPage.routeName,
                      arguments: ContentPageArguments(
                        id: i,
                        imageUrl:
                            "https://images.dog.ceo/breeds/terrier-westhighland/n02098286_275.jpg",
                        title:
                            lipsum.createWord(numWords: 5 + random.nextInt(20)),
                        content: lipsum.createText(
                            numParagraphs: random.nextInt(10)),
                        date: "19/03/2020",
                        tags: List<String>.generate(
                          random.nextInt(3),
                          (_) => lipsum.createWord(),
                        ),
                      ),
                    );
                  }),
            ),
        ],
      ),
    );
  }
}
