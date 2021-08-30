import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:latihan1/pageCard.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> headerFood, newFood, popularFood, recFood;

  int flag = 1;
  void initState() {
    super.initState();
    flag = 1;
    print(flag);
    parseJson();
  }

  void parseJson() async{
    String data = await rootBundle.loadString('assets/foodData.json');
    var hasilJson = jsonDecode(data);
    headerFood = hasilJson['data']['header'];
    newFood = hasilJson['data']['new_taste'];
    popularFood = hasilJson['data']['popular'];
    recFood = hasilJson['data']['recommended'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff093e74),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),

            // paling laris
            Container(
              height: 300,
              width: 400,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(30, 0, 0, 10),
                    child: Text(
                      "Paling laris di sekitarmu",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        // color: Colors.white
                      ),
                    ),
                  ),

                  Container(
                    height: 210,
                    child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: headerFood == null ? 0 : headerFood.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            // height: 250,
                            width: 140,
                            child: card(
                                headerFood[index]['nama'],
                                headerFood[index]['harga'],
                                headerFood[index]['image'],
                                () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => PageCard(

                                  )),
                                );
                              },
                            )
                          );
                        }
                    ),
                  )
                ],
              )
            ),

            // kayak navbar
            Container(
              height: 460,
              width: 400,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            // button new taste
                            GestureDetector(
                              onTap: () {
                                // print("new taste kepijijt");
                                setState(() {
                                  flag = 1;
                                  print(flag);
                                });
                              },
                              child:Container(
                                  height: 40,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [

                                      Text(
                                        "New Taste",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      flag == 1 ?
                                      Padding(
                                        padding:EdgeInsets.symmetric(horizontal:10.0),
                                        child:Container(
                                          height:3.0,
                                          width:30.0,
                                          color:Colors.greenAccent,
                                        )
                                      ) : Padding(
                                          padding:EdgeInsets.symmetric(horizontal:10.0),
                                          child:Container(
                                            height:3.0,
                                            width:30.0,
                                            color:Colors.white,
                                          )
                                      )
                                    ],
                                  )
                              ),
                            ),

                            // button popular
                            GestureDetector(
                              onTap: () {
                                // print("popular kepijijt");
                                setState(() {
                                  flag = 2;
                                  print(flag);
                                });
                              },
                              child:Container(
                                  height: 40,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [

                                      Text(
                                        "Popular",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      flag == 2 ?
                                      Padding(
                                          padding:EdgeInsets.symmetric(horizontal:10.0),
                                          child:Container(
                                            height:3.0,
                                            width:30.0,
                                            color:Colors.greenAccent,
                                          )
                                      ) : Padding(
                                          padding:EdgeInsets.symmetric(horizontal:10.0),
                                          child:Container(
                                            height:3.0,
                                            width:30.0,
                                            color:Colors.white,
                                          )
                                      )
                                    ],
                                  )
                              ),
                            ),

                            // button rekomendet
                            GestureDetector(
                              onTap: () {
                                // print("rekomen kepijijt");
                                setState(() {
                                  flag = 3;
                                  print(flag);
                                });
                              },
                              child:Container(
                                  height: 40,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [

                                      Text(
                                        "Recommended",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      flag == 3 ?
                                      Padding(
                                          padding:EdgeInsets.symmetric(horizontal:10.0),
                                          child:Container(
                                            height:3.0,
                                            width:30.0,
                                            color:Colors.greenAccent,
                                          )
                                      ) : Padding(
                                          padding:EdgeInsets.symmetric(horizontal:10.0),
                                          child:Container(
                                            height:3.0,
                                            width:30.0,
                                            color:Colors.white,
                                          )
                                      )
                                    ],
                                  )
                              ),
                            ),

                          ],
                        ),

                        // condition()

                        Container(
                          height: 420,
                          child: condition()
                        )

                      ],
                    )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // ignore: missing_return
  Widget condition() {
    if(flag == 1) {
      // print("masuk taste");
      return ListView.builder(
        // padding: const EdgeInsets.all(8),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                width: 140,
                child: CardNewTaste()
            );
          }
      );
    }
    else if(flag == 2){
      return ListView.builder(
        // padding: const EdgeInsets.all(8),
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                width: 140,
                child: CardPopular()
            );
          }
      );
    }
    else if(flag == 3){
      return ListView.builder(
        // padding: const EdgeInsets.all(8),
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                width: 140,
                child: CardRec()
            );
          }
      );
    }
  }

  Widget card(nama, harga, gambar, Function onPressed) {
    return GestureDetector(
      onTap: onPressed,
      //     () {
      //   print("card kepijijt");
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => PageCard()),
      //   );
      // },
      child: Container(
          margin: const EdgeInsets.all(5.0),
          // padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.all(
                Radius.circular(10.0)
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 120.0,
                  child: Image.network(
                    gambar,
                    fit: BoxFit.cover,
                  )
              ),

              Container(
                height: 58.0,
                padding: const EdgeInsets.all(3.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      nama,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),

                    Text(
                      harga,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}

// card menu bar
class CardNewTaste extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          print("card New Taste kepijijt");
        },
        child: Container(
          height: 60.0,
          margin: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
                Radius.circular(10.0)
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Container(
                  height: 55.0,
                  width: 55.0,
                  child: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/RedDot_Burger.jpg/1280px-RedDot_Burger.jpg',
                    // fit: BoxFit.cover,
                  )
                ),
              ),

              Container(
                width: 250,
                padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Burger Tumpeh',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                      RatingBar.builder(
                          initialRating: 3.5,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 15.0,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.green,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      Text(
                        'Rp.25.000',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                )

              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardPopular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          print("card popular kepijijt");
        },
        child: Container(
          height: 60.0,
          margin: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
                Radius.circular(10.0)
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Container(
                    height: 55.0,
                    width: 55.0,
                    child: Image.network(
                      'https://static.wixstatic.com/media/c4c029_a75e7f6c7aff4c6b8679b652d250b2b2~mv2.jpg/v1/fill/w_1000,h_666,al_c,q_90,usm_0.66_1.00_0.01/c4c029_a75e7f6c7aff4c6b8679b652d250b2b2~mv2.jpg'
                      // fit: BoxFit.cover,
                    )
                ),
              ),

              Container(
                  width: 250,
                  padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hotdog Tumpeh',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                        RatingBar.builder(
                          initialRating: 5,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 15.0,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.green,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        Text(
                          'Rp.27.000',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  )

              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardRec extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          print("card popular kepijijt");
        },
        child: Container(
          height: 60.0,
          margin: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
                Radius.circular(10.0)
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Container(
                    height: 55.0,
                    width: 55.0,
                    child: Image.network(
                      'https://asset.kompas.com/crops/teG8bxBeC9NzNi6opEf38UDC74Q=/0x0:1000x667/750x500/data/photo/2020/09/22/5f69e601777db.jpg'
                      // fit: BoxFit.cover,
                    )
                ),
              ),

              Container(
                  width: 250,
                  padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pizza Lengket',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                        RatingBar.builder(
                          initialRating: 4,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 15.0,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.green,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        Text(
                          'Rp.30.000',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  )

              ),
            ],
          ),
        ),
      ),
    );
  }
}

// card paling laris
class Card extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("card kepijijt");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PageCard()),
        );
      },
      child: Container(
          margin: const EdgeInsets.all(5.0),
          // padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.all(
                Radius.circular(10.0)
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 120.0,
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.all(
                  //       Radius.circular(10.0)
                  //   )
                  // ),
                  child: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/RedDot_Burger.jpg/1280px-RedDot_Burger.jpg',
                    fit: BoxFit.cover,
                  )
              ),

              Container(
                height: 58.0,
                padding: const EdgeInsets.all(3.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Burger Tumpeh',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),

                    Text(
                      'Gak dijual',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}