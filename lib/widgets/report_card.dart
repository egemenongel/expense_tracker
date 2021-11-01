import 'package:flutter/material.dart';

class ReportCard extends StatelessWidget {
  const ReportCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.blueGrey),
      height: 200.0,
      width: 250.0,
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white70,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Icon(
              icon,
              color: Colors.teal[100],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title,
                  style: const TextStyle(
                    fontSize: 23.0,
                    color: Colors.tealAccent,
                  )),
              const SizedBox(
                height: 30.0,
              ),
              Text(
                subtitle,
                style: TextStyle(color: Colors.teal[100], fontSize: 20.0),
              ),
              const SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
