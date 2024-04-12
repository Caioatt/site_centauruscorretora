import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:seu_projeto/app/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clipboard/clipboard.dart';
import 'package:url_launcher/url_launcher.dart'; // Importe este pacote para usar o lançador de URL

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);
  final String _url_insta = 'https://www.instagram.com';
  final String _url_wpp =
      'https://api.whatsapp.com/send?phone=5571996474046&text=ol%C3%A1,%20Centaurus%20Corretora?';

  void _launchInsta() async {
    if (await canLaunch(_url_insta)) {
      await launch(_url_insta);
    } else {
      throw 'Could not launch $_url_insta';
    }
  }

  void _launchWpp() async {
    if (await canLaunch(_url_wpp)) {
      await launch(_url_wpp);
    } else {
      throw 'Could not launch $_url_wpp';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: AppColors.primaryColor,
      child: Column(
        children: [
          Center(
            child: Container(
              width: 300,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Av. Antônio Carlos Magalhães, 3244 - Caminho das Árvores, Salvador - BA, 41820-000 \n Sala 1108',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Center(
                    child: Row(
                      children: [
                        Expanded(
                            child: SizedBox(
                          width: 1,
                        )),
                        Text(
                          '(71) 3021 - 8600',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            _copyTextToClipboard('3021-8600');
                          },
                          icon: Icon(Icons.copy_outlined),
                          color: Colors.white,
                          hoverColor: Colors.black,
                        ),
                        Expanded(
                            child: SizedBox(
                          width: 1,
                        )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Center(
              child: Row(
            children: [
              Expanded(
                  child: SizedBox(
                width: 1,
              )),
              InkWell(
                onTap: _launchWpp,
                child: Image.asset(
                  'lib/assets/imgs/whatsapp.png',
                  height: 50,
                ),
              ),
              SizedBox(
                width: 40,
              ),
              InkWell(
                onTap: _launchInsta,
                child: Image.asset(
                  'lib/assets/imgs/insta.png',
                  height: 50,
                ),
              ),
              Expanded(
                  child: SizedBox(
                width: 1,
              )),
            ],
          )),
        ],
      ),
    );
  }
}

void _copyTextToClipboard(String text) {
  FlutterClipboard.copy(text).then((value) {
    // Callback quando a cópia é concluída com sucesso
    print('Text copied to clipboard: $text');
  });
}
