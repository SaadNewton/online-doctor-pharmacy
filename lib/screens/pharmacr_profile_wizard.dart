import 'package:doctoworld_seller/screens/pharmacy_account_detail.dart';
import 'package:doctoworld_seller/screens/pharmacy_detail.dart';
import 'package:flutter/material.dart';

bool isProfileIsCompleted = false;

class PharmacyProfileWizard extends StatefulWidget {
  @override
  _PharmacyProfileWizardState createState() => _PharmacyProfileWizardState();
}

class _PharmacyProfileWizardState extends State<PharmacyProfileWizard>
    with SingleTickerProviderStateMixin {
  TabController? _profileWizardTabController;
  int _profileWizardTabIndex = 0;

  @override
  void initState() {
    // TODO: implement initState

    _profileWizardTabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Pharmacy Profile Wizard'),
          textTheme: Theme.of(context).textTheme,
          centerTitle: true,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Container(
                height: 53,
                width: MediaQuery.of(context).size.width * 0.80,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          offset: Offset(0, 1),
                          blurRadius: 9,
                          spreadRadius: 2)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: TabBar(
                  isScrollable: false,
                  controller: _profileWizardTabController,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  labelStyle: Theme.of(context).textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.w600, color: Colors.white),
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Theme.of(context).primaryColor),
                  tabs: [
                    Center(
                      child: new Text(
                        'Pharmacy Detail',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Center(
                      child: new Text(
                        'Account Detail',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                  onTap: (v) {
                    print(v.toString());
                    setState(() {
                      _profileWizardTabIndex = v;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(child: viewSelectorMethod(_profileWizardTabIndex))
            ],
          ),
        ),
      ),
    );
  }

  changeView(int index) {
    setState(() {
      _profileWizardTabIndex = index;
      _profileWizardTabController!.index = index;
    });
  }

  viewSelectorMethod(int profileTab) {
    switch (profileTab) {
      case 0:
        {
          return PharmacyDetail(
            changeView: changeView,
          );
        }
        break;
      case 1:
        {
          return PharmacyAccountDetail(
            changeView: changeView,
          );
        }
        break;
    }
  }
}
