import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:princess_solution/pengaturan/pengaturan_notifier.dart';
import 'package:provider/provider.dart';

class PengaturanPage extends StatelessWidget {
  const PengaturanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PengaturanNotifier(context),
      child: Consumer<PengaturanNotifier>(
        builder: (context, value, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Pengaturan',
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
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
              child: ListView(
                children: [
                  Text(
                    'Izin Akses',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  ListTile(
                    title: Text(
                      'Kamera',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    trailing: Switch(
                      value: value.cameraPermission,
                      activeColor: Color.fromRGBO(76, 105, 176, 1.0),
                      onChanged: (bool newValue) async {
                        await value.toggleCameraPermission(newValue);
                      },
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Folder',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    trailing: Switch(
                      value: value.folderPermission,
                      onChanged: (bool newValue) async {
                        await value.toggleFolderPermission(newValue);
                      },
                    ),
                  ),
                  FilledButton(
                    onPressed: () {
                      value.openDeviceSettings();
                    },
                    child: Text(
                      'Buka Pengaturan Perangkat',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    style: FilledButton.styleFrom(
                      backgroundColor: Color.fromRGBO(76, 105, 176, 1.0),
                    ),
                  ),
                  SizedBox(height: 20),
                  Divider(
                    color: Theme.of(context).dividerColor,
                    thickness: 0.2,
                  ),
                  Card(
                    elevation: 0,
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(MdiIcons.star),
                          SizedBox(width: 15),
                          Text('Rate on PlayStrore'),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 0,
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(MdiIcons.information),
                          SizedBox(width: 15),
                          Text('About'),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
