import 'package:flutter/material.dart';


class SearchField extends StatelessWidget {


  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(

      height:45,

      width: 500,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: _searchController,
        readOnly: true,
          onTap: (){},
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              horizontal: (10),
              vertical: (20)),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,

          hintText: "Search orders",hintStyle: TextStyle(fontSize: 12),
          prefixIcon: Icon(Icons.search,),
          suffixIcon: Icon(Icons.location_on,color: Colors.blue,),
        ),

      ),
    );
  }
}
