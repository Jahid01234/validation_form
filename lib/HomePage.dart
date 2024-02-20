
import 'package:flutter/material.dart';
import 'package:validation_form/login_page.dart';




class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  bool _obscureText = true;
  bool _obscureText1 = true;

TextEditingController  _firstNameController = TextEditingController();
TextEditingController  _lastNameController = TextEditingController();
TextEditingController  _addressController = TextEditingController();
TextEditingController  _phoneController = TextEditingController();
TextEditingController  _emailController = TextEditingController();
TextEditingController  _passwordController = TextEditingController();
TextEditingController  _confirmPassController = TextEditingController();

final _userkey=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('User Validation Form'),
        centerTitle: true,
      ),

      backgroundColor: Colors.lime,

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(

          key: _userkey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children:
              [
                TextFormField(
                  validator: (value){
                    if(value== null || value!.isEmpty){
                      return "Please enter first name";
                    }
                    else if(value.length>20){
                      return " please enter 20 Character";
                    }

                  },
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      color: Theme.of(context).primaryColor,
                    ),
                    border: OutlineInputBorder(),
                    hintText: 'Enter Your First Name',
                  ),
                ),

                SizedBox(height: 20,),
                TextFormField(
                  validator: (value){
                    if(value==null || value!.isEmpty){
                      return "Please enter last name";
                    }
                    else if(value.length>20){
                      return " please enter 20 Character";
                    }

                  },
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      color: Theme.of(context).primaryColor,
                    ),
                    border: OutlineInputBorder(),
                    hintText: 'Enter Your Last Name',
                  ),
                ),

                SizedBox(height: 20,),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty)
                    {
                      return 'Please enter address';
                    }
                     else if (value.length > 30) {
                        return 'Enter 30 Character';
                      }


                  },
                  controller: _addressController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.account_balance_sharp,
                      color: Theme.of(context).primaryColor,
                    ),
                    border: OutlineInputBorder(),
                    hintText: 'Enter Your Address',
                  ),
                ),

                SizedBox(height: 20,),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty)
                    {
                      return 'Please enter phone number';
                    }
                   else if (value.length >11) {
                      return 'Enter 11 digit';
                    }


                  },
                  controller: _phoneController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Theme.of(context).primaryColor,
                    ),
                    border: OutlineInputBorder(),
                    hintText: 'Enter Your Phone Number',
                  ),
                ),

                SizedBox(height: 20,),
               TextFormField(
                 validator: (value) {
                   if (value == null || value.isEmpty) {
                     return 'Please enter your email';
                   } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value)) {
                     return 'Please enter a valid email address';
                   }

                 },
                 controller: _emailController,
                 decoration: InputDecoration(
                   prefixIcon: Icon(
                     Icons.email,
                     color: Theme.of(context).primaryColor,
                   ),
                   border: OutlineInputBorder(),
                   hintText: 'Enter Your Email',
                 ),
               ),


                SizedBox(height: 20,),
                TextFormField(
                    obscureText: _obscureText1,//for visibility off
                  validator: (value){
                    if(value==null || value!.isEmpty){
                      return "Please enter password";
                    }
                    else if(value.length<=8){
                      return " please enter 8 character or anything";
                    }

                  },
                  controller: _passwordController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.password,
                      color: Theme.of(context).primaryColor,
                    ),

                    // For start show password part.(1st password.field)...............
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText1
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        // Toggle password visibility
                        setState(() {
                          _obscureText1 = !_obscureText1;
                        });
                      },
                    ),

                    //For End show password part..............

                    border: OutlineInputBorder(),
                    hintText: 'Enter Your Password',
                  ),
                ),

                SizedBox(height: 20,),
                TextFormField(
                  obscureText: _obscureText,//for visibility off
                  validator: (value){
                    if(value==null || value!.isEmpty){
                      return "Please enter confirm password";
                    }
                    else if(value.length<=8){
                      return " please enter 8 character or anything";
                    }

                  },
                  controller: _confirmPassController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.password,
                      color: Theme.of(context).primaryColor,
                    ),

                    // For start show password part.(2nd confirm password.field)...............
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        // Toggle password visibility
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                    // For End show password part.(2nd confirm password.field)...............

                    border: OutlineInputBorder(),
                    hintText: 'Enter Your Confirm Password',
                  ),
                ),


                SizedBox(height: 20,),
                ElevatedButton
                  (
                    onPressed: () {
                      if (_userkey.currentState!.validate()) {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => login_page()));
                      }
                    },
                    child: Text('Submit',style: TextStyle(
                      color: Colors.deepOrange
                    ),)
                 ),

              ],
            ),
          ),
        ),
      ),

    );

  }

}

