import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:snacksnmeals/Comman/ColorFile.dart';
import 'package:snacksnmeals/pages/MenuPage.dart';
import 'package:snacksnmeals/pages/PopularFoodPage.dart';
import 'package:snacksnmeals/pages/ProductPage.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final List<String> _list = ['assets/f1.jpeg', 'assets/image1.jpeg','assets/juice4.jpeg','assets/f4.jpeg','assets/image2.jpeg', 'assets/image5.jpeg'];

@override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
                    itemCount: _list.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 3,
                      crossAxisSpacing: 3,
                      mainAxisExtent: 270,
                    ),
                    itemBuilder: (context, index) => ItemCard(
                            product: _list[index],
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
      ),
    );
  }
}


class ItemCard extends StatelessWidget {
  final String product;
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
                          image: AssetImage(product)),
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
                    "Food Name",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 5, 5),
                  child: Text(
                    "\$ 15.00",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700
                    ),
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
