import 'dart:convert';

List<EmployeeDataResponse> employeeDataResponseFromJson(String str) => List<EmployeeDataResponse>.from(json.decode(str).map((x) => EmployeeDataResponse.fromJson(x)));

String employeeDataResponseToJson(List<EmployeeDataResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmployeeDataResponse {
  EmployeeDataResponse({
    this.id,
    this.name,
    this.username,
    this.email,
    this.profileImage,
    this.phone,
    this.website,
  });

  int? id;
  String? name;
  String? username;
  String? email;
  String? profileImage;
  String? phone;
  String? website;

  factory EmployeeDataResponse.fromJson(Map<String, dynamic> json) => EmployeeDataResponse(
    id: json["id"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
    profileImage: json["profile_image"],
    phone: json["phone"],
    website: json["website"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "username": username,
    "email": email,
    "profile_image": profileImage,
    "phone": phone,
    "website": website,
  };
}


// To parse this JSON data, do
// //
// //     final employeeDataResponse = employeeDataResponseFromJson(jsonString);
// import 'dart:convert';
//
// List<EmployeeDataResponse> employeeDataResponseFromJson(String str) => List<EmployeeDataResponse>.from(json.decode(str).map((x) => EmployeeDataResponse.fromJson(x)));
//
// String employeeDataResponseToJson(List<EmployeeDataResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class EmployeeDataResponse {
//   EmployeeDataResponse({
//     this.id,
//     this.name,
//     this.username,
//     this.email,
//     this.profileImage,
//     this.address,
//     this.phone,
//     this.website,
//     this.company,
//   });
//
//   int? id;
//   String? name;
//   String? username;
//   String? email;
//   String? profileImage;
//   Address? address;
//   String? phone;
//   String? website;
//   Company? company;
//
//   factory EmployeeDataResponse.fromJson(Map<String, dynamic> json) => EmployeeDataResponse(
//     id: json["id"],
//     name: json["name"],
//     username: json["username"],
//     email: json["email"],
//     profileImage: json["profile_image"],
//     address: Address.fromJson(json["address"]),
//     phone: json["phone"] == null ? null : json["phone"],
//     website: json["website"],
//     company: Company.fromJson(json["company"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "username": username,
//     "email": email,
//     "profile_image": profileImage,
//     "address": address!.toJson(),
//     "phone": phone == null ? null : phone,
//     "website": website,
//     "company": company!.toJson(),
//   };
//   // EmployeeDataResponse.fromMap(Map<dynamic, dynamic> mapData) {
//   //   this.id = mapData['id'];
//   //   this.name = mapData['name'];
//   //   this.username = mapData['username'];
//   //   this.email = mapData['email'];
//   //
//   // }
// }
//
// class Address {
//   Address({
//     this.street,
//     this.suite,
//     this.city,
//     this.zipcode,
//     this.geo,
//   });
//
//   String? street;
//   String? suite;
//   String? city;
//   String? zipcode;
//   Geo? geo;
//
//   factory Address.fromJson(Map<String, dynamic> json) => Address(
//     street: json["street"],
//     suite: json["suite"],
//     city: json["city"],
//     zipcode: json["zipcode"],
//     geo: Geo.fromJson(json["geo"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "street": street,
//     "suite": suite,
//     "city": city,
//     "zipcode": zipcode,
//     "geo": geo!.toJson(),
//   };
// }
//
// class Geo {
//   Geo({
//     this.lat,
//     this.lng,
//   });
//
//   String? lat;
//   String? lng;
//
//   factory Geo.fromJson(Map<String, dynamic> json) => Geo(
//     lat: json["lat"],
//     lng: json["lng"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "lat": lat,
//     "lng": lng,
//   };
// }
//
// class Company {
//   Company({
//     this.name,
//     this.catchPhrase,
//     this.bs,
//   });
//
//   String? name;
//   String? catchPhrase;
//   String? bs;
//
//   factory Company.fromJson(Map<String, dynamic> json) => Company(
//     name: json["name"],
//     catchPhrase: json["catchPhrase"],
//     bs: json["bs"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "name": name,
//     "catchPhrase": catchPhrase,
//     "bs": bs,
//   };
// }
