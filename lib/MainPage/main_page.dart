import 'package:easycare/TabPages/AddPropertyTabPage.dart';
import 'package:easycare/TabPages/homeTabPage.dart';
import 'package:easycare/TabPages/moreTabPage.dart';
import 'package:easycare/TabPages/profileTabPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin
{

  TabController? tabController;
  int selectedIndex = 0;

  onItemClicked(int index)
  {
    setState(() {
      selectedIndex = index;
      tabController!.index= selectedIndex;
    });
  }

  @override
  void initState() {

    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  int _selectedItem = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(

        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children:const [

          HomeTabPage(),
          AddPropertyTabPage(),
          ProfileTabPage(),
          MoreTabPage(),

        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        iconList: [
          Icons.home,
          Icons.align_vertical_bottom_rounded ,
          Icons.brightness_5_outlined ,
          Icons.person,
        ],

        onChange: (index) {
          setState(() {
            selectedIndex = index;
            tabController!.index= selectedIndex;
          });
        },

      ),



    );
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  final int defaultSelectedIndex;

  final Function(int) onChange;
  final List<IconData> iconList;

  CustomBottomNavigationBar(
      {this.defaultSelectedIndex = 0,
        required this.iconList,
        required this.onChange});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
  List<IconData> _iconList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconList;
  }


  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItemList = [];

    for (var i = 0; i < _iconList.length; i++) {
      _navBarItemList.add(buildNavBarItem(_iconList[i], i));
    }

    return Row(
      children: _navBarItemList,
    );
  }

  Widget buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: (){

        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0,left: 10,bottom: 20),
        child: Container(
          height: 75,
          width: 80,
          decoration: index == _selectedIndex
              ? BoxDecoration(
            color:  Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade500,
                offset: Offset(4,4),
                spreadRadius: 1,
                blurRadius: 2,

              ),
            ],
          )
              : BoxDecoration(
            color:  Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.shade100,
                offset: Offset(5,8),
                spreadRadius: 1,
                blurRadius: 5,

              ),
            ],
          ),
          child: Icon(
            icon,
            color: index == _selectedIndex ? Colors.blue : Colors.grey,
          ),
        ),
      ),
    );
  }
}