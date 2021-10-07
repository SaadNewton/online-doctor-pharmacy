import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:doctoworld_seller/Components/custom_button.dart';
import 'package:doctoworld_seller/Components/entry_field.dart';
import 'package:doctoworld_seller/Locale/locale.dart';
import 'package:doctoworld_seller/Routes/routes.dart';
import 'package:flutter/material.dart';

class SupportPage extends StatefulWidget {
  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.support!),
        textTheme: Theme.of(context).textTheme,
        leading: IconButton(
          onPressed: () => Navigator.pushNamed(context, PageRoutes.accountPage),
          icon: Icon(Icons.menu),
        ),
        centerTitle: true,
      ),
      body: FadedSlideAnimation(
        SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height + 50,
            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  locale.howMayWeHelpYou!,
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Theme.of(context).hintColor),
                ),
                Text(
                  locale.letUsKnowUrQueriesFeedbacks!,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Theme.of(context).disabledColor),
                ),
                Spacer(),
                EntryField(prefixIcon: Icons.mail, hint: locale.emailAddress),
                SizedBox(height: 12.0),
                EntryField(
                  prefixIcon: Icons.edit,
                  hint: locale.writeYourMsg,
                  maxLines: 4,
                ),
                Spacer(),
                CustomButton(label: locale.submit),
                Expanded(
                  flex: 4,
                  child: FadedScaleAnimation(
                    Image.asset('assets/hero_image.png'),
                    durationInMilliseconds: 400,
                  ),
                ),
              ],
            ),
          ),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
