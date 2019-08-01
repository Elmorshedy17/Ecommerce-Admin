import 'package:ecommerc_admin/pages/add_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../db/brand.dart';
import '../db/category.dart';
import 'package:toast/toast.dart';

class Manage extends StatefulWidget {
  @override
  _ManageState createState() => _ManageState();
}

class _ManageState extends State<Manage> {
  CateGoryServices _cateGoryServices = CateGoryServices();
  BrandServices _brandServices = BrandServices();
  GlobalKey<FormState> _categoryformKey = GlobalKey<FormState>();
  GlobalKey<FormState> _brandformKey = GlobalKey<FormState>();
  TextEditingController categorycontroller = TextEditingController();
  TextEditingController brandcontroller = TextEditingController();


  _categoryAlert() {
    var alert = new AlertDialog(
      content: Form(
        key: _categoryformKey,
        child: TextFormField(
          controller: categorycontroller,
          decoration: InputDecoration(hintText: "add categroy"),
          validator: (value) {
            if (value.isEmpty) {
              return "categroy cant be empty";
            }
          },
        ),
      ),
      actions: <Widget>[
        FlatButton.icon(
            onPressed: () {
              if (categorycontroller.text != null) {
                _cateGoryServices.createCatergory(categorycontroller.text);
                print(categorycontroller.text);
                Navigator.pop(context);
              }
              Toast.show('category created', context);
            },
            icon: Icon(Icons.add),
            label: Text('add category')),
        FlatButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
            label: Text('cancel')),
      ],
    );
    showDialog(context: context, builder: (context) => alert);
  }

  _brandAlert() {
    var alert = new AlertDialog(
      content: Form(
        key: _brandformKey,
        child: TextFormField(
          controller: brandcontroller,
          decoration: InputDecoration(hintText: "add brand"),
          validator: (value) {
            if (value.isEmpty) {
              return "brand cant be empty";
            }
          },
        ),
      ),
      actions: <Widget>[
        FlatButton.icon(
            onPressed: () {
              if (brandcontroller.text != null) {
                _brandServices.createBrand(brandcontroller.text);
                print(brandcontroller.text);
                Navigator.pop(context);
              }
              Toast.show('brand created', context);
            },
            icon: Icon(Icons.add),
            label: Text('add brand')),
        FlatButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
            label: Text('cancel')),
      ],
    );
    showDialog(context: context, builder: (context) => alert);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.add),
          title: Text('Add Product'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddProduct()),
            );
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.details),
          title: Text('Product List'),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.add_circle),
          title: Text('Add Category'),
          onTap: _categoryAlert,
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.format_align_center),
          title: Text('Category List'),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.add_circle_outline),
          title: Text('Add Brand'),
          onTap: _brandAlert,
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.add_to_photos),
          title: Text('Brand List'),
          onTap: () {},
        ),
        Divider(),
      ],
    );
  }
}
