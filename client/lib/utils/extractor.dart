String extractYoutubeId(String url) {
  final int index = url.lastIndexOf('/');
  return url.substring(index + 1);
}

/// extractRepoNameFromURL returns user/repo from https://github.com/user/repo.
///
/// WARNING:
/// It simply gets the last two path from the URL.
/// It does not verify the URL is well formed.
String extractRepoNameFromURL(String url) {
  final sublist = url.split("/").toList(growable: false);
  if (sublist.length < 2) return url;
  return sublist.sublist(sublist.length - 2, sublist.length).join("/");
}
