class UserModel {
  final String? name;
  final String? image;
  final String? song;
  final String? location;
  final bool? isUser;

  UserModel({this.isUser, this.name, this.image, this.song, this.location});

  factory UserModel.fromJson(Map<String, String> json) {
    return UserModel(
      isUser: (json['isUser'])?.isNotEmpty,
      image: json['image'],
      location: json['location'],
      name: json['name'],
      song: json['song'],
    );
  }
}
