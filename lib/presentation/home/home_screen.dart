import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiero_company/core/colors/colors.dart';
import 'package:hiero_company/core/config/api_config.dart';
import 'package:hiero_company/core/constants/constants.dart';
import 'package:hiero_company/core/widgets/widget.dart';
import 'package:hiero_company/infrastructure/models/jobmodel.dart';
import 'package:hiero_company/presentation/chat/chat_screen.dart';
import 'package:hiero_company/presentation/home/widget/home_widget.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class HomeScrn extends StatelessWidget {
  const HomeScrn({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return TopColorSafeArea(
      child: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            body: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const PaddingContainerWidget(
                                color: colorApp,
                                child: Icon(CupertinoIcons.text_badge_star,
                                    color: Colors.white)),
                            sizedBox10W,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Hai', style: mediumsubTitle),
                                Text(AppDevConfig.companyName,
                                    style: mediumTitle),
                              ],
                            ),
                            const Spacer(),
                            const CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage(AppImage.companyPic),
                            )
                          ],
                        ),
                      ),
                      sizedBox10H,
                      const RowMainTitleWidget(title: 'Profiles'),
                      sizedBox10H,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PaddingContainerWidget(
                              width: size.width / 2,
                              color: colorWhite,
                              child: Column(
                                children: [
                                  const CircleAvatar(
                                    backgroundImage:
                                        AssetImage(AppImage.userPic),
                                    radius: 40,
                                  ),
                                  sizedBox10H,
                                  Text('Adithyan R',
                                      style: companyDesignationTitle),
                                  Text('Flutter Developer',
                                      style: companyNameTitle),
                                  sizedBox5H,
                                  const PaddingContainerWidget(
                                    padding: 6,
                                    color: colorAppLight,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FaIcon(FontAwesomeIcons.battleNet),
                                        sizedBox5W,
                                        Text('102 Connections',
                                            style: TextStyle(color: colorApp)),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                      const RowMainTitleWidget(title: 'Application Status'),
                      sizedBox10H,
                      SegmentedTabControl(
                        barDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100)),
                        tabTextColor: colorApp,
                        selectedTabTextColor: Colors.white,
                        squeezeIntensity: 2,
                        tabPadding: const EdgeInsets.symmetric(horizontal: 8),
                        indicatorDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100)),
                        textStyle:
                            GoogleFonts.poppins(fontWeight: FontWeight.bold),
                        tabs: const [
                          SegmentTab(
                            label: 'Job',
                            color: colorApp,
                            backgroundColor: colorAppLight,
                          ),
                          SegmentTab(
                            label: 'Internship',
                            backgroundColor: colorAppLight,
                            color: colorApp,
                          ),
                        ],
                      ),
                    ],
                  ),
                ), //tab
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.53),
                  child: const TabBarView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      JobTile(),
                      PersonalMessageTile(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class JobTile extends StatelessWidget {
  const JobTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        alignment: Alignment.center,
        child: ListView(
          children: List.generate(
            10,
            (index) => InkWell(
              onTap: () {},
              child: PaddingContainerWidget(
                color: colorAppLight,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                            backgroundImage:
                                AssetImage(jobModel.companyImageUrl ?? ''),
                            radius: 30),
                        sizedBox10W,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              jobModel.title,
                              style: companyDesignationTitle,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              jobModel.companyName ?? '',
                              style: companyNameTitle,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PaddingContainerWidget(
                          padding: 8,
                          color: colorWhite,
                          child: Row(
                            children: [
                              const FaIcon(FontAwesomeIcons.house, size: 15),
                              sizedBox10W,
                              Text(jobModel.employmentType)
                            ],
                          ),
                        ),
                      ],
                    ),
                    sizedBox15H,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        JobSDateExpWidget(
                            iconData: FontAwesomeIcons.userClock,
                            title: 'APPLIED',
                            subtitle: '23',
                            color: colorApp),
                        JobSDateExpWidget(
                            iconData: FontAwesomeIcons.userCheck,
                            title: 'MATCHED',
                            subtitle: '10',
                            color: colorApp),
                        JobSDateExpWidget(
                            iconData: FontAwesomeIcons.listCheck,
                            title: 'TASK SUBMISSION',
                            subtitle: '5',
                            color: colorApp),
                      ],
                    ),
                    sizedBox15H,
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

class InternshipPostWidget extends StatelessWidget {
  const InternshipPostWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PaddingContainerWidget(
          color: colorJobAppLight,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                      backgroundImage: AssetImage(AppImage.companyPic),
                      radius: 30),
                  sizedBox10W,
                  SizedBox(
                    height: 60,
                    width: size.width - 114 - 70,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Community Management',
                          style: companyDesignationTitle,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'Finari Services Private Limited',
                          style: companyNameTitle,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  const TimeDurationContainerWidget(
                    title: 'NOW',
                    color: colorJobApp,
                    lightColor: colorJobAppLight,
                  )
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PaddingContainerWidget(
                    padding: 8,
                    color: colorWhite,
                    child: Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.house,
                          size: 15,
                          color: colorJobApp,
                        ),
                        sizedBox10W,
                        Text('Work from home')
                      ],
                    ),
                  ),
                ],
              ),
              sizedBox15H,
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  JobSDateExpWidget(
                      iconData: FontAwesomeIcons.play,
                      title: 'START DATE',
                      subtitle: 'Immediately',
                      color: colorJobApp),
                  JobSDateExpWidget(
                      iconData: FontAwesomeIcons.calendarDay,
                      title: 'DURATION',
                      subtitle: '1-5 Months',
                      color: colorJobApp),
                  JobSDateExpWidget(
                      iconData: FontAwesomeIcons.piggyBank,
                      title: 'STIPEND',
                      subtitle: '₹ 8 - 15 k',
                      color: colorJobApp),
                ],
              ),
              sizedBox15H,
            ],
          ),
        ),
        sizedBox10H
      ],
    );
  }
}

class JobPostContainerWidget extends StatelessWidget {
  const JobPostContainerWidget({
    super.key,
    required this.size,
    required this.jobModel,
  });
  final JobModel jobModel;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PaddingContainerWidget(
          color: colorAppLight,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                      backgroundImage: AssetImage(
                          jobModel.companyImageUrl ?? AppImage.companyPic),
                      radius: 30),
                  sizedBox10W,
                  SizedBox(
                    height: 60,
                    width: size.width - 114 - 70,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          jobModel.title,
                          style: companyDesignationTitle,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          jobModel.companyName ?? '',
                          style: companyNameTitle,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  TimeDurationContainerWidget(
                    title:
                        getTimeDifference(jobModel.postedOn ?? DateTime.now()),
                    color: colorApp,
                    lightColor: colorAppLight,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PaddingContainerWidget(
                    padding: 8,
                    color: colorWhite,
                    child: Row(
                      children: [
                        const FaIcon(FontAwesomeIcons.house, size: 15),
                        sizedBox10W,
                        Text(jobModel.employmentType)
                      ],
                    ),
                  ),
                ],
              ),
              sizedBox15H,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  JobSDateExpWidget(
                      iconData: FontAwesomeIcons.play,
                      title: 'START DATE',
                      subtitle: DateFormat('d MMM yyyy')
                          .format(jobModel.startingDate),
                      color: colorApp),
                  JobSDateExpWidget(
                      iconData: FontAwesomeIcons.calendarDay,
                      title: 'EXPERIENCE',
                      subtitle: "${jobModel.yearOfExperience} Years",
                      color: colorApp),
                  JobSDateExpWidget(
                      iconData: FontAwesomeIcons.piggyBank,
                      title: 'CTC(Annual)',
                      subtitle: jobModel.salary,
                      color: colorApp),
                ],
              ),
              sizedBox15H,
            ],
          ),
        ),
        sizedBox10H
      ],
    );
  }
}

class RowMainTitleWidget extends StatelessWidget {
  const RowMainTitleWidget({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: mediumlightTitle),
        const Spacer(),
        CircleAvatar(
          backgroundColor: colorAppLight,
          child: LottieBuilder.asset('assets/animations/vED6TkFKA5.json'),
        )
      ],
    );
  }
}

class JobSDateExpWidget extends StatelessWidget {
  const JobSDateExpWidget({
    super.key,
    required this.iconData,
    required this.title,
    required this.subtitle,
    required this.color,
  });
  final IconData? iconData;
  final String title;
  final String subtitle;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FaIcon(iconData, size: 15, color: colorGreyjob),
        sizedBox5W,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            Text(
              subtitle,
              style: TextStyle(color: color),
            )
          ],
        )
      ],
    );
  }
}

class TimeDurationContainerWidget extends StatelessWidget {
  const TimeDurationContainerWidget({
    super.key,
    required this.title,
    required this.color,
    required this.lightColor,
    this.isredact = false,
  });
  final String title;
  final Color color;
  final Color lightColor;
  final bool isredact;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(
          width: 60,
          height: 35,
        ),
        Positioned(
          bottom: 1,
          child: Container(
            width: 55,
            height: 30,
            decoration: BoxDecoration(
                color: colorWhite, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: isredact
                  ? Container()
                  : Text(
                      title,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: color),
                    ),
            ),
          ),
        ),
        Positioned(
            right: 0,
            child: isredact
                ? Container()
                : CircleAvatar(
                    radius: 10,
                    backgroundColor: colorAppLight,
                    child: Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ))
      ],
    );
  }
}

class SearchFilterWidget extends StatelessWidget {
  const SearchFilterWidget({
    super.key,
    required this.size,
    required this.onTap,
    this.filterColor,
  });

  final Size size;
  final void Function()? onTap;
  final Color? filterColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: SizedBox(
            height: 51,
            width: size.width * 0.8,
            child: const TextFormWidget(
                hintText: 'Search Job/Internship',
                icon: CupertinoIcons.search,
                isNolabel: true,
                isSearchFilter: true),
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            color: colorWhite,
            height: 51,
            child: PaddingContainerWidget(
                color: filterColor ?? colorApp,
                child: const Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: FaIcon(
                    FontAwesomeIcons.filter,
                    color: colorWhite,
                  ),
                )),
          ),
        )
      ],
    );
  }
}

class InternshipPostWidgetRedacted extends StatelessWidget {
  const InternshipPostWidgetRedacted({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PaddingContainerWidget(
          color: colorJobAppLight,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: colorApp),
                    child: const Text(''),
                  ),
                  sizedBox10W,
                  SizedBox(
                    height: 60,
                    width: size.width - 114 - 70,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '.............',
                          style: companyDesignationTitle,
                          overflow: TextOverflow.ellipsis,
                        ),
                        sizedBox5H,
                        Text(
                          'Finari.............................',
                          style: companyNameTitle,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  const TimeDurationContainerWidget(
                    title: 'now',
                    color: colorJobApp,
                    lightColor: colorJobAppLight,
                    isredact: true,
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PaddingContainerWidget(
                    width: 150,
                    padding: 8,
                    color: colorWhite,
                    child: Row(
                      children: [
                        sizedBox10H,
                      ],
                    ),
                  ),
                ],
              ),
              sizedBox15H,
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  JobSDateExpWidget(
                      iconData: null,
                      title: '....................',
                      subtitle: '....................',
                      color: colorJobApp),
                  JobSDateExpWidget(
                      iconData: null,
                      title: '....................',
                      subtitle: '....................',
                      color: colorJobApp),
                  JobSDateExpWidget(
                      iconData: null,
                      title: '....................',
                      subtitle: '....................',
                      color: colorJobApp),
                ],
              ),
              sizedBox15H,
            ],
          ),
        ),
        sizedBox10H
      ],
    );
  }
}
