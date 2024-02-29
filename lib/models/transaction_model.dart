class TransactionModel {
  int id;
  String type;
  double amount;
  TransactionDetails details;

  TransactionModel({
    required this.id,
    required this.type,
    required this.amount,
    required this.details,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      type: json['type'],
      amount: json['amount'].toDouble(),
      details: TransactionDetails.fromJson(json['details']),
    );
  }
}

class TransactionDetails {
  String description;
  String from;
  String? image;
  String date;

  TransactionDetails({
    required this.description,
    required this.from,
    this.image,
    required this.date,
  });

  factory TransactionDetails.fromJson(Map<String, dynamic> json) {
    return TransactionDetails(
      description: json['description'],
      from: json['from'],
      image: json['image'],
      date: json['date']??"",
    );
  }
}
