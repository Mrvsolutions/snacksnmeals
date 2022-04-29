import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:snacksnmeals/Comman/ColorFile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: PageBackground,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 50,
                color: PageBackground,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: RaisedButton.icon(
                        onPressed: () {
                          print('Button Clicked.');
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        label: Text(
                          'Food',
                          style: TextStyle(color: BlackColor),
                        ),
                        icon: Image.asset(
                          "assets/ic_chef.png",
                          height: 25,
                          width: 25,
                        ),
                        textColor: BlackColor,
                        color: WhiteColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: RaisedButton.icon(
                        onPressed: () {
                          print('Button Clicked.');
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        label: Text(
                          'Juice',
                          style: TextStyle(color: BlackColor),
                        ),
                        icon: Image.asset(
                          "assets/ic_chef.png",
                          height: 25,
                          width: 25,
                        ),
                        textColor: BlackColor,
                        color: WhiteColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: RaisedButton.icon(
                        onPressed: () {
                          print('Button Clicked.');
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        label: Text(
                          'Desert',
                          style: TextStyle(color: BlackColor),
                        ),
                        icon: Image.asset(
                          "assets/ic_chef.png",
                          height: 25,
                          width: 25,
                        ),
                        textColor: BlackColor,
                        color: WhiteColor,
                      ),
                    ),
                    //your widget items here
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/food_img.jpeg')),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 40,
                      width: 100,
                      color: Colors.black12,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "50% Off",
                              style: TextStyle(
                                  color: WhiteColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Popular Foods',
                        style: TextStyle(color: BlackColor,fontWeight: FontWeight.w400,fontSize: 18),
                      ),
                      Text(
                        'View All',
                        style: TextStyle(color: BlackColor,fontSize: 18),
                      ),
                    ],
                  )
                ],
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: GridView.builder(
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 3,
                      crossAxisSpacing: 3,
                      childAspectRatio: 0.82,
                    ),
                    itemBuilder: (context, index) => ItemCard(
                    //  product: products[index],
                      press: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => ProductDetailPage(),
                        //     ));
                      },
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
//  final Product product;
  final void Function() press;

  const ItemCard({
    Key? key,
 //   required this.product,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)),
        child: Column(
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
              child:  Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/food_img.jpeg')),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
              child: Text(
                // products is out demo list
                "Popular Food",
                style: TextStyle(
                    color: Colors.black,fontSize: 16,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 5, 5),
              child: Text(
                "\$ 150",
                style: TextStyle(
                    color: Colors.black,fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}

