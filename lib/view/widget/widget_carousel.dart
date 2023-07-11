import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class WidgetCarousel extends StatefulWidget {
  const WidgetCarousel({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  State<WidgetCarousel> createState() => _WidgetCarouselState();
}

class _WidgetCarouselState extends State<WidgetCarousel> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: <Widget>[
        CarouselSlider(
          items: widget.children,
          options: CarouselOptions(
            viewportFraction: 1.0,
            height: double.infinity,
            autoPlay: true,
            enableInfiniteScroll: true,
            onPageChanged: (index, _) {
              setState(() {
                _index = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: List<Widget>.generate(
                  widget.children.length,
                  (index) {
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 2.0,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index == _index
                            ? theme.colorScheme.primary
                            : theme.colorScheme.background,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
