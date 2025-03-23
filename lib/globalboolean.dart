class GlobalState {
  static final GlobalState _instance = GlobalState._internal();

  bool isBagelOrdered = false;
  bool basf = false;
  bool donorwall = false;
  bool spinnychair = false;
  bool staircase = false;
  bool centerofeng = false;
  bool longHallway = false;
  bool numChairs = false;
  bool donor = false;
  bool crane = false;
  bool car = false;
  bool throne = false;
  bool flier = false;
  bool stairs = false;
  bool bagel = false;
  String lastGameScreen = 'HuntScreen'; // Default to HuntScreen

  factory GlobalState() {
    return _instance;
  }

  GlobalState._internal();
}
