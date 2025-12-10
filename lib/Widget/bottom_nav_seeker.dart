import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class JobSeekerBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabSelected;

  JobSeekerBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    final navItems = [
      {'icon': LucideIcons.home, 'label': 'Home'},
      {'icon': LucideIcons.briefcase, 'label': 'Jobs'},
      {'icon': LucideIcons.messageSquare, 'label': 'Chat'},
      {'icon': LucideIcons.user, 'label': 'Profile'},
    ];

    return Container(
      height: 65,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Color.fromARGB(255, 126, 164, 217),
            width: 1.0,
          ),
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
          padding: EdgeInsets.symmetric(vertical: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(navItems.length, (index) {
              final item = navItems[index];
              final isActive = currentIndex == index;

              return GestureDetector(
                onTap: () => onTabSelected(index),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: isActive ? Color(0xFFF0FDF4) : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        item['icon'] as IconData,
                        color: isActive
                            ? const Color.fromARGB(255, 78, 88, 235)
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
                          color: isActive ? Colors.blue[300] : Colors.grey[600],
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
    );
  }
}
