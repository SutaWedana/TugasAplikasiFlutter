import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            centerTitle: true,
            title: Text(
              'Home',
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            actions: [
              Builder(
                builder: (context) {
                  return IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                  );
                },
              ),
            ],
          ),
          endDrawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  accountName: const Text('I Nengah Suta Wedana'),
                  accountEmail: const Text('sutawedana@gmail.com'),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    child: ClipOval(
                      child: Image.asset(
                        fit: BoxFit.cover,
                        'assets/PP.jpg',
                        width: 90,
                      ),
                    ),
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.cyan,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://wallpaperaccess.com/full/42271.jpg',
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
            ListTile(
              leading: const Icon(FontAwesomeIcons.whatsapp),
              title: const Text('WhatsApp'),
              onTap: () async {
                final Uri url = Uri.parse('https://wa.me/6285319091245?text=Hello');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  debugPrint('Could not launch $url');
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Unable to open WhatsApp')),
                  );
                }
              },
            ),
            ListTile(
              leading: const Icon(FontAwesomeIcons.instagram),
              title: const Text('Instagram'),
              onTap: () async {
                final Uri url = Uri.parse('https://www.instagram.com/sutawedana_/');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  debugPrint('Could not launch $url');
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Unable to open Instagram')),
                  );
                }
              },
            ),
            ListTile(
              leading: const Icon(FontAwesomeIcons.facebook),
              title: const Text('Facebook'),
              onTap: () async {
                final Uri url = Uri.parse('https://web.facebook.com/ehh.suta/');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                } else {
                  debugPrint('Could not launch $url');
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Unable to open Facebook')),
                  );
                }
              },
            ),

                const Divider(),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Logout'),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Logout'),
                        content: const Text('Apakah anda yakin ingin keluar?'),
                        actions: [
                          TextButton(
                            child: const Text('Batal'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          TextButton(
                            child: const Text(
                              'Keluar',
                              style: TextStyle(color: Colors.red),
                            ),
                            onPressed: () {
                              SystemNavigator.pop();
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                        Color.fromARGB(255, 34, 34, 34),
                        Color.fromARGB(255, 73, 73, 73),
                      ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AnimatedLogo(),
                    const SizedBox(
                      height: 25,
                    ),
                    SelectableText(
                      'I NENGAH SUTA WEDANA',
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),  // Adjust padding as needed
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),  // Background color with transparency
                    borderRadius: BorderRadius.circular(30),  // Makes the container oval
                  ),
                  child: const SelectableText(
                    'Mobile App Development, eager to learn and grow!',
                    style: TextStyle(
                      fontSize: 17,
                      fontStyle: FontStyle.italic,
                      color: Color.fromARGB(255, 202, 198, 198),
                    ),
                    textAlign: TextAlign.center,  // Centers the text within the container
                  ),
                ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      padding: const EdgeInsets.all(15.0),  // Padding di dalam box
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5), // Warna transparan hitam
                        borderRadius: BorderRadius.circular(10),  // Membuat sudut box melengkung
                      ),
                      child: SelectableText(
                        """Hello, my name is I Nengah Suta Wedana, 
or commonly called Suta. I am an Informatics Engineering student at ITB - Stikom Ambon. Currently I am focusing on graphic design, photography, editing and my major""",
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.left, // Mengatur teks agar rata kiri
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),
                  const SkillsSection(),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({super.key});

  @override
  State<AnimatedLogo> createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo> {
  bool isZoomed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.only(bottom: isZoomed ? 50.0 : 0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isZoomed = !isZoomed;
          });
        },
        child: AnimatedScale(
          scale: isZoomed ? 1.3 : 1.0,
          duration: const Duration(milliseconds: 300),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(isZoomed ? 20 : 75),
              border: Border.all(
                color: Color.fromARGB(255, 6, 93, 232),
                width: 2,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(isZoomed ? 20 : 75),
              child: Image.asset(
                fit: BoxFit.cover,
                'assets/PP.jpg',
                width: 150,
                height: 150,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'My Skills',
          style: GoogleFonts.montserrat(
            textStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 25),
        Wrap(
          spacing: 15,
          runSpacing: 15,
          alignment: WrapAlignment.center,
          children: [
            SkillChip(label: 'Flutter', percentage: 5),
            SkillChip(label: 'Graphic Design', percentage: 80),
            SkillChip(label: 'Video Editing', percentage: 40),
            SkillChip(label: 'Photo Editing', percentage: 95),
          ],
        ),
      ],
    );
  }
}

class SkillChip extends StatefulWidget {
  final String label;
  final int percentage;

  const SkillChip({super.key, required this.label, required this.percentage});

  @override
  _SkillChipState createState() => _SkillChipState();
}

class _SkillChipState extends State<SkillChip> {
  bool showBar = false;

  @override
  Widget build(BuildContext context) {
    Color barColor;
    if (widget.percentage < 50) {
      barColor = Colors.red;
    } else if (widget.percentage < 75) {
      barColor = Colors.orange;
    } else {
      barColor = Colors.green;
    }

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              showBar = !showBar;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 6,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Text(
              widget.label,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
        if (showBar)
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
              ),
              child: LinearProgressIndicator(
                value: widget.percentage / 100,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation(barColor),
              ),
            ),
          ),
      ],
    );
  }
}
