class DropDownModel<T> {
  final String id;
  final T? data;

  DropDownModel({
    required this.id,
    this.data,
  });

  bool get hasData => data != null;
}
