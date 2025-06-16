import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../models/profile_models.dart';
import '../../providers/profile_provider.dart';
import '../../utils/api_constants.dart';
import '../profile/profile_bio_page.dart';
import '../profile/profile_name_page.dart';
import '../profile/profile_username_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileModel? profile;
  bool isLoading = false;

  @override
  void initState() {
    load();
    super.initState();
  }

  void load() async {
    isLoading = true;
    setState(() {});
    profile = await ProfileProvider.getProfile();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          CupertinoButton(
            onPressed: () {
              load();
            },
            child: Icon(
              CupertinoIcons.refresh,
              color: Color(0xff3461FD),
              size: 28,
            ),
          ),
        ],
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(color: Color(0xff3461FD)),
            )
          : profile == null
              ? Center(
                  child: Text(
                    "Error",
                    style: GoogleFonts.poppins(
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                    ),
                  ),
                )
              : ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () async {
                        final file = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        if (file != null) {
                          isLoading = true;
                          setState(() {});
                          final res =
                              await ProfileProvider.uploadAvatar(file.path);
                          if (res) {
                            load();
                          } else {
                            isLoading = false;
                            setState(() {});
                          }
                        }
                      },
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          shape: BoxShape.circle,
                        ),
                        child: profile!.avatarUrl == null
                            ? Icon(CupertinoIcons.camera, size: 32)
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: CachedNetworkImage(
                                  imageUrl: ApiConstants.baseUrl +
                                      profile!.avatarUrl!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            profile!.email,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Verified",
                          style: GoogleFonts.poppins(
                            color: Colors.green.shade700,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.verified_user_rounded,
                          color: Colors.green.shade700,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "User ID: ${profile!.id}",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            height: 1,
                          ),
                        ),
                        Text(
                          "Account Created: ${DateFormat.yMMMd().format(profile!.createdAt)}",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),

                    // Row: profile.totalFolders,   profile.totalQuizzesTaken

                    // Column:
                    // name
                    // username
                    // bio (maxLines: 3)
                    SizedBox(height: 10),
                    CupertinoButton(
                      color: Colors.grey.shade100,
                      onPressed: () async {
                        final res =
                            await Get.to(ProfileNamePage(name: profile!.name));
                        if (res != null) {
                          profile!.name = res.toString();
                          setState(() {});
                        }
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              profile!.name,
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                              ),
                              maxLines: 2,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "NAME",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    CupertinoButton(
                      color: Colors.grey.shade100,
                      onPressed: () async {
                        final res = await Get.to(
                            ProfileBioPage(name: profile!.bio ?? ""));
                        if (res != null) {
                          profile!.bio = res.toString();
                          setState(() {});
                        }
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              profile!.bio ?? "No Bio",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                              ),
                              maxLines: 2,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "BIO",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    CupertinoButton(
                      color: Colors.grey.shade100,
                      onPressed: () async {
                        final res = await Get.to(
                            ProfileUsernamePage(name: profile!.username ?? ""));
                        if (res != null) {
                          profile!.username = res.toString();
                          setState(() {});
                        }
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              profile!.username ?? "No Username",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                              ),
                              maxLines: 2,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Username",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Divider(),
                    SizedBox(height: 10),
                    CupertinoButton(
                      color: Colors.red,
                      onPressed: () {},
                      child: Center(
                        child: Text(
                          "Logout",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }
}
