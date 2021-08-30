import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PageCard extends StatefulWidget {
  final String nama, harga, deskripsi, bahan, gambar;
  final double rating;
  const PageCard({ key, @required this.nama, @required this.harga, @required this.deskripsi, @required this.bahan, @required this.gambar, @required this.rating }) : super(key: key);


  @override
  _PageCardState createState() => _PageCardState();
}

class _PageCardState extends State<PageCard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.network(
            widget.gambar,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.40,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15.0),
                    topLeft: Radius.circular(15.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                widget.nama,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              RatingBar.builder(
                                initialRating: widget.rating,
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Text(
                    'Description',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    widget.deskripsi == null ? '' : widget.deskripsi,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: MediaQuery.of(context).size.height * (1/50)
                    ),
                  ),

                  Text(
                    'Ingredients:',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    widget.bahan == null ? '' : widget.bahan,
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: MediaQuery.of(context).size.height * (1/50)
                    ),
                  ),

                  Text(
                    'Price',
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: MediaQuery.of(context).size.height * (1/45)
                    ),
                  ),
                  Text(
                    widget.harga,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: MediaQuery.of(context).size.height *(1/35)
                    ),
                  ),

                ],
              ),
            ),
          )

        ],
        // overflow: Overflow.visible,
      )
        // Container(
      //   child: Column(
      //     children: [
      //       Expanded(
      //         flex: 1,
      //         child: Image.network(
      //           'https://static.wixstatic.com/media/c4c029_a75e7f6c7aff4c6b8679b652d250b2b2~mv2.jpg/v1/fill/w_1000,h_666,al_c,q_90,usm_0.66_1.00_0.01/c4c029_a75e7f6c7aff4c6b8679b652d250b2b2~mv2.jpg',
      //           fit: BoxFit.cover,
      //         )
      //       ),
      //       Expanded(
      //         flex: 2,
      //         child: Container(
      //           padding: const EdgeInsets.all(30.0),
      //           height: MediaQuery.of(context).size.height * 1,
      //           // color: Colors.blueGrey,
      //           decoration: BoxDecoration(
      //             // color: Colors.white,
      //             // border: Border.all(color: Colors.black),
      //             borderRadius: BorderRadius.all(
      //                 Radius.circular(10.0)
      //             ),
      //           ),
      //           child: Column(
      //             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Container(
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     Container(
      //                       child: Column(
      //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                         children: [
      //                           Text(
      //                             'Burger Tumpeh',
      //                             style: TextStyle(
      //                               fontSize: 18,
      //                               fontWeight: FontWeight.bold
      //                             ),
      //                           ),
      //                           RatingBar.builder(
      //                             initialRating: 3.5,
      //                             minRating: 1,
      //                             direction: Axis.horizontal,
      //                             allowHalfRating: true,
      //                             itemCount: 5,
      //                             itemSize: 15.0,
      //                             itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      //                             itemBuilder: (context, _) => Icon(
      //                               Icons.star,
      //                               color: Colors.green,
      //                             ),
      //                             onRatingUpdate: (rating) {
      //                               print(rating);
      //                             },
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //
      //               Text(
      //                 'Description',
      //                 style: TextStyle(
      //                     fontSize: 18,
      //                     fontWeight: FontWeight.bold
      //                 ),
      //               ),
      //
      //               Text(
      //                 'Ingredients:',
      //                 style: TextStyle(
      //                     fontSize: 18,
      //                     fontWeight: FontWeight.bold
      //                 ),
      //               ),
      //
      //               Text(
      //                 'Burger Tumpeh',
      //                 style: TextStyle(
      //                     fontSize: 18,
      //                     fontWeight: FontWeight.bold
      //                 ),
      //               ),
      //
      //               Text(
      //                 'Burger Tumpeh',
      //                 style: TextStyle(
      //                     fontSize: 18,
      //                     fontWeight: FontWeight.bold
      //                 ),
      //               ),
      //
      //               Text(
      //                 'Burger Tumpeh',
      //                 style: TextStyle(
      //                     fontSize: 18,
      //                     fontWeight: FontWeight.bold
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}