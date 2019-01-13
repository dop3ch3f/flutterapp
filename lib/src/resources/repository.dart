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
    item = await sources[1].fetchItem(id);

    // for (source in sources) {
    //   item = await source.fetchItem(id);
    //   if (item != null) {
    //     break;
    //   }
    // }

    caches[0].addItem(item);

    // for (var cache in caches) {
    //   if (cache != (source as Cache)) {
    //     cache.addItem(item);
    //   }
    // }

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
