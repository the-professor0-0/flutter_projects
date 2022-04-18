import 'dart:convert';
import 'package:http/http.dart' as http;

getBooks(String token) async{
  String url="https://laravel.abdullahlatif.com/api/books";
  var result=await http.get(url,headers:{
    "Accept":"application/json",
    'Authorization': 'Bearer $token',
  });
  var responseBody=json.decode(result.body);
  return responseBody;
}

getOrders() async {
  String url ="https://auraq.dsouls.co/wp-json/wc/v3/?consumer_key=ck_b6861beee9817d3feaedb3865305a0c16960ee69&consumer_secret=cs_e69b60d0a7660132bd0205eb5ab7fd07e85f6f7e";
  var result = await http.get(
      Uri.encodeFull(url), headers: {"Accept": "application/json"});
  var responseBody = json.decode(result.body);
  return responseBody;
}

Future<dynamic> getUser(String token,String id) async{
  String url="https://laravel.abdullahlatif.com/api/user/"+id;
  var result=await http.get(url,headers:{
    'Authorization': 'Bearer $token',
  });
  var responseBody=json.decode(result.body);
  return responseBody;
}