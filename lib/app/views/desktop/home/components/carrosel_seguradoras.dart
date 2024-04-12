import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Importe este pacote para usar o lançador de URL

class CarrosselItem {
  final String imagePath;
  final String text;
  final double imageHeight;
  final double imageWidth;
  final String url; // Adicione a URL da seguradora

  CarrosselItem({
    required this.imagePath,
    required this.text,
    required this.imageHeight,
    required this.imageWidth,
    required this.url, // Inclua a URL no construtor
  });
}

class CarrosselSeguradoras extends StatefulWidget {
  @override
  _CarrosselState createState() => _CarrosselState();
}

class _CarrosselState extends State<CarrosselSeguradoras> {
  final List<CarrosselItem> items = [
    CarrosselItem(
      imagePath: 'lib/assets/imgs/liberty.png',
      text: ' ',
      imageHeight: 105.0,
      imageWidth: 200.0,
      url: 'https://www.libertyseguros.com.br/', // URL da primeira seguradora
    ),

    CarrosselItem(
      imagePath: 'lib/assets/imgs/porto.png',
      text: ' ',
      imageHeight: 105.0,
      imageWidth: 280.0,
      url: 'https://www.portoseguro.com.br/', // URL da primeira seguradora
    ),

    CarrosselItem(
      imagePath: 'lib/assets/imgs/suhai2.png',
      text: ' ',
      imageHeight: 75.0,
      imageWidth: 600.0,
      url:
          'https://www.bradescoseguros.com.br/clientes', // URL da primeira seguradora
    ),

    CarrosselItem(
      imagePath: 'lib/assets/imgs/bradesco_desktop.png',
      text: ' ',
      imageHeight: 85.0,
      imageWidth: 250.0,
      url:
          'https://www.bradescoseguros.com.br/clientes', // URL da primeira seguradora
    ),

    CarrosselItem(
      imagePath: 'lib/assets/imgs/allianz.png',
      text: '',
      imageHeight: 105.0,
      imageWidth: 280.0,
      url: 'https://www.allianz.com.br/', // URL da primeira seguradora
    ),

    CarrosselItem(
      imagePath: 'lib/assets/imgs/hdi.png',
      text: '',
      imageHeight: 105.0,
      imageWidth: 200.0,
      url: 'https://www.hdiseguros.com.br/', // URL da primeira seguradora
    ),

    CarrosselItem(
      imagePath: 'lib/assets/imgs/tokyo.png',
      text: '',
      imageHeight: 105.0,
      imageWidth: 200.0,
      url: 'https://www.tokiomarine.com.br/', // URL da primeira seguradora
    ),
    // Adicione URLs para outras seguradoras conforme necessário
  ];

  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      viewportFraction: 0.2,
      initialPage: 2,
    );

    // Inicia o rolar automático
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _startAutoScroll();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    Future.delayed(Duration(seconds: 6)).then((_) {
      if (_controller.hasClients) {
        _controller.nextPage(
          duration: Duration(milliseconds: 3500),
          curve: Curves.easeInOut,
        );
        _startAutoScroll(); // Continua o rolar automático
      }
    });
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 10),
        SizedBox(
          height: 300.0,
          child: PageView.builder(
            controller: _controller,
            itemCount: items.length * 10,
            itemBuilder: (BuildContext context, int index) {
              final item = items[index % items.length];
              return GestureDetector(
                onTap: () {
                  _launchURL(item.url); // Chama a função para abrir a URL
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      Text(
                        item.text,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        height: item.imageHeight,
                        width: item.imageWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage(item.imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
