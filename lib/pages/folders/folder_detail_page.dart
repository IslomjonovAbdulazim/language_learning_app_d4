import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_learning_app_d4/models/folder_model.dart';
import 'package:language_learning_app_d4/models/vocab_model.dart';
import 'package:language_learning_app_d4/pages/folders/create_vocab_page.dart';
import 'package:language_learning_app_d4/pages/quiz/folder_history_page.dart';
import 'package:language_learning_app_d4/providers/folder_provider.dart';
import 'package:language_learning_app_d4/providers/vocab_provider.dart';
import 'package:language_learning_app_d4/widgets/button_widget.dart';

class FolderDetailPage extends StatefulWidget {
  final FolderModel folder;

  const FolderDetailPage({super.key, required this.folder});

  @override
  State<FolderDetailPage> createState() => _FolderDetailPageState();
}

class _FolderDetailPageState extends State<FolderDetailPage> {
  List<VocabModel> vocab = [];
  bool isLoading = false;

  @override
  void initState() {
    load();
    super.initState();
  }

  void load() async {
    isLoading = true;
    setState(() {});
    vocab = await VocabProvider.getAll(widget.folder.id);
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
        centerTitle: true,
        title: Text(
          "Folder Detail",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Get.to(FolderHistoryPage());
            },
            child: Icon(
              Icons.history,
              color: Color(0xff3461FD),
              size: 28,
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              Container(
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
                      widget.folder.title,
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
                      widget.folder.description,
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
                          widget.folder.isOwner ? "Share Code" : "Owner",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            widget.folder.isOwner
                                ? widget.folder.shareCode ?? "No Code"
                                : widget.folder.owner.name,
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        widget.folder.isOwner
                            ? Text(
                                widget.folder.shareStatus,
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  color: widget.folder.shareStatus == "Active"
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
                        _Item(value: widget.folder.totalWords, title: "Words"),
                        _Item(
                            value: widget.folder.totalFollowers,
                            title: "Followers"),
                        _Item(
                            value: widget.folder.totalQuizzes,
                            title: "Quizzes"),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              widget.folder.isOwner && isLoading == false
                  ? Row(
                      children: [
                        Expanded(
                          child: ButtonWidget(
                            onTap: () async {
                              isLoading = true;
                              setState(() {});
                              await FolderProvider.refreshShareCode(
                                  widget.folder.id);
                              load();
                            },
                            text: "Refresh",
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: ButtonWidget(
                            onTap: () async {
                              await Get.to(
                                  CreateVocabPage(folderId: widget.folder.id));
                              load();
                            },
                            text: "New Word",
                          ),
                        ),
                      ],
                    )
                  : SizedBox(),
              SizedBox(height: 10),
              ButtonWidget(
                onTap: () {},
                text: "Test",
              ),
              SizedBox(height: 5),
              Divider(),
              SizedBox(height: 10),
              isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                      color: Color(0xff3461FD),
                    ))
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: vocab.length,
                      itemBuilder: (context, index) {
                        final model = vocab[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Slidable(
                            endActionPane: widget.folder.isOwner == false
                                ? null
                                : ActionPane(
                                    motion: ScrollMotion(),
                                    extentRatio: 0.4,
                                    children: [
                                      SizedBox(width: 5),
                                      Expanded(
                                        child: CupertinoButton(
                                          color: Colors.red,
                                          onPressed: () async {
                                            isLoading = true;
                                            setState(() {});
                                            await VocabProvider.delete(
                                              widget.folder.id,
                                              model,
                                            );
                                            load();
                                          },
                                          child: Icon(
                                            CupertinoIcons.delete,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: CupertinoButton(
                                          color: Colors.yellow,
                                          onPressed: () async {
                                            await Get.to(CreateVocabPage(
                                              folderId: widget.folder.id,
                                              vocab: model,
                                            ));
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
                            child: Card(
                              child: ListTile(
                                tileColor: Color(0xffF5F9FE),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                title: Text(
                                  model.word,
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    height: 1,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                subtitle: Text(
                                  model.translation,
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    height: 1,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
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
