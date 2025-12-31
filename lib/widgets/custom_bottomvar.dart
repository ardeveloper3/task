import 'package:flutter/material.dart';

class CustomBotomNavigation extends StatelessWidget {
  final int selectedItem;
  final Function(int) onTappedItem;
  const CustomBotomNavigation({
    super.key,
    required this.selectedItem,
    required this.onTappedItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        color: Colors.white,
        child: SizedBox(
          height: 15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _BuildNabVar(Icons.home, 0),
              _BuildNabVar(Icons.celebration,  1),
              _BuildNabVar(Icons.shopping_basket_sharp,  2),
              _BuildNabVar(Icons.wechat_outlined,  3),
              _BuildNabVar(Icons.account_circle_rounded,  4),

            ],
          ),
        ),
      ),
    );
  }

  Widget _BuildNabVar(IconData icon, int index) {
    final isSelected = selectedItem == index;
    final color = isSelected ? Colors.blue : Colors.grey;
    return InkWell(
      onTap: () => onTappedItem(index),
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 2),
        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            Icon(icon, color: color, size: 30),
            SizedBox(height: 4),

          ],
        ),
      ),
    );
  }
}
