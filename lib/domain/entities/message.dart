enum From {
  me,
  partner,
}

class Message {
  final String text;
  final String? imageUrl;
  final DateTime createdAt;
  final From from;

  Message({
    required this.text,
    this.imageUrl,
    required this.createdAt,
    required this.from,
  });
}
