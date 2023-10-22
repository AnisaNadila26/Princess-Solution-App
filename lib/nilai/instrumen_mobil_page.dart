import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:princess_solution/models/data.dart';
import 'package:princess_solution/nilai/instrumen_mobil_notifier.dart';
import 'package:provider/provider.dart';

class InstrumenMobilPage extends StatelessWidget {
  final Data item;
  const InstrumenMobilPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => InstrumenMobilNotifier(context, int.parse(item.id!)),
        child: Consumer<InstrumenMobilNotifier>(builder: (context, value, child) {
          // value.id = int.parse(item.id!);
          // value.getNilaiInstrumen(item.id.toString());
          return WillPopScope(
            onWillPop: () async {
              if (value.isFormDirty()) {
                bool shouldExit = await value.backConfirmDialog(context);
                if (shouldExit) {
                  Navigator.pop(context);
                }
              }
              return true;
            },
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  'Instrumen Mobil',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(12, 15, 39, 1.0),
                        Color.fromRGBO(76, 105, 176, 1.0),
                      ],
                    ),
                  ),
                ),
                centerTitle: true,
                actions: [
                  InkWell(
                    onTap: () {
                      value.saveInstrumen();
                    },
                    child: Icon(
                      MdiIcons.contentSave,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: value.isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Instruktur'),
                                    Text('Nama Siswa'),
                                    Text('Kode Kendaraan'),
                                    Text('Paket'),
                                  ],
                                ),
                                SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(value.ins!.nama!),
                                    Text(item.nama!),
                                    Text(item.kodeKendaraan!),
                                    Text(item.paket!),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(width: 30),
                            Form(
                              key: value.keyForm,
                              child: Column(
                                children: [
                                  SizedBox(height: 30),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Instrumen',
                                        style: Theme.of(context).textTheme.bodyLarge,
                                      ),
                                      Text(
                                        'Check',
                                        style:
                                        Theme.of(context).textTheme.bodyLarge,
                                      ),
                                    ],
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: value.listInstrumen.length,
                                    itemBuilder: (context, index) {
                                      final instrumen = value.listInstrumen[index];
                                      return Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            instrumen.instrumenMobil!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                          Checkbox(
                                            activeColor: Color.fromRGBO(76, 105, 176, 1.0),
                                            value: value.isCheckedMap[instrumen.idInstrumen!] == 1,
                                            onChanged: (nilaiInstrumen) {
                                              value.toggleCheckbox(
                                                instrumen.idInstrumen!,
                                                nilaiInstrumen == true ? 1 : 0
                                              );
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          );
        }));
  }
}
