import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_learning_app_d4/models/folder_model.dart';
import 'package:language_learning_app_d4/pages/folders/create_folder_page.dart';
import 'package:language_learning_app_d4/pages/home/profile_page.dart';
import 'package:language_learning_app_d4/providers/folder_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  List<FolderModel> folders = [];

  @override
  void initState() {
    load();
    super.initState();
  }

  void load() async {
    isLoading = true;
    setState(() {});
    folders = await FolderProvider.getAllFolders();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: CupertinoButton(
          onPressed: () {},
          child: Icon(
            Icons.code,
            size: 28,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Text(
          "VocabBuilder",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          CupertinoButton(
            onPressed: () {
              Get.to(ProfilePage());
            },
            child: Icon(
              CupertinoIcons.person,
              size: 28,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [
            Row(
              children: [
                Expanded(
                  child: CupertinoButton(
                    color: Colors.yellow,
                    onPressed: () async {
                      await Get.to(CreateFolderPage());
                      load();
                    },
                    child: Text("Create"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: folders.length,
              itemBuilder: (context, index) {
                final model = folders[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: ListTile(
                    title: Text(model.title),
                    subtitle: Text(model.description),
                    leading: CupertinoButton(
                      color: Colors.red,
                      onPressed: () async {
                        isLoading = true;
                        setState(() {});
                        await FolderProvider.deleteFolder(model);
                        load();
                      },
                      child: Icon(CupertinoIcons.delete),
                    ),
                    trailing: CupertinoButton(
                      onPressed: () async {
                        await Get.to(CreateFolderPage(folder: model));
                        load();
                      },
                      child: Icon(Icons.edit),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
