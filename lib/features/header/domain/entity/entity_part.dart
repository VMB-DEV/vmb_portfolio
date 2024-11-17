enum PartEntity {
  home,
  projects,
  contact,
  resume,
  language,
  ;

  static List<String> get names => values.map((type) => type.name).toList();
}