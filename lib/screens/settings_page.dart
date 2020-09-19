import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker_flutter/themes.dart';
import 'package:habit_tracker_flutter/widgets/user_widget.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // ThemeMode theme = ThemeMode.dark;
  bool isChanged = false;
  Future<ThemeMode> _themeMode = Themes.getThemeMode();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _themeMode,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          ThemeMode themeMode = snapshot.data;

          return Scaffold(
            appBar: AppBar(
              title: Text('Settings'),
            ),
            body: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Theme'),
                          DropdownButton(
                              value: themeMode,
                              items: ThemeMode.values
                                  .map<DropdownMenuItem<ThemeMode>>(
                                      (ThemeMode theme) {
                                return DropdownMenuItem<ThemeMode>(
                                  value: theme,
                                  child: Text(describeEnum(theme)),
                                );
                              }).toList(),
                              onChanged: (ThemeMode newTheme) {
                                setState(() {
                                  isChanged = true;
                                  _themeMode = Future.value(newTheme);
                                });
                              }),
                        ],
                      ),
                      Builder(
                        builder: (BuildContext context) {
                          return Center(
                              child: Visibility(
                                  visible: isChanged,
                                  child: RaisedButton(
                                    onPressed: () {
                                      Themes.writeThemeMode(themeMode);

                                      final snackBar = SnackBar(
                                          content: Text(
                                              'Please restart the application'));
                                      Scaffold.of(context)
                                          .showSnackBar(snackBar);
                                    },
                                    child: Text('Save'),
                                  )));
                        },
                      ),
                    ],
                  ),
                  UserWidget()
                ],
              ),
            ),
          );
        });

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Settings'),
    //   ),
    //   body: Padding(
    //     padding: EdgeInsets.all(8),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Column(
    //           children: [
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Text('Theme'),
    //                 DropdownButton(
    //                     value: theme,
    //                     items: ThemeMode.values
    //                         .map<DropdownMenuItem<ThemeMode>>(
    //                             (ThemeMode theme) {
    //                       return DropdownMenuItem<ThemeMode>(
    //                         value: theme,
    //                         child: Text(describeEnum(theme)),
    //                       );
    //                     }).toList(),
    //                     onChanged: (ThemeMode newTheme) {
    //                       setState(() {
    //                         isChanged = true;
    //                         theme = newTheme;
    //                       });
    //                     }),
    //               ],
    //             ),
    //             Builder(
    //               builder: (BuildContext context) {
    //                 return Center(
    //                     child: Visibility(
    //                         visible: isChanged,
    //                         child: RaisedButton(
    //                           onPressed: () {
    //                             Themes.writeThemeMode(theme);

    //                             final snackBar = SnackBar(
    //                                 content:
    //                                     Text('Please restart the application'));
    //                             Scaffold.of(context).showSnackBar(snackBar);
    //                           },
    //                           child: Text('Save'),
    //                         )));
    //               },
    //             ),
    //           ],
    //         ),
    //         UserWidget()
    //       ],
    //     ),
    //   ),
    // );
  }
}
