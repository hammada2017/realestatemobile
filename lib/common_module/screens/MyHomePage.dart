import 'package:flutter/material.dart';
import '../models/RealEstate.dart';
import 'RealEstateBox.dart';
import 'RealEstateDetail.dart';
import 'LoginPage.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return MyHomePageState(title);
    throw UnimplementedError();
  }

}

class MyHomePageState extends State<MyHomePage>{
  MyHomePageState(this.title);

  final String title;
  bool _loading = false;

  final items = RealEstate.getRealEstates();

  void _onLoading() {
    setState(() {
      _loading = true;
      new Future.delayed(new Duration(seconds: 30), _login);
    });
  }


  Future _login() async{
    setState((){
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    var body = new ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index){
        return GestureDetector(
          child: RealEstateBox(item: items[index],),
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
    );

    var bodyProgress = new Container(
      child: new Stack(
        children: <Widget>[
          new Container(
            alignment: AlignmentDirectional.center,
            decoration: new BoxDecoration(
              color: Colors.white70,
            ),
            child: new Container(
              decoration: new BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: new BorderRadius.circular(10.0)
              ),
              width: 300.0,
              height: 200.0,
              alignment: AlignmentDirectional.center,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Center(
                    child: new SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: new CircularProgressIndicator(
                        value: null,
                        strokeWidth: 7.0,
                      ),
                    ),
                  ),
                  new Container(
                    margin: const EdgeInsets.only(top: 25.0),
                    child: new Center(
                      child: new Text(
                        "loading.. wait...",
                        style: new TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.brown.shade900,
      appBar: AppBar(
        backgroundColor: Colors.brown.shade700,
        title: Text(
          'عقارات ابوسعد',
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.right,
        ),
        bottom: TabBar(
          tabs: [
            Tab( text: "شقة"),
            Tab( text: "فيلا"),
            Tab( text: "عمارة"),
            Tab( text: "بيت"),
            Tab( text: "ارض"),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              child: Image.asset(
                "assets/images/logo2.jpg",
                height: 200.0,
                fit: BoxFit.cover,
              ),
            ),
            Divider(
              height: 2.0,
              color: Colors.black,
            ),
            ListTile(
              leading: Icon(Icons.lock), title: Text(
              "تسجيل الدخول",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black
              ),
            ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
            Divider(
              height: 2.0,
              color: Colors.black,
            ),
            ListTile(
              leading: Icon(Icons.adb_outlined), title: Text(
              "عن التطبيق",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black
              ),
            ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              height: 2.0,
              color: Colors.black,
            ),
            ListTile(
              leading: Icon(Icons.contacts), title: Text(
              "اتصل بنا",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black
              ),
            ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              height: 2.0,
              color: Colors.black,
            ),
          ],
        ),
      ),
      body: _loading ? bodyProgress : body
    );
  }
}

