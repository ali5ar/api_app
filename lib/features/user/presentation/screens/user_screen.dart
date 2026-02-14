import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:api_app/features/user/presentation/provider/user_provider.dart';
import 'package:api_app/features/user/presentation/widgets/custom_search_bar.dart';
import 'package:api_app/features/user/presentation/widgets/landing_widget.dart';
import 'package:api_app/features/user/presentation/widgets/user_data_widget.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, p, _) {
        return Scaffold(
          body: p.isSuccess && p.user != null
              ? ListView(
                  children: [
                    const LandingWidget(),
                    UserData(user: p.user!),
                    const CustomSearchBar(),
                  ],
                )
              : p.isFailure
                  ? Text(p.errMessage ?? 'Unknown error')
                  : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
