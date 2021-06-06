String extractYoutubeId(String url) {
  final int index = url.lastIndexOf('/');
  return url.substring(index + 1);
}
