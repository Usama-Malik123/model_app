import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model_application/controller.dart';
import 'package:model_application/model.dart';

class ViewScreen extends StatefulWidget {
  @override
  State<ViewScreen> createState() => _LocationScreen();
}

class _LocationScreen extends State<ViewScreen> {
  late Future<Model> futureAlbum;
  final controller = Get.put(Controller());
  final myController = TextEditingController();
  // late FirebaseAnalytics _analytics;

  var name="";
  var age;
  var count;
  var firebase_analytics;

  @override
  void initState() {
    super.initState();
    futureAlbum = controller.getData("Null");
   // _analytics = FirebaseAnalytics.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Model>(
        future: futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error.toString()}"),
            );
          } else if (snapshot.hasData) {
            var data = snapshot.data;

            return Container(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Text("Name : "),
                          Text(name.toString()),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Age    : "),
                          Text(age.toString()),
                        ],
                      ),
                       
                      Row(
                        children: [
                          Text("Count : "),
                          Text(count.toString()),
                        ],
                      ),
                      TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Enter Name',
                            hintText: 'Enter Your Name'),
                        controller: myController,
                      ),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              //sendAnalyticsEvent(eventName: "Testng", clickevent:  "Calculate Details");
                              futureAlbum = controller.getData(myController.text);
                              setState(() {
                                name = data!.name;
                                age = data.age;
                                count = data.count;
                              });
                            },
                            child: Icon(Icons.person_add_sharp,
                             size: 30.0,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
//    Future sendAnalyticsEvent(
//      {String? eventName, String? clickevent}) async {
//       await _analytics.logEvent(
//       name: '${eventName}',
//       parameters: <String, dynamic>{
//         'clickEvent': clickevent
//      },
//    );
//  }

}
