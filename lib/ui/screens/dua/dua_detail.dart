import 'package:flutter/material.dart';
import 'package:prophetspath/models/duamodel.dart';
import 'package:prophetspath/services/api/dua_data.dart';
import 'package:prophetspath/ui/screens/dua/dua_single.dart';
import 'package:prophetspath/utils/app_style.dart';

class DuaDetailScreen extends StatefulWidget {
  const DuaDetailScreen({super.key, required this.duaname});
  static String routename = "/duadetail";
  final String duaname;
  @override
  State<DuaDetailScreen> createState() => _DuaDetailScreenState();
}

class _DuaDetailScreenState extends State<DuaDetailScreen> {
  late List<DuaModel>? _duasModel = [];
  late final List<DuaModel> _specific = [];
  @override
  Future getData() async {
    _duasModel = (await DuaService().getdua())!;
    for (int i = 0; i < _duasModel!.length; i++) {
      if (_duasModel![i].categories == widget.duaname) {
        _specific.add(_duasModel![i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.offwhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppStyle.offwhite,
        title: Text(
          widget.duaname,
          style: const TextStyle(
              color: AppStyle.darkblue,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppStyle.darkblue,
            )),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return ListView.builder(
            itemCount: _specific.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DuaSingle(
                                singleDua: _specific[index],
                                totalDuas: _specific.length.toString(),
                                currentIndex: index.toString(),
                              )));
                },
                child: Container(
                  height: 80,
                  margin: const EdgeInsets.symmetric(
                      vertical: 8, horizontal: AppStyle.paddin),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: AppStyle.whiteColor,
                    boxShadow: AppStyle.shadow,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 33,
                        height: 40,
                        // design
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppStyle.primaryColor,
                        ),
                        child: Center(
                            child: Text(
                          (index + 1).toString(),
                          style: const TextStyle(
                              color: AppStyle.whiteColor, fontSize: 16),
                        )),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Text(_specific[index].title,
                            maxLines: 2,
                            style: const TextStyle(
                                color: AppStyle.darkblue,
                                fontSize: 17,
                                height: 1.5,
                                fontWeight: FontWeight.w500)),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
