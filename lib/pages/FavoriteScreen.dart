import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snacksnmeals/Comman/ColorFile.dart';
import 'package:snacksnmeals/Comman/Util.dart';
import 'package:snacksnmeals/Comman/string.dart';
import 'package:snacksnmeals/api/api.dart';
import 'package:snacksnmeals/model/ProductsItem.dart';
import 'package:snacksnmeals/pages/MenuPage.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FavoriteScreenState();
  }
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  // final List<ProductsItem> _list = ['assets/f1.jpeg', 'assets/image1.jpeg','assets/juice4.jpeg','assets/f4.jpeg','assets/image2.jpeg', 'assets/image5.jpeg'];
  List<ProductsItem> _listannmnt = <ProductsItem>[];
  String cust_id = "";

  Future<List<ProductsItem>?> listDataJSON() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    cust_id = preferences.getString(Cust_ID) ?? "";
    // _CondoID = preferences.getString(StrCondo_ID);

    Map data = {'restaurant_id': StrRestaruntId, 'cust_id': cust_id};
    var url = Uri.parse(FavouriteAPI);
    print('Payload : - ' + data.toString());
    var response = await http.post(url, body: data);
    if (response != null && response.statusCode == 200) {
      var jsonResponse = null;
      List loadedAnnouncements;
      jsonResponse = json.decode(response.body);
      if (jsonResponse != null) {
        if (jsonResponse['success'] == 1) {
          CustomeSnackBarMessage(context, jsonResponse['message']);
          loadedAnnouncements = jsonResponse['favplist'];
          _listannmnt = loadedAnnouncements
              .map((model) => ProductsItem.fromJson(model))
              .toList();
          print(_listannmnt.length);
        } else {
          CustomeSnackBarMessage(context, jsonResponse['message']);
        }
        return _listannmnt;
      }
    } else {
      throw Exception('Error');
    }
  }

  // @override
  // Future<void> initState() async {
  //   // TODO: implement initState
  //   // getPref();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
      onRefresh: () async {
        return Future.delayed(
          Duration(seconds: 1),
          () {
            setState(() {});
          },
        );
      },
      child: SingleChildScrollView(
        child: FutureBuilder(
            future: listDataJSON(),
            builder: (context, snapshot) {
              // var beers = json.decode(snapshot.data.toString());
              if (snapshot.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Container(
                color: PageBackground,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: GridView.builder(
                            itemCount: _listannmnt.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 3,
                              crossAxisSpacing: 3,
                              mainAxisExtent: 270,
                            ),
                            itemBuilder: (context, index) => ItemCard(
                                  product: _listannmnt[index],
                                  press: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MenuPage(),
                                        ));
                                  },
                                )),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    ));
  }
}

class ItemCard extends StatelessWidget {
  final ProductsItem product;
  final void Function() press;

  const ItemCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  // For  demo we use fixed height  and width
                  // Now we dont need them
                  height: 155,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(product.p_pic)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 5, 5),
                  child: Text(
                    // products is out demo list
                    product.p_name,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 5, 5),
                  child: Text(
                    "\$" + " " + product.p_price,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              height: 20,
                              width: 20,
                              child: Image.asset('assets/rating_star.png')),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Text(
                              "4.5",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              height: 20,
                              width: 20,
                              child: Image.asset('assets/alarm_clock.png')),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Text(
                              "10-15min",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
