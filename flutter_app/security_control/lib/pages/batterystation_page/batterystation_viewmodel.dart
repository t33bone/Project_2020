import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:security_control/models/gopigo.dart';
import 'package:security_control/services/gopigo_service.dart';
import 'package:security_control/services/service_locator.dart';

DateFormat timeFormat =
    DateFormat('yyyy/MM/dd  hh:mm'); //TODO this better locate in theme.dart?

class BatterystationViewModel extends FutureViewModel<List<GoPiGo>> {
  final _gopigoService = locator<GoPiGoService>();
  @override
  Future<List<GoPiGo>> futureToRun() => _gopigoService.getGoPiGoInfo();
  String _title = "Batterystation";
  String get title => _title;
}

class StatusSectionViewModel extends BatterystationViewModel {
  GoPiGo _temp = new GoPiGo.empty();
  String _statusSectionTitle = "Latest Battery Change";
  String get statusSectionTitle => _statusSectionTitle;

  GoPiGo get recentDevice {
    //TODO _gopigoService.recentBatteryChange
    for (var i in _gopigoService.devices)
      if (i.getTimestamp.isAfter(_temp.getTimestamp)) _temp = i;
    return _temp;
  }
}

class HistorySectionViewModel extends BatterystationViewModel {
  static const int ItemRequestThreshold = 10;
  DateTime _shownHistory = DateTime.now();
  List<GoPiGo> _items;
  List<GoPiGo> get items => _items;

  String _historySectionTitle = "History";
  String get historySectionTitle => _historySectionTitle;

  Future handleHistoryItemCreated(int index) async {
    var itemPosition = index + 1;
    var requestMoreData =
        itemPosition % ItemRequestThreshold == 0 && itemPosition != 0;
    var pageToRequest = _items.last.getTimestamp;
    if (requestMoreData && _shownHistory.isAfter(pageToRequest)) {
      print('pageToRequest: ${timeFormat.format(pageToRequest)}');
      _shownHistory = pageToRequest;
      _showLoadingIndicator();
      await Future.delayed(
          Duration(seconds: 5)); //TODO wait server response, not fixed time
      var newFetchedItems = List<GoPiGo>.generate(
          10,
          (index) => GoPiGo(
              1,
              'test cars$index',
              27));
      _items.addAll(newFetchedItems);
      _removeLoadingIndicator();
    }
  }

  void _showLoadingIndicator() {
    _items.add(GoPiGo(-5, "s", 1));
    notifyListeners();
    GoPiGo(2, "name", 2);
  }

  void _removeLoadingIndicator() {
    // _items.remove(GoPiGo(name: LoadingIndicatorTitle));
    _items.removeWhere((element) => element.id == -5);
    // (element) => element.name.compareTo(LoadingIndicatorTitle) == 0);
    notifyListeners();
  }

  //Generating the first gopigo history list, need to get this from service
  HistorySectionViewModel() {
    _items = List<GoPiGo>.generate(
        5,
        (index) => GoPiGo(
            1,
            'test cars$index',
            27));
  }
}
