class Event {
  static const String collectionName = 'Events';
  String id;
  String title;
  String description;
  String eventImage;
  String eventName;
  DateTime eventDateTime;
  String eventTime;
  bool isFavorite;

  Event({
    this.id = '',
    required this.title,
    required this.description,
    required this.eventImage,
    required this.eventName,
    required this.eventDateTime,
    required this.eventTime,
    this.isFavorite = false,
  });

  Event.fromJasonFireStore(Map<String, dynamic> data)
    : this(
        id: data['id'],
        title: data['title'],
        description: data['description'],
        eventImage: data['eventImage'],
        eventName: data['eventName'],
        eventDateTime: DateTime.fromMillisecondsSinceEpoch(
          data['eventDateTime'],
        ),
        eventTime: data['eventTime'],
        isFavorite: data['isFavorite'],
      );

  Map<String, dynamic> toJasonFireStore() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'eventImage': eventImage,
      'eventName': eventName,
      'eventDateTime': eventDateTime.millisecondsSinceEpoch,
      'eventTime': eventTime,
      'isFavorite': isFavorite,
    };
  }
}
