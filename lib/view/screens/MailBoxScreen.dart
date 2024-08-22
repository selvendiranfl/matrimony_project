import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/mailboxscreen/mailbox_bloc.dart';

class MailBoxScreen extends StatefulWidget {
  const MailBoxScreen({super.key});

  @override
  State<MailBoxScreen> createState() => _MailBoxScreenState();
}

class _MailBoxScreenState extends State<MailBoxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<MailboxBloc, MailboxState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        child: BlocBuilder<MailboxBloc, MailboxState>(
          builder: (context, state) {
            return Placeholder();
          },
        ),
      ),
    );
  }
}
