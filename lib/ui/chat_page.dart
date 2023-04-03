import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dicoding_chatting_firebase/ui/login_page.dart';
import 'package:dicoding_chatting_firebase/widgets/message_bubble.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  static const id = 'chat_page';

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  late User? _activeUser;
  final _messageTextController = TextEditingController();

  Future<void> getCurrentUser() async {
    try {
      _activeUser = _auth.currentUser;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  void dispose() {
    _messageTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Room'),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            tooltip: 'Logout',
            onPressed: () async {
              final navigator = Navigator.of(context);
              await _auth.signOut();
              await navigator.pushReplacementNamed(LoginPage.id);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: _firestore
                    .collection('messages')
                    .orderBy('dateCreated', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return ListView(
                      reverse: true,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 16,
                      ),
                      children: [
                        ...snapshot.data!.docs.map((document) {
                          final data = document.data();
                          final String messageText = data['text'];
                          final String messageSender = data['sender'];
                          return MessageBubble(
                            sender: messageSender,
                            text: messageText,
                            isMyChat: messageSender == _activeUser?.email,
                          );
                        }).toList(),
                      ],
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageTextController,
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                MaterialButton(
                  color: Theme.of(context).primaryColor,
                  textTheme: ButtonTextTheme.primary,
                  onPressed: () {
                    _firestore.collection('messages').add({
                      'text': _messageTextController.text,
                      'sender': _activeUser?.email,
                      'dateCreated': Timestamp.now(),
                    });
                    _messageTextController.clear();
                  },
                  child: const Text('SEND'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
