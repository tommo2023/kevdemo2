import 'package:flutter/material.dart';
import 'package:kevdemo2/shared/custom_colors.dart';
import 'package:kevdemo2/shared/text_theme.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

/// This widget is used to present the InformationPage with a title.
/// It can be customized
/// by providing the [title] to display at the top of the page.
class InformationPage extends StatefulWidget {
  /// Creates an [InformationPage] widget.
  ///
  /// The [title] is required and represents the title of the page.
  const InformationPage({required this.title, super.key});

  /// The title to be displayed at the top of the page.
  final String title;

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  final String loremIpsumText =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
      'Nulla ut ex euismod, malesuada mi eget, feugiat libero. '
      'Suspendisse vel velit efficitur, facilisis libero nec, '
      'tempus massa. Aenean consequat metus eget facilisis. '
      'Donec venenatis libero vel metus posuere interdum. '
      'Vivamus vestibulum, mi quis egestas sollicitudin, '
      'tortor lectus vehicula elit, vel tempus metus mi id arcu.'
      ' Vestibulum consectetur lacinia sem. Suspendisse potenti. '
      'Praesent vel elit non elit tincidunt blandit. Maecenas vel mauris a '
      'nunc euismod tempor a nec tellus. Fusce vel dolor lectus. Fusce vel '
      'tempus purus. Proin ultricies dapibus leo, vel fringilla elit '
      'hendrerit in. Fusce nec ligula vel libero interdum lacinia.';
  final Uri _url = Uri.parse('https://www.kevintoms.games');
  String _launchErrorString = '';
  bool _isLaunchError = false;
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Unable to open web page, retry later: $url');
    }
  }

  Future<void> _openWebPage() async {
    _isLaunchError = false;
    _launchErrorString = '';
    try {
      await _launchInBrowser(_url);
    } catch (e) {
      _isLaunchError = true;
      _launchErrorString = e.toString();
    } finally {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.lightGray,
        title: Padding(
          padding: EdgeInsets.only(left: 2.w, right: 2.w),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'ABOUT',
              style: Theme.of(context)
                  .textTheme
                  .title03
                  .withFontWeight(FontWeight.bold),
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ),
      body: ColoredBox(
        color: CustomColors.lightGray,
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  loremIpsumText,
                  style: Theme.of(context).textTheme.subtitle.withColor(
                        CustomColors.medium,
                      ),
                ),
                SizedBox(height: 3.h),
                Text(
                  'Design and Development',
                  style: Theme.of(context)
                      .textTheme
                      .title03
                      .withFontWeight(FontWeight.bold),
                ),
                SizedBox(height: 3.h),
                Row(
                  children: [
                    SizedBox(
                      height: 10.w,
                      child: Image.asset('assets/banner.png'),
                    ),
                    SizedBox(width: 5.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'by Houses',
                          style: Theme.of(context).textTheme.detail,
                        ),
                        GestureDetector(
                          onTap: _openWebPage,
                          child: Text(
                            'kevintoms.games',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle
                                .withColor(Colors.blue),
                          ),
                        ),
                        if (_isLaunchError)
                          Text(
                            _launchErrorString,
                            style: Theme.of(context).textTheme.detail,
                          ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
