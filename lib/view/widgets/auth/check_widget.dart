import 'package:asro_shop/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';

class CheckWidget extends StatelessWidget {
  const CheckWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset('assets/images/check.png'),
          ),
        ),
        const SizedBox(width: 10),
        Row(
          children: [
            TextUtils(
              text: 'I accept ',
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
            TextUtils(
              text: 'terms & conditions',
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.normal,
              underlineText: true,
            )
          ],
        ),
      ],
    );
  }
}
