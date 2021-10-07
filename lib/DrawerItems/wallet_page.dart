import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:doctoworld_seller/Components/custom_button.dart';
import 'package:doctoworld_seller/Locale/locale.dart';
import 'package:doctoworld_seller/Routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WalletCard {
  final String name;
  final String orderDetails;
  final String payment;
  final String earnings;

  WalletCard(this.name, this.orderDetails, this.payment, this.earnings);
}

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () =>
                Navigator.pushNamed(context, PageRoutes.accountPage)),
        centerTitle: true,
        title: Text(locale.wallet!),
        textTheme: Theme.of(context).textTheme,
      ),
      body: FadedSlideAnimation(
        Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 120),
                Container(
                  color: Theme.of(context).backgroundColor,
                  padding:
                      EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
                  child: Text(locale.recent!),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 172.0),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 15,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: buildRowChildWallet(theme, 'Sam Smith',
                                  '3 items | 30 June 2018, 11.59 am'),
                            ),
                            // Spacer(),
                            Expanded(
                              child: buildRowChildWallet(
                                  theme, '\$80.00', locale.online!,
                                  alignment: CrossAxisAlignment.end),
                            ),
                            // Spacer(),
                            Expanded(
                              child: buildRowChildWallet(
                                  theme, '\$6.50', locale.earnings!,
                                  alignment: CrossAxisAlignment.end),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 6,
                        color: Theme.of(context).backgroundColor,
                      ),
                    ],
                  );
                },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
                  child: Text(
                    locale.availableBalance!.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontSize: 14),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    '\$ 520.50',
                    style: theme.textTheme.headline6!.copyWith(fontSize: 30),
                  ),
                ),
              ],
            ),
            Positioned.directional(
              textDirection: Directionality.of(context),
              end: 15,
              top: 90,
              child: Container(
                width: 150,
                child: CustomButton(
                  radius: 0,
                  onTap: () =>
                      Navigator.pushNamed(context, PageRoutes.sendToBank),
                  label: locale.sendToBank,
                  color: Theme.of(context).primaryColor,
                ),
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

  Widget buildRowChildWallet(ThemeData theme, String text1, String text2,
      {CrossAxisAlignment? alignment}) {
    return Column(
      crossAxisAlignment: alignment ?? CrossAxisAlignment.start,
      children: <Widget>[
        Text(text1, style: theme.textTheme.bodyText1),
        SizedBox(height: 6.0),
        Text(
          text2,
          style: theme.textTheme.subtitle2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
