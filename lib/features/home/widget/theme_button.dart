import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../manger/themeProvider.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<SettingProvider>(context);
    return IconButton(
      onPressed: () {
        if(provider.themeCheck==true){
          provider.changeTheme(ThemeMode.light,false);
        }
        else{
          provider.changeTheme(ThemeMode.dark,true);
        }
      },
      icon: Icon(
        provider.themeCheck?CupertinoIcons.moon_stars_fill:CupertinoIcons.sun_max_fill
        ,
        size: 32,
        color: provider.themeMode == ThemeMode.dark
            ? Colors.yellow.withOpacity(0.85)
            : CupertinoColors.systemYellow,
      ),
    );
  }
}
