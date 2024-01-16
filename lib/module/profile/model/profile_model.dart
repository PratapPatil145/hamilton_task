class ProfileModel {
  String? message;
  bool? success;
  List<Data>? data;

  ProfileModel({this.message, this.success, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? clientId;
  String? clientName;
  String? clientPhone;
  String? createdDate;
  bool? clientStatus;
  int? clientGender;
  String? password;
  String? mail;
  Null? birthDate;
  int? points;
  String? longitude;
  String? latitude;
  int? country;
  String? savedTime;
  int? createdMethod;
  int? userId;
  int? restId;
  String? lastSeen;
  Null? avatar;
  int? activationStep;
  int? walletBalance;
  String? realTimeChannel;
  int? freeQueue;
  int? subscription;
  String? subscriptionExpiredOn;
  int? totalQueue;
  bool? addedFreeQueue;
  Null? loginPassword;
  bool? hasApp;
  Null? oTP;
  Null? online;
  Null? providerId;
  Null? id;
  Null? userid;
  Null? username;
  Null? bio;
  int? countryId;
  String? countryName;
  bool? countryStatus;
  String? countryCode;
  String? countryCurancy;
  String? countryNameAr;
  String? flag;
  bool? restActive;
  int? length;
  String? prefix;
  String? shortCode;
  Null? ticketActive;
  Null? region;
  List<Setting>? setting;
  Connections? connections;
  Connections? userconnections;
  Followlist? followlist;

  Data(
      {this.clientId,
      this.clientName,
      this.clientPhone,
      this.createdDate,
      this.clientStatus,
      this.clientGender,
      this.password,
      this.mail,
      this.birthDate,
      this.points,
      this.longitude,
      this.latitude,
      this.country,
      this.savedTime,
      this.createdMethod,
      this.userId,
      this.restId,
      this.lastSeen,
      this.avatar,
      this.activationStep,
      this.walletBalance,
      this.realTimeChannel,
      this.freeQueue,
      this.subscription,
      this.subscriptionExpiredOn,
      this.totalQueue,
      this.addedFreeQueue,
      this.loginPassword,
      this.hasApp,
      this.oTP,
      this.online,
      this.providerId,
      this.id,
      this.userid,
      this.username,
      this.bio,
      this.countryId,
      this.countryName,
      this.countryStatus,
      this.countryCode,
      this.countryCurancy,
      this.countryNameAr,
      this.flag,
      this.restActive,
      this.length,
      this.prefix,
      this.shortCode,
      this.ticketActive,
      this.region,
      this.setting,
      this.connections,
      this.userconnections,
      this.followlist});

  Data.fromJson(Map<String, dynamic> json) {
    clientId = json['client_id'];
    clientName = json['client_name'];
    clientPhone = json['client_phone'];
    createdDate = json['created_date'];
    clientStatus = json['client_status'];
    clientGender = json['client_gender'];
    password = json['password'];
    mail = json['mail'];
    birthDate = json['birthDate'];
    points = json['points'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    country = json['country'];
    savedTime = json['savedTime'];
    createdMethod = json['createdMethod'];
    userId = json['userId'];
    restId = json['restId'];
    lastSeen = json['lastSeen'];
    avatar = json['avatar'];
    activationStep = json['activationStep'];
    walletBalance = json['walletBalance'];
    realTimeChannel = json['realTimeChannel'];
    freeQueue = json['freeQueue'];
    subscription = json['subscription'];
    subscriptionExpiredOn = json['subscriptionExpiredOn'];
    totalQueue = json['totalQueue'];
    addedFreeQueue = json['AddedFreeQueue'];
    loginPassword = json['LoginPassword'];
    hasApp = json['hasApp'];
    oTP = json['OTP'];
    online = json['online'];
    providerId = json['providerId'];
    id = json['id'];
    userid = json['Userid'];
    username = json['Username'];
    bio = json['Bio'];
    countryId = json['country_id'];
    countryName = json['country_name'];
    countryStatus = json['country_status'];
    countryCode = json['country_code'];
    countryCurancy = json['country_curancy'];
    countryNameAr = json['country_name_ar'];
    flag = json['flag'];
    restActive = json['restActive'];
    length = json['length'];
    prefix = json['prefix'];
    shortCode = json['shortCode'];
    ticketActive = json['ticketActive'];
    region = json['region'];
    if (json['setting'] != null) {
      setting = <Setting>[];
      json['setting'].forEach((v) {
        setting!.add(new Setting.fromJson(v));
      });
    }
    connections = json['connections'] != null
        ? new Connections.fromJson(json['connections'])
        : null;
    userconnections = json['userconnections'] != null
        ? new Connections.fromJson(json['userconnections'])
        : null;
    followlist = json['followlist'] != null
        ? new Followlist.fromJson(json['followlist'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['client_id'] = this.clientId;
    data['client_name'] = this.clientName;
    data['client_phone'] = this.clientPhone;
    data['created_date'] = this.createdDate;
    data['client_status'] = this.clientStatus;
    data['client_gender'] = this.clientGender;
    data['password'] = this.password;
    data['mail'] = this.mail;
    data['birthDate'] = this.birthDate;
    data['points'] = this.points;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['country'] = this.country;
    data['savedTime'] = this.savedTime;
    data['createdMethod'] = this.createdMethod;
    data['userId'] = this.userId;
    data['restId'] = this.restId;
    data['lastSeen'] = this.lastSeen;
    data['avatar'] = this.avatar;
    data['activationStep'] = this.activationStep;
    data['walletBalance'] = this.walletBalance;
    data['realTimeChannel'] = this.realTimeChannel;
    data['freeQueue'] = this.freeQueue;
    data['subscription'] = this.subscription;
    data['subscriptionExpiredOn'] = this.subscriptionExpiredOn;
    data['totalQueue'] = this.totalQueue;
    data['AddedFreeQueue'] = this.addedFreeQueue;
    data['LoginPassword'] = this.loginPassword;
    data['hasApp'] = this.hasApp;
    data['OTP'] = this.oTP;
    data['online'] = this.online;
    data['providerId'] = this.providerId;
    data['id'] = this.id;
    data['Userid'] = this.userid;
    data['Username'] = this.username;
    data['Bio'] = this.bio;
    data['country_id'] = this.countryId;
    data['country_name'] = this.countryName;
    data['country_status'] = this.countryStatus;
    data['country_code'] = this.countryCode;
    data['country_curancy'] = this.countryCurancy;
    data['country_name_ar'] = this.countryNameAr;
    data['flag'] = this.flag;
    data['restActive'] = this.restActive;
    data['length'] = this.length;
    data['prefix'] = this.prefix;
    data['shortCode'] = this.shortCode;
    data['ticketActive'] = this.ticketActive;
    data['region'] = this.region;
    if (this.setting != null) {
      data['setting'] = this.setting!.map((v) => v.toJson()).toList();
    }
    if (this.connections != null) {
      data['connections'] = this.connections!.toJson();
    }
    if (this.userconnections != null) {
      data['userconnections'] = this.userconnections!.toJson();
    }
    if (this.followlist != null) {
      data['followlist'] = this.followlist!.toJson();
    }
    return data;
  }
}

class Setting {
  int? id;
  String? country;
  String? language;
  int? termOfCondition;
  int? chatMessages;
  int? notificationSound;
  int? profilePrivate;
  int? queueVisible;
  int? myOrder;
  int? seated;
  int? chatPrivicy;
  int? commentFromAnyone;
  int? notification;
  int? userID;

  Setting(
      {this.id,
      this.country,
      this.language,
      this.termOfCondition,
      this.chatMessages,
      this.notificationSound,
      this.profilePrivate,
      this.queueVisible,
      this.myOrder,
      this.seated,
      this.chatPrivicy,
      this.commentFromAnyone,
      this.notification,
      this.userID});

  Setting.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    country = json['Country'];
    language = json['language'];
    termOfCondition = json['Term_Of_Condition'];
    chatMessages = json['Chat_Messages'];
    notificationSound = json['Notification_Sound'];
    profilePrivate = json['Profile_Private'];
    queueVisible = json['Queue_visible'];
    myOrder = json['my_Order'];
    seated = json['Seated'];
    chatPrivicy = json['Chat_Privicy'];
    commentFromAnyone = json['Comment_From_Anyone'];
    notification = json['Notification'];
    userID = json['UserID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Country'] = this.country;
    data['language'] = this.language;
    data['Term_Of_Condition'] = this.termOfCondition;
    data['Chat_Messages'] = this.chatMessages;
    data['Notification_Sound'] = this.notificationSound;
    data['Profile_Private'] = this.profilePrivate;
    data['Queue_visible'] = this.queueVisible;
    data['my_Order'] = this.myOrder;
    data['Seated'] = this.seated;
    data['Chat_Privicy'] = this.chatPrivicy;
    data['Comment_From_Anyone'] = this.commentFromAnyone;
    data['Notification'] = this.notification;
    data['UserID'] = this.userID;
    return data;
  }
}

class Connections {
  int? followList;
  int? blockList;
  int? muteList;

  Connections({this.followList, this.blockList, this.muteList});

  Connections.fromJson(Map<String, dynamic> json) {
    followList = json['follow_list'];
    blockList = json['block_list'];
    muteList = json['mute_list'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['follow_list'] = this.followList;
    data['block_list'] = this.blockList;
    data['mute_list'] = this.muteList;
    return data;
  }
}

class Followlist {
  int? following;
  int? follower;

  Followlist({this.following, this.follower});

  Followlist.fromJson(Map<String, dynamic> json) {
    following = json['following'];
    follower = json['follower'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['following'] = this.following;
    data['follower'] = this.follower;
    return data;
  }
}