



class UserAccountModel {
  int id;
  String name;
  String currency;
  String currencyName;
  double balance;

  UserAccountModel({
    required this.id,
    required this.name,
    required this.currency,
    required this.currencyName,
    required this.balance,
  });

  factory UserAccountModel.fromJson(Map<String, dynamic> json) {
    return UserAccountModel(
      id: json['id'],
      name: json['name'],
      currency: json['currency'],
      currencyName: json['currency_name'],
      balance: json['balance'].toDouble(),
    );
  }
}
