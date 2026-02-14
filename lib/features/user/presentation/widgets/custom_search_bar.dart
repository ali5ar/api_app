import 'package:api_app/features/user/presentation/widgets/get_user_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:api_app/features/user/presentation/provider/user_provider.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
     final userProvider = context.watch<UserProvider>();
    // watch: يعيد بناء الويدجت لما selectedId يتغير

    return Column(
      children: [
        Slider(
          value: userProvider.selectedId,
          onChanged: userProvider.changeId,
          min: 1,
          max: 10,
          divisions: 9,
          label: "${userProvider.selectedId.toInt()}",
        ),
        GetUserButton(
          onPressed: () => context.read<UserProvider>().fetchUser(),
        ),
      ],
    );
  }
}
