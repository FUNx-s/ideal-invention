import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const WToppersApp());
}

const Color navy = Color(0xFF071426);
const Color panel = Color(0xFF122B49);
const Color panelLight = Color(0xFF1A3A60);
const Color accent = Color(0xFF82B7FF);
const Color muted = Color(0xFFA8BDD7);

class StudySite {
  final String name;
  final String subtitle;
  final String url;
  final String mark;
  final Color markColor;

  const StudySite({
    required this.name,
    required this.subtitle,
    required this.url,
    required this.mark,
    required this.markColor,
  });
}

const List<StudySite> sites = [
  StudySite(
    name: 'Physics Wallah',
    subtitle: 'Study Portal',
    url: 'https://pw.delta-verse.xyz/study',
    mark: 'PW',
    markColor: Color(0xFFE13F48),
  ),
  StudySite(
    name: 'Science and Fun',
    subtitle: 'Learning Portal',
    url: 'https://delta-verse.xyz/scienceandfun',
    mark: 'S&F',
    markColor: Color(0xFF2478CE),
  ),
  StudySite(
    name: 'Next Toppers',
    subtitle: 'Learning Portal',
    url: 'https://delta-verse.xyz/nexttoppers',
    mark: 'NEXT',
    markColor: Color(0xFF253B59),
  ),
];

class WToppersApp extends StatelessWidget {
  const WToppersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'W TOPPERS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: navy,
        colorScheme: ColorScheme.fromSeed(
          seedColor: accent,
          brightness: Brightness.dark,
          surface: navy,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 22, 20, 28),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'W TOPPERS',
                              style: TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 1.1,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'YOUR LEARNING SPACE',
                              style: TextStyle(
                                color: muted.withOpacity(.9),
                                fontSize: 10,
                                letterSpacing: 2.1,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          color: panelLight,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: accent.withOpacity(.18)),
                        ),
                        child: const Icon(Icons.school_rounded,
                            color: accent, size: 27),
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFF193B63), Color(0xFF102541)],
                      ),
                      border: Border.all(color: accent.withOpacity(.17)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'WELCOME TO YOUR HUB',
                          style: TextStyle(
                            color: accent.withOpacity(.95),
                            fontSize: 10,
                            letterSpacing: 1.8,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Learn. Grow.\nAchieve.',
                          style: TextStyle(
                            fontSize: 29,
                            height: 1.12,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Your favourite study portals, together in one place.',
                          style: TextStyle(color: muted, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      const Text(
                        'YOUR WEBSITES',
                        style: TextStyle(
                          color: accent,
                          fontSize: 11,
                          letterSpacing: 1.8,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '${sites.length} PORTALS',
                        style: const TextStyle(
                            color: muted, fontSize: 10, letterSpacing: 1),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: sites.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: .91,
                    ),
                    itemBuilder: (context, index) {
                      final site = sites[index];
                      return SiteCard(
                        site: site,
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => SiteBrowserScreen(site: site),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 26),
                  const Center(
                    child: Text(
                      'W TOPPERS  •  LEARN SMARTER',
                      style: TextStyle(
                        color: muted,
                        fontSize: 10,
                        letterSpacing: 1.3,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SiteCard extends StatelessWidget {
  final StudySite site;
  final VoidCallback onTap;

  const SiteCard({super.key, required this.site, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: panel,
      borderRadius: BorderRadius.circular(22),
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: Colors.white.withOpacity(.07)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  site.mark,
                  style: TextStyle(
                    color: site.markColor,
                    fontWeight: FontWeight.w900,
                    fontSize: site.mark.length > 3 ? 12 : 18,
                    letterSpacing: -.5,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                site.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 4),
              Text(site.subtitle,
                  style: const TextStyle(color: muted, fontSize: 11)),
              const SizedBox(height: 13),
              const Row(
                children: [
                  Text('OPEN',
                      style: TextStyle(
                          color: accent,
                          fontSize: 10,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.2)),
                  SizedBox(width: 5),
                  Icon(Icons.arrow_forward_rounded,
                      color: accent, size: 14),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SiteBrowserScreen extends StatefulWidget {
  final StudySite site;

  const SiteBrowserScreen({super.key, required this.site});

  @override
  State<SiteBrowserScreen> createState() => _SiteBrowserScreenState();
}

class _SiteBrowserScreenState extends State<SiteBrowserScreen> {
  late final WebViewController controller;
  int loadingProgress = 0;
  bool canGoBack = false;
  bool canGoForward = false;
  String pageTitle = '';

  @override
  void initState() {
    super.initState();
    pageTitle = widget.site.name;
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) {
            if (mounted) setState(() => loadingProgress = progress);
          },
          onPageFinished: (url) async {
            final back = await controller.canGoBack();
            final forward = await controller.canGoForward();
            if (mounted) {
              setState(() {
                canGoBack = back;
                canGoForward = forward;
                loadingProgress = 100;
              });
            }
          },
          onNavigationRequest: (request) {
            final uri = Uri.tryParse(request.url);
            if (uri == null ||
                (uri.scheme != 'https' && uri.scheme != 'http')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.site.url));
  }

  Future<bool> _handleBack() async {
    if (await controller.canGoBack()) {
      await controller.goBack();
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _handleBack,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: navy,
          foregroundColor: Colors.white,
          title: Text(
            pageTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
          ),
          actions: [
            IconButton(
              tooltip: 'Refresh',
              onPressed: () => controller.reload(),
              icon: const Icon(Icons.refresh_rounded, color: accent),
            ),
          ],
        ),
        body: Column(
          children: [
            if (loadingProgress < 100)
              LinearProgressIndicator(
                value: loadingProgress / 100,
                minHeight: 2,
                backgroundColor: panel,
                color: accent,
              ),
            Expanded(child: WebViewWidget(controller: controller)),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
              decoration: const BoxDecoration(
                color: navy,
                border: Border(top: BorderSide(color: Color(0x223B5A7D))),
              ),
              child: Row(
                children: [
                  _BrowserButton(
                    icon: Icons.arrow_back_rounded,
                    label: 'Back',
                    enabled: canGoBack,
                    onTap: () async {
                      if (await controller.canGoBack()) {
                        await controller.goBack();
                      } else if (mounted) {
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                  _BrowserButton(
                    icon: Icons.arrow_forward_rounded,
                    label: 'Forward',
                    enabled: canGoForward,
                    onTap: () => controller.goForward(),
                  ),
                  _BrowserButton(
                    icon: Icons.home_rounded,
                    label: 'Home',
                    enabled: true,
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  _BrowserButton(
                    icon: Icons.refresh_rounded,
                    label: 'Reload',
                    enabled: true,
                    onTap: () => controller.reload(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BrowserButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool enabled;
  final VoidCallback onTap;

  const _BrowserButton({
    required this.icon,
    required this.label,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(13),
        onTap: enabled ? onTap : null,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 7),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon,
                  color: enabled ? accent : muted.withOpacity(.35), size: 21),
              const SizedBox(height: 3),
              Text(
                label,
                style: TextStyle(
                  color: enabled ? muted : muted.withOpacity(.35),
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
