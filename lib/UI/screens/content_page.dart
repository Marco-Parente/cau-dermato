import 'package:flutter/material.dart';

class ContentPageArguments {
  final int id;
  final String title;
  final String content;
  final String date;
  final String imageUrl;
  final List<String> tags;

  ContentPageArguments({
    this.imageUrl,
    this.id,
    this.title,
    this.content,
    this.date,
    this.tags,
  });
}

class ContentPage extends StatelessWidget {
  static const routeName = "/ContentPage";

  final ContentPageArguments arguments;

  const ContentPage({
    Key key,
    this.arguments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dra. Claudia Cherin"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.black,
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height / 4
                : MediaQuery.of(context).size.height / 1.5,
            child: Center(
              child: Hero(
                tag: "CardToPage${arguments.id}",
                child: Container(
                  child: arguments.imageUrl != null
                      ? Image.network(
                          arguments.imageUrl,
                          fit: BoxFit.fitHeight,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes
                                    : null,
                              ),
                            );
                          },
                        )
                      : SizedBox(),
                ),
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    arguments.title,
                    style: Theme.of(context).textTheme.title,
                  ),
                  arguments.tags?.isEmpty ?? true
                      ? SizedBox()
                      : Wrap(
                          spacing: 7,
                          children: <Widget>[
                            ...arguments.tags.map(
                              (tag) => Chip(
                                label: Text(tag),
                                backgroundColor: Theme.of(context).accentColor,
                              ),
                            ),
                          ],
                        ),
                  SizedBox(height: 15),
                  Text(
                    arguments.content,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Spacer(),
                      Icon(
                        Icons.calendar_today,
                        size: 20,
                        color: Theme.of(context).textTheme.caption.color,
                      ),
                      SizedBox(width: 5),
                      Text(
                        arguments.date,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
