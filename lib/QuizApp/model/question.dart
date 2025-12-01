class Question {
  final String title;
  final List<String> _choise;
  final String _goodChoise;
  Question(this.title, this._choise, this._goodChoise);
  List<String> get choise => _choise;
  get goodChoise => _goodChoise;
}
