import 'package:pr12er/protos/pkg/pr12er/messages.pb.dart';

String generateShareSummary(Video video, Detail? detail) {
  final sb = StringBuffer();
  sb.write("""
[YouTube 주소]
${video.link}
""");

  if (detail != null && detail.papers.isNotEmpty) {
    final mainPaper = detail.papers.first;
    sb.write("""

[논문]
${mainPaper.title} (https://arxiv.org/abs/${mainPaper.arxivId})
""");
  }

  return sb.toString();
}
