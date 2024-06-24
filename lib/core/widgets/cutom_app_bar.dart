import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ureflect/moduels/widgets/bottomnavigationbar.dart';

import '../utils/styles.dart';

AppBar buildAppBar({final String? title}) {
  return AppBar(
    leading: IconButton(
      onPressed: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => const BottomNavigationbar()));
      },
      icon: SvgPicture.asset(
        'assets/images/arrow.svg',
      ),
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: true,
    title: Text(
      title ?? '',
      textAlign: TextAlign.center,
      style: Styles.style25,
    ),
  );
}

// class buildAppBar extends StatelessWidget {
//   const buildAppBar({super.key, this.title});
//   final String? title;
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       leading: IconButton(
//         onPressed: () {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => const BottomNavigationbar()));
//         },
//         icon: SvgPicture.asset(
//           'assets/images/arrow.svg',
//         ),
//       ),
//       elevation: 0,
//       backgroundColor: Colors.transparent,
//       centerTitle: true,
//       title: Text(
//         title ?? '',
//         textAlign: TextAlign.center,
//         style: Styles.style25,
//       ),
//     );
//   }
// }
