import 'package:fitness_tracker_app/utils.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = TextEditingController();
  String? dropdownValue = "weight";

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

  openAppDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            // TODO statefulBuilderについて、使い方、動きを調べる
          child: StatefulBuilder(
              builder: (BuildContext context, StateSetter stateSetter) {
                return Container(
                  height: 220,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: [
                        Text(
                          "Add",
                          style: textStyle(28, Colors.black, FontWeight.w700),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 125,
                              height: 40,
                              child: TextFormField(
                                controller: controller,
                                style: textStyle(20, Colors.black, FontWeight.w500),
                                decoration: InputDecoration(
                                    hintText: dropdownValue == "weight"
                                        ? "In kg"
                                        : "In cm",
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.black))),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            DropdownButton(
                              onChanged: (value) {
                                // TODO statesetterについて、使い方、動きを調べる
                                stateSetter(
                                  () {
                                    dropdownValue = value as String?;
                                  },
                                );
                              },
                              hint: Text(
                                "weight",
                                style: textStyle(20, Colors.black, FontWeight.w700),
                              ),
                              dropdownColor: Colors.grey,
                              elevation: 7,
                              value: dropdownValue,
                              items: [
                                DropdownMenuItem(
                                  value: "weight",
                                  child: Text(
                                    "Weight",
                                    style: textStyle(
                                        20, Colors.black, FontWeight.w700),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: "height",
                                  child: Text(
                                    "Height",
                                    style: textStyle(
                                        20, Colors.black, FontWeight.w700),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        IconButton(
                          color: Colors.redAccent,
                          iconSize: 50,
                          onPressed: () => print("Pressed"),
                          icon: Icon(Icons.double_arrow_rounded),
                        ),
                      ],
                    ),
                  ),
                );
              }
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFBF5F5),
      floatingActionButton: Chip(
        backgroundColor: Colors.redAccent,
        onDeleted: () => openAppDialog(),
        deleteIcon: Icon(
          Icons.add,
          color: Colors.white,
          size: 26,
        ),
        label: Text(
          "Add",
          style: textStyle(22, Colors.white, FontWeight.w600),
        ),
      ),
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
                                style: textStyle(
                                    27, Colors.black, FontWeight.w600),
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
