import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/model/event.dart';
import 'package:evently/model/my_user.dart';

class FirebaseUtils {

  static CollectionReference<MyUser> getUserCollection() {
    return FirebaseFirestore.instance
        .collection(MyUser.collectionName)
        .withConverter<MyUser>(
      fromFirestore: (snapshot, options) =>
          MyUser.fromFireStore(snapshot.data()!),
      toFirestore: (user, options) => user.toFireStore(),
    );
  }

  static CollectionReference<Event> getEventCollection(String uId) {
    return getUserCollection()
        .doc(uId)
        .collection(Event.collectionName)
        .withConverter<Event>(
      fromFirestore: (snapshot, options) =>
          Event.fromJasonFireStore(snapshot.data()!),
      toFirestore: (event, options) => event.toJasonFireStore(),
    );
  }

  static Future<void> addEventToFireStore(Event event, String uId) {
    CollectionReference<Event> collectionRef = getEventCollection(uId);
    DocumentReference<Event> docRef = collectionRef.doc();
    event.id = docRef.id;
    return docRef.set(event);
  }

  static Future<void> deleteEventFromFireStore(String eventId,
      String uId) async {
    await getEventCollection(uId).doc(eventId).delete();
  }

  static Future<List<Event>> getEventsForUser(String uId) async {
    QuerySnapshot<Event> snap = await getEventCollection(uId).get();
    return snap.docs.map((doc) => doc.data()).toList();
  }

  static Future<void> addUserToFireStore(MyUser myUser) {
    return getUserCollection().doc(myUser.id).set(myUser);
  }

  static Future<MyUser?> readUserFromFireStore(String id) async {
    var querySnapShot = await getUserCollection().doc(id).get();
    return querySnapShot.data();
  }
}
