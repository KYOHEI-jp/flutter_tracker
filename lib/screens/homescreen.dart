import 'package:fitness_tracker_app/utils.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  buildTab(String text) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: Chip(
        elevation: 10,
        backgroundColor: Colors.redAccent,
        label: Text(
          text,
          style: textStyle(18, Colors.white, FontWeight.w700),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFBF5F5),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 55.0),
          child: Column(
            children: [
              Text(
                "Fitify",
                style: textStyle(45, Colors.black, FontWeight.w600),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  children: [
                    buildTab("All"),
                    buildTab("Weight"),
                    buildTab("Height"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Card(
                          elevation: 6.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: ListTile(
                              leading: Image(
                                width: 50,
                                height: 50,
                                image: AssetImage('images/weight.png'),
                                fit: BoxFit.cover,
                              ),
                              title: Text(
                                "65 kg",
                                style: textStyle(27, Colors.black, FontWeight.w600),
                              ),
                              trailing: Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 28,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
