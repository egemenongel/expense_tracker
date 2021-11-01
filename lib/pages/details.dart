import 'package:biobuluyo_app/widgets/app_bar.dart';
import 'package:biobuluyo_app/widgets/details_card.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: CustomAppBar(
          title: "Details",
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 240,
            ),
            child: DetailsCard(),
          ),
        ));
  }
}
