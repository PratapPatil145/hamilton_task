import 'package:flutter/cupertino.dart';

class RestaurantModel {
  String? message;
  String? currentpage;
  int? pagelimit;
  int? count;
  List<Data>? data;
  bool? status;

  RestaurantModel(
      {this.message,
      this.currentpage,
      this.pagelimit,
      this.count,
      this.data,
      this.status});

  RestaurantModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    currentpage = json['currentpage'];
    pagelimit = json['pagelimit'];
    count = json['count'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['currentpage'] = this.currentpage;
    data['pagelimit'] = this.pagelimit;
    data['count'] = this.count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Data {
  int? id;
  String? nameEn;
  String? nameAr;
  int? parentID;
  bool? isFull;
  bool? isOpen;
  int? maxQueue;
  dynamic longitude;
  dynamic latitude;
  bool? isActive;
  String? expiredDate;
  String? creadteDate;
  int? areaId;
  int? createdUser;
  String? address;
  String? maxGroup;
  String? openHour;
  String? closeHour;
  int? accountType;
  String? savedTime;
  String? logo;
  bool? manualOpen;
  bool? manualFull;
  String? qrCode;
  int? orderId;
  double? rating;
  Null? tablesOptions;
  int? reviews;
  Null? phone;
  int? status;
  Null? insideActive;
  Null? outsideActive;
  bool? isOpenManual;
  Null? insideFull;
  Null? outsideFull;
  Null? maxInside;
  Null? maxOutside;
  int? qTime;
  bool? userHold;
  int? countryID;
  Null? cancelReasonRequired;
  String? realTimeChannel;
  int? branchOrderID;
  bool? preOrder;
  String? conditionsEn;
  String? conditionsAr;
  int? queueCost;
  bool? fastTrackEnabled;
  bool? requiredTurnUpgrade;
  int? lilouNotificationNumber;
  String? lilouNotificationMessageEn;
  String? lilouNotificationMessageAr;
  bool? allowFullListAccess;
  String? lilouCustomMessageEn;
  String? lilouCustomMessageAr;
  bool? enableQueueTags;
  bool? requiredTickets;
  bool? onlyWalkIn;
  int? vendorCategory;
  bool? pickupAvailable;
  bool? queueAvailable;
  int? serviceCharges;
  int? vat;
  int? pickupCustomerFees;
  Null? kioskIsFull;
  Null? kioskInsideFull;
  Null? kioskOutsideFull;
  Null? branchMinQ;
  Null? insideMinQ;
  Null? outsideMinQ;
  int? branchCount;
  String? foodTypeEN;
  String? foodTypeAr;

  Data(
      {this.id,
      this.nameEn,
      this.nameAr,
      this.parentID,
      this.isFull,
      this.isOpen,
      this.maxQueue,
      this.longitude,
      this.latitude,
      this.isActive,
      this.expiredDate,
      this.creadteDate,
      this.areaId,
      this.createdUser,
      this.address,
      this.maxGroup,
      this.openHour,
      this.closeHour,
      this.accountType,
      this.savedTime,
      this.logo,
      this.manualOpen,
      this.manualFull,
      this.qrCode,
      this.orderId,
      this.rating,
      this.tablesOptions,
      this.reviews,
      this.phone,
      this.status,
      this.insideActive,
      this.outsideActive,
      this.isOpenManual,
      this.insideFull,
      this.outsideFull,
      this.maxInside,
      this.maxOutside,
      this.qTime,
      this.userHold,
      this.countryID,
      this.cancelReasonRequired,
      this.realTimeChannel,
      this.branchOrderID,
      this.preOrder,
      this.conditionsEn,
      this.conditionsAr,
      this.queueCost,
      this.fastTrackEnabled,
      this.requiredTurnUpgrade,
      this.lilouNotificationNumber,
      this.lilouNotificationMessageEn,
      this.lilouNotificationMessageAr,
      this.allowFullListAccess,
      this.lilouCustomMessageEn,
      this.lilouCustomMessageAr,
      this.enableQueueTags,
      this.requiredTickets,
      this.onlyWalkIn,
      this.vendorCategory,
      this.pickupAvailable,
      this.queueAvailable,
      this.serviceCharges,
      this.vat,
      this.pickupCustomerFees,
      this.kioskIsFull,
      this.kioskInsideFull,
      this.kioskOutsideFull,
      this.branchMinQ,
      this.insideMinQ,
      this.outsideMinQ,
      this.branchCount,
      this.foodTypeEN,
      this.foodTypeAr});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    parentID = json['parentID'];
    isFull = json['isFull'];
    isOpen = json['isOpen'];
    maxQueue = json['maxQueue'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    isActive = json['isActive'];
    expiredDate = json['expiredDate'];
    creadteDate = json['creadteDate'];
    areaId = json['areaId'];
    createdUser = json['createdUser'];
    address = json['address'];
    maxGroup = json['maxGroup'];
    openHour = json['openHour'];
    closeHour = json['closeHour'];
    accountType = json['accountType'];
    savedTime = json['savedTime'];
    logo = json['logo'];
    manualOpen = json['manualOpen'];
    manualFull = json['manualFull'];
    qrCode = json['qrCode'];
    orderId = json['orderId'];
    rating = json['rating'];
    tablesOptions = json['tablesOptions'];
    reviews = json['reviews'];
    phone = json['phone'];
    status = json['status'];
    insideActive = json['insideActive'];
    outsideActive = json['outsideActive'];
    isOpenManual = json['isOpenManual'];
    insideFull = json['insideFull'];
    outsideFull = json['outsideFull'];
    maxInside = json['maxInside'];
    maxOutside = json['maxOutside'];
    qTime = json['qTime'];
    userHold = json['userHold'];
    countryID = json['countryID'];
    cancelReasonRequired = json['cancelReasonRequired'];
    realTimeChannel = json['realTimeChannel'];
    branchOrderID = json['branchOrderID'];
    preOrder = json['preOrder'];
    conditionsEn = json['conditionsEn'];
    conditionsAr = json['conditionsAr'];
    queueCost = json['QueueCost'];
    fastTrackEnabled = json['FastTrackEnabled'];
    requiredTurnUpgrade = json['RequiredTurnUpgrade'];
    lilouNotificationNumber = json['LilouNotificationNumber'];
    lilouNotificationMessageEn = json['LilouNotificationMessageEn'];
    lilouNotificationMessageAr = json['LilouNotificationMessageAr'];
    allowFullListAccess = json['AllowFullListAccess'];
    lilouCustomMessageEn = json['LilouCustomMessageEn'];
    lilouCustomMessageAr = json['LilouCustomMessageAr'];
    enableQueueTags = json['EnableQueueTags'];
    requiredTickets = json['RequiredTickets'];
    onlyWalkIn = json['OnlyWalkIn'];
    vendorCategory = json['VendorCategory'];
    pickupAvailable = json['PickupAvailable'];
    queueAvailable = json['QueueAvailable'];
    serviceCharges = json['ServiceCharges'];
    vat = json['Vat'];
    pickupCustomerFees = json['PickupCustomerFees'];
    kioskIsFull = json['KioskIsFull'];
    kioskInsideFull = json['KioskInsideFull'];
    kioskOutsideFull = json['KioskOutsideFull'];
    branchMinQ = json['BranchMinQ'];
    insideMinQ = json['InsideMinQ'];
    outsideMinQ = json['OutsideMinQ'];
    branchCount = json['branchCount'];
    foodTypeEN = json['foodTypeEN'];
    foodTypeAr = json['foodTypeAr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    data['parentID'] = this.parentID;
    data['isFull'] = this.isFull;
    data['isOpen'] = this.isOpen;
    data['maxQueue'] = this.maxQueue;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['isActive'] = this.isActive;
    data['expiredDate'] = this.expiredDate;
    data['creadteDate'] = this.creadteDate;
    data['areaId'] = this.areaId;
    data['createdUser'] = this.createdUser;
    data['address'] = this.address;
    data['maxGroup'] = this.maxGroup;
    data['openHour'] = this.openHour;
    data['closeHour'] = this.closeHour;
    data['accountType'] = this.accountType;
    data['savedTime'] = this.savedTime;
    data['logo'] = this.logo;
    data['manualOpen'] = this.manualOpen;
    data['manualFull'] = this.manualFull;
    data['qrCode'] = this.qrCode;
    data['orderId'] = this.orderId;
    data['rating'] = this.rating;
    data['tablesOptions'] = this.tablesOptions;
    data['reviews'] = this.reviews;
    data['phone'] = this.phone;
    data['status'] = this.status;
    data['insideActive'] = this.insideActive;
    data['outsideActive'] = this.outsideActive;
    data['isOpenManual'] = this.isOpenManual;
    data['insideFull'] = this.insideFull;
    data['outsideFull'] = this.outsideFull;
    data['maxInside'] = this.maxInside;
    data['maxOutside'] = this.maxOutside;
    data['qTime'] = this.qTime;
    data['userHold'] = this.userHold;
    data['countryID'] = this.countryID;
    data['cancelReasonRequired'] = this.cancelReasonRequired;
    data['realTimeChannel'] = this.realTimeChannel;
    data['branchOrderID'] = this.branchOrderID;
    data['preOrder'] = this.preOrder;
    data['conditionsEn'] = this.conditionsEn;
    data['conditionsAr'] = this.conditionsAr;
    data['QueueCost'] = this.queueCost;
    data['FastTrackEnabled'] = this.fastTrackEnabled;
    data['RequiredTurnUpgrade'] = this.requiredTurnUpgrade;
    data['LilouNotificationNumber'] = this.lilouNotificationNumber;
    data['LilouNotificationMessageEn'] = this.lilouNotificationMessageEn;
    data['LilouNotificationMessageAr'] = this.lilouNotificationMessageAr;
    data['AllowFullListAccess'] = this.allowFullListAccess;
    data['LilouCustomMessageEn'] = this.lilouCustomMessageEn;
    data['LilouCustomMessageAr'] = this.lilouCustomMessageAr;
    data['EnableQueueTags'] = this.enableQueueTags;
    data['RequiredTickets'] = this.requiredTickets;
    data['OnlyWalkIn'] = this.onlyWalkIn;
    data['VendorCategory'] = this.vendorCategory;
    data['PickupAvailable'] = this.pickupAvailable;
    data['QueueAvailable'] = this.queueAvailable;
    data['ServiceCharges'] = this.serviceCharges;
    data['Vat'] = this.vat;
    data['PickupCustomerFees'] = this.pickupCustomerFees;
    data['KioskIsFull'] = this.kioskIsFull;
    data['KioskInsideFull'] = this.kioskInsideFull;
    data['KioskOutsideFull'] = this.kioskOutsideFull;
    data['BranchMinQ'] = this.branchMinQ;
    data['InsideMinQ'] = this.insideMinQ;
    data['OutsideMinQ'] = this.outsideMinQ;
    data['branchCount'] = this.branchCount;
    data['foodTypeEN'] = this.foodTypeEN;
    data['foodTypeAr'] = this.foodTypeAr;
    return data;
  }
}
