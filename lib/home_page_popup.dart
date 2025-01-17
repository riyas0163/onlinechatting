// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zego_zimkit/zego_zimkit.dart';

class HomePagePopup extends StatefulWidget {
  const HomePagePopup({Key? key}) : super(key: key);

  @override
  State<HomePagePopup> createState() => _HomePagePopupState();
}

class _HomePagePopupState extends State<HomePagePopup> {
  final userIDController = TextEditingController();
  final groupNameController = TextEditingController();
  final groupUsersController = TextEditingController();
  final groupIDController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      color: Colors.white,
      position: PopupMenuPosition.under,
      icon: const Icon(CupertinoIcons.add_circled,color: Colors.green,),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: 'New Chat',
            child: const ListTile(
                leading: Icon(CupertinoIcons.chat_bubble_2_fill,color: Colors.green,),
                title: Text('New Chat', maxLines: 1)),
            onTap: () => ZIMKit().showDefaultNewPeerChatDialog(context),
          ),
          PopupMenuItem(
            value: 'New Group',
            child: const ListTile(
                leading: Icon(CupertinoIcons.person_2_fill,color: Colors.green,),
                title: Text('New Group', maxLines: 1)),
            onTap: () => ZIMKit().showDefaultNewGroupChatDialog(context),
          ),
          PopupMenuItem(
            value: 'Join Group',
            child: const ListTile(
                leading: Icon(Icons.group_add,color: Colors.green,),
                title: Text('Join Group', maxLines: 1)),
            onTap: () => ZIMKit().showDefaultJoinGroupDialog(context),
          ),
        ];
      },
    );
  }
}