import 'package:flutter_base_structure/features/models/login/rest_day.dart';

class Data {
  int? userId;
  String? trainerId;
  String? suggesticId;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? emailVerificationStatus;
  String? address;
  String? biography;
  String? dateOfBirth;
  String? gender;
  String? role;
  String? country;
  String? city;
  String? googleId;
  String? appleId;
  String? socialFlag;
  String? avtar;
  String? currentWeight;
  String? goalWeight;
  String? height;
  String? weeklyGoal;
  String? weightUnit;
  String? heightUnit;
  int? subscriptionPlan;
  int? nutritionPlan;
  String? status;

  // List<Null>? homePlan;
  RestDay? restDay;
  String? billingAddress;
  String? billingCountry;
  String? billingCountryCode;
  String? billingCity;
  String? createdAt;
  String? updatedAt;
  String? token;
  int? nutProgrammeStatus;

  Data(
      {this.userId,
      this.trainerId,
      this.suggesticId,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.email,
      this.emailVerificationStatus,
      this.address,
      this.biography,
      this.dateOfBirth,
      this.gender,
      this.role,
      this.country,
      this.city,
      this.googleId,
      this.appleId,
      this.socialFlag,
      this.avtar,
      this.currentWeight,
      this.goalWeight,
      this.height,
      this.weeklyGoal,
      this.weightUnit,
      this.heightUnit,
      this.subscriptionPlan,
      this.nutritionPlan,
      this.status,
      // this.homePlan,
      this.restDay,
      this.billingAddress,
      this.billingCountry,
      this.billingCountryCode,
      this.billingCity,
      this.createdAt,
      this.updatedAt,
      this.token,
      this.nutProgrammeStatus});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    trainerId = json['trainerId'];
    suggesticId = json['suggesticId'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    emailVerificationStatus = json['email_verification_status'];
    address = json['address'];
    biography = json['biography'];
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
    role = json['role'];
    country = json['country'];
    city = json['city'];
    googleId = json['google_id'];
    appleId = json['apple_id'];
    socialFlag = json['social_flag'];
    avtar = json['avtar'];
    currentWeight = json['current_weight'];
    goalWeight = json['goal_weight'];
    height = json['height'];
    weeklyGoal = json['weekly_goal'];
    weightUnit = json['weight_unit'];
    heightUnit = json['height_unit'];
    subscriptionPlan = json['subscriptionPlan'];
    nutritionPlan = json['nutritionPlan'];
    status = json['status'];
    // if (json['homePlan'] != null) {
    //   homePlan = <Null>[];
    //   json['homePlan'].forEach((v) {
    //     homePlan!.add(Null.fromJson(v));
    //   });
    // }
    restDay = json['restDay'] != null ? RestDay.fromJson(json['restDay']) : null;
    billingAddress = json['billingAddress'];
    billingCountry = json['billingCountry'];
    billingCountryCode = json['billingCountryCode'];
    billingCity = json['billingCity'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    token = json['token'];
    nutProgrammeStatus = json['nutProgrammeStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['trainerId'] = trainerId;
    data['suggesticId'] = suggesticId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone_number'] = phoneNumber;
    data['email'] = email;
    data['email_verification_status'] = emailVerificationStatus;
    data['address'] = address;
    data['biography'] = biography;
    data['date_of_birth'] = dateOfBirth;
    data['gender'] = gender;
    data['role'] = role;
    data['country'] = country;
    data['city'] = city;
    data['google_id'] = googleId;
    data['apple_id'] = appleId;
    data['social_flag'] = socialFlag;
    data['avtar'] = avtar;
    data['current_weight'] = currentWeight;
    data['goal_weight'] = goalWeight;
    data['height'] = height;
    data['weekly_goal'] = weeklyGoal;
    data['weight_unit'] = weightUnit;
    data['height_unit'] = heightUnit;
    data['subscriptionPlan'] = subscriptionPlan;
    data['nutritionPlan'] = nutritionPlan;
    data['status'] = status;
    // if (homePlan != null) {
    //   data['homePlan'] = homePlan!.map((v) => v.toJson()).toList();
    // }
    if (restDay != null) {
      data['restDay'] = restDay!.toJson();
    }
    data['billingAddress'] = billingAddress;
    data['billingCountry'] = billingCountry;
    data['billingCountryCode'] = billingCountryCode;
    data['billingCity'] = billingCity;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['token'] = token;
    data['nutProgrammeStatus'] = nutProgrammeStatus;
    return data;
  }
}
