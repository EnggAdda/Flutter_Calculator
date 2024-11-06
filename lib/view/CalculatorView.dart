import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {

  int x =0;
  int y =0;
  num z =0;

  final displayOneController  = TextEditingController();
  final displayTwoController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    displayOneController.text = x.toString();
    displayTwoController.text = y.toString();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(32.0),
      child:  Column(
        children: [
          //Calculator   Display
          CalculatorDisplay(hint : "Enter First Number" , controller : displayOneController) ,
          SizedBox(
            height:30,
          ),
          CalculatorDisplay(hint : "Enter Second Number" , controller : displayTwoController) ,
          SizedBox(
            height:30,
          ),
          Text(
          z.toString(),
            style: TextStyle (
              fontSize: 60,
              fontWeight : FontWeight.bold,
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(onPressed: () {
                setState(() {
                  z= num.tryParse(displayOneController.text) !+ num.tryParse(displayTwoController.text)!;
                  print(z);
                });

              },
              child: Icon(CupertinoIcons.add),),
              FloatingActionButton(onPressed: () {
                setState(() {
                  z= num.tryParse(displayOneController.text) !- num.tryParse(displayTwoController.text)!;
                  print(z);
                });
              },
                child: Icon(CupertinoIcons.minus),),
              FloatingActionButton(onPressed: () {
                setState(() {
                  z= num.tryParse(displayOneController.text) !* num.tryParse(displayTwoController.text)!;
                  print(z);
                });
              },
                child: Icon(CupertinoIcons.multiply),),
              FloatingActionButton(onPressed: () {
                setState(() {
                  z= num.tryParse(displayOneController.text) !/ num.tryParse(displayTwoController.text)!;
                  print(z);
                });
              },
                child: Icon(CupertinoIcons.divide),),
             const SizedBox(height: 30,),
              FloatingActionButton.extended(
                  onPressed: () {
                    setState(() {
                      x=0;
                      y=0;
                      z=0;
                      displayOneController.clear();
                      displayTwoController.clear();
                    });
             //   z= x/y;
              },
                label:Text("Clear")),

            ],
          ),
          //Expand
          //Button

        ],

      ),
    );
  }
}


class CalculatorDisplay extends StatelessWidget {
  final String? hint;
  final TextEditingController controller;

  const CalculatorDisplay({super.key, this.hint   = "Enter a Number " , required this.controller });

  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      autofocus: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 3.0,

              )

          ),
          labelText: "0",
          hintText :hint,
          hintStyle: TextStyle(
            color: Colors.white ,
          )
      ),
    );
  }
}
