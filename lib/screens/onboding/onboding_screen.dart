import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'components/animated_btn.dart';
import 'components/sign_in_dialog.dart';
import 'components/delayed_animation.dart';

class OnbodingScreen extends StatefulWidget {
  const OnbodingScreen({super.key});

  @override
  State<OnbodingScreen> createState() => _OnbodingScreenState();
}

class _OnbodingScreenState extends State<OnbodingScreen> {
  late RiveAnimationController _btnAnimationController;
  final int delayedAmount = 500;

  bool isShowSignInDialog = false;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Positioned.fill(
        child: Image.asset(
          "assets/Backgrounds/bg.png",
          fit: BoxFit.fill,
        ),
      ),
      Positioned.fill(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: const SizedBox(),
        ),
      ),
      const RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
      Positioned.fill(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: const SizedBox(),
        ),
      ),
      AnimatedPositioned(
        duration: const Duration(milliseconds: 260),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(height: 120),
                    DelayedAnimation(
                      child: Text(
                        "Fell great abut your financial future",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Poppins",
                          height: 1.2,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      delay: delayedAmount + 800,
                    ),
                    SizedBox(height: 16),
                    DelayedAnimation(
                      child: Text(
                        "Optimise current finances to achieve long term financial goal!",
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      delay: delayedAmount + 1600,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60),
              DelayedAnimation(
                child: AnimatedBtn(
                  btnAnimationController: _btnAnimationController,
                  //jika ditekan button akan active
                  press: () {
                    _btnAnimationController.isActive = true;

                    Future.delayed(
                      const Duration(microseconds: 800),
                      () {
                        setState(() {
                          isShowSignInDialog = true;
                        });
                        showCustomDialog(
                          context,
                          onValue: (_) {},
                        );
                      },
                    );
                  },
                ),
                delay: delayedAmount + 2000,
              ),
            ],
          ),
        )),
      )
    ]));
  }
}
