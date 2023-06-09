class AccuraBathComplaintNoToDeleteImageResponse {
  List<AccuraBathComplaintNoToDeleteImageResponseDetails> details;
  int totalCount;

  AccuraBathComplaintNoToDeleteImageResponse({this.details, this.totalCount});

  AccuraBathComplaintNoToDeleteImageResponse.fromJson(
      Map<String, dynamic> json) {
    if (json['details'] != null) {
      details = [];
      json['details'].forEach((v) {
        details.add(
            new AccuraBathComplaintNoToDeleteImageResponseDetails.fromJson(v));
      });
    }
    totalCount = json['TotalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.details != null) {
      data['details'] = this.details.map((v) => v.toJson()).toList();
    }
    data['TotalCount'] = this.totalCount;
    return data;
  }
}

class AccuraBathComplaintNoToDeleteImageResponseDetails {
  int column1;
  String column2;
  String column3;

  AccuraBathComplaintNoToDeleteImageResponseDetails(
      {this.column1, this.column2, this.column3});

  AccuraBathComplaintNoToDeleteImageResponseDetails.fromJson(
      Map<String, dynamic> json) {
    column1 = json['Column1'];
    column2 = json['Column2'];
    column3 = json['Column3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Column1'] = this.column1;
    data['Column2'] = this.column2;
    data['Column3'] = this.column3;

    return data;
  }
}
