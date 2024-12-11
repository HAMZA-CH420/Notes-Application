import 'package:flutter/material.dart';
import 'package:notes/providers/Theme_Provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings"),centerTitle: true,),
      body: Consumer<ThemeProvider>(builder: (ctx,provider,__){
        return SwitchListTile.adaptive(
          title: Text("Dark Theme"),
          onChanged: (value){
          provider.updateTheme(value: value);
        },value:provider.getThemeValue(),);
      },),
    );
  }
}
