class GoPiGo {
  int id;
  String name;
  int batterylevel;
  String location;
  DateTime timestamp;

  String get getName => name;
  int get getId => id;
  int get getBatterylevel => batterylevel;
  String get getLocation => location;
  DateTime get getTimestamp => timestamp;

  void setId(int i) => id = i;
  void setBatteryLevel(int i) => batterylevel = i;
  void setName(String newName) => name = newName;
  void setLocation(String newLoc) => location = newLoc;

  GoPiGo({
    this.id,
    this.name,
    this.batterylevel,
    this.location,
    this.timestamp,
  });

  //TODO match up json field thisNames to what database gives out
  factory GoPiGo.fromJson(Map<String, dynamic> json) {
    return GoPiGo(id: 155, name: 'stub', batterylevel: 66);
  }
}
