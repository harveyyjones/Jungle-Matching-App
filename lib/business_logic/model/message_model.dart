import 'package:flutter_riverpod/flutter_riverpod.dart';

/* final messageStateProvider = StateNotifierProvider<Message, List>((ref) {
  return Message("", DateTime.now(), true);
});

class Message extends StateNotifier<List> {
  final String text;
  final DateTime date;
  final bool isSentByMe;

  Message(this.text, this.date, this.isSentByMe) : super(messages);

  throwMessage() {
    state = [...state, Message(textController.text, DateTime.now(), true)];
  }
}

List<Message> messages = [
  Message("Hi", DateTime.now().subtract(Duration(days: 60)), false),
  Message("Hi", DateTime.now().subtract(Duration(days: 60)), true),
  Message("How are you", DateTime.now().subtract(Duration(days: 30)), false),
  Message("I'm fine, you?", DateTime.now().subtract(Duration(days: 30)), true),
  Message("I'm also fine", DateTime.now().subtract(Duration(days: 30)), false),
  Message("Well, that seems like end of the conversation",
      DateTime.now().subtract(Duration(days: 20)), true),
  Message("That depends on the things you are up to",
      DateTime.now().subtract(Duration(days: 20)), false),
  Message("I just need some sleep",
      DateTime.now().subtract(Duration(minutes: 1)), true),
  Message("I wont let you sleep", DateTime.now().subtract(Duration(days: 3)),
      false),
  Message("I didn't ask for permission",
      DateTime.now().subtract(Duration(minutes: 1)), true),
  Message("I didn't say you did", DateTime.now().subtract(Duration(minutes: 1)),
      false),
  Message(
      "I knowwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww",
      DateTime.now().subtract(Duration(minutes: 1)),
      true),
  Message("Tell me any you dont know",
      DateTime.now().subtract(Duration(minutes: 1)), false),
  Message("range of orbit of the sun",
      DateTime.now().subtract(Duration(minutes: 1)), true),
  Message(
      "I dont think ı will make love with a man who doesn't even know the range of orbit of the sun",
      DateTime.now().subtract(Duration(minutes: 1)),
      false),
  Message("Then give me a sec ı will cry in my mom's basement then come back",
      DateTime.now().subtract(Duration(minutes: 1)), true),
  Message("HAHAHAH ", DateTime.now().subtract(Duration(minutes: 1)), false),
  Message("Someone is having so much fun ",
      DateTime.now().subtract(Duration(minutes: 1)), true),
  Message(" You lucky bastard caught me ",
      DateTime.now().subtract(Duration(minutes: 1)), false),
  Message("No", DateTime.now().subtract(Duration(minutes: 1)), true),
];
 */
List<Message> messages = [
  Message("Hi", DateTime.now().subtract(Duration(days: 60)), false),
  Message("Hi", DateTime.now().subtract(Duration(days: 60)), true),
  Message("How are you", DateTime.now().subtract(Duration(days: 30)), false),
  Message("I'm fine, you?", DateTime.now().subtract(Duration(days: 30)), true),
  Message("I'm also fine", DateTime.now().subtract(Duration(days: 30)), false),
  Message("Well, that seems like end of the conversation",
      DateTime.now().subtract(Duration(days: 20)), true),
  Message("That depends on the things you are up to",
      DateTime.now().subtract(Duration(days: 20)), false),
  Message("I just need some sleep",
      DateTime.now().subtract(Duration(minutes: 1)), true),
  Message("I wont let you sleep", DateTime.now().subtract(Duration(days: 3)),
      false),
  Message("I didn't ask for permission",
      DateTime.now().subtract(Duration(minutes: 1)), true),
  Message("I didn't say you did", DateTime.now().subtract(Duration(minutes: 1)),
      false),
  Message(
      "I knowwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww",
      DateTime.now().subtract(Duration(minutes: 1)),
      true),
  Message("Tell me any you dont know",
      DateTime.now().subtract(Duration(minutes: 1)), false),
  Message("range of orbit of the sun",
      DateTime.now().subtract(Duration(minutes: 1)), true),
  Message(
      "I dont think ı will make love with a man who doesn't even know the range of orbit of the sun",
      DateTime.now().subtract(Duration(minutes: 1)),
      false),
  Message("Then give me a sec ı will cry in my mom's basement then come back",
      DateTime.now().subtract(Duration(minutes: 1)), true),
  Message("HAHAHAH ", DateTime.now().subtract(Duration(minutes: 1)), false),
  Message("Someone is having so much fun ",
      DateTime.now().subtract(Duration(minutes: 1)), true),
  Message(" You lucky bastard caught me ",
      DateTime.now().subtract(Duration(minutes: 1)), false),
  Message("No", DateTime.now().subtract(Duration(minutes: 1)), true),
];

class Message {
  final String text;
  final DateTime date;
  final bool isSentByMe;

  Message(this.text, this.date, this.isSentByMe);

  
}
