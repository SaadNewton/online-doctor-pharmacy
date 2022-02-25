import 'dart:ui';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:doctoworld_seller/Components/custom_button.dart';
import 'package:doctoworld_seller/Controllers/loading_controller.dart';
import 'package:doctoworld_seller/Controllers/model_controllers.dart';
import 'package:doctoworld_seller/Locale/locale.dart';
import 'package:doctoworld_seller/Models/lab_test_categories_model.dart';
import 'package:doctoworld_seller/Repositories/all_lab_test_categories_repo.dart';
import 'package:doctoworld_seller/Repositories/delete_test_Category_repo.dart';
import 'package:doctoworld_seller/Services/get_method_call.dart';
import 'package:doctoworld_seller/Services/service_urls.dart';
import 'package:doctoworld_seller/Storage/local_Storage.dart';
import 'package:doctoworld_seller/lab_owner/tests_under_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'Orders/all_lab_orders.dart';
import 'add_new_test_category.dart';

class ShowAllTestCategories extends StatefulWidget {
  @override
  _ShowAllTestCategoriesState createState() => _ShowAllTestCategoriesState();
}

class _ShowAllTestCategoriesState extends State<ShowAllTestCategories> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Get.find<LoaderController>().updateDataController(true);
      Get.find<LoaderController>().updateFormController(false);
    });
    getMethod(
        context,
        getAllLabTestCategoriesService,
        {'lab_id': storageBox!.read('lab_id')},
        true,
        getAllLabTestCategoriesRepo);
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    return GetBuilder<LoaderController>(
      builder: (loaderController) => GetBuilder<ModelControllers>(
        builder: (modelController) => Scaffold(
          appBar: AppBar(
            title: Text('Test Categories'),
            textTheme: Theme.of(context).textTheme,
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_rounded),
              onPressed: () {
                Get.off(AllLabOrders(
                  tabIndex: 0,
                ));
              },
            ),
          ),
          body: FadedSlideAnimation(
            AllTestCategories(
              labTestCategoriesModel: modelController.labTestCategoriesModel,
            ),
            beginOffset: Offset(0, 0.3),
            endOffset: Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: CustomButton(
                label: 'Add New',
                onTap: () {
                  Get.to(() => AddNewTestCategory(true));
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AllTestCategories extends StatelessWidget {
  final LabTestCategoriesModel? labTestCategoriesModel;
  AllTestCategories({this.labTestCategoriesModel});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoaderController>(
      builder: (loaderController) => ModalProgressHUD(
        inAsyncCall: loaderController.formLoader,
        child: Scaffold(
          body: loaderController.dataLoader
              ? Center(child: CircularProgressIndicator())
              : labTestCategoriesModel!.status == false
                  ? Center(child: Text('No Record Found'))
                  : ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: labTestCategoriesModel!.data!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.to(
                              TestsUnderTestCategory(
                                testCatID: labTestCategoriesModel!
                                    .data![index].id
                                    .toString(),
                                testCatName:
                                    labTestCategoriesModel!.data![index].name,
                              ),
                            );
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
                                  Image.asset(
                                    'assets/labTest.png',
                                    height: 40,
                                    width: 40,
                                  ),
                                  durationInMilliseconds: 400,
                                ),
                                title: Text(
                                  '${labTestCategoriesModel!.data![index].name}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(fontWeight: FontWeight.w500),
                                ),
                                subtitle: Text(
                                  '\> Tap to See Details',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.grey),
                                ),
                                trailing: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(AddNewTestCategory(
                                          false,
                                          '${labTestCategoriesModel!.data![index].name}',
                                          '${labTestCategoriesModel!.data![index].discription}',
                                          '${labTestCategoriesModel!.data![index].id}',
                                          '${labTestCategoriesModel!.data![index].labId}',
                                        ));
                                      },
                                      child: Container(
                                        color: Theme.of(context).primaryColor,
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Icon(
                                            Icons.edit,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        loaderController
                                            .updateFormController(true);
                                        getMethod(
                                            context,
                                            deleteTestCategoryService,
                                            {
                                              'delete_id':
                                                  '${labTestCategoriesModel!.data![index].id}',
                                              'lab_id':
                                                  '${labTestCategoriesModel!.data![index].labId}'
                                            },
                                            true,
                                            deleteTestCategoryRepo);
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
                                  ],
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
