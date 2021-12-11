import 'package:flutter/material.dart';
import 'package:home_automation/Screens/Auth/register-screen.dart';

import 'package:home_automation/Screens/home-screen.dart';
import 'package:provider/provider.dart';
import 'package:home_automation/Models/Auth.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "LoginScreen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObscured = true;
  void _toggleObscured() {
    setState(() {
      isObscured = !isObscured;
    });
   }
  Map <String ,String> _authData={
       'email':'',
       'password':'',
     };

    void errorDialog(String msg){
     showDialog(
       context: context,
       builder: (context)=>AlertDialog(
       title: Text('An Error Occured'),
       content: Text(msg),
       actions: <Widget>[
         ElevatedButton(

           child: Text("Okay"),
         onPressed: (){
           Navigator.of(context).pop();
         },
         ),
       ],
     ));
   }   
     



 Future <void> submit() async {
       if(!formKey.currentState.validate()) 
       {
         return;
          }
       formKey.currentState.save();
       
       try{
          
         await Provider.of<Authentication>(context,listen: false).logIn(
         _authData['email'],
         _authData['password']
         );
          
           Navigator.pushReplacementNamed(context, HomeScreen.routeName);

       }
       catch(error){
          var errorMessage = "Authentication Failed. Please try again later.";
        errorDialog(errorMessage);
       }

     
        
                
      }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: screenSize.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Home Automation",
              style: TextStyle(
                color: Colors.purple,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: screenSize.width - 60,
              child: Card(
                clipBehavior: Clip.hardEdge,
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Colors.purple[100],
                        Colors.purple[200].withOpacity(0.8),
                      ],
                    ),
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                         
                          decoration: InputDecoration(
                              icon: Icon(Icons.person),
                              hintText: "Enter username",
                              labelText: "Username"),
                         validator: (value)
                          {
                            if(value.isEmpty || !value.contains("@"))
                            {
                              return "Invalid email";
                            }
                            return null;
                          },
                          onSaved: (value)
                          {
                            _authData['email']=value;
                          },
                        ),

                        TextFormField(
                      
                          obscureText: isObscured,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isObscured
                                      ? Icons.remove_red_eye_outlined
                                      : Icons.remove_red_eye,
                                ),
                                onPressed: () {
                                
                                   _toggleObscured();
                                  
                                },
                              ),
                              icon: Icon(Icons.lock),
                              hintText: "Enter password",
                              labelText: "Password"),

                              validator: (value)
                          {
                            if(value.isEmpty || value.length<=5)
                            {
                              return "Invalid password";
                            }
                            return null;
                          },
                          onSaved: (value)
                          {
                            _authData['password']=value;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, RegisterScreen.routeName);
                              },
                              child: Text(
                                "Create account",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                submit();
                                    
                              },
                              child: Text("Login"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
