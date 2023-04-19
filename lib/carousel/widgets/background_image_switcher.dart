import 'package:flutter/material.dart';
import 'package:panzetapp/carousel/dummy_data.dart';

class BackgroundImageSwitcher extends StatefulWidget {
  const BackgroundImageSwitcher({
    super.key,
    required this.imageUrl,
    required this.controller,
  });

  final String imageUrl;

  final PageController controller;

  @override
  State<BackgroundImageSwitcher> createState() =>
      _BackgroundImageSwitcherState();
}

class _BackgroundImageSwitcherState extends State<BackgroundImageSwitcher> {
  double _page = 0;

  int get _firstItemIndex => _page.toInt();

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(
      () => setState(() {
        _page = widget.controller.page!;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerLeft,
              child: BackgroundPageViewImage(imageUrl: data[_firstItemIndex]),
            ),
          ),
          PageView.builder(
            reverse: true,
            padEnds: false,
            controller: widget.controller,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return Opacity(
                opacity: index <= _firstItemIndex ? 0 : 1,
                child: BackgroundPageViewImage(imageUrl: data[index]),
              );
            },
          ),
          ColoredBox(
            color: Colors.black.withOpacity(0.2),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0, 0.80],
                  colors: [Colors.transparent, Colors.white],
                ),
              ),
            ),
          )
        ],
      ),
    ); // );
  }
}

class BackgroundPageViewImage extends StatelessWidget {
  const BackgroundPageViewImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      key: ValueKey<String>(imageUrl),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: ColoredBox(
        color: Colors.black.withOpacity(0.2),
        child: Container(),
      ),
    );
  }
}
