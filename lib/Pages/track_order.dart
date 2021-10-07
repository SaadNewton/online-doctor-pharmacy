import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:doctoworld_seller/Components/custom_button.dart';
import 'package:doctoworld_seller/Locale/locale.dart';
import 'package:doctoworld_seller/Routes/routes.dart';
import 'package:flutter/material.dart';

class OrderTrackingPage extends StatefulWidget {
  @override
  _OrderTrackingPageState createState() => _OrderTrackingPageState();
}

class _OrderTrackingPageState extends State<OrderTrackingPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      body: FadedSlideAnimation(
        Stack(
          children: [
            Image.asset(
              'assets/seller_map.png',
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
            PositionedDirectional(
              top: 40,
              start: 8,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: ListTile(
                      leading: FadedScaleAnimation(
                        Image.asset(
                          'assets/test image.png',
                          height: 40,
                          width: 40,
                        ),
                        durationInMilliseconds: 400,
                      ),
                      title: Text(
                        'George Anderson',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        locale.deliveryPartner!,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(letterSpacing: 0.06),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          icon: Icon(
                            Icons.call,
                            color: Theme.of(context).primaryColor,
                          ),
                          color: Theme.of(context).backgroundColor,
                          textColor: Theme.of(context).primaryColor,
                          label: locale.call,
                          radius: 0,
                        ),
                      ),
                      Expanded(
                        child: CustomButton(
                          icon: Icon(
                            Icons.chat,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          label: locale.chat,
                          radius: 0,
                          onTap: () => Navigator.pushNamed(
                              context, PageRoutes.chatScreen),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
