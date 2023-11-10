import 'package:flutter/material.dart';
import 'package:princess_solution/models/data.dart';
import 'package:princess_solution/network/network.dart';
import 'package:princess_solution/nilai/nilai_detail_page.dart';

class NilaiItem extends StatelessWidget {
  final Data item;
  const NilaiItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
              context: context,
              backgroundColor: Theme.of(context).cardColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              isScrollControlled: true,
              builder: (BuildContext context) {
                return NilaiDetailPage(isi: item);
              });
        },
        child: item.jenisKendaraan == 'Manual'
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Transform.translate(
                  offset: Offset(-120, 0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: Color.fromRGBO(226, 235, 245, 1.0),
                        width: 3.0,
                      ),
                    ),
                    color: Theme.of(context).cardColor,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 10, 
                        bottom: 10, 
                        left: 130, 
                        right: 10
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.nama!,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  item.paket!,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  item.kodeKendaraan!,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  item.jenisKendaraan!,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: item.fotoProfil!.isNotEmpty
                            ? Image.network(
                              NetworkURL.getProfilSiswa(item.fotoProfil!),
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                              )
                              : Image.asset(
                                'assets/defaultProfile.png',
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                                )
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Transform.translate(
                  offset: Offset(120, 0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: Color.fromRGBO(226, 235, 245, 1.0),
                        width: 3.0,
                      ),
                    ),
                    color: Theme.of(context).cardColor,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 10, right: 130),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              item.fotoProfil!.isNotEmpty
                                  ? NetworkURL.getProfilSiswa(item.fotoProfil!)
                                  : 'assets/defaultProfile.png',
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  item.nama!,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  item.paket!,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  item.kodeKendaraan!,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  item.jenisKendaraan!,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
