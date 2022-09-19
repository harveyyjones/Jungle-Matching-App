import 'package:chat_new/business_logic/model/message_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessageMenager extends StateNotifier<Message> {
  MessageMenager() : super(Message("", DateTime.now(), true));

  sendMessage(messageWantedToBeSent) {
    Message messageSentByMe =
        Message(messageWantedToBeSent, DateTime.now(), true);

//      textController.clear();

    print(state);
    
    return messageSentByMe;
  }
}
