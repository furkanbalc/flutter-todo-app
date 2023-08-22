import 'package:flutter/material.dart';
import 'package:my_application/models/onboard_data.dart';
import 'package:my_application/product/constants/app_icon_constants.dart';
import 'package:my_application/product/constants/app_languages_constants.dart';
import 'package:my_application/view/home_page.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late PageController _pageViewController = PageController();
  int currentIndex = 0;

  @override
  void initState() {
    _pageViewController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBarOnBoarding(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Consumer<OnBoardData>(
          builder: (context, onBoardData, child) {
            return PageView.builder(
              itemCount: onBoardData.screens.length,
              controller: _pageViewController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                        height: 400,
                        child: Image.asset(onBoardData.screens[index].img)),
                    SizedBox(
                      height: 10.0,
                      child: ListView.builder(
                        itemCount: onBoardData.screens.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 3.0),
                                width: currentIndex == index ? 25 : 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    buildTextOnBoardTitle(onBoardData, index),
                    buildTextOnBoardSubTitle(onBoardData, index),
                    InkWell(
                      onTap: () async {
                        if (index == onBoardData.screens.length - 1) {
                          onBoardData.toggleStatusViewed();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        }

                        _pageViewController.nextPage(
                          duration: const Duration(milliseconds: 50),
                          curve: Curves.bounceIn,
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0)),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              AppLanguagesConstants.appNextButton,
                              style: TextStyle(fontSize: 16.0),
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            AppIconConstants.skipIcon
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }

  Text buildTextOnBoardSubTitle(OnBoardData onBoardData, int index) {
    return Text(
      onBoardData.screens[index].desc,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 14.0,
        fontFamily: 'Montserrat',
      ),
    );
  }

  Text buildTextOnBoardTitle(OnBoardData onBoardData, int index) {
    return Text(
      onBoardData.screens[index].text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 27.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
      ),
    );
  }

  AppBar _buildAppBarOnBoarding(BuildContext context) {
    return AppBar(
      actions: [
        TextButton(
          onPressed: () {
            Provider.of<OnBoardData>(context, listen: false)
                .toggleStatusViewed();
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          child: const Text(
            AppLanguagesConstants.appSkipButton,
          ),
        )
      ],
    );
  }
}
