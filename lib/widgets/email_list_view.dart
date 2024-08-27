import 'package:flutter/cupertino.dart';
import 'package:test_drive/widgets/email_widget.dart';
import 'package:test_drive/widgets/search_bar.dart';

import '../models/chat_data.dart' as data;
import '../models/chat_models.dart';

class EmailListView extends StatelessWidget {
  final int? selectedIndex;
  final ValueChanged<int>? onSelected;
  final User currentUser;

  const EmailListView({
    super.key,
    this.selectedIndex,
    this.onSelected,
    required this.currentUser,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView(
        children: [
          const SizedBox(
            height: 8,
          ),
          SearchBar(
            currentUser: currentUser,
          ),
          const SizedBox(
            height: 8,
          ),
          ...List.generate(
            data.emails.length,
            (index) {
              return Padding(
                padding: const EdgeInsets.only(
                  bottom: 8.0,
                ),
                child: EmailWidget(
                  email: data.emails[index],
                  onSelected: onSelected != null
                      ? () {
                          onSelected!(index);
                        }
                      : null,
                  isSelected: selectedIndex == index,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
