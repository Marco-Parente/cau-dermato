import 'package:flutter/material.dart';

class InfoCardArguments {
  final int id;
  final String title;
  final String content;
  final String date;
  final String imageUrl;
  final List<String> tags;
  final ValueChanged<int> onTap;
  final EdgeInsets margin;

  InfoCardArguments({
    this.id,
    this.title,
    this.content,
    this.date,
    this.imageUrl,
    this.tags,
    this.onTap,
    this.margin = const EdgeInsets.only(left: 15, right: 15, bottom: 15),
  });
}

class InfoCard extends StatelessWidget {
  final InfoCardArguments arguments;

  const InfoCard({
    Key key,
    this.arguments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          if (arguments.onTap != null) {
            arguments.onTap(arguments.id);
          }
          print(arguments.id);
        },
        child: Container(
          margin: arguments.margin,
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black26,
                spreadRadius: 0.01,
                blurRadius: 10,
                offset: Offset.fromDirection(10, -10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Hero(
                  tag: "CardToPage${arguments.id}",
                  child: Container(
                    color: Colors.grey,
                    height: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? MediaQuery.of(context).size.height / 4
                        : MediaQuery.of(context).size.height / 1.5,
                    child: arguments.imageUrl != null
                        ? Image.network(
                            arguments.imageUrl,
                            fit: BoxFit.cover,
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
                Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        arguments.title,
                        style: Theme.of(context).textTheme.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                      SizedBox(height: 10),
                      Text(
                        arguments.content,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          arguments.tags?.isEmpty ?? true
                              ? Spacer()
                              : Expanded(
                                  child: Wrap(
                                    spacing: 7,
                                    children: <Widget>[
                                      ...arguments.tags.map(
                                        (tag) => Chip(
                                          label: Text(tag),
                                          backgroundColor:
                                              Theme.of(context).accentColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
