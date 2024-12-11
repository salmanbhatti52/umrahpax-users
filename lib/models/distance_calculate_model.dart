




class DistanceCalculatorModel {
  String? status;
  Data? data;

  DistanceCalculatorModel({
    this.status,
    this.data,
  });

  factory DistanceCalculatorModel.fromJson(Map<String, dynamic> json) => DistanceCalculatorModel(
    status: json["status"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data!.toJson(),
  };
}

class Data {
  String? distance;

  Data({
    this.distance,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    distance: json["distance"],
  );

  Map<String, dynamic> toJson() => {
    "distance": distance,
  };
}
