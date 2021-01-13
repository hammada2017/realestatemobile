import 'package:flutter/material.dart';
import '../models/RealEstate.dart';
import 'MyApp.dart';
import 'RealEstateDetail.dart';
import 'RealEstateAdd.dart';

class RealEstateList extends StatefulWidget {
  RealEstateList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return RealEstateListState(title);
    throw UnimplementedError();
  }

}

class RealEstateListState extends State<RealEstateList>{
  RealEstateListState(this.title);

  final String title;

  final items = RealEstate.getRealEstates();


  void showSnackBar(BuildContext context, int index){
    var deleteRecord = items[index];

    setState(() {
      items.removeAt(index);
    });

    SnackBar snackBar = SnackBar(
      content: Text(' حذف ${deleteRecord.adsName} '),
      action: SnackBarAction(
        label: 'تراجع',
        onPressed: (){
          setState(() {
            items.insert(index, deleteRecord);
          });
        },
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            backgroundColor: Colors.brown.shade900,
            appBar: AppBar(
              backgroundColor: Colors.brown.shade700,
              title: Text(
                'عقارات ابوسعد',
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
              ),
            ),
          drawer: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text("Mohammed Anwar"),
                  accountEmail: Text("mohammed@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.orange,
                    child: Text(
                      "M",
                      style: TextStyle(fontSize: 40.0),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home), title: Text(
                  "الرئيسية",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),
                ),
                  onTap: () {

                  },
                ),
                Divider(
                  height: 2.0,
                  color: Colors.black,
                ),
                ListTile(
                  leading: Icon(Icons.settings), title: Text(
                  "الأعدادات",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),
                ),
                  onTap: () {

                  },
                ),
                Divider(
                  height: 2.0,
                  color: Colors.black,
                ),
                ListTile(
                  leading: Icon(Icons.help), title: Text(
                  "المساعدة",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),
                ),
                  onTap: () {

                  },
                ),
                Divider(
                  height: 2.0,
                  color: Colors.black,
                ),
                ListTile(
                  leading: Icon(Icons.logout), title: Text(
                  "تسجيل الخروج",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),
                ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                    );
                  },
                ),
                Divider(
                  height: 2.0,
                  color: Colors.black,
                ),
              ],
            ),
          ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RealEstateAdd()),
                );
              },
            ),
            body: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index){
                return GestureDetector(
                  child: ListTile(
                    title: Text('${items[index].adsName} - ${items[index].realEstatePlace}'),
                    trailing: Container(
                      width: 60,
                      child: FlatButton(
                        child: Icon(Icons.delete, color: Colors.grey,),
                        onPressed: (){
                          showSnackBar(context, index);
                        },
                      ),
                    ),
                  ),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RealEstateDetail(item: items[index]),
                      ),
                    );
                  },
                );
              },
            ),
        ),
      ),
    );
  }
}

