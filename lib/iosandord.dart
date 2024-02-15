import 'package:bitcoinapp/coin_data.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

int index = 19;

String selectedcurrency = "USD";

class _MyWidgetState extends State<MyWidget> {
  DropdownButton<String> getdropdownbutton() {
    List<DropdownMenuItem<String>> getdropdownmenu() {
      List<DropdownMenuItem<String>> dropdownmenulist = [];
      for (String currency in currenciesList) {
        print(currency);
        var newdropmenu =
            DropdownMenuItem(child: Text(currency), value: currency);
        dropdownmenulist.add(newdropmenu);
        print("$newdropmenu");
      }

      return dropdownmenulist;
    }

    return DropdownButton<String>(
      value: selectedcurrency,
      items: getdropdownmenu(),
      onChanged: (value) {
        setState(() {
          // print("${value}########################");
          setState(() {
            index = currenciesList
                .indexOf(value!); // Get the index of the selected currency
            selectedcurrency = value;
            print(index);
            print(selectedcurrency);
          });
        });
      },
    );
  }

  CupertinoPicker getpicker() {
    List<Widget> pickerlist = [];
    for (String currency in currenciesList) {
      pickerlist.add(Text(currency));
    }

    return CupertinoPicker(
      itemExtent: 32,
      onSelectedItemChanged: (Changed) {
        setState(() {
          // print("$Changed##########");
          index = Changed;
          selectedcurrency = currenciesList[index];
        });
      },
      children: pickerlist,
    );
  }

  @override
  Widget build(BuildContext context) {
    return getpicker();
    // Platform.isIOS ? getpicker() : getdropdownbutton();
  }
}
