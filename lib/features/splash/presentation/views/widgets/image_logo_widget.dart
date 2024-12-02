import 'package:flutter/material.dart';

import '../../../../../core/utilities/app_images.dart';

class ImageLogoWidget extends StatelessWidget {
  const ImageLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
        AppImages.logoSplash,
        width: 120,
        height: 80,
    );
  }
}
