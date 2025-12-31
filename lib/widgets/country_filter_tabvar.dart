import 'package:flutter/material.dart';
import 'package:task/home/home_controller.dart';

class CountryFilterTab extends StatelessWidget {
  final HomeController controller;

  const CountryFilterTab({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: controller.showMore,
      builder: (_, showMore, __) {
        final countries = showMore
            ? controller.allCountries
            : controller.mainCountries;

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
          child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
            child: Row(
              key: ValueKey(showMore),
              children: [
                ...countries.map(
                      (country) => _CountryChip(
                    label: country,
                    isActive:
                    controller.selectedCountry.value == country,
                    onTap: () {
                      controller.selectedCountry.value = country;
                    },
                  ),
                ),

                /// MORE TAB
                if (!showMore)
                  _CountryChip(
                    label: 'More',
                    isActive: false,
                    onTap: () {
                      controller.showMore.value = true;
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _CountryChip extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _CountryChip({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? Colors.orange : Colors.blue.shade100,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
