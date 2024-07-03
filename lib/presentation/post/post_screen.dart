import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sliding_box/flutter_sliding_box.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiero_company/core/colors/colors.dart';
import 'package:hiero_company/core/constants/constants.dart';
import 'package:hiero_company/core/provider/provider.dart';
import 'package:hiero_company/infrastructure/models/jobmodel.dart';
import 'package:hiero_company/presentation/home/home_screen.dart';
import 'package:hiero_company/presentation/job/add%20job/add_job.dart';
import 'package:hiero_company/presentation/job/add%20job/widget/bottomsheet.dart';
import 'package:provider/provider.dart';
import 'package:redacted/redacted.dart';

class PostJoborInternScrn extends StatelessWidget {
  const PostJoborInternScrn({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Job/Internship', style: mediumTitle),
                        const Spacer(),
                        Consumer<SignUpProvider>(
                          builder: (context, jobTypeProvider, child) => InkWell(
                            onTap: () {
                              clearJobAllControllers();
                              jobTypeProvider.clearAllFields();
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AddJobInternPostScrn()),
                              );
                            },
                            child: const CircleAvatar(
                              radius: 24,
                              backgroundColor: colorAppLight,
                              child: FaIcon(FontAwesomeIcons.solidSquarePlus),
                            ),
                          ),
                        ),
                        sizedBox5W,
                        const CircleAvatar(
                          radius: 24,
                          backgroundColor: colorAppLight,
                          child: FaIcon(CupertinoIcons.search),
                        )
                      ],
                    ),
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
              ),
              Padding(
                padding: const EdgeInsets.only(top: 130, left: 10, right: 10),
                child: TabBarView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    InkWell(
                        onLongPress: () {
                          showSlidingBox(
                              context: context,
                              box: SlidingBox(
                                maxHeight: size.height * 0.25,
                                color: Colors.white,
                                style: BoxStyle.shadow,
                                draggableIconBackColor: Colors.transparent,
                                body: bottomSheetJobOrInternship(
                                    context: context, jobmodel: jobModel),
                              ));
                        },
                        child: JobPostContainerWidget(
                          size: size,
                          jobModel: jobModel,
                        )),
                    InternshipPostWidgetRedacted(size: size).redacted(
                      context: context,
                      redact: true,
                      configuration: RedactedConfiguration(
                        animationDuration: const Duration(milliseconds: 800),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
