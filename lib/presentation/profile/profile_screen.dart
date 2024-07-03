import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hiero_company/core/colors/colors.dart';
import 'package:hiero_company/core/constants/constants.dart';
import 'package:hiero_company/core/widgets/widget.dart';
import 'package:hiero_company/presentation/profile/widgets/profile_pic.dart';

class ProfileScrn extends StatelessWidget {
  const ProfileScrn({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const ProfilePictureWidget(photoURL: AppImage.companyPic),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "lieper_user",
                          style: Theme.of(context).textTheme.headlineMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Text(
                          "@adddd",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  ElevatedBtnWidget(
                    onPressed: () {},
                    title: 'Edit',
                    leading: const FaIcon(
                      FontAwesomeIcons.pencil,
                      color: colorWhite,
                      size: 20,
                    ),
                    elevation: 5,
                    btnColor: colorApp,
                  )
                ],
              ),
              const SizedBox(height: 16),
              const SizedBox(
                width: 300,
                child: Text("nsvdxhks"),
              ),
            ],
          ),
        )
      ],
    );
  }
}
