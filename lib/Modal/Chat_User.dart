class ChatUser{

  ChatUser ({
    required this.image,
    required this.about,
    required this.name,
    required this.createdAt,
    required this.isOnline,
    required this.id,
    required this.lastActive,
    required this.email,
    required this.PushToken,

});
  String? image;
  String? about;
  String? name;
  String? createdAt;
  String? isOnline;
  String? id;
  String? lastActive;
  String? email;
  String? PushToken;

ChatUser.fromJson(Map<String,dynamic>json){
  about = json['about'] ?? '';
  image=json['image']??'';
  about=json['name']??'';
  createdAt=json['createdAt']??'';
  isOnline=json['isOnline']??'';
  id=json['id']??'';
  lastActive=json['lastActive']??'';
  email=json['email']??'';
  PushToken=json['PushToken']??'';

}

Map<String,dynamic> toJSon(){
  final data =<String,dynamic> {};
  data["image"]=image;
  data["about"]=about;
  data["name"]=name;
  data["createdAt"]=createdAt;
  data["isOnline"]=isOnline;
  data["id"]=id;
  data["lastActive"]=lastActive;
  data["email"]=email;
  data["PushToken"]=PushToken;
  return data;
}
}