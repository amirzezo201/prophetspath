import 'package:flutter/material.dart';
import 'package:prophetspath/utils/app_style.dart';

class ExploreItem extends StatelessWidget {
  const ExploreItem(
      {super.key,
      required this.itemName,
      required this.itemIcon,
      required this.ontap});
  final Function ontap;
  final String itemName;
  final String itemIcon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ontap();
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppStyle.whiteColor,
          boxShadow: AppStyle.shadow,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.060,
              width: MediaQuery.of(context).size.width * 0.13,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppStyle.secondaryColor,
              ),
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(itemIcon))),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.01,
          ),
          Expanded(
            child: Text(
              itemName,
              style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
            ),
          )
        ]),
      ),
    );
  }
}
