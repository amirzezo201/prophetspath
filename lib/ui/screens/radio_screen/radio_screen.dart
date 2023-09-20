import 'package:flutter/material.dart';
import 'package:prophetspath/models/radio.dart';
import 'package:prophetspath/providers/radio_provider.dart';
import 'package:prophetspath/ui/common/loding_listview.dart';
import 'package:prophetspath/ui/screens/radio_screen/widgets/custom_toggle_widget.dart';
import 'package:prophetspath/ui/screens/radio_screen/widgets/radio_widget.dart';
import 'package:prophetspath/ui/screens/radio_screen/widgets/reciters_listview.dart';
import 'package:prophetspath/utils/app_style.dart';
import 'package:provider/provider.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({Key? key}) : super(key: key);
  static String routeName = "/radio";

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  bool isRadio = true;
  @override
  void initState() {
    super.initState();
    context.read<RadioProvider>().getLists();
  }

  @override
  Widget build(BuildContext context) {
    List<RadioModel> radiosList = context.watch<RadioProvider>().radios;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(AppStyle.paddin),
          children: [
            const Text(
              'Radio',
              style: AppStyle.titleTextStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: CustomToggleWidget(
                isRadio: isRadio,
                onPressed: () {
                  setState(() => isRadio = !isRadio);
                },
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Visibility(
                visible: isRadio,
                replacement: const RecitersListView(),
                child: radiosList.isNotEmpty
                    ? ListView.builder(
                        itemBuilder: (context, index) => RadioWidget(
                          radioModel: radiosList[index],
                          index: index,
                        ),
                        itemCount: radiosList.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                      )
                    : const LodingListView())
          ],
        ),
      ),
    );
  }
}
