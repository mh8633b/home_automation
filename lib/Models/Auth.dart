import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'Http_excep.dart';



class Authentication with ChangeNotifier{


      
////////Signup///////
 Future <void> signUp(String email, String password,) async
{
   var url= Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBZcMIUwgy9d_KSq7s1bgjQP7NeLimpD6w');
    
      try{
        final response =await http.post(url, body:json.encode(
     {
       'email' :email,
       'password':password,
       'returnSecureToken':true,
     }
   ));

   final responseData = json.decode(response.body);
 //  print(responseData);
 if(responseData['error']!=null){
   throw HttpExcep(responseData['error']['message']);
 }

      }catch(error)
      {
        throw error;
      }
  
 }

 ////Login/////
  Future <void> logIn(String email, String password,) async
{
   var url= Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBZcMIUwgy9d_KSq7s1bgjQP7NeLimpD6w');
   
   try{
     final response =await http.post(url, body:json.encode(
     {
       'email' :email,
       'password':password,
       'returnSecureToken':true,
     }
   ));

   final responseData = json.decode(response.body);
   //print(responseData);
   if(responseData['error']!=null)
   {
   throw HttpExcep(responseData['error']['message']);
   }

   }
   catch(error)
   {
     throw error;

   }  
}


    ////Logout////
   

}