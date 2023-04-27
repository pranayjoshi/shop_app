import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = "/edit-prod";
  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();

  @override
  void dispose() {
    _priceFocusNode.dispose();
    _descFocusNode.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Produc")),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
            child: ListView(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: "Title"),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_priceFocusNode);
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Price"),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              focusNode: _priceFocusNode,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_descFocusNode);
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Description"),
              maxLines: 3,
              keyboardType: TextInputType.multiline,
              focusNode: _descFocusNode,
            ),
            Row(
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(top: 8, right: 10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          style: BorderStyle.solid,
                          width: 1,
                          color: Colors.grey)),
                  child: Container(),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Image Url"),
                  keyboardType: TextInputType.url,
                  textInputAction: TextInputAction.done,
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
