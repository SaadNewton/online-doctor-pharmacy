import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:doctoworld_seller/Locale/locale.dart';
import 'package:doctoworld_seller/Routes/routes.dart';
import 'package:flutter/material.dart';

class TopSellingItem {
  TopSellingItem(this.img, this.name, this.sold, this.price);
  String img;
  String name;
  String sold;
  String price;
}

class InsightPage extends StatefulWidget {
  @override
  _InsightPageState createState() => _InsightPageState();
}

class _InsightPageState extends State<InsightPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List<TopSellingItem> topSellingItems = [
      TopSellingItem('assets/medicine img/11.png', 'Salospir 100mg Tablet',
          '124', '378.00'),
      TopSellingItem('assets/medicine img/22.png', 'Xenical 120mg Tablet',
          '119', '279.00'),
      TopSellingItem('assets/medicine img/33.png', 'Allergy Relief Tablet',
          '124', '235.00'),
      TopSellingItem(
          'assets/medicine img/44.png', 'Arber OTC Tablet', '127', '159.00'),
      TopSellingItem('assets/medicine img/55.png', 'Non Drosy Lartin Tablet',
          '136', '139.00'),
      TopSellingItem('assets/medicine img/66.png', 'Corcidin 100mg Tablet',
          '110', '199.00'),
    ];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Navigator.pushNamed(context, PageRoutes.accountPage);
            }),
        centerTitle: true,
        title: Text(locale.insight!),
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
              buildOrderCard(context),
              SizedBox(
                height: 8,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        locale.orders!,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      FadedScaleAnimation(
                        Image.asset(
                          'assets/graph1.png',
                          fit: BoxFit.fill,
                          colorBlendMode: BlendMode.color,
                          color: Theme.of(context).primaryColor,
                        ),
                        durationInMilliseconds: 400,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          locale.viewAllTransactions!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: 14,
                                  color: Theme.of(context).primaryColor),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16),
                child: Text(
                  locale.topSellingItems!,
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
                  itemCount: topSellingItems.length,
                  itemBuilder: (context, index) {
                    return buildTopSellingItemCard(
                        context,
                        topSellingItems[index].img,
                        topSellingItems[index].name,
                        topSellingItems[index].sold,
                        topSellingItems[index].price);
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

  Container buildOrderCard(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: '${locale.orders}\n',
                      style: Theme.of(context).textTheme.subtitle2),
                  TextSpan(
                      text: '698',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(height: 2)),
                ])),
            VerticalDivider(
              color: Colors.grey[400],
            ),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: '${locale.revenue}\n',
                      style: Theme.of(context).textTheme.subtitle2),
                  TextSpan(
                      text: '\$ 7.8k',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(height: 2)),
                ])),
            VerticalDivider(
              color: Colors.grey[400],
            ),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: '${locale.pending}\n',
                      style: Theme.of(context).textTheme.subtitle2),
                  TextSpan(
                      text: '14',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(height: 2)),
                ])),
          ],
        ),
      ),
    );
  }

  Container buildTopSellingItemCard(BuildContext context, String img,
      String name, String sold, String price) {
    var locale = AppLocalizations.of(context)!;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Stack(
        children: [
          Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    img,
                    fit: BoxFit.fill,
                    height: 70,
                  )),
              SizedBox(
                width: 10,
              ),
              RichText(
                  text: TextSpan(
                      style: Theme.of(context).textTheme.subtitle1,
                      children: <TextSpan>[
                    TextSpan(text: '$name\n'),
                    TextSpan(
                        text: '${locale.apparel}\n\n',
                        style: Theme.of(context).textTheme.subtitle2),
                    TextSpan(
                        text: '$sold ${locale.sold}',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(height: 0.5)),
                  ])),
            ],
          ),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: RichText(
              text: TextSpan(
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(height: 1),
                  children: <TextSpan>[
                    TextSpan(text: '\n\n\n\n${locale.revenue} '),
                    TextSpan(
                        text: '\$$price',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(fontSize: 14)),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
