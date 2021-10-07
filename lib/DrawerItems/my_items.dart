import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:doctoworld_seller/Locale/locale.dart';
import 'package:doctoworld_seller/Routes/routes.dart';
import 'package:flutter/material.dart';

class MyItemsPage extends StatefulWidget {
  @override
  _MyItemsPageState createState() => _MyItemsPageState();
}

class MedicineInfo {
  String image;
  String name;
  String price;
  String sold;
  bool prescription;

  MedicineInfo(this.image, this.name, this.price, this.sold, this.prescription);
}

class _MyItemsPageState extends State<MyItemsPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List<MedicineInfo> _myItems = [
      MedicineInfo('assets/medicine img/11.png', 'Salospir 100mg\nTablet',
          '3.50', '119 ' + locale.sold!.toLowerCase(), true),
      MedicineInfo('assets/medicine img/22.png', 'Xenical 120mg\nTablet',
          '3.00', '119 ' + locale.sold!.toLowerCase(), false),
      MedicineInfo(
          'assets/medicine img/33.png',
          'Allergy Relief\nTopcare Tablet',
          '4.00',
          '119 ' + locale.sold!.toLowerCase(),
          false),
      MedicineInfo('assets/medicine img/44.png', 'Arber OTC\nTablet', '3.50',
          '119 ' + locale.sold!.toLowerCase(), true),
      MedicineInfo('assets/medicine img/55.png', 'Non Drosy\nLartin Tablet',
          '3.50', '119 ' + locale.sold!.toLowerCase(), false),
      MedicineInfo('assets/medicine img/66.png', 'Coricidin 100mg\nTablet',
          '3.50', '119 ' + locale.sold!.toLowerCase(), true),
      MedicineInfo('assets/medicine img/11.png', 'Salospir 100mg\nTablet',
          '3.50', '119 ' + locale.sold!.toLowerCase(), true),
      MedicineInfo('assets/medicine img/22.png', 'Xenical 120mg\nTablet',
          '3.00', '119 ' + locale.sold!.toLowerCase(), false),
      MedicineInfo(
          'assets/medicine img/33.png',
          'Allergy Relief\nTopcare Tablet',
          '4.00',
          '119 ' + locale.sold!.toLowerCase(),
          false),
      MedicineInfo('assets/medicine img/44.png', 'Arber OTC\nTablet', '3.50',
          '119 ' + locale.sold!.toLowerCase(), true),
      MedicineInfo('assets/medicine img/55.png', 'Non Drosy\nLartin Tablet',
          '3.50', '119 ' + locale.sold!.toLowerCase(), false),
      MedicineInfo('assets/medicine img/66.png', 'Coricidin 100mg\nTablet',
          '3.50', '119 ' + locale.sold!.toLowerCase(), true),
    ];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, PageRoutes.accountPage);
          },
          icon: Icon(Icons.menu),
        ),
        centerTitle: true,
        title: Text(locale.myItems!),
        textTheme: Theme.of(context).textTheme,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        color: Theme.of(context).backgroundColor,
        child: GridView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: _myItems.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.82),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, PageRoutes.editItemsPage),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Stack(
                        children: [
                          FadedScaleAnimation(
                            Image.asset(_myItems[index].image),
                            durationInMilliseconds: 400,
                          ),
                          _myItems[index].prescription
                              ? Align(
                                  alignment: Alignment.topRight,
                                  child: Image.asset(
                                    'assets/ic_prescription.png',
                                    scale: 3,
                                  ),
                                )
                              : SizedBox.shrink(),
                        ],
                      ),
                      Spacer(),
                      Text(_myItems[index].name),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            '\$ ' + _myItems[index].price,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Spacer(),
                          Text(
                            _myItems[index].sold,
                            style: Theme.of(context).textTheme.subtitle2,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
