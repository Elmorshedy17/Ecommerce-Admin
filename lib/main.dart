import 'package:ecommerc_admin/pages/maps.dart';
import 'package:flutter/material.dart';
import './pages/Dashboard.dart';
import './pages/manage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//      home: MyHomePage(title: 'Admin'),
      home:
//      MapSample(),
//      Osama(),
//        CameraApp(),
      SignUp(),
//      MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
//          title: Text(widget.title),
//        centerTitle: true,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                child: Text('Dashboard'),
                icon: Icon(Icons.dashboard),
              ),
              Tab(
                child: Text('Manage'),
                icon: Icon(Icons.filter_list),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Dashboard(),
            Manage(),
          ],
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
//
//class GoogleSignApp extends StatefulWidget {
//  @override
//  _GoogleSignAppState createState() => _GoogleSignAppState();
//}
//
//class _GoogleSignAppState extends State<GoogleSignApp> {
//  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//  final GoogleSignIn _googlSignIn = new GoogleSignIn();
//
//  Future<FirebaseUser> _signIn(BuildContext context) async {
//    Scaffold.of(context).showSnackBar(new SnackBar(
//      content: new Text('Sign in'),
//    ));
//
//    final GoogleSignInAccount googleUser = await _googlSignIn.signIn();
//    final GoogleSignInAuthentication googleAuth =
//        await googleUser.authentication;
//
//    final AuthCredential credential = GoogleAuthProvider.getCredential(
//      accessToken: googleAuth.accessToken,
//      idToken: googleAuth.idToken,
//    );
//
//    FirebaseUser userDetails =
//        await _firebaseAuth.signInWithCredential(credential);
//    ProviderDetails providerInfo = new ProviderDetails(userDetails.providerId);
//
//    List<ProviderDetails> providerData = new List<ProviderDetails>();
//    providerData.add(providerInfo);
//
//    UserDetails details = new UserDetails(
//      userDetails.providerId,
//      userDetails.displayName,
//      userDetails.photoUrl,
//      userDetails.email,
//      providerData,
//    );
//    Navigator.push(
//      context,
//      new MaterialPageRoute(
//        builder: (context) => new MyHomePage(),
//      ),
//    );
//    return userDetails;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Builder(
//        builder: (context) => Stack(
//              fit: StackFit.expand,
//              children: <Widget>[
//                Container(
//                  width: MediaQuery.of(context).size.width,
//                  height: MediaQuery.of(context).size.height,
//                  child: Image.asset('assets/photo_2.jpg',
//                      fit: BoxFit.cover,
//                      color: Color.fromRGBO(255, 255, 255, 0.6),
//                      colorBlendMode: BlendMode.modulate),
//                ),
//                Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    SizedBox(height: 10.0),
//                    Container(
//                        width: 250.0,
//                        child: Align(
//                          alignment: Alignment.center,
//                          child: RaisedButton(
//                            shape: RoundedRectangleBorder(
//                                borderRadius: new BorderRadius.circular(30.0)),
//                            color: Color(0xffffffff),
//                            child: Row(
//                              mainAxisAlignment: MainAxisAlignment.start,
//                              children: <Widget>[
//                                Icon(
//                                  FontAwesomeIcons.google,
//                                  color: Color(0xffCE107C),
//                                ),
//                                SizedBox(width: 10.0),
//                                Text(
//                                  'Sign in with Google',
//                                  style: TextStyle(
//                                      color: Colors.black, fontSize: 18.0),
//                                ),
//                              ],
//                            ),
//                            onPressed: () => _signIn(context)
//                                .then((FirebaseUser user) => print(user))
//                                .catchError((e) => print(e)),
//                          ),
//                        )),
//                    Container(
//                        width: 250.0,
//                        child: Align(
//                          alignment: Alignment.center,
//                          child: RaisedButton(
//                            shape: RoundedRectangleBorder(
//                                borderRadius: new BorderRadius.circular(30.0)),
//                            color: Color(0xffffffff),
//                            child: Row(
//                              mainAxisAlignment: MainAxisAlignment.start,
//                              children: <Widget>[
//                                Icon(
//                                  FontAwesomeIcons.facebookF,
//                                  color: Color(0xff4754de),
//                                ),
//                                SizedBox(width: 10.0),
//                                Text(
//                                  'Sign in with Facebook',
//                                  style: TextStyle(
//                                      color: Colors.black, fontSize: 18.0),
//                                ),
//                              ],
//                            ),
//                            onPressed: () {},
//                          ),
//                        )),
//                    Container(
//                        width: 250.0,
//                        child: Align(
//                          alignment: Alignment.center,
//                          child: RaisedButton(
//                            shape: RoundedRectangleBorder(
//                                borderRadius: new BorderRadius.circular(30.0)),
//                            color: Color(0xffffffff),
//                            child: Row(
//                              mainAxisAlignment: MainAxisAlignment.start,
//                              children: <Widget>[
//                                Icon(
//                                  FontAwesomeIcons.solidEnvelope,
//                                  color: Color(0xff4caf50),
//                                ),
//                                SizedBox(width: 10.0),
//                                Text(
//                                  'Sign in with Email',
//                                  style: TextStyle(
//                                      color: Colors.black, fontSize: 18.0),
//                                ),
//                              ],
//                            ),
//                            onPressed: () {},
//                          ),
//                        )),
//                  ],
//                ),
//              ],
//            ),
//      ),
//    );
//  }
//}

//class UserDetails {
//  final String providerDetails;
//  final String userName;
//  final String photoUrl;
//  final String userEmail;
//  final List<ProviderDetails> providerData;
//
//  UserDetails(this.providerDetails, this.userName, this.photoUrl,
//      this.userEmail, this.providerData);
//}
//
//class ProviderDetails {
//  ProviderDetails(this.providerDetails);
//
//  final String providerDetails;
//}


//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:yarab/components/pages/sign_in.dart';
//import 'package:yarab/db/users.dart';
//import 'home.dart';
//import 'package:firebase_database/firebase_database.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
//  UserServices _userServices = UserServices();
//
  String _email;
  String _name;
  TextEditingController _passwordControler = TextEditingController();
  TextEditingController _passwordConfirmControler = TextEditingController();
  TextEditingController _nameControler = TextEditingController();
  TextEditingController _emailControler = TextEditingController();

  String gender;
  String groupValue = "male";

  valueChanged(e) {
    setState(() {
      if (e == 'male') {
        groupValue = e;
        gender = e;
      } else if (e == 'female') {
        groupValue = e;
        gender = e;
      }
    });
  }

  bool hidePass = true;

  showPassValue() {
    setState(() {
      if (hidePass) {
        hidePass = false;
      } else if (hidePass == false) {
        hidePass = true;
      }
    });
  }

  String _password;
  String _confirm;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset('assets/photo_2.jpg',
                fit: BoxFit.cover,
                color: Color.fromRGBO(255, 255, 255, 0.6),
                colorBlendMode: BlendMode.modulate),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 50.0,
              ),
              Container(
                height: 180.0,
                width: 400.0,
                child: Image.asset(
                  'assets/photo_2.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                child: ListView(
                  children: <Widget>[
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: _nameControler,
                            decoration: InputDecoration(
                                icon: Icon(Icons.person_outline),
                                hintText: 'Full Name'),
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'this field is required';
                              }
                            },
                            onSaved: (val) {
                              _name = val;
                            },
                          ),
                          TextFormField(
                            controller: _emailControler,
                            decoration: InputDecoration(
                                icon: Icon(Icons.email),
                                hintText: 'Email adress'),
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'this field is required';
                              }
                            },
                            onSaved: (val) {
                              _email = val;
                            },
                          ),
                          TextFormField(
                            controller: _passwordControler,
                            obscureText: true,
                            decoration: InputDecoration(
                                icon: Icon(Icons.vpn_key),
                                hintText: 'Password'),
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'this field is required';
                              } else if (val.length < 3) {
                                return 'this filed must be more than 2 characters';
                              }
                            },
                            onSaved: (val) {
                              _password = val;
                            },
                          ),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                                icon: Icon(Icons.account_balance),
                                hintText: 'Confirm Password'),
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'this field is required';
                              } else if (val.length < 3) {
                                return 'this filed must be more than 3 characters';
                              } else if (_passwordControler.text != val) {
                                return 'password desnt match';
                              }
                            },
                            onSaved: (val) {
                              _confirm = val;
                            },
                          ),

                          Container(
                            margin: EdgeInsets.only(top: 20.0),
                            child: RaisedButton(
                              color: Colors.redAccent,
                              textColor: Colors.white,
                              child: Text('Sign Up'),
                              onPressed: LogUp,
                            ),
                          ),
//                          Divider(
//                            color: Colors.red,
//                          ),
//                          Row(
//                            mainAxisSize: MainAxisSize.max,
//                            mainAxisAlignment:
//                            MainAxisAlignment.spaceBetween,
//                            children: <Widget>[
//                              Container(
//                                  padding: const EdgeInsets.all(8.0),
//                                  child: InkWell(
//                                      onTap: () {
//
//                                        Navigator.pushReplacement(
//                                            context, MaterialPageRoute(builder: (context) => SignIn()));
//                                      },
//                                      child: RichText(
//                                        text: TextSpan(children: [
//                                          TextSpan(
//                                              text:
//                                              'have account already ? ',
//                                              style: TextStyle(
//                                                  fontSize: 20.0,
//                                                  color: Colors.black54)),
//
//                                          TextSpan(
//                                              text: 'Log In',
//                                              style: TextStyle(
//                                                  fontSize: 20.0,
//                                                  color: Colors.red))
//                                        ]),
//                                      ))),
//                            ],
//                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> LogUp() async {
    final databaseReference = FirebaseDatabase.instance.reference();
    final fomdata = _formKey.currentState;
    String ref = 'Users';
    if (fomdata.validate()) {
      fomdata.save();
      FirebaseUser user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password)
          .then((user) {
        databaseReference.child(ref).push().set({
          "user name": _nameControler.text,
          "email": _emailControler.text,
          "user id": user.uid,
          "gender": gender,
        }).catchError((onError) {
          print(onError);
        });

        print(user);
      }).catchError((onError) {
        print(onError);
      });
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
      print(_email);
      print(_password);
    }
  }
}
