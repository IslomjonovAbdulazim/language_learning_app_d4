import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_learning_app_d4/models/vocab_model.dart';
import 'package:language_learning_app_d4/providers/vocab_provider.dart';
import 'package:language_learning_app_d4/widgets/button_widget.dart';
import 'package:language_learning_app_d4/widgets/textfield_widget.dart';

class CreateVocabPage extends StatefulWidget {
  final int folderId;
  final VocabModel? vocab;

  const CreateVocabPage({
    super.key,
    this.vocab,
    required this.folderId,
  });

  @override
  State<CreateVocabPage> createState() => _CreateVocabPageState();
}

class _CreateVocabPageState extends State<CreateVocabPage> {
  final wordController = TextEditingController();
  final translationController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    wordController.text = widget.vocab?.word ?? "";
    translationController.text = widget.vocab?.translation ?? "";
    super.initState();
  }

  @override
  void dispose() {
    wordController.dispose();
    translationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "${widget.vocab == null ? 'Create' : 'Update'} Vocab",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFieldWidget(
                hint: "Word",
                focus: FocusNode(),
                controller: wordController,
              ),
              SizedBox(height: 10),
              TextFieldWidget(
                hint: "Translation",
                focus: FocusNode(),
                controller: translationController,
              ),
              SizedBox(height: 20),
              isLoading
                  ? CircularProgressIndicator(color: Color(0xff3461FD))
                  : ButtonWidget(
                      onTap: () async {
                        final word = wordController.text.trim();
                        final translation = translationController.text.trim();
                        final model = VocabModel(
                          id: widget.vocab?.id ?? -1,
                          word: word,
                          translation: translation,
                          createdAt: DateTime.now(),
                        );
                        if (word.isEmpty || translation.isEmpty) {
                          Get.closeAllSnackbars();
                          Get.snackbar(
                            "Cannot be Empty",
                            "Word and Translation cannot be empty",
                            colorText: Colors.red.shade700,
                          );
                          return;
                        }
                        isLoading = true;
                        setState(() {});
                        if (widget.vocab == null) {
                          final res = await VocabProvider.create(
                              widget.folderId, model);
                          if (res) {
                            Navigator.pop(context);
                          }
                        } else {
                          final res = await VocabProvider.update(
                              widget.folderId, model);
                          if (res) {
                            Navigator.pop(context);
                          }
                        }
                        isLoading = false;
                        setState(() {});
                      },
                      text: "Save",
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
