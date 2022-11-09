import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Grade.dart';

class ProductList extends StatefulWidget {
  ProductList({Key? key, this.title}) : super(key: key);

  String? title;

  @override
  State<ProductList> createState() => _ProductListState();

}


class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title!),

          actions: [
            IconButton(
                icon: Icon(Icons.edit),
                onPressed: () =>{
                  debugPrint('Working!'), _editGrade()
                }
              // debugPrint('Clicked'


            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
            )
          ]
      ),
      body: _buildProductList(context),
      floatingActionButton: FloatingActionButton(
        onPressed: _addToDb,
        tooltip: "Add",
        child: const Icon(Icons.add),
      ),
    );
  }

  Future getProducts() async{
    print("Getting the products...");
    return await FirebaseFirestore.instance.collection('products').get();
  }

  Widget _buildProduct(BuildContext context, DocumentSnapshot productData){
    final product = Grade.fromMap(
        productData.data(),
        reference: productData.reference);
    return GestureDetector(
      child: ListTile(
        title: Text(product.sid!),
        subtitle: Text(product.id!),
        trailing: Text(product.grade!.toString()),
      ),
      onLongPress: (){
        //todo: delete
      },
    );
  }

  Widget _buildProductList(BuildContext context){
    return FutureBuilder(
        future: getProducts(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          print("Snapshot: $snapshot");
          if (!snapshot.hasData){
            print("Data is missing from BuildProductList");
            return CircularProgressIndicator();
          }
          print("Found data for BuildProductList");
          return ListView(
            padding: EdgeInsets.all(16),
            children: snapshot.data.docs.map<Widget>( (document)
            => _buildProduct(context, document)
            ).toList(),
          );
        }
    );
  }
  void _editGrade() {
    var event = Navigator.pushNamed(context, '/GradeShower');
  }

  Future _addToDb() async{
    print("Adding a new entry...");
    final data = <String,Object?>{
      "name": "hoodie",
      "type": "clothing",
      "cost": 40.00
    };
    await
    FirebaseFirestore.instance.collection('products').doc().set(data);
    setState(() {
      print("Added data: $data");
    });

  }
}