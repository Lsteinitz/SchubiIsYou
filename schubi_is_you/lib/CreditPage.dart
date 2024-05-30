import 'package:flutter/widgets.dart';

class CreditPage extends StatelessWidget {
  const CreditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/credits.jpeg"),
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.topCenter
                )
            ),
        )

    );

  }
}
