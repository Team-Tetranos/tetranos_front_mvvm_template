import 'package:flutter/cupertino.dart';
import 'package:tetranos_template/res/constants.dart';

import '../dependency_injection/di.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget desktopBody;
  final Widget tabletBody;
  final Widget mobileBody;
  ResponsiveLayout({Key? key, required this.desktopBody, required this.tabletBody, required this.mobileBody}) : super(key: key);

  AppConstants appConstants = sl.get<AppConstants>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      if(constraints.maxWidth<appConstants.mobile_width){
        return mobileBody;
      }else if(constraints.maxWidth>=appConstants.mobile_width&&constraints.maxWidth<appConstants.tablet_width){
        return tabletBody;
      }else{
        return desktopBody;
      }
    });
  }
}
