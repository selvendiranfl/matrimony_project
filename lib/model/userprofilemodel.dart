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
  String? createdFor;  // New field

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
    this.aboutMyself,
    this.createdFor,
    this.ancestralValues // New field
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
    ancestralValues = json['ancestralValues'];// New field
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
    data['ancestralValues'] = this.ancestralValues;// New field
    return data;
  }
}
