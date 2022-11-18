import 'package:badges/badges.dart';
import 'package:nhom6_shopping_app/json/favourite_json.dart';
import 'package:nhom6_shopping_app/theme/colors.dart';
// import 'nhom6_shopping_app/pages/book_detail_page.dart';
// import 'package:nhom6_shopping_app/theme/colors1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:nhom6_shopping_app/pages/product_detail_page.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar:
          PreferredSize(child: getAppBar(), preferredSize: Size.fromHeight(60)),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        "Favourite",
        style: TextStyle(
            color: secondary1, fontSize: 18, fontWeight: FontWeight.w600),
      ),
      leading: IconButton(
        icon: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              color: white,
              shape: BoxShape.circle,
              border: Border.all(color: secondary1.withOpacity(0.2))),
          child: Center(
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 15,
              color: secondary1,
            ),
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      elevation: 1,
      backgroundColor: white,
    );
  }

  Widget getBody() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            getSearchAndCart(),
            SizedBox(
              height: 30,
            ),
            getFavourite()
          ],
        ),
      ),
    );
  }

  Widget getSearchAndCart() {
    // var size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          // width: size.width * 1,
          height: 45,
          decoration: BoxDecoration(
              color: grey.withOpacity(0.25),
              borderRadius: BorderRadius.circular(30)),
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 15, bottom: 0),
            child: TextField(
              cursorColor: primary,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search...",
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getFavourite() {
    var size = MediaQuery.of(context).size;
    return Wrap(
      spacing: 15,
      runSpacing: 20,
      children: List.generate(favouriteProductJson.length, (index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => ProductDetail(
                          img: favouriteProductJson[index]['img'],
                          title: favouriteProductJson[index]['title'],
                          description: favouriteProductJson[index]
                              ['description'],
                          price:
                              favouriteProductJson[index]['price'].toString(),
                          rate: favouriteProductJson[index]['rate'].toString(),
                        )));
          },
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: (size.width - 55) / 2,
                    height: (size.width + 40) / 2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage(favouriteProductJson[index]['img']),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration:
                          BoxDecoration(color: white, shape: BoxShape.circle),
                      child: Icon(
                        LineIcons.heartAlt,
                        size: 20,
                        color: danger,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: (size.width - 55) / 2,
                child: Text(
                  favouriteProductJson[index]['title'],
                  maxLines: 1,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: (size.width - 55) / 2,
                child: Text(
                  favouriteProductJson[index]['price'],
                  maxLines: 1,
                  style: TextStyle(fontSize: 14, color: black.withOpacity(0.4)),
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                width: (size.width - 55) / 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RatingBar.builder(
                      ignoreGestures: true,
                      initialRating: favouriteProductJson[index]['rate'],
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 15,
                      itemPadding: EdgeInsets.only(right: 2),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: danger,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "(${favouriteProductJson[index]['rate']})",
                      style: TextStyle(
                          color: danger,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
