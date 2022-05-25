import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:snacksnmeals/Comman/ColorFile.dart';

import '../AppToolbar.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late String _titleheading = "Cart";
  final List<String> _list = ['assets/f1.jpeg', 'assets/image1.jpeg','assets/juice4.jpeg','assets/f4.jpeg','assets/image2.jpeg', 'assets/image5.jpeg'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppToolbar(context, _titleheading, true, false),
        body: Stack(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: new ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    //  var Announcementlst = _listannmnt[index];
                    return GestureDetector(
                        child: ProductListItem(context,_list[index]), onTap: () {});
                  },
                  itemCount: _list.length,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: Card(
                    margin: const EdgeInsets.all(0.0),
                    elevation: 5,
                    borderOnForeground: true,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(40), bottom: Radius.zero),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(20, 0, 10, 0),
                                  child: Text(
                                    "8 Selected Food",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        "Total Amount: ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        "\$90.00",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                            child: SizedBox(
                              width: double.infinity,
                              height: 55,
                              child: RaisedButton(
                                onPressed: () {},
                                child: Text(
                                  "CHECKOUT",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: Colors.white),
                                ),
                                color: Colors.orange,
                                textColor: Colors.white,
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(40.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

Container ProductListItem(BuildContext context,String strimage) {
  return Container(
    height: 180,
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: [
            Container(
              height: 125,
              width: 125,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(strimage)),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 140,right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Text(
                      // products is out demo list
                      "Noodles with chicken sd d sdfgggdfsg gsd",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          height: 1.3,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: Text(
                        // products is out demo list
                        "Asian noodles with chicken",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            height: 1.2,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                  Container(
                    margin:  const EdgeInsets.only(bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "\$15.0",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin:  const EdgeInsets.only(bottom: 5),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: bgOrangeColor),
                          child: Row(
                            children: [
                              InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  )),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 3),
                                padding:
                                EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3)),
                                child: Text(
                                  '3',
                                  style: TextStyle(color: Colors.white, fontSize: 16),
                                ),
                              ),
                              InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  )),
                            ],
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
      ),
    ),
  );
}
