import 'package:doctoworld_seller/Components/custom_button.dart';
import 'package:doctoworld_seller/Controllers/loading_controller.dart';
import 'package:doctoworld_seller/Controllers/model_controllers.dart';
import 'package:doctoworld_seller/Locale/locale.dart';
import 'package:doctoworld_seller/Models/tests_under_test_category.dart';
import 'package:doctoworld_seller/Services/service_urls.dart';
import 'package:doctoworld_seller/lab_owner/add_new_test.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleTestDetails extends StatefulWidget {
  final TestsByTestCategoryModelData? testDetail;
  SingleTestDetails({this.testDetail});

  @override
  _SingleTestDetailsState createState() => _SingleTestDetailsState();
}

class _SingleTestDetailsState extends State<SingleTestDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return GetBuilder<LoaderController>(
      builder: (loaderController) => GetBuilder<ModelControllers>(
        builder: (modelController) => Scaffold(
          appBar: AppBar(
            title: Text('Test Details'),
            textTheme: Theme.of(context).textTheme,
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_rounded),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Center(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(2, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Image.network(
                    '$imageBaseUrl${widget.testDetail!.imagePath}',
                    height: 100,
                    width: 150,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  '${widget.testDetail!.name}',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: Offset(2, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              'Description',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              '${widget.testDetail!.description}',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(fontSize: 12),
                            )
                          ],
                        ),
                      )),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: MyCustomBox(
                        icon: Icons.price_change_outlined,
                        label: 'Test Price',
                        value: '${widget.testDetail!.price}',
                      ),
                    ),
                    Expanded(
                      child: MyCustomBox(
                        icon: Icons.access_time,
                        label: 'Est Time',
                        value: '${widget.testDetail!.estTime} Hrs.',
                      ),
                    ),
                    Expanded(
                      child: MyCustomBox(
                        icon: Icons.home,
                        label: 'Avail Home',
                        value: widget.testDetail!.isAvailableForHome == 1
                            ? 'YES'
                            : 'NO',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 150,
                  child: CustomButton(
                    label: '✎️  Edit Test',
                    onTap: () {
                      Get.to(AddNewLabTest(
                        addNew: false,
                        model: widget.testDetail!,
                        testCategoryID:
                            widget.testDetail!.testCategoryId.toString(),
                      ));
                    },
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

class MyCustomBox extends StatelessWidget {
  IconData? icon;
  String? label;
  String? value;
  MyCustomBox({this.icon, this.label, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 5,
                offset: Offset(2, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Icon(icon!),
                SizedBox(
                  height: 5,
                ),
                Text(label!),
                SizedBox(
                  height: 5,
                ),
                Text(value!,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontSize: 12)),
              ],
            ),
          )),
    );
  }
}
