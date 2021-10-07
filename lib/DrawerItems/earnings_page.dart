import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:doctoworld_seller/Locale/locale.dart';
import 'package:doctoworld_seller/Routes/routes.dart';
import 'package:flutter/material.dart';

class Payouts {
  String name;
  String account;
  String amount;
  String date;

  Payouts(this.name, this.account, this.amount, this.date);
}

class EarningsPage extends StatefulWidget {
  @override
  _EarningsPageState createState() => _EarningsPageState();
}

class _EarningsPageState extends State<EarningsPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List<Payouts> payoutList = [
      Payouts('Bank of New York', '6546 5456 1354 5435', '378.00',
          '30 Jun 2020, 11:59 am'),
      Payouts('City Bank', '1567 3573 3576 7932', '400.00',
          '30 Jun 2020, 11:59 am'),
      Payouts('City Bank', '2416 9432 6946 6563', '378.00',
          '30 Jun 2020, 11:59 am'),
      Payouts('Bank of New York', '6546 5456 1354 5435', '378.00',
          '30 Jun 2020, 11:59 am'),
      Payouts('City Bank', '1567 3573 3576 7932', '400.00',
          '30 Jun 2020, 11:59 am'),
      Payouts('City Bank', '2416 9432 6946 6563', '378.00',
          '30 Jun 2020, 11:59 am'),
      Payouts('Bank of New York', '6546 5456 1354 5435', '378.00',
          '30 Jun 2020, 11:59 am'),
    ];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Navigator.pushNamed(context, PageRoutes.accountPage);
            }),
        centerTitle: true,
        title: Text(locale.earnings!),
        textTheme: Theme.of(context).textTheme,
        actions: [
          Row(
            children: [
              Text(
                locale.today!,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    letterSpacing: 1,
                    color: Theme.of(context).primaryColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                width: 8,
              ),
              Icon(Icons.arrow_drop_down,
                  color: Theme.of(context).primaryColor),
              SizedBox(
                width: 8,
              ),
            ],
          )
        ],
      ),
      body: FadedSlideAnimation(
        Container(
          constraints: BoxConstraints.expand(),
          color: Theme.of(context).backgroundColor,
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: 8,
              ),
              Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: ListTile(
                  title: Text(
                    locale.totalEarnings!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 13),
                  ),
                  trailing: Text(
                    '\$590.0',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        locale.earnings!,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      FadedScaleAnimation(
                        Image.asset(
                          'assets/graph.png',
                          fit: BoxFit.fill,
                          colorBlendMode: BlendMode.color,
                          color: Theme.of(context).primaryColor,
                        ),
                        durationInMilliseconds: 400,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16),
                child: Text(
                  locale.payouts!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 14),
                ),
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: 0),
                  shrinkWrap: true,
                  itemCount: payoutList.length,
                  itemBuilder: (context, index) {
                    return buildPayoutCard(
                        context,
                        payoutList[index].name,
                        payoutList[index].account,
                        payoutList[index].amount,
                        payoutList[index].date);
                  }),
            ],
          ),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }

  Container buildPayoutCard(BuildContext context, String name, String account,
      String amount, String date) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Spacer(),
              Text(
                '\$' + amount,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
          SizedBox(
            height: 6,
          ),
          Row(
            children: [
              Text(
                account,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              Spacer(),
              Expanded(
                flex: 2,
                child: Text(
                  date,
                  style: Theme.of(context).textTheme.subtitle2,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
