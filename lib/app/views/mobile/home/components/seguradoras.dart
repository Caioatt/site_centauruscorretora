import 'package:flutter/material.dart';

class Seguradoras extends StatelessWidget {
  const Seguradoras({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      width: 300,
      height: 450,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Image.asset(
                'lib/assets/imgs/liberty.png',
                width: 130,
              ),
              SizedBox(
                width: 15,
              ),
              Image.asset(
                'lib/assets/imgs/porto.png',
                width: 130,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Image.asset(
                'lib/assets/imgs/allianz.png',
                width: 130,
              ),
              SizedBox(
                width: 15,
              ),
              Image.asset(
                'lib/assets/imgs/hdi.png',
                width: 130,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Image.asset(
                'lib/assets/imgs/tokyo.png',
                width: 130,
              ),
              SizedBox(
                width: 15,
              ),
              Image.asset(
                'lib/assets/imgs/bradesco.png',
                width: 130,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Image.asset(
              'lib/assets/imgs/suhai.png',
              width: 130,
            ),
          )
        ],
      ),
    );
  }
}
