import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:doctoworld_seller/Components/custom_button.dart';
import 'package:doctoworld_seller/Components/entry_field.dart';
import 'package:doctoworld_seller/Locale/locale.dart';
import 'package:doctoworld_seller/Routes/routes.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () =>
                  Navigator.pushNamed(context, PageRoutes.accountPage)),
          centerTitle: true,
          title: Text(locale.myProfile!),
          textTheme: Theme.of(context).textTheme,
        ),
        body: FadedSlideAnimation(
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          FadedScaleAnimation(
                            Image.asset('assets/seller img/1.png', scale: 3.5),
                            durationInMilliseconds: 400,
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                  radius: 14,
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    size: 16,
                                  )),
                              SizedBox(height: 16),
                              Text(
                                locale.changeImage!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                        color: Theme.of(context).primaryColor),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          EntryField(
                            prefixIcon: Icons.store,
                            initialValue: locale.wellLifeStoree,
                          ),
                          SizedBox(height: 20),
                          EntryField(
                            prefixIcon: Icons.phone_iphone,
                            initialValue: '+1 987 654 3210',
                          ),
                          SizedBox(height: 20),
                          EntryField(
                            prefixIcon: Icons.mail,
                            initialValue: 'welllifestore@gmail.com',
                          ),
                        ],
                      ),
                    ),
                    Divider(thickness: 6),
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 20.0),
                      title: Text(
                        locale.selectAddressOnMap!,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(fontSize: 15),
                      ),
                      trailing: Icon(
                        Icons.location_on,
                        color: Theme.of(context).primaryColor,
                      ),
                      subtitle: Text(
                        '\n1124, Patestine Street, Jackson Tower,\nNear City Garden, New York, USA',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, PageRoutes.addAddress);
                      },
                    ),
                    Container(
                      height: 200,
                      color: Theme.of(context).backgroundColor,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: CustomButton(label: locale.update),
              ),
            ],
          ),
          beginOffset: Offset(0, 0.3),
          endOffset: Offset(0, 0),
          slideCurve: Curves.linearToEaseOut,
        ));
  }
}
