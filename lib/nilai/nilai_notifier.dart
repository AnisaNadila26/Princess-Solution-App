import 'package:flutter/material.dart';
import 'package:princess_solution/models/data.dart';
import 'package:princess_solution/models/instruktur.dart';
import 'package:princess_solution/nilai/nilai_item.dart';
import 'package:princess_solution/repository/siswa_repository.dart';
import 'package:princess_solution/network/network.dart';
import 'package:princess_solution/data/preference_ins.dart';

class NilaiNotifier extends ChangeNotifier {
  final BuildContext context;

  NilaiNotifier(this.context) {
    getInstruktur();
    setCurrentTab(0);
  }

  int currentTabIndex = 0;
  Instruktur? ins;
  bool isLoading = true;

  TextEditingController searchController = TextEditingController();

  setCurrentTab(int index) {
    currentTabIndex = index;
    searchSiswa('');
    notifyListeners();
  }

  List<Data> siswaListManual = [];
  List<Data> siswaListMatic = [];

  getListSiswa(String idInstruktur) async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await SiswaRepository.getSiswa(
          NetworkURL.getListSiswa(), idInstruktur);

      if (response['code'] == 200) {
        final manualList = response['data']['siswa_list_manual'] as List<dynamic>;
        final maticList = response['data']['siswa_list_matic'] as List<dynamic>;

        siswaListManual = manualList.map((data) => Data.fromJson(data)).toList();
        siswaListMatic = maticList.map((data) => Data.fromJson(data)).toList();
      }
    } catch (error) {
      print("Error fetching siswa list: $error");
    }

    isLoading = false;
    notifyListeners();
  }

  getInstruktur() async {
    isLoading = true;
    notifyListeners();

    try {
      final instruktur = await PreferenceInstruktur().getInstruktur();
      if (instruktur != null) {
        ins = instruktur;
        await getListSiswa(ins!.idInstruktur!);
        searchSiswa('');
      }
    } catch (error) {
      print("Error getting instruktur: $error");
    }

    isLoading = false;
    notifyListeners();
  }

  tabButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 45,
        width: 260,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Theme.of(context).cardColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                if (currentTabIndex == 0)
                  Container(
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color.fromRGBO(76, 105, 176, 1.0),
                    ),
                  ),
                TextButton(
                  onPressed: () => setCurrentTab(0),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: currentTabIndex == 0 ? 0 : 20),
                    child: Text(
                      'Manual',
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.bodyLarge,
                      // style: TextStyle(
                      //   color: currentTabIndex == 0 ? Colors.white : Colors.black,
                      // ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 16),
            Stack(
              alignment: Alignment.center,
              children: [
                if (currentTabIndex == 1)
                  Container(
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color.fromRGBO(76, 105, 176, 1.0),
                    ),
                  ),
                TextButton(
                  onPressed: () => setCurrentTab(1),
                  child: Padding(
                    padding:
                        EdgeInsets.only(right: currentTabIndex == 1 ? 0 : 20),
                    child: Text(
                      'Matic',
                      style: Theme.of(context).textTheme.bodyLarge,
                      // style: TextStyle(
                      //   color: currentTabIndex == 1 ? Colors.white : Colors.black,
                      // ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  buildSiswaList(List<Data> siswaList) {
    if (siswaList.isEmpty) {
      return Center(
        child: Text('Belum ada siswa'),
      );
    }

    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return NilaiItem(item: siswaList[index]);
      },
      // separatorBuilder: (BuildContext context, int index) => const Divider(
      //   color: Colors.black,
      //   thickness: 0.2,
      // ),
      itemCount: siswaList.length,
    );
  }

  List<Data> filteredSiswaListManual = [];
  List<Data> filteredSiswaListMatic = [];

  searchSiswa(String query) {
    if (currentTabIndex == 0) {
      filteredSiswaListManual = query.isEmpty
          ? siswaListManual
          : siswaListManual
              .where((siswa) =>
                  siswa.nama!.toLowerCase().contains(query.toLowerCase()))
              .toList();
      filteredSiswaListMatic = [];
    } else if (currentTabIndex == 1) {
      filteredSiswaListMatic = query.isEmpty
          ? siswaListMatic
          : siswaListMatic
              .where((siswa) =>
                  siswa.nama!.toLowerCase().contains(query.toLowerCase()))
              .toList();
       filteredSiswaListManual = [];
    }
    notifyListeners();
  }

}
