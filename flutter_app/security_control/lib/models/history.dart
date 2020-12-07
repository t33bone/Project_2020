class History {
  int id;
  String name;
  DateTime timestamp;

  int get getId => id;
  String get getName => name;
  DateTime get getTimestamp => timestamp;

  void setId(int i) => id = i;

  History({
    this.id,
    this.name,
    this.timestamp,
  });

  //TODO
  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      id: 155,
      name: 'stub',
      timestamp: DateTime.now(),
    );
  }
}
