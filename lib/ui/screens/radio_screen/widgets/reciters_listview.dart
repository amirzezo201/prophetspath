import 'package:flutter/material.dart';
import 'package:prophetspath/models/reciter.dart';
import 'package:prophetspath/models/surah_list.dart';
import 'package:prophetspath/providers/radio_provider.dart';
import 'package:prophetspath/ui/common/loding_listview.dart';
import 'package:prophetspath/ui/screens/radio_screen/widgets/reciter_item_widget.dart';
import 'package:prophetspath/utils/app_style.dart';
import 'package:provider/provider.dart';

class RecitersListView extends StatefulWidget {
  const RecitersListView({Key? key}) : super(key: key);

  @override
  State<RecitersListView> createState() => _RecitersListViewState();
}

class _RecitersListViewState extends State<RecitersListView> {
  int selectedSurah = 1;
  @override
  Widget build(BuildContext context) {
    List<Reciter> recitersList = context
        .watch<RadioProvider>()
        .reciters
        .where((element) => element.surahs.contains(selectedSurah))
        .toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 5, bottom: 20),
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
          decoration: BoxDecoration(
              color: AppStyle.whiteColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: AppStyle.shadow),
          child: DropdownButton<int>(
            // design
            borderRadius: BorderRadius.circular(10),
            dropdownColor: AppStyle.whiteColor,
            underline: Container(),
            menuMaxHeight: 300,
            //
            items: surahsData
                .map(
                  (e) => DropdownMenuItem<int>(
                    value: e.number,
                    alignment: Alignment.centerRight,
                    child: Text(
                      e.name,
                      style: const TextStyle(fontFamily: 'UthmanTN'),
                    ),
                  ),
                )
                .toList(),

            value: selectedSurah,
            onChanged: (int? value) {
              setState(() {
                selectedSurah = value!;
              });
            },
          ),
        ),
        recitersList.isNotEmpty
            ? ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => ReciterItemWidget(
                    reciter: recitersList[index], selectedSurah: selectedSurah),
                itemCount: recitersList.length,
                shrinkWrap: true,
              )
            : const LodingListView()
      ],
    );
  }
}
