import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snacksnmeals/Comman/ColorFile.dart';
import 'package:snacksnmeals/Comman/string.dart';
import 'package:snacksnmeals/pages/MyOrderPage.dart';

import '../AppToolbar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late String _titleheading = "Profile";
  late File _image;
  late String Uploaded_pimgUrl;
  // TextEditingController _dateController = TextEditingController();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _contactController = new TextEditingController();
  final ImagePicker _picker = ImagePicker();
  @override
  void initState() {
    //_dateController.text = formatDate(DateTime.now(), [dd, '/', mm, '/', yyyy]);
    super.initState();
        () async {
      await GetSharePrefrenceValue();
      setState(() {
      });
    } ();

  }
  Future GetSharePrefrenceValue() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
   _nameController.text = preferences.getString(StrUserName)?? "";
   _emailController.text = preferences.getString(StrUserEmail)?? "";
   Uploaded_pimgUrl = preferences.getString(Strru_profile_pic)?? "";
   _contactController.text = preferences.getString(StrContactNumber)?? "";
       // _UserID = preferences.getString(Register_UserID);
       //  _Apart_No = preferences.getString(Strapt_no);
  }

  _imgFromCamera() async {
    //  File image = await ImagePicker.pickImage(source: ImageSource.camera);
    PickedFile? pickedFile = await _picker.getImage(source: ImageSource.camera);
    final File image = File(pickedFile!.path);

    setState(() {
      _image = image;
     // UploadProfilePicRequest();
    });
  }

  _imgFromGallery() async {
    //  File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    PickedFile? pickedFile = await _picker.getImage(source: ImageSource.gallery);
    final File image = File(pickedFile!.path);
    setState(() {
      _image = image;
     // UploadProfilePicRequest();
    });
  }
  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppToolbar(context, _titleheading, true, false),
        body: Container(
          color: PageBackground,
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                    color: profilebg,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage("assets/user_profile.png")),
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                // products is out demo list
                _nameController.text,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  // products is out demo list
                  // "1639 Pride Avenue, Queens \nNew York.",
                  _emailController.text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      // products is out demo list
                      "Edit Profile",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w300),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      height: 15,
                        width: 15,
                        child: Image.asset('assets/edit.png',color: Colors.orange,)),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(30, 0, 10, 0),
                    child: SizedBox(
                      height: 50,
                      child: RaisedButton(
                        onPressed: () {
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: Text(
                            "Favorites",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w800,
                                fontSize: 18),
                          ),
                        ),
                        color: Colors.orange,
                        textColor: Colors.white,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(40.0),
                        ),
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 30, 0),
                    child: SizedBox(
                      height: 50,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyOrderPage(),
                              ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15 , 0, 15, 0),
                          child: Text(
                            "My Order",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w800,
                                fontSize: 18),
                          ),
                        ),
                        color: Colors.white,
                        textColor: Colors.black,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(40.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: GridView.builder(
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                        childAspectRatio: 0.82,
                        mainAxisExtent: 270,
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
        ));
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
                          image: AssetImage('assets/food_img.jpeg')),
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
