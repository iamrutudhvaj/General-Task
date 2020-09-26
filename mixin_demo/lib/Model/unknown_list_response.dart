import 'package:mixin_demo/Model/unknown_list.dart';

class UnknownListResponse {
  int page;
  int perPage;
  int total;
  int totalPages;
  List<UnknownList> data;
  Ad ad;

  UnknownListResponse(
      {this.page,
      this.perPage,
      this.total,
      this.totalPages,
      this.data,
      this.ad});

  UnknownListResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['per_page'];
    total = json['total'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
      data = new List<UnknownList>();
      json['data'].forEach((v) {
        data.add(new UnknownList.fromJson(v));
      });
    }
    ad = json['ad'] != null ? new Ad.fromJson(json['ad']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['per_page'] = this.perPage;
    data['total'] = this.total;
    data['total_pages'] = this.totalPages;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    if (this.ad != null) {
      data['ad'] = this.ad.toJson();
    }
    return data;
  }
}

class Ad {
  String company;
  String url;
  String text;

  Ad({this.company, this.url, this.text});

  Ad.fromJson(Map<String, dynamic> json) {
    company = json['company'];
    url = json['url'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company'] = this.company;
    data['url'] = this.url;
    data['text'] = this.text;
    return data;
  }
}
