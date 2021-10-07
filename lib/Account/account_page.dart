import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:doctoworld_seller/Data/global_data.dart';
import 'package:doctoworld_seller/Locale/locale.dart';
import 'package:doctoworld_seller/Repositories/get_user_detail_info.dart';
import 'package:doctoworld_seller/Routes/routes.dart';
import 'package:doctoworld_seller/Services/service_urls.dart';
import 'package:doctoworld_seller/Storage/local_Storage.dart';
import 'package:doctoworld_seller/UI/change_password.dart';
import 'package:doctoworld_seller/UI/contact_us_ui.dart';
import 'package:doctoworld_seller/UI/edit_profile_ui.dart';
import 'package:doctoworld_seller/UI/login_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class MenuTile {
  String? title;
  String? subtitle;
  IconData iconData;
  Function onTap;

  MenuTile(this.title, this.subtitle, this.iconData, this.onTap);
}

class _AccountPageState extends State<AccountPage> {
  @override
  void initState() {
    // TODO: implement initState
    getUserDetailRepo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List<MenuTile> _menu = [
      // MenuTile(locale.myOrders, locale.companyPolicies, Icons.assignment, () {
      //   Navigator.pushNamed(context, PageRoutes.recentOrdersTabs);
      // }),
      // MenuTile(locale.storeProfile, locale.letUsHelpYou, Icons.store, () {
      //   Navigator.pushNamed(context, PageRoutes.profilePage);
      // }),
      // MenuTile(
      //     locale.wallet, locale.quickPayments, Icons.account_balance_wallet,
      //     () {
      //   Navigator.pushNamed(context, PageRoutes.walletPage);
      // }),
      // MenuTile(locale.insight, locale.seeTheProgress, Icons.insert_chart, () {
      //   Navigator.pushNamed(context, PageRoutes.insightPage);
      // }),
      // MenuTile(locale.earnings, locale.sellOverview, Icons.monetization_on, () {
      //   Navigator.pushNamed(context, PageRoutes.earningsPage);
      // }),
      // MenuTile(locale.myItems, locale.manageItems, Icons.local_hospital, () {
      //   Navigator.pushNamed(context, PageRoutes.myItemsPage);
      // }),
      // MenuTile(locale.changeLanguage, locale.changeLanguage, Icons.language,
      //     () {
      //   Navigator.pushNamed(context, PageRoutes.languagePage);
      // }),
      MenuTile(locale.tnC, locale.companyPolicies, Icons.assignment, () {
        Navigator.pushNamed(context, PageRoutes.tncPage);
      }),
      MenuTile(locale.contactUs, locale.letUsHelpYou, Icons.mail, () {
        Get.to(ContactUs());
      }),
      // MenuTile(locale.faqs, locale.quickAnswers, Icons.announcement, () {
      //   Navigator.pushNamed(context, PageRoutes.faqPage);
      // }),
      MenuTile('Reset Password', 'Be Secure', Icons.lock, () {
        Get.to(ChangePassword(
          userId: userDetailModel!.data!.id,
        ));
      }),
      MenuTile(locale.logout, locale.seeYouSoon, Icons.exit_to_app, () {
        Get.offAll(LoginUI());
        storageBox!.erase();
      }),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.account!),
        textTheme: Theme.of(context).textTheme,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.close,
            color: Theme.of(context).primaryColor,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: FadedScaleAnimation(
                    userDetailModel!.data!.imagePath == null ||
                            userDetailModel == null
                        ? Image.asset('assets/seller img/1.png', scale: 3.5)
                        : Image.network(
                            "$imageBaseUrl${userDetailModel!.data!.imagePath!}",
                            height: 150,
                            width: MediaQuery.of(context).size.width * 0.5,
                            fit: BoxFit.fill,
                          ),
                    durationInMilliseconds: 400,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userDetailModel == null
                            ? userDetailModel!.data!.name!
                            : 'User',
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              fontSize: 18,
                            ),
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 3,
                      ),
                      userDetailModel == null
                          ? SizedBox()
                          : RichText(
                              text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text:
                                      "\n${userDetailModel!.data!.ownerPhone}",
                                  style: Theme.of(context).textTheme.subtitle2),
                            ])),
                      SizedBox(
                        height: 10,
                      ),
                      OutlinedButton(
                          onPressed: () {
                            Get.to(EditDetails(
                              editLabDetails: false,
                            ));
                          },
                          child: Text(
                            '✎  Edit',
                            style: TextStyle(color: Colors.black),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Theme.of(context).backgroundColor,
            child: GridView.builder(
                itemCount: _menu.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(8.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.6, crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: _menu[index].onTap as void Function()?,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FadedScaleAnimation(
                            Text(
                              _menu[index].title!,
                              style: Theme.of(context).textTheme.subtitle1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            durationInMilliseconds: 400,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  _menu[index].subtitle!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(fontSize: 13),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Icon(
                                _menu[index].iconData,
                                size: 32,
                                color: Theme.of(context).highlightColor,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
