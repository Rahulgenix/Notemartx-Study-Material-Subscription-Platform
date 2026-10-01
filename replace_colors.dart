import 'dart:io';

void main() {
  final dir = Directory('lib');
  final files = dir.listSync(recursive: true).whereType<File>().where((f) => f.path.endsWith('.dart'));

  for (final file in files) {
    String content = file.readAsStringSync();
    bool changed = false;

    if (content.contains('AppColors.cardColor')) {
      content = content.replaceAll('AppColors.cardColor', 'Theme.of(context).cardColor');
      changed = true;
    }
    
    if (content.contains('AppColors.white')) {
      // Be careful with replacing AppColors.white blindly, maybe just AppColors.white for text?
      // Actually, let's just replace AppColors.cardColor and AppTypography hardcoded colors for now.
    }

    if (changed) {
      file.writeAsStringSync(content);
      print('Updated ${file.path}');
    }
  }
}
