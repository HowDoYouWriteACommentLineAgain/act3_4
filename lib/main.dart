import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScreen();
  }
}

class MainScreen extends StatelessWidget{
  const MainScreen({super.key});


  final tab1Text = const Text("This is the home screen text for Act#3 and now #4");
  final tab2Text = const Text("This is the gallery screen where columns and rows are demoed in flutter. Prevously act #2");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Screen',
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text(style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),'Home Screen'),
            backgroundColor: Colors.deepPurpleAccent,
            centerTitle: true,
          ),
          bottomNavigationBar: Material(
            color: Colors.deepPurpleAccent,
            child: Builder(
              builder: (ctx)=>TabBar(
                onTap: (index) async{
                  await showDialog(
                    context: ctx,
                    builder: (_) => AlertDialog(
                      title: const Text("test"),
                      content: index == 0 ? tab1Text : tab2Text,
                      actions: [
                        TextButton(
                          onPressed:() => Navigator.pop(ctx),
                          child: const Text("Dimiss")
                        )
                      ]
                    )
                  );
                },
                unselectedLabelColor: Colors.white,
                labelColor: Colors.amber,
                tabs: [
                  Tab(icon: Icon(Icons.add_circle), text: "Act 3: Home",),
                  Tab(icon: Icon(Icons.abc_outlined),text: "Act 2: Gallery",),
                ],
              ),
            ),
          ),
          body: const TabBarView(
            children: [
              ColoredBox(
                color: Colors.white60,
                child: Center(
                  child: CardHome(),
                ),
              ),
              ColoredBox(
                color: Colors.white60,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 120.0),
                    child: LocalImageDemo()
                  ),
                ),
              ),
            ]
          )
        )
      )
    );
  }
}

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Text(
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        'Hello! :). If second tab does not appear please make sure that local_image_demo.dart is also included in the lib',
      )
    );
  }
}

class CardHome extends StatelessWidget{
  const CardHome({super.key});

  @override
  Widget build(BuildContext context) {

    const double fontSize = 24;
    // final snackBar = SnackBar(content: const Text("Made by Krystian L. Genson for Mobile Dev II"));
    final alertDialog = AlertDialog(
      content: const Text("Made by Krystian L. Genson for Mobile Dev II"),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Dismiss"),
        ),
      ],
    );
    return(
      Card(
        color: Colors.deepPurpleAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 4.0,
        shadowColor: Colors.black.withValues(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 300,
            maxWidth: 380
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  style: TextStyle(
                    fontWeight: FontWeight.bold, 
                    color: Colors.black,
                    fontSize: fontSize
                  ),
                  'Hello! 😀'
                ),
                SizedBox(height: 8),
                Text(
                  style: TextStyle(
                    fontWeight: FontWeight.bold, 
                    color: Colors.black,
                    fontSize: fontSize
                  ),
                  'If second tab does not appear please make sure that local_image_demo.dart is also included in the lib'
                ),
                SizedBox(height: 8),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.amberAccent, // button background
                    foregroundColor: Colors.white,            // text (and icon) color
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  // onPressed: (){ScaffoldMessenger.of(context).showSnackBar(snackBar);},
                  onPressed: () async{
                    await showDialog(context: context, builder: (_)=>alertDialog);
                  },
                  child: Text(
                    "Welcome!", 
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold
                    )
                  )
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}



class LocalImageDemo extends StatelessWidget {
  const LocalImageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left image
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min, // keep height compact
                children: [
                  Image.asset(
                    'assets/images/facebook.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 5), // space between image
                  const Text(
                    'Facebook',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
            // Center image
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min, // keep height compact
                children: [
                  Image.asset(
                    'assets/images/instagram.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 5), // space between image
                  const Text(
                    'Instagram',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min, // keep height compact
                children: [
                  Image.asset(
                    'assets/images/linkedin.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 5), // space between image
                  const Text(
                    'Flutter Logo',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min, // keep height compact
                children: [
                  Image.asset(
                    'assets/images/telegram.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 5), // space between image
                  const Text(
                    'Telegram',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left image
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min, // keep height compact
                children: [
                  Image.asset(
                    'assets/images/twitter.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 5), // space between image
                  const Text(
                    'Twitter',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
            // Center image
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min, // keep height compact
                children: [
                  Image.asset(
                    'assets/images/whatsapp.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 5), // space between image
                  const Text(
                    'Whatsapp',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min, // keep height compact
                children: [
                  Image.asset(
                    'assets/images/youtube.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 5), // space between image
                  const Text(
                    'Youtube',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min, // keep height compact
                children: [
                  Image.asset(
                    'assets/images/apple.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 5), // space between image
                  const Text(
                    'Apple',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left image
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min, // keep height compact
                children: [
                  Image.asset(
                    'assets/images/behance.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 5), // space between image
                  const Text(
                    'Behance',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
            // Center image
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min, // keep height compact
                children: [
                  Image.asset(
                    'assets/images/discord.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 5), // space between image
                  const Text(
                    'Discord',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min, // keep height compact
                children: [
                  Image.asset(
                    'assets/images/facebook-messenger.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 5), // space between image
                  const Text(
                    'Messenger',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min, // keep height compact
                children: [
                  Image.asset(
                    'assets/images/furniture.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 5), // space between image
                  const Text(
                    'Furniture',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left image
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min, // keep height compact
                children: [
                  Image.asset(
                    'assets/images/github.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 5), // space between image
                  const Text(
                    'Github',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
            // Center image
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min, // keep height compact
                children: [
                  Image.asset(
                    'assets/images/google.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 5), // space between image
                  const Text(
                    'Google',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min, // keep height compact
                children: [
                  Image.asset(
                    'assets/images/photoshop.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 5), // space between image
                  const Text(
                    'Photoshop',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min, // keep height compact
                children: [
                  Image.asset(
                    'assets/images/pinterest.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 5), // space between image

                  const Text(
                    'pinterest',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left image
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min, // keep height compact
                children: [
                  Image.asset(
                    'assets/images/problem.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 5), // space between image

                  const Text(
                    'Problem solver',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
            // Center image
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min, // keep height compact
                children: [
                  Image.asset(
                    'assets/images/shipping.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 5), // space between image

                  const Text(
                    'Shipping',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min, // keep height compact
                children: [
                  Image.asset(
                    'assets/images/telegram.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 5), // space between image

                  const Text(
                    'Telegram',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min, // keep height compact
                children: [
                  Image.asset(
                    'assets/images/tik-tok.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 5), // space between image

                  const Text(
                    'Tik-tok',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left image
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min, // keep height compact
                children: [
                  Image.asset(
                    'assets/images/vk.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 5), // space between image

                  const Text(
                    'VK',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
            // Center image
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min, // keep height compact
                children: [
                  Image.asset(
                    'assets/images/medical.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 5), // space between image

                  const Text(
                    'Medical app',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min, // keep height compact
                children: [
                  Image.asset(
                    'assets/images/computer.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 5), // space between image

                  const Text(
                    'Computer connect',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min, // keep height compact
                children: [
                  Image.asset(
                    'assets/images/graph.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 5), // space between image

                  const Text(
                    'Graph',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}