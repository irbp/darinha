class Location {
  final int start;
  final int end;
  final String filename;

  Location({
    required this.start,
    required this.end,
    required this.filename,
  });

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      start: map['start'],
      end: map['end'],
      filename: map['filename'],
    );
  }
}
