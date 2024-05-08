import 'dart:io';

import 'package:festival_post_app/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override

  Widget build(BuildContext context) {
    return  PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        exitDialog();
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Festival Post Maker",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.search),
              )
            ],
            backgroundColor: Colors.amber.shade200,
            elevation: 5,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider.builder(itemCount: carouselList.length, itemBuilder: (context, index, realIndex) {
                 return
                   Container(
                    // height: 50,
                    //  width: 600,
                     margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: Image.asset("${carouselList[index]}",fit: BoxFit.contain,)
                  );
                }, options: CarouselOptions(autoPlay: true)),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 15, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Upcoming festival",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan.shade400),
                      ),
                      Text(
                        "View all",
                        style: TextStyle(fontSize: 18, color: Colors.cyan.shade400),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(
                    height: 140,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: category.length,
                      itemBuilder: (context, index) {
                         return
                        Tile(index);
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15, right: 10), child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Other Festiavl",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan.shade400),
                      ),
                      Text(
                        "View all",
                        style: TextStyle(fontSize: 18, color: Colors.cyan.shade400),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(
                    height: 140,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: festivalList.length,
                      itemBuilder: (context, index) {
                        return
                          Container(
                            height: 150,
                            width: 120,
                            // color: Colors.red,
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.red,
                              image:  DecorationImage(
                                  image: AssetImage("${festivalList[index]}"),
                                  fit: BoxFit.cover),
                            ),
                          );

                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15, right: 10), child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Festiavls",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.cyan.shade400),
                    ),
                    Text(
                      "View all",
                      style: TextStyle(fontSize: 18, color: Colors.cyan.shade400),
                    )
                  ],
                ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(
                    height: 140,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: festival2List.length,
                      itemBuilder: (context, index) {
                        return
                          Container(
                            height: 150,
                            width: 120,
                            // color: Colors.red,
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.red,
                              image:  DecorationImage(
                                  image: AssetImage("${festival2List[index]}"),
                                  fit: BoxFit.cover),
                            ),
                        );

                      },
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
   Widget Tile(int index)
  {
    return InkWell(
      onTap: () {
        List mainList = [gujaratList,buddhaList,diwaliList,duseraList,diwaliList];
        Navigator.pushNamed(context, 'choice',arguments: mainList[index]);
      },
      child:
      Container(
      height: 150,
      width: 120,
      // color: Colors.red,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.red,
        image:  DecorationImage(
            image: AssetImage("${category[index].image}"),
            fit: BoxFit.cover),
      ),
          ),
    );
  }
  void exitDialog()
  {
    showDialog(context: context, builder: (context) {
     return AlertDialog(
       title: Column(
         children: [
           Text("Are sure Exit"),
           Row(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
               ElevatedButton(onPressed: () {
                 setState(() {
                   exit(0);
                 });
               }, child: Text("Yes")),
               ElevatedButton(onPressed: () {
                 setState(() {
                   Navigator.pop(context);
                 });
               }, child: Text("No"))
             ],
           )
         ],
       ),
     );
    },);
  }
}
