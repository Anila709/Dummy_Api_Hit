class QuateModel {
  int id;
  String quote;
  String author;
  QuateModel({
    required this.id,
    required this.quote,
    required this.author,
  });

  factory QuateModel.fromJson(Map<String, dynamic> json) {
    return QuateModel(
      id: json['id'],
      quote: json['quote'],
      author: json['author'],
    );
  }
}

class QuatesModel {
  int total;
  int skip;
  int limit;
  List<QuateModel> quotes;
  QuatesModel({
    required this.total,
    required this.skip,
    required this.limit,
    required this.quotes,
  });

  factory QuatesModel.fromJson(Map<String, dynamic> json) {

    List<QuateModel> eachQuote=[];
    for(Map<String,dynamic> eachData in json['quotes']){
      var mQuote=QuateModel.fromJson(eachData);
      eachQuote.add(mQuote);
    }
    return QuatesModel(
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
      quotes: eachQuote,
    );
  }
}
