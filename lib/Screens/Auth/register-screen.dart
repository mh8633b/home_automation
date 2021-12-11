import 'package:flutter/material.dart';
import 'package:home_automation/Models/Auth.dart';
import '../home-screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = "RegisterScreen";
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>  {
 
  TextEditingController passcontroller= new TextEditingController();

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
          
         await Provider.of<Authentication>(context,listen: false).signUp(
         _authData['email'],
         _authData['password'],
         );
           Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          
       }catch(error){
          var errorMessage = "Authentication Failed. Please try again later.";
        errorDialog(errorMessage);
       }

     
        
                
      }

  final formKey = GlobalKey<FormState>();
  bool isObscured = true;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Container(
        width: screenSize.width,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: screenSize.width - 60,
                  child: Card(
                    clipBehavior: Clip.hardEdge,
                    elevation: 5,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                              
                              
                              //validator: validateUsername,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.person),
                                  hintText: "Enter username",
                                  labelText: "Username"),
                            ),

                            TextFormField(
                              
                              decoration: InputDecoration(
                                  icon: Icon(Icons.person),
                                  hintText: "Enter email",
                                  labelText: "Email"),

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
                              
                             controller: passcontroller,
                    
                              obscureText: isObscured,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      isObscured
                                          ? Icons.remove_red_eye_outlined
                                          : Icons.remove_red_eye,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        isObscured = !isObscured;
                                      });
                                    },
                                  ),
                                  icon: Icon(Icons.lock),
                                  hintText: "Enter password",
                                  labelText: "Password"),
                          onSaved: (value)
                          {
                           _authData['password']=value;
                          },
                            ),

//                  new TextField(
//                      controller: passcontroller
//                  ),
                          SizedBox(height:20,),
                            new FlutterPwValidator(
                      successColor:Colors.green[600],
                      defaultColor:Colors.white,
                      controller: passcontroller,
                      minLength: 6,
                      uppercaseCharCount: 2,
                      numericCharCount: 3,
                      specialCharCount: 1,
                      width: 400,
                      height: 170, onSuccess: null,

                  ),

                            TextFormField(
                             
                              
                              obscureText: isObscured,
                              decoration: InputDecoration(
                                  icon: Icon(Icons.lock),
                                  hintText: "Enter same password",
                                  labelText: "Confirm Password"),
                                 
                                  validator: (value) {

                          if (value.isEmpty || value != passcontroller.text) {
                          return 'Inavlid Password';
                                 }
                            return null;
                                },
                                 onSaved: (value){

                                      },
                            ),

                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                            
                              onPressed: () {
                                submit();
                               
                                
                              },
                              child: Text("Register"),
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
        ),
      ),
    );
  }
}
