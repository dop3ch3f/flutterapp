import "dart:async";
import "../resources/news_api_provider.dart";
import "../resources/news_db_provider.dart";
import "../models/item_model.dart";

class Repository {
  List<Source> sources = <Source>[
    newsDbProvider,
    NewsApiProvider(),
  ];

  List<Cache> caches = <Cache>[
    newsDbProvider,
  ];

  Future<List> fetchTopIds() {
    return sources[1].fetchTopIds();
  }

  Future<ItemModel> fetchItem(int id) async {
    ItemModel item;
    // Source source;
    for (var i = 0; i < sources.length; i++) {
      item = await sources[i].fetchItem(id);
      if (item != null) {
        if (i == 1) {
          caches[0].addItem(item);
          return item;
        }
        return item;
      }
      continue;
    }
    return item;
  }

  clearCache() async {
    for (var cache in caches) {
      await cache.clear();
    }
  }
}

abstract class Source {
  Future<List<int>> fetchTopIds();
  Future<ItemModel> fetchItem(int id);
}

abstract class Cache {
  Future<int> addItem(ItemModel item);
  Future<int> clear();
}
