import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:doctoworld_seller/Components/custom_button.dart';
import 'package:doctoworld_seller/Components/entry_field.dart';
import 'package:doctoworld_seller/Locale/locale.dart';
import 'package:doctoworld_seller/Routes/routes.dart';
import 'package:flutter/material.dart';

class EditItemPage extends StatefulWidget {
  @override
  _EditItemPageState createState() => _EditItemPageState();
}

class _EditItemPageState extends State<EditItemPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(locale.editItem!),
        textTheme: Theme.of(context).textTheme,
        actions: [
          TextButton.icon(
            onPressed: () =>
                Navigator.pushNamed(context, PageRoutes.reviewsPage),
            icon: Icon(Icons.star, color: Color(0xffF29F19), size: 16),
            label: Text(
              '4.5',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: Color(0xffF29F19)),
            ),
          ),
        ],
      ),
      body: FadedSlideAnimation(
        Stack(
          children: [
            ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          FadedScaleAnimation(
                            Image.asset('assets/medicine img/11.png', scale: 3),
                            durationInMilliseconds: 400,
                          ),
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
                              SizedBox(height: 12),
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
                      EntryField(
                          label: locale.productID, initialValue: 'DW14114'),
                      EntryField(
                        label: locale.productName,
                        initialValue: 'Salospir 100mg Tablet',
                      ),
                    ],
                  ),
                ),
                Divider(thickness: 6),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: EntryField(
                    label: locale.itemCategory,
                    initialValue: 'OTC ' + locale.medicines!,
                    suffixIcon: Icons.arrow_drop_down,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                  child: EntryField(
                    label: locale.subCategory,
                    initialValue: locale.healthCareProducts,
                    suffixIcon: Icons.arrow_drop_down,
                  ),
                ),
                Divider(thickness: 6),
                Padding(
                  padding:
                      EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                  child: EntryField(
                    label: locale.description,
                    maxLines: 4,
                    initialValue:
                        'Lorem ipsum dolor sit amet, lorem ipsum dolor sit amet, lorem ipsum dolor sit amet, lorem ipsum dolor sit amet,',
                  ),
                ),
                Divider(thickness: 6),
                ListTile(
                  leading:
                      Image.asset('assets/ic_prescription.png', scale: 2.5),
                  title: Text(
                    locale.prescUploaded!,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  trailing: Switch(
                    value: true,
                    onChanged: (value) {},
                    activeColor: Theme.of(context).primaryColor,
                  ),
                ),
                Divider(thickness: 6),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        locale.setPricing!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: Theme.of(context).disabledColor),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: EntryField(
                              label: locale.pricing,
                              initialValue: '\$3.50',
                            ),
                          ),
                          SizedBox(width: 20.0),
                          Expanded(
                            child: EntryField(
                              label: locale.quantity,
                              initialValue: locale.packOf! + ' 4',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.0),
                      Row(
                        children: [
                          Expanded(child: EntryField(initialValue: '\$3.50')),
                          SizedBox(width: 20.0),
                          Expanded(
                              child: EntryField(
                                  initialValue: locale.packOf! + ' 6')),
                        ],
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 40,
                    width: 40,
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Theme.of(context).primaryColorLight,
                    ),
                    child: Icon(Icons.add),
                  ),
                ),
                SizedBox(height: 72),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(
                label: locale.updateItem,
                color: Theme.of(context).primaryColor,
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
