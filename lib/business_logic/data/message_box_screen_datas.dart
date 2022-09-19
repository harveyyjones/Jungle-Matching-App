import 'package:chat_new/business_logic/model/user_model.dart';
import 'package:chat_new/business_logic/service/user_service.dart';

import '../../screens/messages/message_box_screen.dart';

class MessagesInfos {
  static List<UsersModelKisiler?>? users;

  static getInfos() {
    var service = UserService();
    service.fetchUsers().then((value) {
      users = value!.kisiler!;

      print("Mesaj  kutusundaki kısmındaki veriler alındı.");
      print(users);
      MessageScreen(
        users: [users],
      );
        return users;
    });
  }
}
