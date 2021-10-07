import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:doctoworld_seller/Components/custom_button.dart';
import 'package:doctoworld_seller/Components/entry_field.dart';
import 'package:doctoworld_seller/Locale/locale.dart';
import 'package:flutter/material.dart';

class SendToBankPage extends StatefulWidget {
  @override
  _SendToBankPageState createState() => _SendToBankPageState();
}

class _SendToBankPageState extends State<SendToBankPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
        appBar: AppBar(
          title: Text(locale.sendToBank!),
          textTheme: Theme.of(context).textTheme,
          centerTitle: true,
        ),
        body: FadedSlideAnimation(
          Stack(
            children: [
              ListView(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          locale.availableBalance!.toUpperCase(),
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        Text(
                          '\$ 520.50',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.0),
                  Divider(thickness: 6),
                  Column(
                    // physics: BouncingScrollPhysics(),
                    // shrinkWrap: true,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              locale.bankInfo!,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(fontSize: 14),
                            ),
                            EntryField(
                              label: locale.accountHolderName,
                              hint: 'Well Life Store',
                            ),
                            EntryField(
                              label: locale.bankName,
                              hint: 'HNBC Bank of New York',
                            ),
                            EntryField(
                              label: locale.branchCode,
                              hint: 'CDR 21451',
                            ),
                            EntryField(
                              label: locale.accountNumber,
                              hint: '4321 4567 2265 6264',
                            ),
                          ],
                        ),
                      ),
                      Divider(thickness: 6),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: EntryField(
                          label: locale.amountToTransfer,
                          hint: '\$500',
                        ),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                    ],
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                  label: locale.sendToBank,
                  radius: 0,
                  onTap: () => Navigator.pop(context),
                ),
              )
            ],
          ),
          beginOffset: Offset(0, 0.3),
          endOffset: Offset(0, 0),
          slideCurve: Curves.linearToEaseOut,
        ));
  }
}
