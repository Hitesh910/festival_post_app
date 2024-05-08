import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:ui' as ui;

import 'package:path_provider/path_provider.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  // late TextEditingController txtname;
  TextEditingController txtname = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtAdd = TextEditingController();
  TextEditingController txtNum = TextEditingController();
  String? name, email, add, num;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Color isColor = Colors.black;
  List fontList = ["sedan", "Nunito", "Knit"];
  String? isFont = 'sedan';
  ImagePicker picker = ImagePicker();
  String? path;
  GlobalKey globalKey = GlobalKey();

  String? m1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (name != null && email != null && add != null && num != null) {
      txtname.text = name!;
      txtEmail.text = email!;
      txtAdd.text = add!;
      txtNum.text = num!;
    }
  }

  Widget build(BuildContext context) {
    m1 = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit"),
        backgroundColor: Colors.amber.shade200,
      ),
      body:
      SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 410,
            width: 450,
            child: RepaintBoundary(
              key: globalKey,
              child: Stack(
                children: [
                  Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Image.asset(
                      '$m1',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Align(
                    alignment: Alignment(-0.9, -0.9),
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.file(
                        File('$path'),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.8, -0.9),
                    child: Text(
                      "$name",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: isFont,
                          color: isColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.5, 0.8),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            // width: 350,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15)),
                                color: Colors.white),
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.phone),
                                      Text(
                                        "$num",
                                        style: TextStyle(
                                            fontFamily: isFont, color: isColor),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Text("//"),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.email),
                                      Text(
                                        "$email",
                                        style: TextStyle(
                                            fontFamily: isFont, color: isColor),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.6, 0.9),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10)),
                            color: Colors.red.shade400),
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            Icon(Icons.location_on),
                            Text(
                              "$add",
                              style:
                              TextStyle(fontFamily: isFont, color: isColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton.filledTonal(
                  onPressed: () async {
                    XFile? image =
                    await picker.pickImage(source: ImageSource.gallery);
                    setState(() {
                      path = image!.path;
                    });
                  },
                  icon: Icon(Icons.image,size: 32,)),
              IconButton.filledTonal(
                onPressed: () {
                  setState(() {
                    text();
                  });
                },
                icon: const Icon(
                  Icons.text_fields,
                  size: 32,
                ),
              ),
              IconButton.filledTonal(
                onPressed: () {
                  setState(() {
                    font();
                  });
                },
                icon: const Icon(
                  Icons.text_format,
                  size: 32,
                ),
              ),
              IconButton.filledTonal(
                onPressed: () {
                  setState(() {
                    color();
                  });
                },
                icon: const Icon(
                  Icons.color_lens,
                  size: 32,
                ),
              ),

              IconButton.filledTonal(
                onPressed: () {
                  setState(() {
                    save();
                  });
                },
                icon: const Icon(
                  Icons.download,
                  size: 32,
                ),
              ),
            ],
          ),

        ]),
      ),
    );
  }

  Future text() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Enter the data"),
          content: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      // autofocus: true,
                      decoration: const InputDecoration(
                          label: Text("Name"), border: OutlineInputBorder()),
                      controller: txtname,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Name is required";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      controller: txtEmail,
                      decoration: const InputDecoration(
                        label: Text("Email"),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (!RegExp(
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                            .hasMatch(value!)) {
                          return "Valid email";
                        } else if (value.isEmpty) {
                          return "Email is required";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      controller: txtNum,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Number"),
                      ),
                      validator: (value) {
                        if (value!.length != 10) {
                          return "Valid number";
                        } else if (value.isEmpty) {
                          return "Number is required";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 80,
                    child: TextFormField(
                      controller: txtAdd,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), label: Text("Address")),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Address is required";
                        }
                        return null;
                      },
                      maxLines: 2,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (formKey.currentState!.validate()) {
                            name = txtname.text;
                            email = txtEmail.text;
                            add = txtAdd.text;
                            num = txtNum.text;
                            print("$name $email $add $num");
                            Navigator.pop(context);
                          }
                          return null;
                        });
                      },
                      child: const Text("Submit"))
                ],
              ),
            ),
          ),
        );

      },
    );
  }

  Future color() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 250,
                  width: 250,
                  child: Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemCount: Colors.primaries.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              isColor = Colors.primaries[index];
                              Navigator.pop(context);
                            });
                          },
                          child: Container(
                            height: 150,
                            width: 150,
                            margin: EdgeInsets.all(10),
                            decoration:
                            BoxDecoration(color: Colors.primaries[index]),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Future font() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 80,
                  width: 80,
                  child: Expanded(
                      child: ListView.builder(
                        itemCount: fontList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      isFont = fontList[index];
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Text(
                                    fontList[index],
                                    style: const TextStyle(fontSize: 25),
                                  )),
                              const Divider()
                            ],
                          );
                        },
                      )),
                ),
              ],
            )

        );
      },
    );
  }


  Future<Object?> save() async{
    {
      RenderRepaintBoundary boundary = globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3);
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      var bs64 = byteData?.buffer.asUint8List();

      String? path ="${DateTime.now().year}${DateTime.now().month}${DateTime.now().day}${DateTime.now().hour}${DateTime.now().minute}${DateTime.now().second}";

      if(Platform.isAndroid)
        {
          await File("/storage/emulated/0/Download/$path.png").writeAsBytes(bs64!);
          return "/storage/emulated/0/Download/1.png";
        }
      else
        {
          Directory? dir = await getDownloadsDirectory();
          await File("${dir!.path}.png").writeAsBytes(bs64!);
          return "${dir!.path}.png";
        }
    }
  }
}
