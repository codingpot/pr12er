import 'package:flutter_test/flutter_test.dart';
import 'package:pr12er/utils/extractor.dart';

void main() {
  group("extractYoutubeId", () {
    test('extracts only ID from youtube short url', () {
      const url = "https://youtu.be/V7_cNTfm2i8";
      expect(extractYoutubeId(url), "V7_cNTfm2i8");
    });

    test('extracts ID from youtube long url', () {
      const url = 'https://www.youtube.com/video-id';
      expect(extractYoutubeId(url), "video-id");
    });
  });
}
