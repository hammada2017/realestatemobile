import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import '../models/RealEstate.dart';

class RealEstateBox extends StatelessWidget{
  RealEstateBox({Key key, this.item}): super(key: key);
  final RealEstate item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      height: 200,
      child: Card(
        color: Colors.brown.shade600,
        child: Container(
          padding: EdgeInsets.all(5),
          child: Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Image.asset(
                  this.item.realEstateImage,
                  width: 150.0,
                  height: 300.0,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Container(
                  //padding: EdgeInsets.all(5),
                  child: Column(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        textDirection: TextDirection.rtl,
                        children: [
                          Text(
                            this.item.adsName,
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25.00,
                            ),
                          ),
                          Text(
                            '${this.item.realEstateSpace}م² ',
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                      Text(
                          (this.item.currencyType == 'جنيه') ? '${this.item.realEstatePrice} جنيه سوداني' : '${this.item.realEstatePrice} دولار امريكي',
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 20.00,
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        this.item.realEstatePlace,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      Text(
                          (this.item.roomsNumber != null || this.item.pathRoomsNumber != null) ? '${this.item.roomsNumber} غرف , ${this.item.pathRoomsNumber} حمامات ' : '',
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 15.00,
                          color: Colors.red,
                        ),
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        textDirection: TextDirection.rtl,
                        children: [
                          Icon(
                            Icons.remove_red_eye,
                            textDirection: TextDirection.rtl,
                            size: 13.0,
                          ),
                          Text(
                            ' ${this.item.viewsNumber.toString()} ',
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 13.0,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 70.0),
                            child: Text(
                              this.item.createdAt,
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 13.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }

}