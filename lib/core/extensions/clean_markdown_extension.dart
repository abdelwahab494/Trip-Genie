extension CleanMarkdownExtension on String {
  String get cleanMarkdown {
    return replaceAll(RegExp(r'\*{1,2}'), '')
        .replaceAll(RegExp(r'`'), '')
        .replaceAll(RegExp(r'_'), '')
        .replaceAll(RegExp(r'\#'), '')
        .replaceAll(RegExp(r'>'), '')
        .trim();
  }
}
