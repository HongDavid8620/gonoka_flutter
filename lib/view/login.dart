import 'package:flutter/material.dart';
import 'package:gonoka/view/post.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String _validation = '';
  var _username;
  var _password;

  //make key for form and call save function on form key
  _submit() {
    var form = _formkey.currentState;
    form!.save();
  }

  //check validation and push navigator
  _login(context) {
    _submit();
    if (_username == '' || _password == '') {
      setState(() {
        _validation = 'Incorrect email or password';
      });
    } else if (!_username.contains('@')) {
      setState(() {
        _validation = 'Your email is missing @';
      });
    } else {
      setState(() {
        _validation = '';
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Mainpage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
          child: Container(
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  height: 450,
                  color: Color.fromRGBO(222, 222, 222, 0.5),
                  child: Image.network(
                    'https://www.automaticpallet.com/wp-content/uploads/undraw_buffer_wq43.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Container(
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        //header Sign In
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'SIGN IN',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),
                        ),

                        //validation message
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: _validation != ''
                                  ? Text(
                                      _validation,
                                      style: TextStyle(color: Colors.red),
                                    )
                                  : null,
                            )),

                        //User Address TextFeild
                        Padding(
                          padding:
                              EdgeInsets.only(left: 20, right: 20, bottom: 5),
                          child: Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: ThemeData().colorScheme.copyWith(
                                    primary: Colors.grey[600],
                                  ),
                            ),
                            child: TextFormField(
                              onFieldSubmitted: (value) {
                                _login(context);
                              },
                              onSaved: (value) {
                                _username = value;
                                // print(_username);
                              },
                              decoration: InputDecoration(
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                fillColor: Colors.grey[300],
                                filled: true,
                                prefixIcon: Icon(Icons.person),
                                hintText: 'Email Address',
                              ),
                            ),
                          ),
                        ),

                        //User password TextFeild
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: ThemeData().colorScheme.copyWith(
                                    primary: Colors.grey[600],
                                  ),
                            ),
                            child: TextFormField(
                              onFieldSubmitted: (value) {
                                _login(context);
                              },
                              onSaved: (value) {
                                _password = value;
                                // print(_password);
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                fillColor: Colors.grey[300],
                                filled: true,
                                prefixIcon: Icon(Icons.lock),
                                hintText: 'Password',
                              ),
                            ),
                          ),
                        ),

                        //Sign in button
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: SizedBox(
                              width: double.infinity,
                              child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.blueAccent),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ))),
                                  child: Text(
                                    'SIGN IN',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    _login(context);
                                  }),
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
