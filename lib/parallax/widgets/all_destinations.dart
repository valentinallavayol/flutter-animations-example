import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:panzetapp/parallax/dummy_data.dart';

import 'package:panzetapp/parallax/widgets/destination_item.dart';

class AllDestinations extends StatefulWidget {
  const AllDestinations({
    super.key,
    required this.padding,
    required this.spacing,
  });
  final double padding;
  final double spacing;

  @override
  State<AllDestinations> createState() => _AllDestinationsState();
}

class _AllDestinationsState extends State<AllDestinations> {
  late final double _imageWidth;
  late final ScrollController _scrollController;
  late final double _indexFactor;

  double _imageOffset = 0;

  @override
  void initState() {
    final deviceWidth =
        window.physicalSize.shortestSide / window.devicePixelRatio;

    _imageWidth = deviceWidth - widget.padding * 2;
    _indexFactor = (widget.spacing + _imageWidth) / deviceWidth;
    _imageOffset = -widget.padding / deviceWidth;

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        _imageOffset =
            (_scrollController.offset - widget.padding) / deviceWidth;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * .6),
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: widget.padding),
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => SizedBox(width: widget.spacing),
        itemCount: MockDestinations.data.length,
        itemBuilder: (_, index) => DestinationItem(
          index: index,
          details: MockDestinations.data[index],
          imageWidth: _imageWidth,
          imageOffset: _imageOffset,
          indexFactor: _indexFactor,
        ),
      ),
    );
  }
}
