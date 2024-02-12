class Conversation {
  final String question;
  final String answer;

  const Conversation(this.question, this.answer);

  factory Conversation.fromJson(Map json) => Conversation(
        json['question'],
        json['answer'],
      );
}
