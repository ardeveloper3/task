import 'package:flutter/material.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({super.key});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  static const int indicatorCount = 3;

  final List<String> bannerUrls = [
    'https://picsum.photos/800/300?1',
    'https://picsum.photos/800/300?2',
    'https://picsum.photos/800/300?3',
    'https://picsum.photos/800/300?4',
    'https://picsum.photos/800/300?5',
    'https://picsum.photos/800/300?6',
    'https://picsum.photos/800/300?7',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 125,
          child: PageView.builder(
            controller: _pageController,
            itemCount: bannerUrls.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index % indicatorCount; // ✅ MAGIC LINE
              });
            },
            itemBuilder: (_, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.network(
                  bannerUrls[index],
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) {
                    return Image.asset(
                      'assets/images/sliderimage.png',
                      fit: BoxFit.cover,
                    );
                  },
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 8),

        /// 🔹 ONLY 3 INDICATORS
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(indicatorCount, (i) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 6,
              width: currentIndex == i ? 18 : 6,
              decoration: BoxDecoration(
                color: currentIndex == i ? Colors.orange : Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            );
          }),
        ),
      ],
    );
  }
}
