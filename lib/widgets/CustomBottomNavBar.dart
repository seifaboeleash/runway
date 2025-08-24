import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;
  int _bagCount = 5;

  final List<IconData> _icons = [
    Icons.home,
    Icons.favorite_border,
    Icons.shopping_bag_outlined,
    Icons.person_outline,
  ];

  final List<String> _labels = [
    'Home',
    'Likes',
    'Bag',
    'Profile',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      showUnselectedLabels: true,
      items: List.generate(_icons.length, (index) {
        if (index == 2) {
          // Bag with badge
          return BottomNavigationBarItem(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(_icons[index]),
                if (_bagCount > 0)
                  Positioned(
                    right: -6,
                    top: -2,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 18,
                        minHeight: 18,
                      ),
                      child: Text(
                        '$_bagCount',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
            label: _labels[index],
          );
        } else {
          return BottomNavigationBarItem(
            icon: Icon(_icons[index]),
            label: _labels[index],
          );
        }
      }),
    );
  }
}
