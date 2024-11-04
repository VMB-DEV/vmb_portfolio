enum PartEntity {
  home,
  projects,
  experiences,
  contact,
  resume,
  ;

  static List<String> get names => values.map((type) => type.name).toList();
}