import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabSelected;
  final VoidCallback onAddPressed;

  BottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
    required this.onAddPressed,
  });

  @override
  Widget build(BuildContext context) {
    final navItems = [
      {'icon': LucideIcons.home, 'label': 'Home'},
      {'icon': LucideIcons.briefcase, 'label': 'Jobs'},

      {'icon': LucideIcons.messageSquare, 'label': 'Chat'},
      {'icon': LucideIcons.user, 'label': 'Profile'},
    ];

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 65,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(color: Color(0xFFD1FAE5), width: 1.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, -2),
                blurRadius: 4,
              ),
            ],
          ),
          child: SafeArea(
            top: false,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(4, (index) {
                  if (index == 2) return SizedBox(width: 55);

                  final realIndex = index > 1 ? index - 1 : index;
                  final item = navItems[realIndex];
                  final isActive = currentIndex == realIndex;

                  return GestureDetector(
                    onTap: () => onTabSelected(realIndex),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      decoration: BoxDecoration(
                        color: isActive
                            ? Color(0xFFF0FDF4)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            item['icon'] as IconData,
                            color: isActive
                                ? Colors.green[700]
                                : Colors.grey[600],
                            size: 24,
                          ),
                          SizedBox(height: 3),
                          Text(
                            item['label'] as String,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: isActive
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                              color: isActive
                                  ? Colors.blue[300]
                                  : Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),

        Positioned(
          bottom: 25,
          child: GestureDetector(
            onTap: onAddPressed,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.green[600],
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(Icons.add, color: Colors.white, size: 32),
            ),
          ),
        ),
      ],
    );
  }
}
