class AppString {
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
  static const String APP_NAME = 'Class Point';

  static const String urlbanner = "https://cdn.requeue.net/media/logos/";

  static int queDeclarecount = 1;

  // Set<int> selectedIndices = {};
}

const String urlPattern = r'/(https?:\/\/[^\s]+)/g';
const String emailPattern = r'\S+@\S+';
const String phonePattern = r'[\d-]{9,}';
