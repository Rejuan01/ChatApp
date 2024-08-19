class UserModel {
  late String image;
  late String about;
  late String name;
  late final String createdAt;
  late bool isOnline;
  late final String id;
  late final String pushToken;
  late final String lastActive;
  late final String email;

  UserModel({
    required this.id,
    required this.name,
    required this.about,
    required this.email,
    required this.image,
    required this.createdAt,
    required this.isOnline,
    required this.pushToken,
    required this.lastActive,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    image = json['image'] ?? '';
    about = json['about'] ?? '';
    name = json['name'] ?? '';
    createdAt = json['created_at'] ?? '';
    isOnline = json['is_online'] ?? '';
    id = json['id'] ?? '';
    pushToken = json['push_token '] ?? '';
    lastActive = json['last_active'] ?? '';
    email = json['email'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image'] = image;
    data['about'] = about;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['is_online'] = isOnline;
    data['id'] = id;
    data['push_token '] = pushToken;
    data['last_active'] = lastActive;
    data['email'] = email;
    return data;
  }
}
