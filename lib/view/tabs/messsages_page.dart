import 'package:facebook/assets/assets.dart';
import 'package:facebook/assets/dimens.dart';
import 'package:facebook/assets/strings.dart';
import 'package:facebook/model/messages_model.dart';
import 'package:flutter/material.dart';

class MessagesTab extends StatefulWidget {
  const MessagesTab({super.key});
  @override
  State<MessagesTab> createState() => _MessagesTabState();
}

class _MessagesTabState extends State<MessagesTab> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimens.xMargin),
              child: pageHeader(
                  title: Strings.messages,
                  icon: Icons.message,
                  searchOnTap: () {})),
          const Divider(thickness: 1),
          Expanded(
              child: ListView.builder(
            itemCount: messagesData.length,
            itemBuilder: (context, i) => ListTile(
                onTap: messagesData[i].onTap,
                leading: iconBtn(
                    onPressed: messagesData[i].profileOnTap,
                    icon: CircleAvatar(
                        backgroundImage:
                            AssetImage(messagesData[i].profileImage))),
                title: Text(messagesData[i].username,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(' ${messagesData[i].data}'),
                trailing: Text(messagesData[i].text as String)),
          ))
        ],
      ),
    );
  }
}
