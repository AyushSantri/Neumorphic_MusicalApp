class SongData {
  static List<SongDetail> songData = [];
}

class SongDetail {
  final int id;
  final String author;
  final String title;
  final String url;

  SongDetail(
      {required this.id,
      required this.author,
      required this.title,
      required this.url});

  factory SongDetail.fromMap(Map<String, dynamic> map) {
    return SongDetail(
        id: map['id'],
        author: map['author'],
        title: map['title'],
        url: map['url']);
  }

  toMap() => {
        "id": id,
        "author": author,
        "title": title,
        "url": url,
      };
}
