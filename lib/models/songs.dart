class Songs{
  final String songName;
  final String artistName;
  final String songImage;
  final String audioPath;
  int index;

  Songs({
    required this.songName, 
    required this.artistName, 
    required this.songImage, 
    required this.audioPath,
    this.index = 0
    });
  factory Songs.fromJson(Map<String, dynamic> json) {
    return Songs(
      songName: json['songName'],
      artistName: json['artistName'],
      songImage: json['songImage'],
      audioPath: json['audioPath'],
      index: json['index'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'songName': songName,
      'artistName': artistName,
      'songImage': songImage,
      'audioPath': audioPath,
      'index': index
    };
  }

}