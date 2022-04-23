import 'package:vexana/vexana.dart';

import '../../../../core/models/base_model.dart';

class AnimeList extends INetworkModel {
  Pagination? pagination;
  List<Data>? data;

  AnimeList({this.pagination, this.data});

  AnimeList.fromJson(Map<String, dynamic> json) {
    pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) => AnimeList.fromJson(json);
}

class Pagination {
  int? lastVisiblePage;
  bool? hasNextPage;
  int? currentPage;
  Items? items;

  Pagination({this.lastVisiblePage, this.hasNextPage, this.currentPage, this.items});

  Pagination.fromJson(Map<String, dynamic> json) {
    lastVisiblePage = json['last_visible_page'];
    hasNextPage = json['has_next_page'];
    currentPage = json['current_page'];
    items = json['items'] != null ? Items.fromJson(json['items']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['last_visible_page'] = lastVisiblePage;
    data['has_next_page'] = hasNextPage;
    data['current_page'] = currentPage;
    if (items != null) {
      data['items'] = items!.toJson();
    }
    return data;
  }
}

class Items {
  int? count;
  int? total;
  int? perPage;

  Items({this.count, this.total, this.perPage});

  Items.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    total = json['total'];
    perPage = json['per_page'];
  }

  Future<Map<String, dynamic>> toJson() async {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['total'] = total;
    data['per_page'] = perPage;
    return data;
  }
}

class Data extends BaseModel {
  int? malId;
  String? title;

  Data({
    this.malId,
    this.title,
  });

  Data.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    title = json['title'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mal_id'] = malId;
    data['title'] = title;
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) => Data.fromJson(json);
}
