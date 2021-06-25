import 'package:flutter_test/flutter_test.dart';
import 'package:pr12er/utils/share_service.dart';
import 'package:pr12er/protos/pkg/pr12er/messages.pb.dart';

void main() {
  group("generateShareSummary", () {
    test("should generate only YT link if no Detail", () {
      final video = Video()
        ..prId = 1
        ..title = "Title"
        ..link = "https://youtube.com/www";
      expect(generateShareSummary(video, null), """
[YouTube 주소]
https://youtube.com/www
""");
    });

    test("should generate a full report when detail is set", () {
      final video = Video()
        ..prId = 1
        ..title = "Title"
        ..link = "https://youtube.com/www";
      final detail = Detail();
      detail.paper.addAll([
        Paper()
          ..title = "paper-title"
          ..arxivId = "arxiv-id"
      ]);
      expect(generateShareSummary(video, detail), """
[YouTube 주소]
https://youtube.com/www

[논문]
paper-title (https://arxiv.org/abs/arxiv-id)
""");
    });
  });
}
