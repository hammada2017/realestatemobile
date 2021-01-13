import 'package:flutter/material.dart';
import '../models/RealEstate.dart';
import 'dart:io';
import 'dart:convert';
//import 'package:http/http.dart' as http;
//import 'package:image_picker/image_picker.dart';

class RealEstateForm extends StatefulWidget {
  @override
  RealEstateFormState createState() {
    return RealEstateFormState();
  }
}
// Create a corresponding State class, which holds data related to the form.
class RealEstateFormState extends State<RealEstateForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  TextEditingController _adsName = new TextEditingController();
  TextEditingController _realEstatePlace = new TextEditingController();
  int realEstateType;
  int adsType;
  TextEditingController _latitute = new TextEditingController();
  TextEditingController _longitute = new TextEditingController();
  int currencyType;
  TextEditingController _realEstatePrice = new TextEditingController();
  TextEditingController _phone = new TextEditingController();
  TextEditingController _recuratementPeriod = new TextEditingController();
  TextEditingController _realEstateSpace = new TextEditingController();
  TextEditingController _roomsNumber = new TextEditingController();
  TextEditingController _holsNumber = new TextEditingController();
  TextEditingController _pathsNumber = new TextEditingController();
  TextEditingController _storeNumber = new TextEditingController();
  TextEditingController _realEstateAge = new TextEditingController();
  TextEditingController _flatsNumber = new TextEditingController();
  int state;
  TextEditingController _otherInfo = new TextEditingController();


  final realEsteTypes = RealEstateType.getRealEstatesTypes();
  final adsTypes = AdsType.getAdsTypes();
  final currencyTypes = CurrencyType.getCurrencyTypes();
  final status = Status.getStatus();

  RealEstateType selectedRealEstateType;
  AdsType selectedAdsType;
  CurrencyType selectedCurrencyType;
  Status selectState;

  // Future<File> file;
  // String sta = '';
  // String base64Image;
  // File tmpFile;
  // String errMessage = 'Error Uploading Image';

  // chooseImage() {
  //   setState(() {
  //     file = ImagePicker.pickImage(source: ImageSource.gallery);
  //   });
  //   setStatus('');
  // }
  //
  // setStatus(String message) {
  //   setState(() {
  //     sta = message;
  //   });
  // }
  //
  // startUpload() {
  //   setStatus('Uploading Image...');
  //   if (null == tmpFile) {
  //     setStatus(errMessage);
  //     return;
  //   }
  //   String fileName = tmpFile.path.split('/').last;
  //   upload(fileName);
  // }

  // upload(String fileName) {
  //   http.post(uploadEndPoint, body: {
  //     "image": base64Image,
  //     "name": fileName,
  //   }).then((result) {
  //     setStatus(result.statusCode == 200 ? result.body : errMessage);
  //   }).catchError((error) {
  //     setStatus(error);
  //   });
  // }

  // Widget showImage() {
  //   return FutureBuilder<File>(
  //     future: file,
  //     builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
  //       if (snapshot.connectionState == ConnectionState.done &&
  //           null != snapshot.data) {
  //         tmpFile = snapshot.data;
  //         base64Image = base64Encode(snapshot.data.readAsBytesSync());
  //         return Flexible(
  //           child: Image.file(
  //             snapshot.data,
  //             fit: BoxFit.fill,
  //           ),
  //         );
  //       } else if (null != snapshot.error) {
  //         return const Text(
  //           'Error Picking Image',
  //           textAlign: TextAlign.center,
  //         );
  //       } else {
  //         return const Text(
  //           'No Image Selected',
  //           textAlign: TextAlign.center,
  //         );
  //       }
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListView(
        children: [
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_circle,
                        textDirection: TextDirection.rtl,
                        size: 30.0,
                      ),
                      Text(
                        'إضافة عقار',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  margin: EdgeInsets.only(top: 0.0, bottom: 20.0),
                  color: Colors.blueGrey,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child: TextFormField(
                          controller: _adsName,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.article_outlined),
                            hintText: 'أدخل اسم الأعلان',
                            labelText: 'اسم الأعلان',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'اسم الأعلان لايمكن تركه فارغاً';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child: TextFormField(
                          controller: _realEstatePlace,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.add_location),
                            hintText: 'أدخل مكان العقار',
                            labelText: 'مكان العقار',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'مكان العقار لايمكن تركه فارغاً';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child: DropdownButton(
                          hint: Text('أختر نوع العقار'),
                          //value: selectedType,
                          onChanged: ( value ){
                            setState(() {
                              selectedRealEstateType = value;
                            });
                            print(selectedRealEstateType);
                          },
                          items: realEsteTypes.map((RealEstateType type){
                            return DropdownMenuItem<int>(
                              value: type.id,
                                child: Text(
                                  type.type,
                                  style: TextStyle(

                                  ),
                                ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child: DropdownButton(
                          hint: Text('أختر نوع الأعلان'),
                          //value: selectedAdsType,
                          onChanged: ( value ){
                            setState(() {
                              selectedRealEstateType = value;
                            });
                            print(selectedRealEstateType);
                          },
                          items: adsTypes.map((AdsType type){
                            return DropdownMenuItem<int>(
                              value: type.id,
                              child: Text(
                                type.type,
                                style: TextStyle(

                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child: TextFormField(
                          controller: _latitute,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.add_location_alt_outlined),
                            hintText: 'أدخل الأحداثي السيني',
                            labelText: 'الأحداثي السيني',
                          ),
                          // validator: (value) {
                          //   if (value.isEmpty) {
                          //     return 'اسم الأعلان لايمكن تركه فارغاً';
                          //   }
                          //   return null;
                          // },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child: TextFormField(
                          controller: _longitute,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.add_location_alt_outlined),
                            hintText: 'أدخل الأحداثي الصادي',
                            labelText: 'الأحداثي الصادي',
                          ),
                          // validator: (value) {
                          //   if (value.isEmpty) {
                          //     return 'مكان العقار لايمكن تركه فارغاً';
                          //   }
                          //   return null;
                          // },
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child: DropdownButton(
                          hint: Text('أختر نوع العملة'),
                          //value: selectedCurrencyType,
                          onChanged: ( value ){
                            setState(() {
                              selectedCurrencyType = value;
                            });
                            print(selectedCurrencyType);
                          },
                          items: currencyTypes.map((CurrencyType type){
                            return DropdownMenuItem<int>(
                              value: type.id,
                              child: Text(
                                type.currency,
                                style: TextStyle(

                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child: TextFormField(
                          controller: _realEstatePrice,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.attach_money),
                            hintText: 'أدخل سعر العقار',
                            labelText: 'سعر العقار',
                          ),
                          // validator: (value) {
                          //   if (value.isEmpty) {
                          //     return 'اسم الأعلان لايمكن تركه فارغاً';
                          //   }
                          //   return null;
                          // },
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child: TextFormField(
                          controller: _phone,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.phone),
                            hintText: 'أدخل رقم التواصل',
                            labelText: 'رقم التواصل',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'رقم التواصل لا يمكن تركه فارغاً';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child: TextFormField(
                          controller: _recuratementPeriod,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.description),
                            hintText: 'أدخل مدة التأجير',
                            labelText: 'مدة التأجير',
                          ),
                          // validator: (value) {
                          //   if (value.isEmpty) {
                          //     return 'مكان العقار لايمكن تركه فارغاً';
                          //   }
                          //   return null;
                          // },
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child: TextFormField(
                          controller: _realEstateSpace,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.architecture),
                            hintText: 'أدخل المساحة',
                            labelText: 'المساحة',
                          ),
                          // validator: (value) {
                          //   if (value.isEmpty) {
                          //     return 'رقم التواصل لا يمكن تركه فارغاً';
                          //   }
                          //   return null;
                          // },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child: TextFormField(
                          controller: _roomsNumber,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.weekend),
                            hintText: 'أدخل عدد الغرف',
                            labelText: 'عدد الغرف',
                          ),
                          // validator: (value) {
                          //   if (value.isEmpty) {
                          //     return 'مكان العقار لايمكن تركه فارغاً';
                          //   }
                          //   return null;
                          // },
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child: TextFormField(
                          controller: _holsNumber,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.weekend_outlined),
                            hintText: 'أدخل عدد الصالات',
                            labelText: 'عدد الصالات',
                          ),
                          // validator: (value) {
                          //   if (value.isEmpty) {
                          //     return 'رقم التواصل لا يمكن تركه فارغاً';
                          //   }
                          //   return null;
                          // },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child: TextFormField(
                          controller: _pathsNumber,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.wc),
                            hintText: 'أدخل عدد الحمامات',
                            labelText: 'عدد الحمامات',
                          ),
                          // validator: (value) {
                          //   if (value.isEmpty) {
                          //     return 'مكان العقار لايمكن تركه فارغاً';
                          //   }
                          //   return null;
                          // },
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child: TextFormField(
                          controller: _storeNumber,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.arrow_upward),
                            hintText: 'أدخل رقم الدور',
                            labelText: 'رقم الدور',
                          ),
                          // validator: (value) {
                          //   if (value.isEmpty) {
                          //     return 'رقم التواصل لا يمكن تركه فارغاً';
                          //   }
                          //   return null;
                          // },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child: TextFormField(
                          controller: _realEstateAge,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.access_time_outlined),
                            hintText: 'أدخل عمر العقار',
                            labelText: 'عمر العقار',
                          ),
                          // validator: (value) {
                          //   if (value.isEmpty) {
                          //     return 'مكان العقار لايمكن تركه فارغاً';
                          //   }
                          //   return null;
                          // },
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child: TextFormField(
                          controller: _flatsNumber,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.auto_awesome_motion),
                            hintText: 'أدخل عدد الشقق',
                            labelText: 'عدد الشقق',
                          ),
                          // validator: (value) {
                          //   if (value.isEmpty) {
                          //     return 'رقم التواصل لا يمكن تركه فارغاً';
                          //   }
                          //   return null;
                          // },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child: DropdownButton(
                          hint: Text('أختر الحالة'),
                          //value: selectState,
                          onChanged: ( value ){
                            setState(() {
                              selectState = value;
                            });
                            print(selectState);
                          },
                          items: status.map((Status state){
                            return DropdownMenuItem<int>(
                              value: state.id,
                              child: Text(
                                state.state,
                                style: TextStyle(

                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child: TextFormField(
                          controller: _otherInfo,
                          decoration: const InputDecoration(
                            icon: const Icon(Icons.info_outline),
                            hintText: 'أدخل معلومات إضافية عن العقار',
                            labelText: 'معلومات إضافية',
                          ),
                          maxLines: 5,
                          // validator: (value) {
                          //   if (value.isEmpty) {
                          //     return 'رقم التواصل لا يمكن تركه فارغاً';
                          //   }
                          //   return null;
                          // },
                        ),
                      ),
                    ),
                  ],
                ),
                // Row(
                //   children: [
                //     Expanded(
                //       child: Container(
                //         padding: EdgeInsets.only(right: 10, left: 10),
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.stretch,
                //           children: [
                //             OutlineButton(
                //               onPressed: chooseImage,
                //               child: Text('Choose Image'),
                //             ),
                //             SizedBox(
                //               height: 20.0,
                //             ),
                //             showImage(),
                //             SizedBox(
                //               height: 20.0,
                //             ),
                //             OutlineButton(
                //               onPressed: startUpload,
                //               child: Text('Upload Image'),
                //             ),
                //             SizedBox(
                //               height: 20.0,
                //             ),
                //             Text(
                //               sta,
                //               textAlign: TextAlign.center,
                //               style: TextStyle(
                //                 color: Colors.green,
                //                 fontWeight: FontWeight.w500,
                //                 fontSize: 20.0,
                //               ),
                //             ),
                //             SizedBox(
                //               height: 20.0,
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: RaisedButton(
                            color: Colors.lightGreen,
                            child: const Text(
                              'إضافة',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            onPressed: () {
                              // It returns true if the form is valid, otherwise returns false
                              if (_formKey.currentState.validate()) {
                                // If the form is valid, display a Snackbar.
                                Scaffold.of(context)
                                    .showSnackBar(SnackBar(content: Text(_adsName.text)));
                              }
                            },
                          ),
                        ),
                        Container(
                          child: RaisedButton(
                            color: Colors.red,
                            child: const Text(
                                'إلغاء',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              // It returns true if the form is valid, otherwise returns false
                              if (_formKey.currentState.validate()) {
                                // If the form is valid, display a Snackbar.
                                Scaffold.of(context)
                                    .showSnackBar(SnackBar(content: Text(_adsName.text)));
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}