// ignore_for_file: public_member_api_docs, sort_constructors_first

typedef ChildBuilder<T> = T Function(
  Map<String, dynamic> childData,
);

typedef ChildConverter<T> = Map<String, dynamic> Function(T child);

class PageModel<T> {
  int total;
  int skip;
  int limit;
  List<T> items;
  PageModel({
    required this.total,
    required this.skip,
    required this.limit,
    required this.items,
  });

  factory PageModel.fromJson(Map<String, dynamic> json, builder) {
    return PageModel(
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
      items: List<T>.from(
        json['todos'].map(
          (data) {
            return builder(data);
          },
        ),
      ),
    );
  }

  Map<String, dynamic> toJson(ChildConverter converter) {
    return <String, dynamic>{
      'total': total,
      'skip': skip,
      'limit': limit,
      'todos': items.map((x) => converter(x)).toList(),
    };
  }
}
