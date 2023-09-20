import 'package:flutter/material.dart';
import 'package:prophetspath/utils/app_style.dart';

class CustomToggleWidget extends StatefulWidget {
  final bool isRadio;
  final VoidCallback onPressed;
  const CustomToggleWidget(
      {Key? key, required this.isRadio, required this.onPressed})
      : super(key: key);

  @override
  State<CustomToggleWidget> createState() => _CustomWidgeToggletState();
}

class _CustomWidgeToggletState extends State<CustomToggleWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 230,
      height: 40,
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: widget.onPressed,
                  style: ButtonStyle(
                    overlayColor:
                        MaterialStateProperty.all<Color>(AppStyle.primaryColor),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                        const RoundedRectangleBorder(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(20),
                      ),
                    )),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppStyle.whiteColor),
                    fixedSize:
                        MaterialStateProperty.all<Size>(const Size(100, 40)),
                  ),
                  child: const Text('Broadcasting',
                      style: TextStyle(color: Colors.black)),
                ),
              ),
              ElevatedButton(
                onPressed: widget.onPressed,
                style: ButtonStyle(
                  overlayColor:
                      MaterialStateProperty.all<Color>(AppStyle.primaryColor),
                  splashFactory: InkRipple.splashFactory,
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                      const RoundedRectangleBorder(
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(20),
                    ),
                  )),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppStyle.whiteColor),
                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(100, 40)),
                ),
                child: const Text('Reciters',
                    style: TextStyle(color: AppStyle.darkblue)),
              ),
            ],
          ),
          SizedBox(
            width: 230,
            height: 40,
            child: AnimatedAlign(
              widthFactor: 230,
              alignment:
                  widget.isRadio ? Alignment.centerLeft : Alignment.centerRight,
              duration: const Duration(milliseconds: 200),
              child: Container(
                width: 115,
                height: 40,
                decoration: BoxDecoration(
                    color: AppStyle.primaryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    widget.isRadio ? 'Broadcasting' : 'Reciters',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
