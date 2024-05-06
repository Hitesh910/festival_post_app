import 'package:festival_post_app/utils/global.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text(
            "Festival Post Maker",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          backgroundColor: Colors.amber.shade200,
          elevation: 5,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   height: 80,
            //   width: MediaQuery.sizeOf(context).width,
            //   alignment: Alignment.bottomCenter,
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     boxShadow: [BoxShadow(
            //       blurRadius: 5,spreadRadius: -2
            //     )],
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Text("Festival Post Maker",style: TextStyle(fontSize: 25),),
            //         Icon(Icons.help,color: Colors.amber.shade400,)
            //       ],
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: const Image(
                    image: AssetImage("assets/Images/img1.jpg"),
                  )),
            ),
            // Container(
            //   decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/Images/img1.jpg"))),
            // )
            // ListView.builder(itemBuilder: )
            //
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
                    //   Container(
                    //   height: 150,
                    //   width: 120,
                    //   // color: Colors.red,
                    //   margin: const EdgeInsets.all(5),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(15),
                    //     color: Colors.red,
                    //     image:  DecorationImage(
                    //         image: AssetImage('${category[index].image}'),
                    //         fit: BoxFit.cover),
                    //   ),
                    // );
                  },
                ),
              ),
            )
          ],
        ));
  }
   Widget Tile(int index)
  {
    return InkWell(
      onTap: () {
        List mainList = [diwaliList,diwaliList,diwaliList,diwaliList];
        Navigator.pushNamed(context, 'choice',arguments: mainList[index]);
      },
      child: Container(
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
}
