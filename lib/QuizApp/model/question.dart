class Question {
  final String title;
  final List<String> _choise;
  final String _goodChoise;
  Question(this.title, this._choise, this._goodChoise);
  List<String> get choise => _choise;
  get goodChoise => _goodChoise;
  
  Map<String, dynamic> toJson() => {
    "title": title,
    "choise": _choise,
    "goodChoise": _goodChoise,
  };

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      json["title"],
      List<String>.from(json["choise"]),
      json["goodChoise"],
    );
  }
}
