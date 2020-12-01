//TODO: conform to servers model of GoPiGo
class GoPiGo {
  int id;
  String name;
  int batterylevel;
  String location;
  int timestamp; //TODO make a good time format

  // GoPiGo(this.id, this.name, this.batterylevel);

  String get getName => name;
  int get getId => id;
  int get getBatterylevel => batterylevel;
  String get getLocation => location;

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
