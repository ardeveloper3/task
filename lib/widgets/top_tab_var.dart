import 'package:flutter/material.dart';

class TopTabBar extends StatelessWidget {
  final List<String> tabs;
  final ValueNotifier<int> selectedIndex;

  const TopTabBar({super.key, required this.tabs, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedIndex,
      builder: (_, value, __) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: List.generate(tabs.length, (index) {
                final isActive = index == value;
                return GestureDetector(
                  onTap: () => selectedIndex.value = index,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Column(
                      children: [
                        Text(
                          tabs[index],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: isActive ? Colors.white : Colors.white70,
                          ),
                        ),
                        if (isActive)
                          Container(
                            margin: const EdgeInsets.only(top: 6),
                            height: 3,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          )
                      ],
                    ),
                  ),
                );
              },

              ),
            ),
            Icon(Icons.search,color: Colors.white,),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Image.asset("assets/images/win.png"),
            ),

          ],
        );
      },
    );
  }
}
