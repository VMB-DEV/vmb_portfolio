extension ListExtenstion<T> on List<T> {
  List<T> withoutLast() => sublist(0, length -1);
}
