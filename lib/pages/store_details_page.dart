import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uber_eats/json/home_page_json.dart';
import 'package:uber_eats/theme/colors.dart';
import 'package:uber_eats/theme/style.dart';

class StoreDetailsPage extends StatefulWidget {
  final String img;

  const StoreDetailsPage({Key? key, required this.img}) : super(key: key);

  @override
  State<StoreDetailsPage> createState() => _StoreDetailsPageState();
}

class _StoreDetailsPageState extends State<StoreDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: getFooter(),
      body: getBody(),
    );
  }

  Widget getFooter() {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 80,
      width: size.width,
      decoration: BoxDecoration(
          color: white,
          border: Border(top: BorderSide(color: black.withOpacity(0.1)))),
      child: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: Column(
          children: [
            Text(
              "\$15.00 away from a \$0.00 delivery fee",
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w500, color: primary),
            )
          ],
        ),
      ),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 100.0),

        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: size.width,
                  child: Image(
                    image: NetworkImage(widget.img),
                    fit: BoxFit.cover,
                  ),
                ),
                SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: white,
                              shape: BoxShape.circle
                            ),
                            child: Center(child: Icon(Icons.arrow_back,size: 18,)),
                          )),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: white,
                              shape: BoxShape.circle
                            ),
                            child: Center(child: Icon(Icons.favorite_border,size: 18,)),
                          ))
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 15.0,right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Starbucks (park Row at Beekman St)",
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26),),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Container(
                        width: size.width-30,
                        child: Text("Cafe - coffee & Tea - Breakfast and Brunch -Bakery \$, ",style: TextStyle(
                          fontSize: 14,height: 1.5,
                        ),),
                      )
                    ],

                  ),

                  SizedBox(height: 15,),
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
                          child: Text("40 - 50 min",style: TextStyle(fontSize: 14),),
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
                                Text("4.7",style: TextStyle(fontSize: 14),),
                                SizedBox(width: 3,),
                                Icon(Icons.star,color: yellowStar,size: 17,),
                                SizedBox(width: 3,),
                                Text("259",style: TextStyle(fontSize: 14),),

                              ],
                            )
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 15,),
                  Divider(thickness: 1,color: Colors.black.withOpacity(0.3),),
                  SizedBox(height: 10,),
                  
                  Text("Store Info",style: customContent,),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Container(
                        width: size.width * 0.8,
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/images/pin_icon.svg",width: 15,color: black.withOpacity(0.5),),
                            SizedBox(width: 8,),
                            Text("38 park Row Frnt 4, New York , NY 100360",style: TextStyle(fontSize: 14),)
                          ],
                        ),
                      ),
                      Expanded(
                        child: TextButton(onPressed: (){}, child: Text(
                          "More Info",style: TextStyle(fontSize: 12,color: primary,fontWeight: FontWeight.bold),
                        )),
                      )
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Icon(Icons.comment,color: primary,size: 15,),
                      SizedBox(width: 8,),
                      Text("People Say....",style: TextStyle(fontSize: 15,color: black.withOpacity(0.5)),)
                    ],
                  ),
                  SizedBox(height: 15,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(peopleFeedback.length, (index) {
                        return  Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: primary.withOpacity(0.2)
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 18.0,right: 18),
                                child: Text(peopleFeedback[index],style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: primary),),
                              ),
                            ),
                          ),
                        );
                      }
                    )
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: size.width-30,

                    decoration: BoxDecoration(
                      border: Border.all(color: black.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Delivery fee ',style: TextStyle(color: black.withOpacity(0.5)),),
                          SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: (size.width-70)*0.8,
                                child: Text("there aren't enogh couriers nearby, the delivery fee is higher right now",
                                  style: TextStyle(fontSize: 17,height: 1.5),),

                              ),
                              Container(
                                width: (size.width-70)*0.2 ,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,color: black.withOpacity(0.15)
                                  ),
                                  child: Center(child: Icon(Icons.arrow_circle_down_outlined,color: black.withOpacity(0.4),size: 18,)),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Divider(
                    thickness: 1,color: black.withOpacity(0.3),
                  ),
                  SizedBox(height: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("menu",style: TextStyle(fontSize: 15),),
                          Icon(Icons.search,size: 27,)

                        ],
                      ),
                      SizedBox(height: 30,),
                      Text("Packed For You",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),),
                      SizedBox(
                        height: 30,
                      ),
                     Column(
                       children: List.generate(packForYou.length, (index){
                         return  Padding(
                           padding: const EdgeInsets.only(bottom: 40.0),
                           child: Row(
                             children: [
                               Container(
                                 width: (size.width-30)*0.6,
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text(packForYou[index]["name"],style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17,height: 1.5),),
                                     SizedBox(height: 10,),
                                     Text(packForYou[index]["description"],style: TextStyle(height: 1.3),),
                                     SizedBox(height: 10,),
                                     Text(packForYou[index]["price"],style: TextStyle(height: 1.3),),


                                   ],
                                 ),
                               ),
                               SizedBox(width: 15,),
                               Expanded(
                                 child: Container(
                                   height: 110,
                                   child: Padding(
                                     padding: const EdgeInsets.only(top: 10.0,bottom: 10,left: 20),
                                     child: Image(image: NetworkImage(packForYou[index]["img"]),fit: BoxFit.cover,),
                                   ),
                                 ),
                               )
                             ],
                           ),
                         );
                       },
                     )
                     )
                    ],
                  )


                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
