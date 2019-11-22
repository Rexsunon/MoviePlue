import 'index.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _isSelected = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavItem(
      selectedIndex: _isSelected,
      onItemSelected: (index) => setState(() {
        _isSelected = index;
//        _pageController.animateToPage(index,
//            duration: Duration(milliseconds: 300), curve: Curves.ease);
      }),
      navBarItems: <BottomNavBarItem>[
        BottomNavBarItem(
          icon: Icon(Icons.home),
          activeColor: Colors.blue,
          inactiveColor: Colors.black54,
          title: Text('Feed'),
        ),
        BottomNavBarItem(
          icon: Icon(Icons.bookmark),
          activeColor: Colors.blue,
          inactiveColor: Colors.black54,
          title: Text('Save'),
        ),
        BottomNavBarItem(
          icon: Icon(Icons.perm_identity),
          activeColor: Colors.blue,
          inactiveColor: Colors.black54,
          title: Text('Profile'),
        ),
      ],
    );
  }
}
