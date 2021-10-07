import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:doctoworld_seller/Auth/login_navigator.dart';
import 'package:doctoworld_seller/Components/custom_button.dart';
import 'package:doctoworld_seller/Locale/language_cubit.dart';
import 'package:doctoworld_seller/Locale/locale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeLanguagePage extends StatefulWidget {
  @override
  _ChangeLanguagePageState createState() => _ChangeLanguagePageState();
}

class _ChangeLanguagePageState extends State<ChangeLanguagePage> {
  late LanguageCubit _languageCubit;
  int? _selectedLanguage = -1;

  @override
  void initState() {
    super.initState();
    _languageCubit = BlocProvider.of<LanguageCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    final List<String> _languages = [
      'English',
      'عربى',
      'français',
      'bahasa Indonesia',
      'português',
      'Español',
      'italiano',
      'Türk',
      'Kiswahili'
    ];
    return BlocBuilder<LanguageCubit, Locale>(
      builder: (context, locale) {
        _selectedLanguage = getCurrentLanguage(locale);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.changeLanguage!,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          body: FadedSlideAnimation(
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ListView.builder(
                  padding: EdgeInsets.only(bottom: 80),
                  itemCount: _languages.length,
                  itemBuilder: (context, index) => RadioListTile(
                    activeColor: Theme.of(context).primaryColor,
                    onChanged: (dynamic value) async {
                      setState(() {
                        _selectedLanguage = value;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginNavigator()));
                      });
                      if (_selectedLanguage == 0) {
                        _languageCubit.selectEngLanguage();
                      } else if (_selectedLanguage == 1) {
                        _languageCubit.selectArabicLanguage();
                      } else if (_selectedLanguage == 2) {
                        _languageCubit.selectFrenchLanguage();
                      } else if (_selectedLanguage == 3) {
                        _languageCubit.selectIndonesianLanguage();
                      } else if (_selectedLanguage == 4) {
                        _languageCubit.selectPortugueseLanguage();
                      } else if (_selectedLanguage == 5) {
                        _languageCubit.selectSpanishLanguage();
                      } else if (_selectedLanguage == 6) {
                        _languageCubit.selectItalianLanguage();
                      } else if (_selectedLanguage == 7) {
                        _languageCubit.selectTurkishLanguage();
                      } else if (_selectedLanguage == 8) {
                        _languageCubit.selectSwahiliLanguage();
                      }
                    },
                    groupValue: _selectedLanguage,
                    value: index,
                    title: Text(_languages[index]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(
                    label: 'Submit',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginNavigator()));
                      _languageCubit.selectEngLanguage();
                    },
                  ),
                ),
              ],
            ),
            beginOffset: Offset(0, 0.3),
            endOffset: Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          ),
        );
      },
    );
  }

  int getCurrentLanguage(Locale locale) {
    if (locale == Locale('en'))
      return 0;
    else if (locale == Locale('ar'))
      return 1;
    else if (locale == Locale('fr'))
      return 2;
    else if (locale == Locale('id'))
      return 3;
    else if (locale == Locale('pt'))
      return 4;
    else if (locale == Locale('es'))
      return 5;
    else if (locale == Locale('it'))
      return 6;
    else if (locale == Locale('tr'))
      return 7;
    else if (locale == Locale('sw'))
      return 8;
    else
      return -1;
  }
}
