class MessageModel {
  final String content;
  final String date;

  const MessageModel({
    required this.content,
    required this.date,
  });

  static MessageModel mock =
      MessageModel(content: 'tin nhan', date: '10/02/2001');
}
