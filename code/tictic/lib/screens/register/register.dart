import 'package:flutter/material.dart';
import 'package:tictic/constants/sizes.dart';
import 'package:tictic/screens/register/widgets/call_to_action.dart';
import 'package:tictic/screens/scaffold_with_image.dart';

import '../welcome/widgets/call_to_actions.dart';

class Register extends StatefulWidget {
  const Register({super.key});
  static const String routeName = '/register';

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String _email = '';
  final _formGlobalKey = GlobalKey<FormState>();

  String _password = '';


  @override
  Widget build(BuildContext context) {
    return ScaffoldWithImage(
      child: Padding(
        padding: const EdgeInsets.only(top: kVerticalPadding),
        child: Column(
          /*crossAxisAlignment: CrossAxisAlignment.start,*/
          children: [Row(
            children: [
              SizedBox(width: kHorizontalPadding),
              ElevatedButton(onPressed: (){
                Navigator.pop(context);
              }, child: Icon(Icons.arrow_back)),
            ],
          ), Text("Register"),
            SizedBox(height: kVerticalPadding),
            Text( 'Your email: $_email',textAlign: TextAlign.start,),
            //wieso kann hier nicht textalign start??
            SizedBox(height: kVerticalPadding),
            /*Padding(
              padding: const EdgeInsets.only(left: kHorizontalPadding, right: kHorizontalPadding),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  label : Text("Adresse email"),
                ),
                onChanged: (value){
                  setState((){
                    _email = value;
              });
              }
              ),
            ),*/
            Form(
              key: _formGlobalKey,
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: kVerticalPadding,),
                  //TextFormField
                  Padding(
                    padding: const EdgeInsets.only(left: kHorizontalPadding, right: kHorizontalPadding),
                    child: TextFormField(
                      maxLength: 150,
                      decoration: const InputDecoration(
                        label: Text('Votre Email'),
                      ),
                        validator: (value) {
                          if (value == null ||value.isEmpty ){
                        return 'Un Email doit etre fourni';
                        }
                    return null;
                        },
                      onSaved: (value){
                        _email = value!;
                      },
                      ),
                  ),
                  SizedBox(height: kVerticalPaddingL,),
                  Padding(
                    padding: const EdgeInsets.only(left: kHorizontalPadding),
                    child: Text( 'Your new password: $_password',textAlign: TextAlign.start,),
                  ),
                  //wieso kann hier nicht textalign start??
                  SizedBox(height: kVerticalPadding),
                  Padding(
                    padding: const EdgeInsets.only(left: kHorizontalPadding, right: kHorizontalPadding),
                    child: TextFormField(
                      maxLength: 150,
                      decoration: const InputDecoration(
                        label: Text('Votre mot de passe'),
                      ),
                      validator: (value) {
                        if (value == null ||value.isEmpty ){
                          return 'Un mot de passe doit etre fourni';
                        }
                        return null;
                      },
                      onSaved: (value){
                        _password = value!;
                      },
                    ),
                  ),



                  //submit
                  SizedBox(height: kVerticalPaddingL,),
                  CallToAction(formGlobalKey : _formGlobalKey),
                ],
              ),
            ),

            SizedBox(height: kVerticalPadding,),

          ],

        ),



      ),
    );
  }
}
