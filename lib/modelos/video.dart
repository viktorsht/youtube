class Video {
  String? id="";
  String? title="";
  String? img="";
  String? canal="";
  String? descricao="";
  Video({this.id,this.title,this.img,this.canal, this.descricao});
  /*
  static converterJson(Map<String, dynamic> json){
    return Video(
      id: json["id"]["videoId"],
      title: json["snippet"]["title"],
      img: json["snippet"]["thumbnails"]["high"]["url"],
      canal: json["snippet"]["channelId"],
      descricao: json["snippet"]["description"],
    );
  }*/
  factory Video.fromJson(Map<String, dynamic> json){
    return Video(
      id: json["id"]["videoId"],
      title: json["snippet"]["title"],
      img: json["snippet"]["thumbnails"]["high"]["url"],
      canal: json["snippet"]["channelId"],
      descricao: json["snippet"]["description"],
    );
  }
}