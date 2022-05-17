import 'package:flutter/material.dart';


class DarkBox extends StatelessWidget {
  const DarkBox({ Key? key , }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
        margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        decoration: BoxDecoration(
          boxShadow:const [
            BoxShadow(
              color: Colors.white,
              spreadRadius: -5,
              blurRadius: 17,
              offset: Offset(0, 3),
            )
          ],
          border: Border.all(width: 0.5, color: Colors.white),
          borderRadius: const BorderRadius.all(
            Radius.circular(18.0),
          ),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff2f2f2f),
              Color.fromARGB(255, 97, 97, 97),
            ],
          ),
        ),
        height: 100,
        width: 360,


      child: Row(
        children: [
          SizedBox(width: 5.0),


          Container(


            height: 40,
            width: 90,
            // margin: EdgeInsets.all(getProportionateScreenWidth(20)),
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.height,
              vertical: MediaQuery.of(context).size.width,

            ),
            decoration: BoxDecoration(
              //  border: Border.all(width: 2),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 10,

                ),
              ],
            ),
            child: Text(

              "FOR SALE",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,),

            ),

          ),
          Container(
            height: 40,
            width: 85,
            margin: EdgeInsets.all(MediaQuery.of(context).size.width,),
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.height,
              vertical: MediaQuery.of(context).size.width,
            ),
            decoration: BoxDecoration(
              //  border: Border.all(width: 2),
              color: Color(0xFF4668D9),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 10,

                ),
              ],
            ),
            child: Text.rich(
              TextSpan(
                style: TextStyle(color: Colors.white),
                children: [
                  TextSpan(text: "Filter"),

                ],
              ),
            ),
          ),
          Container(
            height: 40,
            width: 100,
            //  margin: EdgeInsets.all(getProportionateScreenWidth(20)),
            padding: EdgeInsets.symmetric(
              horizontal:MediaQuery.of(context).size.height,
              vertical: MediaQuery.of(context).size.width,
            ),
            decoration: BoxDecoration(
              //   border: Border.all(width: 2),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 10,

                ),
              ],
            ),
            child: Text(
              "FOR RENT",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,),
            ),
          ),
        ],
      ),

         );


  }
}