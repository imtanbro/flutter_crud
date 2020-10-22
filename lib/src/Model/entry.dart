class Entry {
  final String uid;
  final String date;
  final String entry;

  Entry({this.date, this.entry, this.uid});
  factory Entry.fromJson(Map<String, dynamic> json) {
    return Entry(
      date: json['date'],
      entry: json['entry'],
      uid: json['entryId'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "date": date,
      "entry": entry,
      "entryId": uid,
    };
  }
}
