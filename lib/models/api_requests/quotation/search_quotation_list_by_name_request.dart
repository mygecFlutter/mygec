class SearchQuotationListByNameRequest {
  String CompanyId;
  String LoginUserID;
  String word;
  String needALL;


  SearchQuotationListByNameRequest({this.CompanyId,this.LoginUserID,this.word,this.needALL});

  SearchQuotationListByNameRequest.fromJson(Map<String, dynamic> json) {
    CompanyId = json['CompanyId'];
    LoginUserID = json['LoginUserID'];
    word = json['word'];
    needALL = json['needALL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CompanyId'] = this.CompanyId;
    data['LoginUserID'] = this.LoginUserID;
    data['word'] = this.word;
    data['needALL'] = this.needALL;

    return data;
  }
}