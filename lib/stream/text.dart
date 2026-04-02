import 'dart:async';

class DownloadProgress {
  final int percentage;
  final DateTime timestamp;

  DownloadProgress(this.percentage, this.timestamp);
}

class DownloadService {
  final StreamController<DownloadProgress> _controller = StreamController();

  Stream<DownloadProgress> get stream => _controller.stream;
  void startDownload() async {
    for (int i = 0; i <= 10; i += 10) {
      await Future.delayed(Duration(milliseconds: 100));
      _controller.add(DownloadProgress(i * 10, DateTime.now()));
    }
    _controller.close();
  }
}

void main() {
  // 1 - Create a dedicated DownloadProgress class to carry the progress + the timestamp (datetime)

  // 2 - Change the stream to send DownloadProgress objects instead of just integers.

  // 3 - Update startDownload() to send the current time along with progress  (DateTime.now)

  // 4 - Listen to the stream.

  // 5 - For each new value, compute the estimated remaining time
  //    💡 Hint: Keep the first timestamp to calculate time difference.

  // 6 Print something like:  Progress: 30% | Remaining: 700ms

  final service = DownloadService();
  service.stream.listen((progress) {
    final startTime = DateTime.now();
    if (progress.percentage > 0) {
      final totalDif = progress.timestamp.difference(startTime).inMilliseconds;
      final totalTime = (totalDif / progress.percentage) * 100;
      final remainingMs = (totalTime - totalDif).round();

      print("Progress : ${progress.percentage} | Remaining : ${remainingMs} ");
    }
  });
}
