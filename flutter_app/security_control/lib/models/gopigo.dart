//TODO: conform to servers model of GoPiGo
class GoPiGo {
  int _id;
  String _name;
  int _batterylevel;
  GoPiGo(this._id, this._name, this._batterylevel);
  String get name => _name;
  int get id => _id;
  int get batterylevel => _batterylevel;
  void setId(int i) => _id = i;
  void setBatteryLevel(int i) => _batterylevel = i;
  void setName(String newName) {
    _name = newName;
  }
}
