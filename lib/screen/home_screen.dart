import 'package:flutter/material.dart';
import 'package:multi_language_app/language/languages.dart';
import 'package:multi_language_app/localization/constant.dart';
import 'package:multi_language_app/model/language_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          // leading: const Icon(
          //   Icons.language,
          //   color: Colors.white,
          // ),
          title: Text(
            Languages.of(context)!.appName,
          ),
          centerTitle: true,
        ),
        body: Container(
          margin: const EdgeInsets.all(30),
          child: Center(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 80,
                ),
                Text(
                  Languages.of(context)!.welcomeText,
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  Languages.of(context)!.appDescription,
                  style: const TextStyle(fontSize: 20, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 70,
                ),
                _createLanguageDropDown()
              ],
            ),
          ),
        ),
      );

  _createLanguageDropDown() {
    return DropdownButton<LanguageModel>(
      iconSize: 30,
      hint: Text(Languages.of(context)!.selectLanguage),
      onChanged: (LanguageModel? language) {
        changeLanguage(context, language!.languageCode);
      },
      items: LanguageModel.languageList()
          .map<DropdownMenuItem<LanguageModel>>(
            (e) => DropdownMenuItem<LanguageModel>(
              value: e,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    e.country,
                    style: const TextStyle(fontSize: 30),
                  ),
                  Text(e.languageName)
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
