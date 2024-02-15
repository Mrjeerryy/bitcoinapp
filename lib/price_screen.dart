import 'package:bitcoinapp/coin_data.dart';
import 'package:bitcoinapp/feedback.dart';
import 'package:bitcoinapp/getdata.dart';
import 'package:bitcoinapp/iosandord.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

var rate;
var rate1;
var rate2;

// DateTime dateTime = DateTime.parse(time);

class _PriceScreenState extends State<PriceScreen> {
  void initState() {
    getdatacoin();
    super.initState();
  }

  Future<void> getdatacoin() async {
    Networking network = Networking();
    var data1 =
        await network.get1Data("${cryptoList[0]}", "${currenciesList[index]}");
    Networking network2 = Networking();
    var data2 =
        await network2.get1Data("${cryptoList[1]}", "${currenciesList[index]}");
    Networking network3 = Networking();
    var data3 =
        await network3.get1Data("${cryptoList[2]}", "${currenciesList[index]}");
    print("$data1  ###########$data2#####$data3#######");

    // Assuming data is a double, convert it to a string

    // Use setState to trigger a rebuild with the updated rate value
    setState(() {
      rate = data1;
      (rate1 = data3);
      rate2 = data2;

      // print("$rate,${rate1},${rate2}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('🤑 Coin Ticker'),
        actions: [
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        FeedbackForm()), // Replace FeedbackPage with the actual name of your feedback page class
              );
            },
            child: Icon(Icons.feedback_outlined),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
              child: Column(
                children: [
                  Card(
                    color: Colors.lightBlueAccent,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 28.0),
                      child: Text(
                        '1 ${cryptoList[0]} = ? ${rate} ${currenciesList[index]}', // Use the updated rate value here
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.lightBlueAccent,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 28.0),
                      child: Text(
                        '1 ${cryptoList[1]} = ? ${rate1.toString()} ${currenciesList[index]}', // Use the updated rate value here
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.lightBlueAccent,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 28.0),
                      child: Text(
                        '1 ${cryptoList[2]} = ? ${rate2} ${currenciesList[index]}', // Use the updated rate value here
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Card(
            //   color: Colors.lightBlue,
            //   child: Padding(
            //     padding: EdgeInsets.all(8.0),
            //     child: Container(
            //       // color: Colors.lightBlue,
            //       child: Text(
            //         // "Updated at TIME:${dateTime.hour + 05}:${dateTime.minute} date: ${dateTime.day} YEAR:${dateTime.year} ",
            //         // style: TextStyle(fontSize: 15),
            //       ),
            //     ),
            //   ),
            // ),
            Card(
              color: Colors.lightBlue,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  height: 150.0,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: MyWidget(),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            getdatacoin();
          });
        },
        backgroundColor: Colors.white,
        child: Icon(
          Icons.refresh,
          color: Colors.lightBlue,
        ),
      ),
    );
  }
}
