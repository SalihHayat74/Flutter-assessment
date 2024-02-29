



import 'dart:convert';

import 'package:flutter_assessment/models/user_account_model.dart';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;

import '../models/transaction_model.dart';

class ApiDataProvider extends ChangeNotifier{
  List<TransactionModel> transactions=[];
  UserAccountModel? userData;

  getBanners()async{

    String url="http://13.60.35.163:3030/assessment";

    http.Response response=await http.get(Uri.parse(url));

    if(response.statusCode==200){
      transactions.clear();

      Map<String,dynamic> data=jsonDecode(response.body);
      userData= UserAccountModel.fromJson(data["account"]);
      for(int i=0;i<data["transactions"].length;i++){
        transactions.add(TransactionModel.fromJson(data['transactions'][i]));
      }
      notifyListeners();
    }
  }


}