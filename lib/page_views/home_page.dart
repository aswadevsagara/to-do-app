import 'package:flutter/material.dart';

import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/constants/strings.dart';
import 'package:todo_app/reusable_widgets/customtextfield.dart';

import '../constants/titles.dart';
import '../reusable_widgets/custombuttton.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
 bool isButton = false;
  List<Titles> titles = List.empty(growable: true);

  int selectedIndex = 1;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: liteYellow,
        centerTitle: true,
        title: const Text(
          "Welcome Herody Users",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // textfield_1 //

            Form(
              key: formKey,
              child: TextFields(
                formKey: formKey,
                controller: titleController,
                fontSize: 12,
                maxLines: 1,
                minLines: 1,
                title: field1Title,
                verticalhgt: 0,
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            // textfield_2//

            TextFields(
              controller: descriptionController,
              fontSize: 15,
              maxLines: 5,
              minLines: 1,
              title: field2Title,
              verticalhgt: 30,
            ),
            const SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Visibility(
                  visible: !isButton,
                  child: CustomButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        String title = titleController.text.trim();
                        String description1 = descriptionController.text.trim();
                        if (title.isNotEmpty) {
                          setState(() {
                            titleController.text = "";
                            descriptionController.text = "";
                            titles.add(Titles(
                                title1: title, description: description1));
                          });
                        }
                      }
                    },
                    text: "save",
                  ),
                ),
                Visibility(
                  visible: isButton,
                  child: CustomButton(
                    onPressed: () {
                      String title = titleController.text.trim();
                      String description1 = descriptionController.text.trim();
                      if (title.isNotEmpty) {
                        setState(() {
                          titleController.text = "";
                          descriptionController.text = "";
                          titles[selectedIndex].title1 = title;
                          titles[selectedIndex].description = description1;
                          selectedIndex = -1;
                          isButton=false;
                        });
                      }
                    },
                    text: "update",
                  ),
                ),
              ],
            ),
            titles.isEmpty
                ? const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      "add something...",
                      style: TextStyle(fontSize: 22),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: titles.length,
                      itemBuilder: (context, index) => getRow(index,() {
                        print("hello");
                         titleController.text = titles[index].title1;
                  descriptionController.text = titles[index].description;
                  setState(() {
                    selectedIndex = index;
                    isButton=true;
                  });
                      }),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Widget getRow(int index,VoidCallback fun) {
    return Card(
      color: titles[index].checkboxValue ? liteYellow : Colors.white,
      child: ListTile(
        leading: Checkbox(
            value: titles[index].checkboxValue,
            activeColor: liteYellow,
            onChanged: (newBool) {
              setState(() {
                titles[index].checkboxValue = !titles[index].checkboxValue;
              });
            }),
        title: Column(
          children: [
            Text(
              titles[index].title1,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(titles[index].description),
          ],
        ),
        trailing: SizedBox(
          width: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap:  fun,
                child: Icon(Icons.edit),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    titles.removeAt(index);
                  });
                },
                child: Icon(Icons.delete),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
