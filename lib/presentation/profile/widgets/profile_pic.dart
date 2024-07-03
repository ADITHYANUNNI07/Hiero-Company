import 'package:flutter/material.dart';
import 'package:hiero_company/core/constants/constants.dart';

class ProfilePictureWidget extends StatelessWidget {
  const ProfilePictureWidget({
    super.key,
    this.photoURL,
  });

  final String? photoURL;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        height: size.height / 3,
        foregroundDecoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black87,
              Colors.transparent,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [0, 0.5],
          ),
        ),
        decoration: BoxDecoration(
          image: photoURL != null
              ? DecorationImage(
                  image: AssetImage(photoURL ?? ""),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: Center(
          child: photoURL == null
              ? Image.network(
                  AppImage.noProfileUser,
                  color: Colors.white,
                  height: 200,
                )
              : null,
        ));
  }
}
