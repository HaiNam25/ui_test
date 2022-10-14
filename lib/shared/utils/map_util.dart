class MapUtil {
  static List<TT> getValuesByKeys<T extends Object, TT extends Object>({required Map map, required List<T> keys,}) {
    List<TT> list = [];
    keys.forEach((element) {
      if (map.containsKey(element)) {
        list.add(map[element]!);
      }
    });
    return list;
  }
}