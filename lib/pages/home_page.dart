import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:uber_eats/json/home_page_json.dart';
import 'package:uber_eats/pages/store_details_page.dart';
import 'package:uber_eats/theme/style.dart';

import '../theme/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeMenu = 0;
  List<String> images = [
    "assets/images/slide_1.jpg",
    "assets/images/slide_2.jpg",
    "assets/images/slide_3.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(menu.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          activeMenu = index;
                        });
                      },
                      child: activeMenu == index
                          ? ElasticIn(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15, top: 8, bottom: 8),
                                  child: Text(
                                    menu[index],
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            )
                          : ElasticIn(    
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15, top: 8, bottom: 8),
                                  child: Text(
                                    menu[index],
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                    ),
                  );
                })),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15, top: 10),
                  height: 45,
                  width: size.width - 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: textFieldColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/images/pin_icon.svg",
                              width: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "New York",
                              style: customContent,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 35,
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/images/time_icon.svg",
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Now",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Icon(Icons.keyboard_arrow_down)
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: SvgPicture.asset(
                      "assets/images/filter_icon.svg",
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            CarouselSlider(
              options: CarouselOptions(height: 180.0, autoPlay: true),
              items: images.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        //decoration: const BoxDecoration(color: Colors.white),
                        child: Image.asset(
                          i,
                        ));
                  },
                );
              }).toList(),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                width: size.width,
                decoration: BoxDecoration(color: textFieldColor),
                child: Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(color: white),
                    child: Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          margin: EdgeInsets.only(left: 30),
                          child: Row(
                            children: List.generate(categories.length, (index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 30.0),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      categories[index]["img"],
                                      width: 40,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(categories[index]["name"])
                                  ],
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
            SizedBox(
              height: 15,
            ),

            Container(
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: size.width,
                          height: 160,
                          child: Image(
                            image: NetworkImage(firstMenu[0]["img"]),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                            bottom: 15,
                            right: 15,
                            child: SvgPicture.asset(
                              firstMenu[0]["is_liked"]
                                  ? "assets/images/loved_icon.svg"
                                  : "assets/images/love_icon.svg",
                              width: 20,
                              color: white,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      firstMenu[0]["name"],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          "sponsored",
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.info,
                          size: 15,
                          color: Colors.grey,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      firstMenu[0]["description"],
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: textFieldColor,
                            borderRadius: BorderRadius.circular(3)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(Icons.hourglass_bottom,
                            color: primary,
                            size: 16,
                            ),
                          ),
                        ),
                        SizedBox(width: 8,),
                        Container(
                          decoration: BoxDecoration(
                            color: textFieldColor,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(firstMenu[0]["time"],style: TextStyle(fontSize: 14),),
                          ),
                        ),
                        SizedBox(width: 8,),
                        Container(
                          decoration: BoxDecoration(
                            color: textFieldColor,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(firstMenu[0]["delivery_fee"],style: TextStyle(fontSize: 14),),
                          ),
                        ),

                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            Container(
              width: size.width,
              height: 10,
              color: textFieldColor,

            ),

            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(left: 15,
              right: 15,bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("More to explore",style: customTitle,),
                  SizedBox(height: 15,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(exploreMenu.length, (index) {
                        return  GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>StoreDetailsPage(
                              img: exploreMenu[index]["img"],
                            )));

                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      width: size.width-30,
                                      height: 160,
                                      child: Image(
                                        image: NetworkImage(exploreMenu[index]["img"]),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                        bottom: 15,
                                        right: 15,
                                        child: SvgPicture.asset(
                                          exploreMenu[index]["is_liked"]
                                              ? "assets/images/loved_icon.svg"
                                              : "assets/images/love_icon.svg",
                                          width: 20,
                                          color: white,
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  exploreMenu[index]["name"],
                                  style:
                                  TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "sponsored",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.info,
                                      size: 15,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  exploreMenu[index]["description"],
                                  style: TextStyle(fontSize: 14),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: textFieldColor,
                                          borderRadius: BorderRadius.circular(3)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Icon(Icons.hourglass_bottom,
                                          color: primary,
                                          size: 16,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 8,),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: textFieldColor,
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(exploreMenu[index]["time"],style: TextStyle(fontSize: 14),),
                                      ),
                                    ),
                                    SizedBox(width: 8,),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: textFieldColor,
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Row(
                                            children: [
                                              Text(exploreMenu[index]["rate"],style: TextStyle(fontSize: 14),),
                                              SizedBox(width: 3,),
                                              Icon(Icons.star,color: yellowStar,size: 17,),
                                              SizedBox(width: 3,),
                                              Text(exploreMenu[index]["rate_number"],style: TextStyle(fontSize: 14),),

                                            ],
                                          )
                                      ),
                                    ),

                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }

                    ),
                   )
                  )
                ],
              ),
            ),

            SizedBox(height: 15,),
            Container(
              width: size.width,
              height: 10,
              color: textFieldColor,

            ),

            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(left: 15,
                  right: 15,bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Popular Near You",style: customTitle,),
                  SizedBox(height: 15,),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(popularNearYou.length, (index) {
                          return  GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>StoreDetailsPage(
                                img: popularNearYou[index]["img"],
                              )));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width: size.width-30,
                                        height: 160,
                                        child: Image(
                                          image: NetworkImage( popularNearYou[index]["img"]),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                          bottom: 15,
                                          right: 15,
                                          child: SvgPicture.asset(
                                            popularNearYou[index]["is_liked"]
                                                ? "assets/images/loved_icon.svg"
                                                : "assets/images/love_icon.svg",
                                            width: 20,
                                            color: white,
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    exploreMenu[index]["name"],
                                    style:
                                    TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "sponsored",
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        Icons.info,
                                        size: 15,
                                        color: Colors.grey,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    popularNearYou[index]["description"],
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: textFieldColor,
                                            borderRadius: BorderRadius.circular(3)
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Icon(Icons.hourglass_bottom,
                                            color: primary,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 8,),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: textFieldColor,
                                          borderRadius: BorderRadius.circular(3),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(popularNearYou[index]["time"],style: TextStyle(fontSize: 14),),
                                        ),
                                      ),
                                      SizedBox(width: 8,),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: textFieldColor,
                                          borderRadius: BorderRadius.circular(3),
                                        ),
                                        child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Row(
                                              children: [
                                                Text( popularNearYou[index]["rate"],style: TextStyle(fontSize: 14),),
                                                SizedBox(width: 3,),
                                                Icon(Icons.star,color: yellowStar,size: 17,),
                                                SizedBox(width: 3,),
                                                Text( popularNearYou[index]["rate_number"],style: TextStyle(fontSize: 14),),

                                              ],
                                            )
                                        ),
                                      ),

                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }

                        ),
                      )
                  )
                ],
              ),
            ),


          ],
        )
      ],
    );
  }
}
