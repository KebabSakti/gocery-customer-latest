enum QuerySortingDirection { desc, asc }

class QueryModel {
  final QueryFieldValue? filter;
  final QueryFieldValue? search;
  final QuerySorting? sort;
  final QueryPaginate? paginate;

  const QueryModel({this.filter, this.search, this.sort, this.paginate});

  Map<String, String> toJson() {
    Map<String, String> result = {};

    if (filter != null) {
      result.putIfAbsent('filter', () => '${filter!.field},${filter!.value}');
    }

    if (search != null) {
      result.putIfAbsent('search', () => '${search!.field},${search!.value}');
    }

    if (sort != null) {
      result.putIfAbsent(
          'sort', () => '${sort!.field},${sort!.direction.name}');
    }

    if (paginate != null) {
      result.putIfAbsent(
          'paginate', () => '${paginate!.offset},${paginate!.limit}');
    }

    return result;
  }
}

class QueryFieldValue {
  final String field;
  final String value;

  QueryFieldValue({required this.field, required this.value});
}

class QuerySorting {
  final String field;
  final QuerySortingDirection direction;

  QuerySorting({required this.field, required this.direction});
}

class QueryPaginate {
  final int offset;
  final int limit;

  QueryPaginate({required this.offset, required this.limit});
}
