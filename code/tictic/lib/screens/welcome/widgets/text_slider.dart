import 'package:flutter/material.dart';

import '../../../constants/fonts.dart';
import '../../../constants/sizes.dart';

class TextSlider extends StatelessWidget {
   TextSlider({
     super.key,
    required this.pageController,
    required this.items,
     required this.currentIdx,
   required this.onPageChanged});

  final PageController pageController;
  final List<String> items;
  int currentIdx;
  void Function(int)? onPageChanged;


  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      //todo:  fix
      height: kTextSliderHeight,
      child: PageView.builder(
          scrollDirection: Axis.horizontal,
          controller: pageController,
          itemCount: items.length,
          onPageChanged: onPageChanged,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
              child: Text(items[index], style: kTagLine,
                textAlign: TextAlign.center,
                ),
            );
          }),
    );
  }
}
