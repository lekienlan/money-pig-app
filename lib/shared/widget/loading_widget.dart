import 'package:flutter/material.dart';
import 'package:money_pig/shared/theme/colors.gen.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(ColorName.primaryMain),
          strokeWidth: 4.0,
        ),
      ),
    );
  }
}
