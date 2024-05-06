import 'package:festival_post_app/utils/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// import '../../model/festival_model.dart';

class ChoiceScreen extends StatefulWidget {
  const ChoiceScreen({super.key});

  @override
  State<ChoiceScreen> createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
  List m1 = [];
  int pt =0;


  @override
  Widget build(BuildContext context) {
    m1 = ModalRoute.of(context)!.settings.arguments as List;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Choice Screen",
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: Colors.amber.shade200,
        actions: [
          IconButton(onPressed: () {
            Navigator.pushNamed(context, 'edit',arguments: m1[pt]);
          }, icon: Icon(Icons.check))
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 350,
            width: 400,
            margin: const EdgeInsets.all(8),
            // padding: EdgeInsets.all(8),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: Image(
              image: AssetImage("${m1[pt]}"),
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: diwaliList.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      // m1 = diwaliList[index];
                      pt = index;
                    });
                  },
                  child: Image.asset(
                   diwaliList[index]
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
