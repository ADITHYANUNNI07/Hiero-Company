import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hiero_company/core/colors/colors.dart';
import 'package:hiero_company/core/constants/constants.dart';
import 'package:hiero_company/infrastructure/models/jobmodel.dart';
import 'package:hiero_company/presentation/job/add%20job/add_job.dart';

Widget bottomSheetJobOrInternship({context, required JobModel jobmodel}) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          width: 1,
          color: Colors.black.withAlpha(30),
        ))),
        child: MaterialListItem(
          title: Text(
            jobmodel.title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          description: Text(
            jobmodel.companyName ?? '',
            style: TextStyle(
              color: Colors.black.withAlpha(120),
              fontSize: 13,
            ),
          ),
          image: Image.asset(
            jobmodel.companyImageUrl ?? '',
            fit: BoxFit.cover,
          ),
          onPressed: () {},
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MaterialShareIconButton(
              icon: const FaIcon(FontAwesomeIcons.penToSquare, size: 27),
              text: const Text("Edit"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AddJobInternPostScrn(jobmodel: jobmodel),
                    ));
              },
            ),
            MaterialShareIconButton(
              icon: const Icon(Icons.share_outlined, size: 27),
              text: const Text("Share"),
              onPressed: () {},
            ),
            MaterialShareIconButton(
              icon: const Icon(Icons.link_outlined, size: 27),
              text: const Text("Copy link"),
              onPressed: () {},
            ),
            MaterialShareIconButton(
              icon: const FaIcon(CupertinoIcons.trash, size: 27),
              text: const Text("Delete"),
              onPressed: () {},
              isDelete: true,
            ),
          ],
        ),
      ),
    ],
  );
}

class MaterialShareIconButton extends StatelessWidget {
  final Widget icon;
  final Widget text;
  final VoidCallback onPressed;
  final bool isDelete;
  const MaterialShareIconButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
    this.isDelete = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          margin: const EdgeInsets.only(bottom: 8),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: isDelete ? colorRed.withOpacity(0.4) : colorAppLight,
            borderRadius: const BorderRadius.all(Radius.circular(25)),
          ),
          child: MaterialButton(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            height: 75,
            splashColor: Colors.black.withAlpha(30),
            highlightColor: Colors.black.withAlpha(30),
            onPressed: onPressed,
            child: icon,
          ),
        ),
        text,
      ],
    );
  }
}

class MaterialListItem extends StatelessWidget {
  final Widget title;
  final Widget description;
  final Widget image;
  final VoidCallback onPressed;

  const MaterialListItem({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 45,
                height: 45,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(45)),
                ),
                child: image,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 15, top: 0),
                        child: title),
                    Container(
                        margin: const EdgeInsets.only(left: 15, top: 2),
                        child: description),
                  ],
                ),
              ),
            ],
          ),
          sizedBox10H
        ],
      ),
    );
  }
}
