import 'package:admin_for_e_commerce/screens/HomeScreen/AddProductPage/AddProducts.dart';
import 'package:admin_for_e_commerce/screens/HomeScreen/homeScreen.dart';
import 'package:flutter/material.dart';






class MainScreen extends StatefulWidget {

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  
int _pageIndex = 0;
  PageController _pageController = PageController();

 
@override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

   void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController.animateToPage(index,duration: const Duration(milliseconds: 500),curve: Curves.easeInOut);
  }
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  var _widgetOptions = <Widget>[
    HomeScreen(),
    Add_products(),
    Text(
      'Index 2: Orders',
      style: optionStyle,
    ),
    // Text(
    //   'Index 3: Settings',
    //   style: optionStyle,
    // ),
  ];

 @override
  void initState(){
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin Panel"),),
      body: PageView(
        children: _widgetOptions,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
      // Center(
      //   child:_widgetOptions.elementAt(_selectedIndex),
      // ),
       
      bottomNavigationBar: BottomNavigationBar(
        
        onTap: onTabTapped,
        currentIndex: _pageIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'HomeScreen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.precision_manufacturing),
            label: 'AddProducts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.badge),
            label: 'Orders',
          ),
          //   BottomNavigationBarItem(
          //   icon: Icon(Icons.settings),
          //   label: 'Settings',
          // ),
        ],
        // currentIndex: _selectedIndex,       
      ),
    );
  }
}