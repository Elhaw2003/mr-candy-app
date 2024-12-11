import 'package:flutter/material.dart';

import '../../../../../core/utilities/app_images.dart';

class ImageLogoWidget extends StatelessWidget {
  const ImageLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
        AppImages.logoSplash,
        width:  MediaQuery.of(context).size.width*0.27,
        height: MediaQuery.of(context).size.height*0.1,
    );
  }
}
