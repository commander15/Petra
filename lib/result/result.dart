class Result {
  int _id;
  int _cycleLength;
  DateTime _lastPeriod;
  DateTime _nextPeriod;
  DateTime _follicularPhase;
  DateTime _ovulationPhase;
  DateTime _lutealPhase;

  Result(
    this._id,
    this._cycleLength,
    this._lastPeriod,
    this._nextPeriod,
    this._follicularPhase,
    this._ovulationPhase,
    this._lutealPhase,
  );

  int get id => _id;
  int get cycleLength => _cycleLength;
  DateTime get lastPeriod => _lastPeriod;
  DateTime get nextPeriod => _nextPeriod;
  DateTime get follicularPhase => _follicularPhase;
  DateTime get ovulationPhase => _ovulationPhase;
  DateTime get lutealPhase => _lutealPhase;

  set id(int value) {
    _id = value;
  }

  set cycleLength(int value) {
    _cycleLength = value;
  }

  set lastPeriod(DateTime value) {
    _lastPeriod = value;
  }

  set nextPeriod(DateTime value) {
    _nextPeriod = value;
  }

  set follicularPhase(DateTime value) {
    _follicularPhase = value;
  }

  set ovulationPhase(DateTime value) {
    _ovulationPhase = value;
  }

  set lutealPhase(DateTime value) {
    _lutealPhase = value;
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['cycleLength'] = cycleLength;
    map['lastPeriod'] = lastPeriod.toString();
    map['nextPeriod'] = nextPeriod.toString();
    map['follicularPhase'] = follicularPhase.toString();
    map['ovulationPhase'] = ovulationPhase.toString();
    map['lutealPhase'] = lutealPhase.toString();

    return map;
  }

  Result.fromMapObject(Map<String, dynamic> map): 
  _id = map['id'],
  _cycleLength = map['cycleLength'],
  _lastPeriod = DateTime.parse(map['lastPeriod']),
  _nextPeriod = DateTime.parse(map['nextPeriod']),
  _follicularPhase = DateTime.parse(map['follicularPhase']),
  _ovulationPhase = DateTime.parse(map['ovulationPhase']),
  _lutealPhase = DateTime.parse(map['lutealPhase']);

  Result.empty():
  _id = 0,
  _cycleLength = 0,
  _lastPeriod = DateTime(0),
  _nextPeriod = DateTime(0),
  _follicularPhase = DateTime(0),
  _ovulationPhase = DateTime(0),
  _lutealPhase = DateTime(0);
}