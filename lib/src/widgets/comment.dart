import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import '../models/item_model.dart';
import '../widgets/loading_container.dart';

class Comment extends StatelessWidget {
  final int itemId;
  final Map<int, Future<ItemModel>> itemMap;
  final int depth;

  Comment({this.itemId, this.itemMap, this.depth});

  Widget build(context) {
    return FutureBuilder(
      builder: (context, AsyncSnapshot<ItemModel> snapshot) {
        final item = snapshot.data;

        if (!snapshot.hasData) {
          return LoadingContainer();
        }

        final children = <Widget>[
          ListTile(
            title: Html(data: item.text),
            subtitle:
                item.by == "" ? Text("Deleted") : Text('Author: ${item.by}'),
            contentPadding: EdgeInsets.only(
              left: (depth + 1) * 16.0,
              right: 16.0,
            ),
          ),
          Divider(
            height: 8.0,
          ),
        ];

        snapshot.data.kids.forEach((kidId) {
          children.add(
            Comment(
              itemId: kidId,
              itemMap: itemMap,
              depth: depth + 1,
            ),
          );
        });

        return Column(
          children: children,
        );
      },
      future: itemMap[itemId],
    );
  }
}
