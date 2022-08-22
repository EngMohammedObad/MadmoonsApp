import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';

import '../../paths.dart';

class InteractiveImage extends StatefulWidget {
  InteractiveImage(this.image) ;

  final String image;

  @override
  _InteractiveImageState createState() => new _InteractiveImageState();
}

class _InteractiveImageState extends State<InteractiveImage> {

  void _handleDoubleTapDown(TapDownDetails details) {
    _doubleTapDetails = details;
  }
  final _transformationController = TransformationController();
  TapDownDetails? _doubleTapDetails;
  void _handleDoubleTap() {
    if (_transformationController.value != Matrix4.identity()) {
      _transformationController.value = Matrix4.identity();
    } else {
      final position = _doubleTapDetails?.localPosition;
      // For a 3x zoom
      _transformationController.value = Matrix4.identity()
        ..translate(-position!.dx * 2, -position.dy * 2)
        ..scale(3.0);
      // Fox a 2x zoom
      // ..translate(-position.dx, -position.dy)
      // ..scale(2.0);
    }
  }
  @override
  Widget build(BuildContext context) {
    setState(() => print("STATE SET\n"));
     return GestureDetector(
       onDoubleTapDown: _handleDoubleTapDown,
       onDoubleTap: _handleDoubleTap,
       child: Center(
         child: InteractiveViewer(
           transformationController: _transformationController,
           child:   Image.network(widget.image),
           /* ... */
         ),
       ),
     );

  }
  //Image.network(widget.image),
}