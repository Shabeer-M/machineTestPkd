const String kStatus = "status";
const String kMessage = "message";
const String kData = "data";
const String kId = "Id";
const String kName = "Name";
const String kAddress1 = "Address1";
const String kAddress2 = "Address2";
const String kAddress3 = "Address3";
const String kAddress4 = "Address4";

class ShopModel {
  int? status;
  String? message;
  List<Data>? data;

  ShopModel({this.status, this.message, this.data});

  ShopModel.fromJson(Map<String, dynamic> json) {
    status = json[kStatus];
    message = json[kMessage];
    if (json[kData] != null) {
      data = <Data>[];
      json[kData].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[kStatus] = status;
    data[kMessage] = message;
    if (this.data != null) {
      data[kData] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? address1;
  String? address2;
  String? address3;
  String? address4;

  Data({this.id, this.name, this.address1, this.address2, this.address3, this.address4});

  Data.fromJson(Map<String, dynamic> json) {
    id = json[kId];
    name = json[kName];
    address1 = json[kAddress1];
    address2 = json[kAddress2];
    address3 = json[kAddress3];
    address4 = json[kAddress4];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[kId] = id;
    data[kName] = name;
    data[kAddress1] = address1;
    data[kAddress2] = address2;
    data[kAddress3] = address3;
    data[kAddress4] = address4;
    return data;
  }
}
