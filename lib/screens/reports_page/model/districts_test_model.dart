import 'address_model.dart';

class DistrictsTestModel {
  int? cityId;
  List<AddressModel>? addressModel;

  DistrictsTestModel({this.cityId, this.addressModel});

  DistrictsTestModel.fromJson(Map<String, dynamic> json) {
    cityId = json['cityId'];
    if (json['districts'] != null) {
      addressModel = <AddressModel>[];
      json['districts'].forEach((v) {
        addressModel!.add(AddressModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cityId'] = cityId;
    if (addressModel != null) {
      data['districts'] = addressModel!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

