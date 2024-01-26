class AllUserModel {
  List<UsersModel>? users;
  num? total;
  num? skip;
  num? limit;
  AllUserModel({
    required this.users,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory AllUserModel.fromJson(Map<String, dynamic> json) {
    List<UsersModel> eachUser=[];
    for(Map<String,dynamic> eachMap in json['users']){
      eachUser.add(UsersModel.fromJson(eachMap));
    }
    return AllUserModel(
        users: eachUser,
        total: json['total'],
        skip: json['skip'],
        limit: json['limit']);
  }
}

class UsersModel {
  int? id;
  String? firstName;
  String? lastName;
  String? maidenName;
  int? age;
  String? gender;
  String? email;
  String? phone;
  String? username;
  String? password;
  String? birthDate;
  String? image;
  String? bloodGroup;
  num? height;
  num? weight;
  String? eyeColor;
  HairModel? hair;
  String? domain;
  String? ip;
  AddressModel? address;
  String? macAddress;
  String? university;
  BankModel? bank;
  CompanyModel? company;
  String? ein;
  String? ssn;
  String? userAgent;
  CryptoModel? crypto;

  UsersModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.maidenName,
    required this.age,
    required this.gender,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
    required this.birthDate,
    required this.image,
    required this.bloodGroup,
    required this.height,
    required this.weight,
    required this.eyeColor,
    required this.hair,
    required this.domain,
    required this.ip,
    required this.address,
    required this.macAddress,
    required this.university,
    required this.bank,
    required this.company,
    required this.ein,
    required this.ssn,
    required this.userAgent,
    required this.crypto,
  });
  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        maidenName: json['maidenName'],
        age: json['age'],
        gender: json['gender'],
        email: json['email'],
        phone: json['phone'],
        username: json['username'],
        password: json['password'],
        birthDate: json['birthDate'],
        image: json['image'],
        bloodGroup: json['bloodGroup'],
        height: json['height'],
        weight: json['weight'],
        eyeColor: json['eyeColor'],
        hair: HairModel.fromJson(json['hair']),
        domain: json['domain'],
        ip: json['ip'],
        address: AddressModel.fromJson(json['address']),
        macAddress: json['macAddress'],
        university: json['university'],
        bank: BankModel.fromJson(json['bank']),
        company: CompanyModel.fromJson(json['company']),
        ein: json['ein'],
        ssn: json['ssn'],
        userAgent: json['userAgent'],
        crypto: CryptoModel.fromJson(json['crypto']));
  }
}

class HairModel {
  String? color;
  String? type;
  HairModel({
    required this.color,
    required this.type,
  });

  factory HairModel.fromJson(Map<String, dynamic> json) {
    return HairModel(
      color: json['color'],
      type: json['type'],
    );
  }
}

class CoordinatesModel {
  num? lat;
  num? lng;
  CoordinatesModel({
    required this.lat,
    required this.lng,
  });
  factory CoordinatesModel.fromJson(Map<String, dynamic> json) {
    return CoordinatesModel(lat: json['lat'], lng: json['lng']);
  }
}

class AddressModel {
  String? address;
  String? city;
  String? postalCode;
  String? state;
  CoordinatesModel? coordinates;
  AddressModel({
    required this.address,
    required this.city,
    required this.postalCode,
    required this.state,
    required this.coordinates,
  });
  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
        address: json['address'],
        city: json['city'],
        postalCode: json['postalCode'],
        state: json['state'],
        coordinates: CoordinatesModel.fromJson(json['coordinates']));
  }
}

class BankModel {
  String? cardExpire;
  String? cardNumber;
  String? cardType;
  String? currency;
  String? iban;
  BankModel({
    required this.cardExpire,
    required this.cardNumber,
    required this.cardType,
    required this.currency,
    required this.iban,
  });
  factory BankModel.fromJson(Map<String, dynamic> json) {
    return BankModel(
        cardExpire: json['cardExpire'],
        cardNumber: json['cardNumber'],
        cardType: json['cardType'],
        currency: json['currency'],
        iban: json['iban']);
  }
}

class CompanyModel {
  AddressModel? address;
  String? department;
  String? name;
  String? title;
  CompanyModel({
    required this.address,
    required this.department,
    required this.name,
    required this.title,
  });
  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      address: AddressModel.fromJson(json['address']),
      department: json['department'],
      name: json['name'],
      title: json['title'],
    );
  }
}

class CryptoModel {
  String? coin;
  String? wallet;
  String? network;
  CryptoModel({
    required this.coin,
    required this.wallet,
    required this.network,
  });
  factory CryptoModel.fromJson(Map<String, dynamic> json) {
    return CryptoModel(
        coin: json['coin'], wallet: json['wallet'], network: json['network']);
  }
}
