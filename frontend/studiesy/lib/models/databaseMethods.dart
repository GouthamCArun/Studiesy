import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseMethods {
  FirebaseFirestore db = FirebaseFirestore.instance;

  getNotes() async {
    return db.collection('Notes').snapshots();
  }

  updateNotes(String subject, String transcribe) async {
    QuerySnapshot snapshotUserInfo;
    await db
        .collection('Notes')
        .where('name', isEqualTo: subject)
        .get()
        .then((value) => {
              snapshotUserInfo = value,
              print(snapshotUserInfo.docs[0].data().toString()),
              db
                  .collection('Notes')
                  .doc(subject)
                  .update({'transcribe': transcribe}),
            });
    String url = 'https://ihrd1-production.up.railway.app//summary';
    final result = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "subject": subject,
      }),
    );
 if (result.statusCode == 200) {
      // If the server did return a 201 CREATED result,
      // then parse the JSON.
      print(jsonDecode(result.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album');
    }
  }

  getConversationMessage(String chatRoomId) async {
    return FirebaseFirestore.instance
        .collection('chatroom')
        .doc(chatRoomId)
        .collection('chats')
        .orderBy("time", descending: true)
        .snapshots();
  }

  addConversationMessage(
      String chatRoomId, messageMap, question, subject) async {
    FirebaseFirestore.instance
        .collection('chatroom')
        .doc(chatRoomId)
        .collection('chats')
        .add(messageMap)
        .catchError((e) {
      print(e.toString());
    });

    Future.delayed(const Duration(seconds: 10));

    final response = await http.post(
      Uri.parse('https://web-production-4ed5.up.railway.app/bot'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "question": question,
        "subject": subject,
        "time": DateTime.now().millisecondsSinceEpoch
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      print(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album');
    }
  }
  fetchAudio(){
    
  }
}
