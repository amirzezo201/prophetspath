import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prophetspath/utils/app_style.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({
    super.key,
    required this.iconData,
    required this.itemName,
    required this.navigatoTo,
  });
  final String iconData;
  final String itemName;
  final String navigatoTo;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, navigatoTo);
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
              height: MediaQuery.of(context).size.height * 0.065,
              width: MediaQuery.of(context).size.height * 0.065,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppStyle.secondaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  iconData,
                  // ignore: deprecated_member_use
                  color: AppStyle.primaryColor,
                ),
              )),
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
