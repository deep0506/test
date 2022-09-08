import 'dart:async';
import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
import 'package:demo/constant.dart';
import 'package:demo/models/ModelProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Amplify Flutter Packages
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:amplify_api/amplify_api.dart'; // UNCOMMENT this line after backend is deployed
import 'package:http/http.dart' as http11;
// Generated in previous step
import 'models/ModelProvider.dart';
import 'amplifyconfiguration.dart';
import 'widgets/custom_widget.dart';

void main() async {
  runApp(MaterialApp(
    home: GoogleSignInDemo(),
    // home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _amplifyConfigured = false;
  @override
  initState() {
    super.initState();
    _configureAmplify();
  }

  void _configureAmplify() async {
    await Amplify.addPlugin(AmplifyAPI());
    // UNCOMMENT this line after backend is deployed
    await Amplify.addPlugin(
        AmplifyDataStore(modelProvider: ModelProvider.instance));

    // Once Plugins are added, configure Amplify
    await Amplify.configure(amplifyconfig);
    try {
      setState(() {
        _amplifyConfigured = true;
      });
    } catch (e) {
      print(e);
    }
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController desController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(hintText: 'Please enter your name'),
          ),
          TextField(
            controller: desController,
            decoration:
                InputDecoration(hintText: 'Please enter your description'),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        final item = Todo(
            name: nameController.text,
            description: desController.text,
            isComplete: true);
        await Amplify.DataStore.save(item);
      }),
    );
  }
}

class Zoom extends StatefulWidget {
  const Zoom({Key? key}) : super(key: key);

  @override
  State<Zoom> createState() => _ZoomState();
}

class _ZoomState extends State<Zoom> {
  late TextEditingController controller;
  late SharedPreferences dd;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dtata();
  }

  dtata() async {
    controller = TextEditingController(text: "");
    dd = await SharedPreferences.getInstance();
    controller.text = dd.getString("name") ?? '';
  }

  @override
  Widget build(BuildContext context) {
    int d = 10;
    d = 50;
    // controller.text = "dadad";
    print("hhshdfhs ${MediaQuery.of(context).size.width}");
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05),
        child: Column(
          children: [
            TextField(
              controller: controller,
            ),
            GestureDetector(
              onTap: () async {
                print(controller.text);

                dd.setString('name', controller.text);
                print("Hello ${dd.getString(
                  'name',
                )}");
              },
              child: Container(
                height: Utils.getHeight(context) * 0.2,
                width: MediaQuery.of(context).size.width * 65 / 100,
                color: Colors.red,
              ),
            ),
            // InkWell(
            //   onTap: (){
            //     Navigator.pop(context);
            //   },
            //   child: Container(
            //     height: 200,
            //     width: MediaQuery.of(context).size.width * .25,
            //     color: Colors.amber,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

class Utils {
  static getHeight(context) {
    return MediaQuery.of(context).size.height;
  }
}

class FF extends StatelessWidget {
  const FF({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: GestureDetector(
        //     onTap: (){
        //      // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_){
        //      //   return Zoom();
        //      // }), (route) => true);
        //       Navigator.push(context, MaterialPageRoute(builder: (context){
        //         return Zoom();
        //       }));
        //     },
        //     child: Icon(Icons.star)),
        title: Text('HHHHH FF'),
      ),
    );
  }
}

class Goa extends StatelessWidget {
  const Goa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text("Goa"),
      ),
      body: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FF();
          }));
        },
        child: Container(
          height: 50,
          width: 50,
          color: Colors.amber,
        ),
      ),
    );
  }
}

class AAA extends StatefulWidget {
  const AAA({Key? key}) : super(key: key);

  @override
  State<AAA> createState() => AAAState();
}

class AAAState extends State<AAA> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
    // fetchCountry();
  }

  List<ResData> dddd = [];
  ResData df = ResData();

  fetchData() async {
    print('====>');
    final response = await http11
        .post(Uri.parse("https://www.vireats.com/appointments/index.php/appointments/ajax_register_appointment_custom",),body:jsonEncode({
      "post_data": {
        "appointment_id": "undefined",
        "appointment": {
          "id_users_provider": "0000000004",
          "is_unavailable": "false",
          "start_datetime": "2022-09-24 10:30:00",
          "user_type": "2",
          "end_datetime": "2022-09-24 10:00:00",
          "id_services": "1",
          "notes": "dddddddtesst"
        },
        "manage_mode": false,
        "csrftoken": "",
        "customer": {
          "city": "Alameda",
          "zip_code": "",
          "email": "deepchovatiya2002@gmail.com",
          "user_type": "2",
          "phone_number": "",
          "first_name": "Deep",
          "last_name": "Chovatiya",
          "address": "tt"
        },
        "other_params": {
          "merchant_id": "0000000004",
          "service_duration": "5",
          "service_id_type": "1",
          "logged_in_user_id": "0000000046"
        }
      },
      "manage_mode": false,
      "appointment_id": "undefined"
    }));



    print("Your data is ${response}");
    print("Your data is ${response.body}");
    print("Your data is ${response.statusCode}");
    // // print("Hello ddd ${response}");
    // // print("Hello ddd ${response.statusCode}");
    // // print("Hello ddd ${response.body.runtimeType}");
    // // print("Hello ddd ${response.body.runtimeType}");
    // // print("Hello ddd--> ${jsonDecode(response.body).length}");
    //
    // // df = ResData.fromJson(jsonDecode(response.body));
    // // print("Hello ddd ${df.body}");
    // // print("Hello ddd ${df.toJson()}");
    //
    // String fff = 5.toString();
    // jsonDecode(fff);
    //
    // for (int i = 0; i < jsonDecode(response.body).length; i++) {
    //
    //   print('string ===> ${response.body[10]}');
    //   print('json ===> ${jsonDecode(response.body)[0]}');
    //   print('json ===> ${jsonDecode(response.body)[0]["userId"]}');
    //   print('model ===> ${ResData.fromJson(jsonDecode(response.body)[0])}');
    //   print(
    //       'model ===> ${ResData.fromJson(jsonDecode(response.body)[0]).userId}');
    //   break;
    //   dddd.add(ResData.fromJson(jsonDecode(response.body)[i]));
    // }
    // print("dddd ${dddd.length}");
    // dddd.addAll()
  }

  Future<ResCountry> fetchCountry() async {
    final res = await http11.post(
        Uri.parse("https://staging-mobile.vireats.com/"),
        body: {"action": "get-state", "country_id": "105"});
    // print("rsss ${res.body.runtimeType}");
    var data = jsonDecode(res.body);

    // print("rsss ${data.runtimeType}");
    // print("rsss ${data['data'].length}");

    ResCountry dd = ResCountry.fromJson(data);

    return dd;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder<ResCountry>(
          future: fetchCountry(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return Text("${snapshot.data.data[1].title}");
            } else {
              return CircularProgressIndicator();
            }
          },
        ));
  }
}



class GoogleSignInDemo extends StatelessWidget {
  const GoogleSignInDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child:
        InkWell(
          onTap: () async{
            GoogleSignInAccount? dd = await _googleSignIn.signIn();
          },
          child: Container(
            color:Colors.red,
            padding: EdgeInsets.all(12),
            child: Text("Hello Goa"),
          ),
        ),
      ),
    );
  }
}
