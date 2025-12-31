import 'package:flutter/material.dart';
import 'package:task/home/home_controller.dart';
import 'package:task/widgets/banner_slider.dart';
import 'package:task/widgets/country_filter_tabvar.dart';
import 'package:task/widgets/profile_card.dart';
import 'package:task/widgets/top_tab_var.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.blue,
              Colors.white
            ])
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopTabBar(
                  tabs: controller.mainTabs,
                  selectedIndex: controller.selectedMainTab,
                ),
                const SizedBox(height: 12),
                CountryFilterTab(controller: controller),
                const SizedBox(height: 12),
                const BannerSlider(),
                const SizedBox(height: 12),

                /// Profiles Grid
                Expanded(
                  child: ValueListenableBuilder(
                    valueListenable: controller.selectedCountry,
                    builder: (_, __, ___) {
                      return GridView.builder(
                        itemCount: controller.filteredProfiles.length,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.7,
                        ),
                        itemBuilder: (_, index) {
                          return ProfileCard(
                            profile: controller.filteredProfiles[index],
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
