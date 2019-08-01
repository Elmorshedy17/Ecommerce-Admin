import 'dart:io';
import 'package:ecommerc_admin/db/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../db/category.dart';
import '../db/brand.dart';
import '../db/product.dart';
import 'package:toast/toast.dart';

//import 'package:flutter_typeahead/flutter_typeahead.dart';
import './osama.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  ProductServices productServices = ProductServices();
  CateGoryServices _cateGoryServices = CateGoryServices();
  BrandServices _brandServices = BrandServices();
  TextEditingController productnamecontroller = TextEditingController();
  TextEditingController quantitycontroller = TextEditingController();
  TextEditingController Pricecontroller = TextEditingController();
  GlobalKey<FormState> _fromkey = GlobalKey<FormState>();

//  GlobalKey<FormState> _secfromkey = GlobalKey<FormState>();
  List<DocumentSnapshot> brands = <DocumentSnapshot>[];
  List<DocumentSnapshot> categories = <DocumentSnapshot>[];
  List<DropdownMenuItem<String>> categoriesDropDown =
      <DropdownMenuItem<String>>[];
  List<DropdownMenuItem<String>> brandsDropDown = <DropdownMenuItem<String>>[];
  String _currentCategory;
  String _currentBrand;
  List<String> selectedSize = <String>[];
  File _image1;
  File _image2;
  File _image3;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCategories();
    _getBrands();
  }

  List<DropdownMenuItem<String>> getCategoriesDropDown() {
    List<DropdownMenuItem<String>> items = new List();
    for (int i = 0; i < categories.length; i++) {
      setState(() {
        items.insert(
            0,
            DropdownMenuItem(
              child: Text(categories[i].data['category name']),
              value: categories[i].data['category name'],
            ));
      });
    }
    return items;
  }

  List<DropdownMenuItem<String>> getBrandsDropDown() {
    List<DropdownMenuItem<String>> items = new List();
    for (int i = 0; i < brands.length; i++) {
      setState(() {
        items.insert(
            0,
            DropdownMenuItem(
              child: Text(brands[i].data['brandName']),
              value: brands[i].data['brandName'],
            ));
      });
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.1,
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.close,
            color: Colors.black,
          ),
          title: Text(
            'add Product',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Form(
          key: _fromkey,
          child: ListView(
            children: <Widget>[
//              isLoading? CircularProgressIndicator :
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: OutlineButton(
                        child: _displayChild1(),
                        onPressed: () {
                          _selectImage(
                              ImagePicker.pickImage(
                                  source: ImageSource.gallery),
                              1);
                          print('hey');
                        },
                        padding: EdgeInsets.symmetric(
                            vertical: 30.0, horizontal: 30.0),
                        borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.8), width: 2.0),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: OutlineButton(
                        child: _displayChild2(),
                        onPressed: () {
                          _selectImage(
                              ImagePicker.pickImage(
                                  source: ImageSource.gallery),
                              2);
                          print('hey2');
                        },
                        padding: EdgeInsets.symmetric(
                            vertical: 30.0, horizontal: 30.0),
                        borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.8), width: 2.0),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: OutlineButton(
                        child: _displayChild3(),
                        onPressed: () {
                          _selectImage(
                              ImagePicker.pickImage(
                                  source: ImageSource.gallery),
                              3);
                          print('hey3');
                        },
                        padding: EdgeInsets.symmetric(
                            vertical: 30.0, horizontal: 30.0),
                        borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.8), width: 2.0),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                child: Text(
                  'please enter 10 characters as maximum',
                  style: TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
                padding: EdgeInsets.all(8.0),
              ),
              Container(
                padding: EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: productnamecontroller,
                  decoration: InputDecoration(
                    hintText: 'Product Name',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'you must enter product name';
                    } else if (value.length > 10) {
                      return 'product name must be less than 10 characters';
                    }
                  },
                ),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Category :',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  DropdownButton(
                    items: categoriesDropDown,
                    onChanged: changeSelectedCategory,
                    value: _currentCategory,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, top: 8.0, bottom: 8.0, right: 8.0),
                    child: Text(
                      'Brand :',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  DropdownButton(
                    items: brandsDropDown,
                    onChanged: changeSelectedBrand,
                    value: _currentBrand,
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(12.0),
                child: TextFormField(
//                  initialValue: '1',
                  controller: quantitycontroller,
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    labelText: 'Quantity',
                    hintText: 'Quantity',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'you must enter product name';
                    } else if (value.length > 10) {
                      return 'product name must be less than 10 characters';
                    }
                  },
                ),
              ),

              Container(
                padding: EdgeInsets.all(12.0),
                child: TextFormField(
//                  initialValue: '0.00',
                  controller: Pricecontroller,
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: InputDecoration(
                    hintText: 'Price',
                    labelText: 'Price',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'you must enter product name';
                    } else if (value.length > 10) {
                      return 'product name must be less than 10 characters';
                    }
                  },
                ),
              ),

              Text(
                'Avilable sizes',
                textAlign: TextAlign.center,
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Checkbox(
                      value: selectedSize.contains('XS'),
                      onChanged: (value) => changeSelectedSize(value, 'XS'),
                    ),
                    Text('XS'),
                    Checkbox(
                      value: selectedSize.contains('S'),
                      onChanged: (value) => changeSelectedSize(value, 'S'),
                    ),
                    Text('S'),
                    Checkbox(
                      value: selectedSize.contains('M'),
                      onChanged: (value) => changeSelectedSize(value, 'M'),
                    ),
                    Text('M'),
                    Checkbox(
                      value: selectedSize.contains('L'),
                      onChanged: (value) => changeSelectedSize(value, 'L'),
                    ),
                    Text('L'),
                    Checkbox(
                      value: selectedSize.contains('XL'),
                      onChanged: (value) => changeSelectedSize(value, 'XL'),
                    ),
                    Text('XL'),
                    Checkbox(
                      value: selectedSize.contains('XXL'),
                      onChanged: (value) => changeSelectedSize(value, 'XXL'),
                    ),
                    Text('XXL'),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Checkbox(
                      value: selectedSize.contains('28'),
                      onChanged: (value) => changeSelectedSize(value, '28'),
                    ),
                    Text('28'),
                    Checkbox(
                      value: selectedSize.contains('30'),
                      onChanged: (value) => changeSelectedSize(value, '30'),
                    ),
                    Text('30'),
                    Checkbox(
                      value: selectedSize.contains('32'),
                      onChanged: (value) => changeSelectedSize(value, '32'),
                    ),
                    Text('32'),
                    Checkbox(
                      value: selectedSize.contains('34'),
                      onChanged: (value) => changeSelectedSize(value, '34'),
                    ),
                    Text('34'),
                    Checkbox(
                      value: selectedSize.contains('36'),
                      onChanged: (value) => changeSelectedSize(value, '36'),
                    ),
                    Text('36'),
                    Checkbox(
                      value: selectedSize.contains('38'),
                      onChanged: (value) => changeSelectedSize(value, '38'),
                    ),
                    Text('38'),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Checkbox(
                      value: selectedSize.contains('40'),
                      onChanged: (value) => changeSelectedSize(value, '40'),
                    ),
                    Text('40'),
                    Checkbox(
                      value: selectedSize.contains('42'),
                      onChanged: (value) => changeSelectedSize(value, '42'),
                    ),
                    Text('42'),
                    Checkbox(
                      value: selectedSize.contains('44'),
                      onChanged: (value) => changeSelectedSize(value, '44'),
                    ),
                    Text('44'),
                    Checkbox(
                      value: selectedSize.contains('46'),
                      onChanged: (value) => changeSelectedSize(value, '46'),
                    ),
                    Text('46'),
                    Checkbox(
                      value: selectedSize.contains('48'),
                      onChanged: (value) => changeSelectedSize(value, '48'),
                    ),
                    Text('48'),
                    Checkbox(
                      value: selectedSize.contains('50'),
                      onChanged: (value) => changeSelectedSize(value, '50'),
                    ),
                    Text('50'),
                  ],
                ),
              ),
              FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text('add product'),
                onPressed: () {
//              Navigator.push(
//                  context, MaterialPageRoute(builder: (context) => Osama()));

                  ValidateAndUpload();
                },
              ),
              // select category
            ],
          ),
        ));
  }

  _getCategories() async {
    List<DocumentSnapshot> data = await _cateGoryServices.getcategories();

    setState(() {
      categories = data;
      categoriesDropDown = getCategoriesDropDown();
      _currentCategory = categories[0].data['category name'];
    });
  }

  _getBrands() async {
    List<DocumentSnapshot> data = await _brandServices.getbrands();

    setState(() {
      brands = data;
      brandsDropDown = getBrandsDropDown();
      _currentBrand = brands[0].data['brandName'];
    });
  }

  changeSelectedCategory(String selectedCategory) {
    setState(() {
      _currentCategory = selectedCategory;
    });
  }

  changeSelectedBrand(String selectedBrand) {
    setState(() {
      _currentBrand = selectedBrand;
    });
  }

  void changeSelectedSize(bool value, String Size) {
    if (selectedSize.contains(Size)) {
      setState(() {
        selectedSize.remove(Size);
      });
    } else {
      setState(() {
        selectedSize.insert(0, Size);
      });
    }
  }

  void _selectImage(Future<File> pickImage, int ImageNumber) async {
    File tempimg = await pickImage;
    switch (ImageNumber) {
      case 1:
        setState(() {
          _image1 = tempimg;
        });
        break;
      case 2:
        setState(() {
          _image2 = tempimg;
        });
        break;
      case 3:
        setState(() {
          _image3 = tempimg;
        });
        break;
    }
  }

  Widget _displayChild1() {
    if (_image1 == null) {
      return Icon(
        Icons.add,
        color: Colors.grey,
      );
    } else {
      return Image.file(
        _image1,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }

  Widget _displayChild2() {
    if (_image2 == null) {
      return Icon(
        Icons.add,
        color: Colors.grey,
      );
    } else {
      return Image.file(
        _image2,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }

  Widget _displayChild3() {
    if (_image3 == null) {
      return Icon(
        Icons.add,
        color: Colors.grey,
      );
    } else {
      return Image.file(
        _image3,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }

  void ValidateAndUpload() async {
    if (_fromkey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      if (_image1 != null && _image2 != null && _image3 != null) {
        if (selectedSize.isNotEmpty) {
          String imgUrl1;
          String imgUrl2;
          String imgUrl3;
          FirebaseStorage storage = FirebaseStorage.instance;
          final String picture1 =
              "1${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
          StorageUploadTask task1 =
              storage.ref().child(picture1).putFile(_image1);
          final String picture2 =
              "2${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
          StorageUploadTask task2 =
              storage.ref().child(picture1).putFile(_image2);
          final String picture3 =
              "3${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
          StorageUploadTask task3 =
              storage.ref().child(picture1).putFile(_image3);
          StorageTaskSnapshot snapshot1 =
              await task1.onComplete.then((snapshot) => snapshot);
          StorageTaskSnapshot snapshot2 =
              await task2.onComplete.then((snapshot) => snapshot);

          task3.onComplete.then((snapshot3) async {
            imgUrl1 = await snapshot1.ref.getDownloadURL();
            imgUrl2 = await snapshot2.ref.getDownloadURL();
            imgUrl3 = await snapshot3.ref.getDownloadURL();
            List<String> imageList = [imgUrl1, imgUrl2, imgUrl3];

            productServices.upLoadProduct(
              productName: productnamecontroller.text,
              price: double.parse(Pricecontroller.text),
              sizes: selectedSize,
              images: imageList,
              quantity: int.parse(quantitycontroller.text),
            );
            _fromkey.currentState.reset();
            setState(() {
              isLoading = false;
            });
            Toast.show('product added', context);
          Navigator.pop(context);
          });
        } else {
          Toast.show('select sizes please', context);
          setState(() {
            isLoading = false;
          });
        }
      }
    } else {
      Toast.show('all images must be inserted', context);
      setState(() {
        isLoading = false;
      });
    }
  }
}
