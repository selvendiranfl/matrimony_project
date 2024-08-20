class ProfileModel {
  String? name;
  String? gender;
  String? dob;
  String? religion;
  String? motherTongue;
  String? number;
  String? mailId;
  String? password;
  String? maritalStatus;
  String? caste;
  String? subCaste;
  String? dhosham;
  String? marryOtherCommunity;
  String? countryLiving;
  String? state;
  String? city;
  String? height;
  String? physicalStatus;
  String? education;
  String? occupation;
  String? currencyType;
  String? annualIncome;
  String? familyType;
  String? familyValue;
  String? ancestralValues;
  String? aboutMyself;
  String? createdFor;
  String? UiId; // New field
  String? bodyType;
  String? profilePic;
  String? eatingHabit;
  String? drinking;
  String? smoking;
  String? gothra;
  String? zodiac;
  String? star;
  String? raasi;
  String? college;
  String? occupationDetail;
  String? organization;
  String? fatherOccupation;
  String? motherOccupation;
  String? brothers;
  String? brothersMarried;
  String? sisters;
  String? sistersMarried;
  String? aboutMyFamily;
  String? hobbiesInterests;
  String? viewsOnEqualRelationship;
  String? ancestralorigin;

  ProfileModel({
    this.name,
    this.gender,
    this.dob,
    this.religion,
    this.motherTongue,
    this.number,
    this.mailId,
    this.password,
    this.maritalStatus,
    this.caste,
    this.subCaste,
    this.dhosham,
    this.marryOtherCommunity,
    this.countryLiving,
    this.state,
    this.city,
    this.height,
    this.physicalStatus,
    this.education,
    this.occupation,
    this.currencyType,
    this.annualIncome,
    this.familyType,
    this.familyValue,
    this.ancestralValues,
    this.aboutMyself,
    this.createdFor,
    this.UiId, // New field
    this.bodyType,
    this.profilePic,
    this.eatingHabit,
    this.drinking,
    this.smoking,
    this.gothra,
    this.zodiac,
    this.star,
    this.raasi,
    this.college,
    this.occupationDetail,
    this.organization,
    this.fatherOccupation,
    this.motherOccupation,
    this.brothers,
    this.brothersMarried,
    this.sisters,
    this.sistersMarried,
    this.aboutMyFamily,
    this.hobbiesInterests,
    this.viewsOnEqualRelationship,
    this.ancestralorigin,
  });

  ProfileModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    gender = json['gender'];
    dob = json['dob'];
    religion = json['religion'];
    motherTongue = json['mother_tongue'];
    number = json['number'];
    mailId = json['mail_id'];
    password = json['password'];
    maritalStatus = json['marital_status'];
    caste = json['caste'];
    subCaste = json['sub_caste'];
    dhosham = json['dhosham'];
    marryOtherCommunity = json['marry_other_community'];
    countryLiving = json['country_living'];
    state = json['state'];
    city = json['city'];
    height = json['height'];
    physicalStatus = json['physical_status'];
    education = json['education'];
    occupation = json['occupation'];
    currencyType = json['currency_type'];
    annualIncome = json['annual_income'];
    familyType = json['family_type'];
    familyValue = json['family_value'];
    aboutMyself = json['about_myself'];
    createdFor = json['created_for'];
    ancestralValues = json['ancestralValues'];
    UiId = json['UiId']; // New field
    bodyType = json['body_type'];
    profilePic = json['profile_pic'];
    eatingHabit = json['eating_habit'];
    drinking = json['drinking'];
    smoking = json['smoking'];
    gothra = json['gothra'];
    zodiac = json['zodiac'];
    star = json['star'];
    raasi = json['raasi'];
    college = json['college'];
    occupationDetail = json['occupation_detail'];
    organization = json['organization'];
    fatherOccupation = json['father_occupation'];
    motherOccupation = json['mother_occupation'];
    brothers = json['brothers'];
    brothersMarried = json['brothers_married'];
    sisters = json['sisters'];
    sistersMarried = json['sisters_married'];
    aboutMyFamily = json['about_my_family'];
    hobbiesInterests = json['hobbies_interests'];
    viewsOnEqualRelationship = json['views_on_equal_relationship'];
    ancestralorigin = json['ancestralorigin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['religion'] = this.religion;
    data['mother_tongue'] = this.motherTongue;
    data['number'] = this.number;
    data['mail_id'] = this.mailId;
    data['password'] = this.password;
    data['marital_status'] = this.maritalStatus;
    data['caste'] = this.caste;
    data['sub_caste'] = this.subCaste;
    data['dhosham'] = this.dhosham;
    data['marry_other_community'] = this.marryOtherCommunity;
    data['country_living'] = this.countryLiving;
    data['state'] = this.state;
    data['city'] = this.city;
    data['height'] = this.height;
    data['physical_status'] = this.physicalStatus;
    data['education'] = this.education;
    data['occupation'] = this.occupation;
    data['currency_type'] = this.currencyType;
    data['annual_income'] = this.annualIncome;
    data['family_type'] = this.familyType;
    data['family_value'] = this.familyValue;
    data['about_myself'] = this.aboutMyself;
    data['created_for'] = this.createdFor;
    data['ancestralValues'] = this.ancestralValues;
    data['UiId'] = this.UiId; // New field
    data['body_type'] = this.bodyType;
    data['profile_pic'] = this.profilePic;
    data['eating_habit'] = this.eatingHabit;
    data['drinking'] = this.drinking;
    data['smoking'] = this.smoking;
    data['gothra'] = this.gothra;
    data['zodiac'] = this.zodiac;
    data['star'] = this.star;
    data['raasi'] = this.raasi;
    data['college'] = this.college;
    data['occupation_detail'] = this.occupationDetail;
    data['organization'] = this.organization;
    data['father_occupation'] = this.fatherOccupation;
    data['mother_occupation'] = this.motherOccupation;
    data['brothers'] = this.brothers;
    data['brothers_married'] = this.brothersMarried;
    data['sisters'] = this.sisters;
    data['ancestralorigin'] = this.ancestralorigin;
    data['sisters_married'] = this.sistersMarried;
    data['about_my_family'] = this.aboutMyFamily;
    data['hobbies_interests'] = this.hobbiesInterests;
    data['views_on_equal_relationship'] = this.viewsOnEqualRelationship;
    return data;
  }
}
