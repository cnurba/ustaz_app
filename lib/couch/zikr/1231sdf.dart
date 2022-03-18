// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../../../infrastructure/search/astra_swipe_provider.dart';

// class SwipeableCard extends StatefulWidget {
//   const SwipeableCard(
//       {Key? key,
//       required this.child,
//       this.isFront = false,
//       this.isLast = false})
//       : super(key: key);
//   final bool isFront;
//   final bool isLast;
//   final Widget child;

//   @override
//   State<SwipeableCard> createState() => _SwipeableCardState();
// }

// class _SwipeableCardState extends State<SwipeableCard> {
//   @override
//   void initState() {
//     super.initState();

//     WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
//       final size = MediaQuery.of(context).size;
//       final provider = Provider.of<AstraSwipeProvider>(context, listen: false);
//       provider.setScreenSize(size);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return (widget.isFront) ? buildFronCard() : widget.child;
//   }

//   Widget buildFronCard() => GestureDetector(
//         excludeFromSemantics: true,
//         onPanStart: (details) {
//           final provider =
//               Provider.of<AstraSwipeProvider>(context, listen: false);
//           provider.startPosition(details);
//         },
//         onPanUpdate: (details) {
//           final provider =
//               Provider.of<AstraSwipeProvider>(context, listen: false);
//           provider.updatePosition(details);
//         },
//         onPanEnd: (details) {
//           final provider =
//               Provider.of<AstraSwipeProvider>(context, listen: false);
//           provider.endPosition();
//         },
//         child: LayoutBuilder(builder: (context, constrants) {
//           final provider = Provider.of<AstraSwipeProvider>(context);
//           final position = provider.position;
//           final milliseconds = (provider.isDragging) ? 0 : 400;
//           final angle = provider.angle * pi / 180;

//           final center = constrants.smallest.center(Offset.zero);

//           final rotatedMatrix = Matrix4.identity()
//             ..translate(center.dx, center.dy)
//             ..rotateZ(angle)
//             ..translate(-center.dx, -center.dy);

//           return AnimatedContainer(
//             curve: Curves.easeInOut,
//             duration: Duration(milliseconds: milliseconds),
//             transform: rotatedMatrix..translate(position.dx, position.dy),
//             child: widget.child,
//           );
//         }),
//       );
// }



// class AstraSwipeProvider extends ChangeNotifier {
//   AstraSwipeProvider();

//   final List<dynamic> _content = [];

//   bool _isDragging = false;
//   Offset _position = Offset.zero;
//   Size _screenSize = Size.zero;
//   double _angle = 0;
//   dynamic _currentContent;

//   List<dynamic> get content => _content;
//   bool get isDragging => _isDragging;
//   Offset get position => _position;
//   double get angle => _angle;

//   dynamic get currentContent => _currentContent;

//   void initialize({required List<dynamic> content}) async {
//     _content.addAll(content);
    
    
//     if (_content.isNotEmpty) {
//       _currentContent = _content.last;  
//       _content.removeLast(); 
//      }

//      await Future.delayed(const Duration(milliseconds: 1));

//     notifyListeners();
//   }

//   void setScreenSize(Size screenSize) {
//     _screenSize = screenSize;
//   }

//   void startPosition(DragStartDetails details) {
//     _isDragging = true;

//     notifyListeners();
//   }

//   void updatePosition(DragUpdateDetails details) {
//     _position += details.delta;
//     final x = _position.dx;
//     _angle = 45 * x / _screenSize.width;
//     notifyListeners();
//   }

//   void endPosition() {
//     _isDragging = false;

//     final solution = getSolution();

//     switch (solution) {
//       case Solution.like:
//         like();
//         break;
//       case Solution.dislike:
//         dislike();
//         break;
//       case Solution.reject:
//         reject();
//         break;
//       case Solution.block:
//         block();
//         break;
//       default:
//         resetPosition();
//     }
//   }

//   dislike() {
//     _angle = -20;
//     _position -= Offset(2 * _screenSize.width, 0);
//     _nextCard();
//     notifyListeners();
//   }

//   reject() {
//     _angle = 0;
//     _position -= Offset(0, _screenSize.height);
//     _nextCard();
//     notifyListeners();
//   }

//   block() {
//     _angle = 0;
//     _position += Offset(0, _screenSize.height);
//     _nextCard();
//     notifyListeners();
//   }

//   like() {
//     _angle = 20;
//     _position += Offset(2 * _screenSize.width / 2, 0);
//     //_nextCard();
//     nextCard();
//     notifyListeners();
//   }

//   Future _nextCard() async {
//     if (_content.isEmpty) return;
//     await Future.delayed(const Duration(milliseconds: 200));
//     content.removeLast();
//     resetPosition();
//   }

//   Future<void> nextCard() async {
//     if (content.isEmpty) return;
    
//     _currentContent = content.last;
//     notifyListeners();
//     await Future.delayed(const Duration(milliseconds: 200));
//     content.removeLast();
//     resetPosition();
//   }

//   Solution? getSolution() {
//     final x = _position.dx;
//     final y = _position.dy;
//     final forceSuperLike = x.abs() < 20;
//     final forceBlock = x.abs() > 20;
//     final delta = 100;

//     if (x >= delta) {
//       return Solution.like;
//     } else if (x <= -delta) {
//       return Solution.dislike;
//     } else if (y <= -delta / 2 && forceSuperLike) {
//       return Solution.reject;
//     } else if (y >= delta / 2 && forceBlock) {
//       return Solution.block;
//     }
//   }

//   void resetPosition() {
//     _position = Offset.zero;
//     _isDragging = false;
//     _angle = 0;
//     notifyListeners();
//   }
// }

// enum Solution {
//   like,
//   dislike,
//   reject,
//   block,
// }

