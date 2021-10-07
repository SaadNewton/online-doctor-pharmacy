import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:doctoworld_seller/Locale/locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ReviewPage extends StatefulWidget {
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class ReviewDetail {
  String image;
  String name;
  String? disease;
  double rating;
  String date;

  ReviewDetail(this.image, this.name, this.disease, this.rating, this.date);
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List<ReviewDetail> _reviews = [
      ReviewDetail('assets/profile pics/dp1.png', 'Ronny George',
          locale.coldFever, 5.0, '20 Dec, 2019'),
      ReviewDetail('assets/profile pics/dp2.png', 'Reena Roy', locale.headache,
          4.0, '15 Dec, 2019'),
      ReviewDetail('assets/profile pics/dp3.png', 'Herry Johnson',
          locale.headache, 1.0, '02 Dec, 2019'),
      ReviewDetail('assets/profile pics/dp1.png', 'Ronny George',
          locale.coldFever, 5.0, '20 Dec, 2019'),
      ReviewDetail('assets/profile pics/dp2.png', 'Reena Roy', locale.headache,
          4.0, '15 Dec, 2019'),
      ReviewDetail('assets/profile pics/dp3.png', 'Herry Johnson',
          locale.headache, 1.0, '02 Dec, 2019'),
      ReviewDetail('assets/profile pics/dp1.png', 'Ronny George',
          locale.coldFever, 5.0, '20 Dec, 2019'),
      ReviewDetail('assets/profile pics/dp2.png', 'Reena Roy', locale.headache,
          4.0, '15 Dec, 2019'),
      ReviewDetail('assets/profile pics/dp3.png', 'Herry Johnson',
          locale.headache, 1.0, '02 Dec, 2019'),
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          locale.reviews!,
          style: Theme.of(context).appBarTheme.textTheme!.bodyText1,
        ),
      ),
      body: FadedSlideAnimation(
        ListView(
          physics: BouncingScrollPhysics(),
          children: [
            ListTile(
              title: Row(
                children: [
                  Text(
                    'Salospir 100mg Tablet',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 20),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Color(0xffF29F19),
                        size: 16,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        '4.5',
                        style: Theme.of(context)
                            .appBarTheme
                            .textTheme!
                            .bodyText1!
                            .copyWith(color: Color(0xffF29F19), fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
              subtitle: Row(
                children: [
                  Text(
                    locale.averageReviews!,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontSize: 14, height: 1.8),
                  ),
                  Spacer(),
                  Text(
                    locale.avgReview!,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontSize: 14, height: 1.8),
                  ),
                ],
              ),
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: _reviews.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Divider(
                        color: Theme.of(context).backgroundColor,
                        thickness: 6,
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          radius: 18,
                          backgroundImage: AssetImage(_reviews[index].image),
                        ),
                        title: Row(
                          children: [
                            Text(
                              _reviews[index].name,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Text(
                                  _reviews[index].rating.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(fontSize: 10),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Row(
                                  children: List.generate(
                                    _reviews[index].rating.floor(),
                                    (index) => Icon(
                                      Icons.star,
                                      size: 12,
                                      color: Color(0xffF29F19),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: List.generate(
                                    5 - _reviews[index].rating.floor(),
                                    (index) => Icon(
                                      Icons.star,
                                      size: 12,
                                      color: Theme.of(context).disabledColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            RichText(
                                text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: locale.forr! + ' ',
                                  style: Theme.of(context).textTheme.subtitle2),
                              TextSpan(
                                text: locale.coldFever,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(fontSize: 10),
                              ),
                            ])),
                            Spacer(),
                            Text(
                              '20 Dec, 2020',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(fontSize: 10),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 10.0),
                        child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
                      )
                    ],
                  );
                })
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
