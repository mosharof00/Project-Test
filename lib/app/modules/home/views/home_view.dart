import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    final List dropDownList = [
      'class-1',
      'class-2',
      'class-3',
      'class-4',
      'class-5',
      'class-6'
    ];
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Container(
                height: 100,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    color: Color(0x335C6BC0),
                    borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Select class & date',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 5),
                      SizedBox(
                        height: 50,
                        width: MediaQuery.sizeOf(context).width,
                        child: DropdownMenu(
                            onSelected: (color) {
                              if (color != null) {}
                            },
                            width: 440,
                            hintText: 'Select Exam',
                            dropdownMenuEntries: const <DropdownMenuEntry<
                                Color>>[
                              DropdownMenuEntry(
                                  value: Colors.black, label: 'Black'),
                              DropdownMenuEntry(
                                  value: Colors.blue, label: 'Blue'),
                              DropdownMenuEntry(
                                  value: Colors.red, label: 'Red'),
                              DropdownMenuEntry(
                                  value: Colors.green, label: 'Green')
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Obx(() => SizedBox(
                    height: 50,
                    child: DropdownButton(
                      hint: const Text('Select Class'),
                      // underline: SizedBox(),
                      isExpanded: true,
                      value: homeController.selectedItem.value == ""
                          ? null
                          : homeController.selectedItem.value,
                      onChanged: (newValue) {
                        homeController.upDateSelectedItem(newValue.toString());
                      },
                      items: dropDownList.map((e) {
                        return DropdownMenuItem(
                            value: e.toString(), child: Text(e.toString()));
                      }).toList(),
                    ),
                  )),
              // Obx(() => SizedBox(
              //       height: 20,
              //       width: MediaQuery.sizeOf(context).width,
              //       child: DropdownButton<String>(
              //           isExpanded: true,
              //           value: homeController.selectedItem.value,
              //           onChanged: (newValue) {
              //             homeController
              //                 .upDateSelectedItem(newValue.toString());
              //           },
              //           items: dropDownList
              //               .map<DropdownMenuItem<String>>((String value) {
              //             return DropdownMenuItem<String>(
              //                 value: value, child: Text(value));
              //           }).toList()),
              //     )),

              SizedBox(
                height: 40,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Text('I am in'),
                      );
                    }),
              )
            ],
          ),
        ));
  }
}

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   final List<String> classes = ['class1', 'class2', 'class3'];
//   String dropdownValue = 'class1';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Dropdown Menu with Search'),
//         ),
//         body: Center(
//           child: DropdownButton<String>(
//             value: dropdownValue,
//             onChanged: (String? newValue) {
//               if (newValue != null) {
//                 setState(() {
//                   dropdownValue = newValue;
//                 });
//               }
//             },
//             items: classes.map<DropdownMenuItem<String>>((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(value),
//               );
//             }).toList(),
//             isExpanded: true,
//             underline: Container(
//               height: 2,
//               color: Colors.blue,
//             ),
//             icon: Icon(Icons.arrow_drop_down),
//             iconSize: 36,
//             elevation: 16,
//             style: TextStyle(color: Colors.blue, fontSize: 20),
//             dropdownColor: Colors.white,
//             // Enable search functionality
//             isDense: false,
//             hint: Text("Select a class"),
//             onChanged: (String? newValue) {
//               setState(() {
//                 dropdownValue = newValue!;
//               });
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

