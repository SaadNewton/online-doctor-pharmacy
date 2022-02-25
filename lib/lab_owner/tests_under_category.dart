import 'dart:ui';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:doctoworld_seller/Components/custom_button.dart';
import 'package:doctoworld_seller/Controllers/loading_controller.dart';
import 'package:doctoworld_seller/Controllers/model_controllers.dart';
import 'package:doctoworld_seller/Locale/locale.dart';
import 'package:doctoworld_seller/Models/tests_under_test_category.dart';
import 'package:doctoworld_seller/Repositories/delete_test_under_test_Category.dart';
import 'package:doctoworld_seller/Repositories/tests_by_test_category_repo.dart';
import 'package:doctoworld_seller/Services/get_method_call.dart';
import 'package:doctoworld_seller/Services/post_method_call.dart';
import 'package:doctoworld_seller/Services/service_urls.dart';
import 'package:doctoworld_seller/lab_owner/single_test_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'add_new_test.dart';

class TestsUnderTestCategory extends StatefulWidget {
  String? testCatName;
  String? testCatID;
  TestsUnderTestCategory({this.testCatID, this.testCatName});

  @override
  _TestsUnderTestCategoryState createState() => _TestsUnderTestCategoryState();
}

class _TestsUnderTestCategoryState extends State<TestsUnderTestCategory> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Get.find<LoaderController>().updateDataController(true);
      Get.find<LoaderController>().updateFormController(false);
    });
    getMethod(context, getAllTestsUnderTestCategoryService,
        {'test_category_id': widget.testCatID}, true, testsByTestCategoryRepo);
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    return GetBuilder<LoaderController>(
      builder: (loaderController) => GetBuilder<ModelControllers>(
        builder: (modelController) => Scaffold(
          appBar: AppBar(
            title: Text('Tests Under This Category'),
            textTheme: Theme.of(context).textTheme,
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_rounded),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: FadedSlideAnimation(
            AllTestsOfCategory(
              categoryId: widget.testCatID,
              testsByTestCategoryModel:
                  modelController.testsByTestCategoryModel,
            ),
            beginOffset: Offset(0, 0.3),
            endOffset: Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: CustomButton(
                label: 'Add New Test',
                onTap: () {
                  Get.to(() => AddNewLabTest(
                        addNew: true,
                        testCategoryID: widget.testCatID,
                      ));
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AllTestsOfCategory extends StatelessWidget {
  final categoryId;
  final TestsByTestCategoryModel? testsByTestCategoryModel;
  AllTestsOfCategory({this.testsByTestCategoryModel, this.categoryId});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoaderController>(
      builder: (loaderController) => ModalProgressHUD(
        inAsyncCall: loaderController.formLoader,
        child: Scaffold(
          body: loaderController.dataLoader
              ? Center(child: CircularProgressIndicator())
              : testsByTestCategoryModel!.status == false
                  ? Center(child: Text('No Record Found'))
                  : ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: testsByTestCategoryModel!.data!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.to(SingleTestDetails(
                              testDetail:
                                  testsByTestCategoryModel!.data![index],
                            ));
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(
                                thickness: 6,
                                color: Theme.of(context).backgroundColor,
                              ),
                              ListTile(
                                leading: FadedScaleAnimation(
                                  testsByTestCategoryModel!
                                              .data![index].imagePath ==
                                          null
                                      ? Image.asset(
                                          'assets/labTest.png',
                                          height: 40,
                                          width: 40,
                                        )
                                      : Image.network(
                                          '$imageBaseUrl${testsByTestCategoryModel!.data![index].imagePath}',
                                          height: 40,
                                          width: 40,
                                          fit: BoxFit.cover,
                                        ),
                                  durationInMilliseconds: 400,
                                ),
                                title: Text(
                                  '${testsByTestCategoryModel!.data![index].name}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(fontWeight: FontWeight.w500),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                          text: 'Price - ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2!
                                              .copyWith(),
                                        ),
                                        TextSpan(
                                          text:
                                              '${testsByTestCategoryModel!.data![index].price}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1!
                                              .copyWith(),
                                        )
                                      ]),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '\> Tap to See Details',
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.grey),
                                    )
                                  ],
                                ),
                                trailing: GestureDetector(
                                  onTap: () {
                                    deletedTestCategoryId = categoryId;
                                    loaderController.updateFormController(true);
                                    postMethod(
                                        context,
                                        deleteTestUnderTestCategoryService,
                                        {
                                          'delete_id':
                                              '${testsByTestCategoryModel!.data![index].id}',
                                        },
                                        true,
                                        deleteTestUnderTestsCategoryRepo);
                                  },
                                  child: Container(
                                    color: Theme.of(context).primaryColor,
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
        ),
      ),
    );
  }
}
