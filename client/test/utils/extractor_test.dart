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

  group("extractRepoNameFromURL", () {
    test("returns user/name for github URL", () {
      const url = "https://github.com/codingpot/pr12er";
      expect(extractRepoNameFromURL(url), "codingpot/pr12er");
    });

    test("returns the input string for invalid URL", () {
      const url = "pr12er";
      expect(extractRepoNameFromURL(url), url);
    });
  });
}
