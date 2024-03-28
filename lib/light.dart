import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var isActive = false;
  final color1 = const Color(0xff2C3333);
  var controller = TorchController();
  final color2 = const Color(0xffE7f6f2);

  @override
  Widget build(BuildContext context) {
      var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Flash Light",
        
          style: TextStyle(color: Colors.transparent),
          
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      isActive ? "assets/on.png" : "assets/off.png",
                      height: 200,
                      width: 200,
                      fit: BoxFit.fill,
                    )
                  ],
                ),
              ),
            ),
          ),
          CircleAvatar(
              child: IconButton(
            onPressed: () {
              controller.toggle();
              isActive = !isActive;
              setState(() {
                
              });
            },
            icon: Text(
              
              "Click Me",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            
          )),
          Text(
            "Developed By Muhammad Faheem",
            style: TextStyle(fontSize: 14.0, color: color2),
          ),
        ],
      ),
    );
  }
}
