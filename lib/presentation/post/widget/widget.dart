import 'package:flutter/material.dart';
import 'package:flutter_sliding_box/flutter_sliding_box.dart';
import 'package:hiero_company/core/constants/constants.dart';
import 'package:hiero_company/core/routes/routes.dart';
import 'package:hiero_company/infrastructure/models/jobmodel.dart';
import 'package:hiero_company/presentation/home/home_screen.dart';
import 'package:hiero_company/presentation/post/add%20post/widget/bottomsheet.dart';
import 'package:hiero_company/presentation/post/display%20post/job_post.dart';
import 'package:redacted/redacted.dart';

listOfPostWidget(BuildContext context, Size size, JobModel jobmodel) {
  return Column(
    children: [
      InkWell(
        onTap: () {
          NavigationHandler.navigateTo(
              context, JobPostScrn(jobModel: jobmodel));
        },
        onLongPress: () {
          showSlidingBox(
            context: context,
            box: SlidingBox(
              maxHeight: size.height * 0.25,
              color: Colors.white,
              style: BoxStyle.shadow,
              draggableIconBackColor: Colors.transparent,
              body: bottomSheetJobOrInternship(
                  context: context, jobmodel: jobmodel),
            ),
          );
        },
        child: JobPostContainerWidget(
          size: size,
          jobModel: jobmodel,
        ),
      ),
      sizedBox5H,
    ],
  );
}

listOfPostRedactedWidget(BuildContext context, Size size) {
  return Column(
    children: [
      InternshipPostWidgetRedacted(size: size).redacted(
        context: context,
        redact: true,
        configuration: RedactedConfiguration(
          animationDuration: const Duration(milliseconds: 800),
        ),
      ),
      sizedBox5H,
    ],
  );
}
