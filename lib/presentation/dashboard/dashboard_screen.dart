import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hiero_company/core/colors/colors.dart';
import 'package:hiero_company/presentation/chat/chat_screen.dart';
import 'package:hiero_company/presentation/home/home_screen.dart';
import 'package:hiero_company/presentation/profile/profile_screen.dart';
import 'package:hiero_company/presentation/post/post_screen.dart';
import 'package:hiero_company/presentation/notification/notification_screen.dart';
import 'package:provider/provider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class PageIndexProvider with ChangeNotifier {
  int _index = 0;

  int get index => _index;

  void setIndex(int newIndex) {
    _index = newIndex;
    notifyListeners();
  }
}

class DashboardScrn extends StatelessWidget {
  const DashboardScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PageIndexProvider(),
      child: Consumer<PageIndexProvider>(
        builder: (context, provider, _) {
          List<Widget> pages = [
            const HomeScrn(),
            const NotificationScrn(),
            const PostJoborInternScrn(),
            const ChatScrn(),
            const ProfileScrn()
          ];

          return Scaffold(
            body: pages[provider.index],
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GNav(
                onTabChange: (index) {
                  provider.setIndex(index);
                },
                tabBackgroundColor: colorApp,
                activeColor: colorWhite,
                padding: const EdgeInsets.all(10),
                tabActiveBorder: Border.all(
                  color: const Color(0xFF773BFF).withOpacity(0.5),
                ),
                tabs: const [
                  GButton(
                    iconActiveColor: colorWhite,
                    icon: CupertinoIcons.house_alt,
                    text: 'Home',
                  ),
                  GButton(
                    icon: CupertinoIcons.bell,
                    text: 'Notification',
                  ),
                  GButton(
                    icon: CupertinoIcons.add_circled,
                    text: 'Post',
                  ),
                  GButton(
                    icon: CupertinoIcons.chat_bubble_2,
                    text: 'Chat',
                  ),
                  GButton(
                    icon: CupertinoIcons.person,
                    text: 'Profile',
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
