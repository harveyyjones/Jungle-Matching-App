import 'package:flutter_riverpod/flutter_riverpod.dart';

class SharedStories {
  final storyProvider = Provider<List>((ref) {
    return sharedStories;
  });
  // Kullanıcıların paylaştıkları storyler.
}

List sharedStories = [
  [
    "assets/selfieforstory.jpg",
    "assets/selfieforstory2.jpg",
    "assets/selfieforstory3.jpg"
  ],
  [
    "assets/selfieforstory.jpg",
    "assets/selfieforstory2.jpg",
    "assets/selfieforstory3.jpg"
  ],
  [
    "assets/selfieforstory.jpg",
    "assets/selfieforstory3.jpg",
    "assets/selfieforstory2.jpg"
  ],
];
