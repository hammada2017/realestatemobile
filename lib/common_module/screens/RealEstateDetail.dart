import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../models/RealEstate.dart';
import 'package:url_launcher/url_launcher.dart';


class RealEstateDetail extends StatelessWidget{
  RealEstateDetail({Key key, this.item}):super(key: key);
  final RealEstate item;
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.brown.shade900,
          appBar: AppBar(
            backgroundColor: Colors.brown.shade700,
            title: Text(
              this.item.adsName,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
            ),
          ),
          body: ListView(
            children: [
              Container(
                constraints: BoxConstraints.expand(
                  height: 200.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                child: Image.asset(
                  this.item.realEstateImage,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                textDirection: TextDirection.rtl,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Card(
                      color: Colors.brown.shade600,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        textDirection: TextDirection.rtl,
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.info,
                                  textDirection: TextDirection.rtl,
                                  size: 25.0,
                                  color: Colors.white,
                                ),
                                Text(
                                  ' معلومات العقار ',
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            textDirection: TextDirection.rtl,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'السعر',
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  Row(
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      Icon(
                                        Icons.attach_money,
                                        textDirection: TextDirection.rtl,
                                        size: 25.0,
                                      ),
                                      Text(
                                        (this.item.currencyType == 'جنيه') ? '${this.item.realEstatePrice} جنيه سوداني' : '${this.item.realEstatePrice} دولار امريكي',
                                        textDirection: TextDirection.rtl,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.lightBlueAccent
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'المساحة',
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  Row(
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      Icon(
                                        Icons.architecture,
                                        textDirection: TextDirection.rtl,
                                        size: 25.0,
                                      ),
                                      Text(
                                        '${this.item.realEstateSpace}م² ',
                                        textDirection: TextDirection.rtl,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.lightBlueAccent
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            textDirection: TextDirection.rtl,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'عدد الغرف',
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  Row(
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      Icon(
                                        Icons.weekend_outlined,
                                        textDirection: TextDirection.rtl,
                                        size: 25.0,
                                      ),
                                      Text(
                                        ' ${this.item.roomsNumber.toString()} ',
                                        textDirection: TextDirection.rtl,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.lightBlueAccent
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'عدد الصالات',
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  Row(
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      Icon(
                                        Icons.weekend_sharp,
                                        textDirection: TextDirection.rtl,
                                        size: 25.0,
                                      ),
                                      Text(
                                        ' ${this.item.holsNumber.toString()} ',
                                        textDirection: TextDirection.rtl,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.lightBlueAccent
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            textDirection: TextDirection.rtl,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'عدد الحمامات',
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  Row(
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      Icon(
                                        Icons.wc,
                                        textDirection: TextDirection.rtl,
                                        size: 25.0,
                                      ),
                                      Text(
                                        ' ${this.item.pathRoomsNumber.toString()} ',
                                        textDirection: TextDirection.rtl,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.lightBlueAccent
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'عمر العقار',
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  Row(
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      Icon(
                                        Icons.apartment_sharp,
                                        textDirection: TextDirection.rtl,
                                        size: 25.0,
                                      ),
                                      Text(
                                        ' ${this.item.realEstateAge.toString()} ',
                                        textDirection: TextDirection.rtl,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.lightBlueAccent
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            textDirection: TextDirection.rtl,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'رقم الدور',
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  Row(
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      Icon(
                                        Icons.auto_awesome_motion,
                                        textDirection: TextDirection.rtl,
                                        size: 25.0,
                                      ),
                                      Text(
                                        ' ${this.item.storeNumber.toString()} ',
                                        textDirection: TextDirection.rtl,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.lightBlueAccent
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'عدد الشقق',
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  Row(
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      Icon(
                                        Icons.local_offer,
                                        textDirection: TextDirection.rtl,
                                        size: 25.0,
                                      ),
                                      Text(
                                        ' ${this.item.flatsNumber.toString()} ',
                                        textDirection: TextDirection.rtl,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.lightBlueAccent
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(),

                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Card(
                      color: Colors.brown.shade600,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        textDirection: TextDirection.rtl,
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.info_outline,
                                  textDirection: TextDirection.rtl,
                                  size: 25.0,
                                  color: Colors.white,
                                ),
                                Text(
                                  ' معلومات  اضافية',
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              this.item.otherInfo,
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.lightBlueAccent
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Card(
                      color: Colors.brown.shade600,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        textDirection: TextDirection.rtl,
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.navigation,
                                  textDirection: TextDirection.rtl,
                                  size: 25.0,
                                  color: Colors.white,
                                ),
                                Text(
                                  ' عنوان العقار',
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              this.item.realEstatePlace,
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.lightBlueAccent
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Card(
                      color: Colors.brown.shade600,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        textDirection: TextDirection.rtl,
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.phone,
                                  textDirection: TextDirection.rtl,
                                  size: 25.0,
                                  color: Colors.white,
                                ),
                                Text(
                                  ' معلومات الأتصال',
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: FlatButton(
                              onPressed: () => launch("tel:+${this.item.phone}"),
                              child: Text(
                                this.item.phone.toString(),
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.lightBlueAccent
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
            ],
          ),
        )
    );
    throw UnimplementedError();
  }

}

// UrlLauncher.launch('mailto:${p.email}'),