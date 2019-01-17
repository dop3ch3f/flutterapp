import 'package:flutter/material.dart';
import 'dart:async';
import '../blocs/comments_provider.dart';
import '../models/item_model.dart';
import '../widgets/comment.dart';

class NewsDetail extends StatelessWidget {
  final int itemId;

  NewsDetail({this.itemId});

  Widget build(context) {
    final bloc = CommentsProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: buildDetails(bloc),
    );
  }

  Widget buildDetails(CommentsBloc bloc) {
    return StreamBuilder(
        stream: bloc.itemWithComments,
        builder:
            (context, AsyncSnapshot<Map<int, Future<ItemModel>>> snapshot) {
          if (!snapshot.hasData) {
            return Text('Loading');
          }
          final itemFuture = snapshot.data[itemId];

          return FutureBuilder(
            builder: (context, AsyncSnapshot<ItemModel> itemSnapshot) {
              if (!itemSnapshot.hasData) {
                return Text('Loading');
              }
              return buildList(itemSnapshot.data, snapshot.data);
            },
            future: itemFuture,
          );
        });
  }

  Widget buildList(ItemModel item, Map<int, Future<ItemModel>> itemMap) {
    final children = <Widget>[];
    children.add(buildTitle(item));
    final commentsList = item.kids.map((kidId) {
      return Comment(
        itemId: kidId,
        itemMap: itemMap,
        depth: 0,
      );
    }).toList();
    children.addAll(commentsList);

    return ListView(children: children);
  }

  Widget buildTitle(ItemModel item) {
    return Container(
      margin: EdgeInsets.all(10.0),
      alignment: Alignment.topCenter,
      child: Text(
        item.title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      ),
    );
  }
}
