import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'message_bubble.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy(
            'createdAt',
            descending: true,
          )
          .snapshots(),
      builder: (BuildContext ctx, AsyncSnapshot<QuerySnapshot> chatSnapshot) {
        if (chatSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final chatDocs = chatSnapshot.data!.docs;
        return ListView.builder(
          reverse: true,
          itemCount: chatDocs.length,
          itemBuilder: (ctx, index) => MessageBubble(
            (chatDocs[index].data() as Map<String, dynamic>)['text'],
            (chatDocs[index].data() as Map<String, dynamic>)['username'],
            (chatDocs[index].data() as Map<String, dynamic>)['userImage'],
            (chatDocs[index].data() as Map<String, dynamic>)['userId'] ==
                user!.uid,
            key: ValueKey(chatDocs[index].id),
          ),
        );
      },
    );
  }
}
