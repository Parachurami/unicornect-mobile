import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unicornect/app/providers/new_user_provider.dart';
import 'package:unicornect/app/screens/sign_in_screen.dart';
import 'package:unicornect/app/widgets/first_page.dart';
class Onboarding extends ConsumerStatefulWidget{
  const Onboarding({super.key});

  @override
  ConsumerState<Onboarding> createState() {
    return _OnboardingState();
  }

}

class _OnboardingState extends ConsumerState<Onboarding>{
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    ref.watch(newUserProvider.notifier).loadData();
    bool newUser = ref.watch(newUserProvider) as bool;
    // TODO: implement build
    return Scaffold(
      body: newUser ? const FirstPage() : const SignInScreen(),
    );
  }

}