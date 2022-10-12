import 'package:beginners219/screens/setting_contents_screen.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return SettingsList(
      sections: [
        SettingsSection(
          tiles: <SettingsTile>[
            SettingsTile.navigation(
              leading: Icon(Icons.language),
              title: Text('어플 버전'),
              value: Text('v0.1'),
              onPressed: (context) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingContentsScreen(
                      title: '어플 버전',
                    ),
                  ),
                );
              },
            ),
            SettingsTile.navigation(
              leading: Icon(Icons.language),
              title: Text('고객센터'),
              onPressed: (context) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingContentsScreen(
                      title: '고객센터',
                    ),
                  ),
                );
              },
            ),
            SettingsTile.switchTile(
              onToggle: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
              leading: Icon(Icons.language),
              title: Text('알림 설정'),
              activeSwitchColor: Colors.blueAccent,
              initialValue: isSwitched,
            ),
            SettingsTile.navigation(
              leading: Icon(Icons.language),
              title: Text('공지사항'),
              onPressed: (context) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingContentsScreen(
                      title: '알림 설정',
                    ),
                  ),
                );
              },
            ),
            SettingsTile.navigation(
              leading: Icon(Icons.language),
              title: Text('제휴 문의'),
              onPressed: (context) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingContentsScreen(
                      title: '제휴 문의',
                    ),
                  ),
                );
              },
            ),
            SettingsTile.navigation(
              leading: Icon(Icons.language),
              title: Text('후원 문의'),
              onPressed: (context) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingContentsScreen(
                      title: '후원 문의',
                    ),
                  ),
                );
              },
            ),
            SettingsTile.navigation(
              leading: Icon(Icons.language),
              title: Text('인스타그램'),
              value: Text('@beginners219'),
              onPressed: (context) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingContentsScreen(
                      title: '인스타그램',
                    ),
                  ),
                );
              },
            ),
            SettingsTile.navigation(
              leading: Icon(Icons.language),
              title: Text('유튜브'),
              value: Text('beginners219'),
              onPressed: (context) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingContentsScreen(
                      title: '유튜브',
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
