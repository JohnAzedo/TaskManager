import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconColor;

  CustomCard({this.icon, this.title, this.subtitle, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () {
            debugPrint(this.title);
          },
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  size: 40.0,
                  color: iconColor,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(fontSize: 16.0, color: Colors.black45),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
