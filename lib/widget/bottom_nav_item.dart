import 'index.dart';

class BottomNavItem extends StatefulWidget {
  final int selectedIndex;
  final double iconSize;
  final Color backgroundColor;
  final bool showElevation;
  final Duration animationDuration;
  final List<BottomNavBarItem> navBarItems;
  final ValueChanged<int> onItemSelected;

  BottomNavItem(
      {Key key,
      this.selectedIndex = 0,
      this.iconSize = 24,
      this.backgroundColor,
      this.showElevation = true,
      this.animationDuration = const Duration(milliseconds: 270),
      @required this.navBarItems,
      @required this.onItemSelected}) {
    assert(navBarItems != null);
    assert(navBarItems.length >= 2 && navBarItems.length <= 5);
    assert(onItemSelected != null);
  }

  @override
  _BottomNavItemState createState() => _BottomNavItemState();
}

class _BottomNavItemState extends State<BottomNavItem> {
  @override
  Widget build(BuildContext context) {
    final bgColor = (widget.backgroundColor == null)
        ? Theme.of(context).bottomAppBarColor
        : widget.backgroundColor;

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        boxShadow: [
          if (widget.showElevation)
            BoxShadow(color: Colors.black12, blurRadius: 2)
        ]
      ),
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: 56,
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: widget.navBarItems.map((item) {
              var index = widget.navBarItems.indexOf(item);
              return GestureDetector(
                onTap: () {
                  widget.onItemSelected(index);
                },
                child: _buildItem(item, widget.selectedIndex == index),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildItem(BottomNavBarItem item, bool isSelected) {
    return AnimatedContainer(
      width: isSelected ? 130 : 50,
      height: double.maxFinite,
      duration: widget.animationDuration,
      padding: EdgeInsets.only(left: 12.0),
      decoration: BoxDecoration(
          color: isSelected
              ? item.inactiveColor.withOpacity(0.2)
              : widget.backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(50.0))),
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: IconTheme(
                    data: IconThemeData(
                        size: widget.iconSize,
                        color: isSelected
                            ? item.activeColor.withOpacity(1.0)
                            : item.inactiveColor == null
                                ? item.activeColor
                                : item.inactiveColor),
                    child: item.icon),
              ),
              isSelected
                  ? DefaultTextStyle.merge(
                      style: TextStyle(
                          color: item.activeColor, fontWeight: FontWeight.bold),
                      child: item.title)
                  : SizedBox.shrink(),
            ],
          )
        ],
      ),
    );
  }
}
