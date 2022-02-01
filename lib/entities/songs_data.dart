class SongData {
  List<SongDetail> songData = [];
}

class SongDetail {
  int id;
  String author;
  String title;
  String url;

  SongDetail(this.id, this.author, this.title, this.url);
}
