import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_learning_app_d4/models/folder_model.dart';
import 'package:language_learning_app_d4/pages/folders/copy_folder_page.dart';
import 'package:language_learning_app_d4/pages/folders/create_folder_page.dart';
import 'package:language_learning_app_d4/pages/folders/folder_detail_page.dart';
import 'package:language_learning_app_d4/pages/home/profile_page.dart';
import 'package:language_learning_app_d4/providers/folder_provider.dart';
import 'package:language_learning_app_d4/widgets/button_widget.dart';

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
          onPressed: () {
            if (isLoading == false) {
              load();
            }
          },
          child: Icon(
            Icons.refresh,
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
                  child: ButtonWidget(
                    onTap: () async {
                      await Get.to(CreateFolderPage());
                      load();
                    },
                    text: "Create",
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ButtonWidget(
                    text: "Copy",
                    onTap: () async {
                      await Get.to(CopyFolderPage());
                      load();
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: Color(0xff3461FD),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: folders.length,
                    itemBuilder: (context, index) {
                      final model = folders[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Slidable(
                          endActionPane: ActionPane(
                            motion: ScrollMotion(),
                            extentRatio: model.isOwner ? 0.4 : 0.2,
                            children: [
                              SizedBox(width: 10),
                              Expanded(
                                child: CupertinoButton(
                                  color: Colors.red,
                                  onPressed: () async {
                                    isLoading = true;
                                    setState(() {});
                                    await FolderProvider.deleteFolder(model);
                                    load();
                                  },
                                  child: Icon(
                                    CupertinoIcons.delete,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                              model.isOwner == false
                                  ? SizedBox()
                                  : Expanded(
                                      child: CupertinoButton(
                                        color: Colors.yellow,
                                        onPressed: () async {
                                          await Get.to(
                                              CreateFolderPage(folder: model));
                                          load();
                                        },
                                        child: Icon(
                                          Icons.edit,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                          child: CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () async {
                              await Get.to(FolderDetailPage(folder: model));
                              load();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 20,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xffF5F9FE),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    model.title,
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      height: 1,
                                      color: Colors.black,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    model.description,
                                    style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Divider(thickness: 0.2),
                                  Row(
                                    children: [
                                      Text(
                                        model.isOwner ? "Share Code" : "Owner",
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Expanded(
                                        child: Text(
                                          model.isOwner
                                              ? model.shareCode ?? "No Code"
                                              : model.owner.name,
                                          style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      model.isOwner
                                          ? Text(
                                              model.shareStatus,
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500,
                                                color: model.shareStatus ==
                                                        "Active"
                                                    ? Colors.green.shade700
                                                    : Colors.red.shade700,
                                              ),
                                            )
                                          : SizedBox.shrink(),
                                    ],
                                  ),
                                  Divider(thickness: 0.2),
                                  Row(
                                    children: [
                                      _Item(
                                          value: model.totalWords,
                                          title: "Words"),
                                      _Item(
                                          value: model.totalFollowers,
                                          title: "Followers"),
                                      _Item(
                                          value: model.totalQuizzes,
                                          title: "Quizzes"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
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

class _Item extends StatelessWidget {
  final int value;
  final String title;

  const _Item({required this.value, required this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(height: 8),
          Text(
            "$value",
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              height: 1,
            ),
          ),
          SizedBox(height: 4),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: Colors.grey.shade600,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}
