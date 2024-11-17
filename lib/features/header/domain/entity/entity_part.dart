enum PartEntity {
  home,
  projects,
  contact,
  resume,
  ;

  static List<String> get names => values.map((type) => type.name).toList();
}