import 'package:flutter/material.dart';
import 'package:myapp/Pages/home/HomeController.dart';
import 'package:myapp/shared/theme/AppColors.dart';
import 'package:myapp/shared/theme/AppTextStyles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var homecontroller = HomeController();
  final pages = [
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.blue,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[homecontroller.currentPage],
      bottomNavigationBar: Container(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                homecontroller.setPage(0);
                setState(() {});
              },
              icon: const Icon(Icons.home),
              color: AppColors.primary,
            ),
            GestureDetector(
              onTap: () {
                homecontroller.setPage(1);
                setState(() {});
              },
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(5)),
                child: const Icon(Icons.add_box_outlined),
              ),
            ),
            IconButton(
                onPressed: () {
                  homecontroller.setPage(2);
                  setState(() {});
                },
                icon: const Icon(Icons.description_outlined))
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(152),
        child: Container(
          height: 152,
          color: AppColors.primary,
          child: Center(
            child: ListTile(
              title: Text.rich(
                TextSpan(
                    text: "Olá, ",
                    style: TextStyles.titleRegular,
                    children: [
                      TextSpan(
                        text: "Arthur",
                        style: TextStyles.titleBoldBackground,
                      )
                    ]),
              ),
              subtitle: Text(
                "Subtailte here",
                style: TextStyles.captionShape,
              ),
              trailing: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
