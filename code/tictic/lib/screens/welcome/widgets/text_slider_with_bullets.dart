import 'package:flutter/material.dart';

import '../../../constants/sizes.dart';
import 'package:tictic/l10n/app_localizations.dart';
import 'bullets.dart';
import 'text_slider.dart';

class TextSliderWithBullets extends StatefulWidget {
  const TextSliderWithBullets({super.key});


  @override
  State<TextSliderWithBullets> createState() => _TextSliderWithBulletsState();
}

class _TextSliderWithBulletsState extends State<TextSliderWithBullets> {

  final PageController _pageController = PageController(viewportFraction: 1);

  int _currentIdx = 0;
  late final List<String> _items;
  bool _itemsInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Initialize once only
    if (!_itemsInitialized) {
      _items = [
      AppLocalizations
          .of(context)
          ?.harmony ?? '',
      AppLocalizations
          .of(context)
          ?.instant ?? '',
      AppLocalizations
          .of(context)
          ?.annoying ?? '',
      AppLocalizations
          .of(context)
          ?.spendings ?? '',
    ];
      _itemsInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_itemsInitialized) {
      // While waiting for didChangeDependencies to run
      return const SizedBox.shrink(); // or a loader if needed
    }
    return  Column(
      children: [
        TextSlider(pageController: _pageController, items: _items, currentIdx: _currentIdx, onPageChanged: (int index){
          setState(() {
            _currentIdx = index;
          });
        },
        ),
        SizedBox(
          height: kVerticalPadding,
        ),
        Bullets(items: _items,
            pageController: _pageController,
            currentIdx: _currentIdx)
      ],
    );
  }
}
