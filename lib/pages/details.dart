import 'package:biobuluyo_app/widgets/details_card.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 280),
        child: DetailsCard(),
      ),
    ));
  }
}
