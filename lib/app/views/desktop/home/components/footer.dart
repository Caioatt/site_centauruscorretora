import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seu_projeto/app/colors.dart';
import 'package:url_launcher/url_launcher.dart'; // Importe este pacote para usar o lançador de URL
import 'package:clipboard/clipboard.dart';

class FooterDesktop extends StatelessWidget {
  const FooterDesktop({Key? key}) : super(key: key);

  final String _url_insta = 'https://www.instagram.com';
  final String _url_wpp = 'https://api.whatsapp.com/send?phone=5571996474046&text=ol%C3%A1,%20Centaurus%20Corretora?';

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
      color: AppColors.primaryColor,
      width: 10300,
      height: 240,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 30,
              ),
              Container(
                // color: Colors.black,
                width: 300,
                height: 220,
                child: Column(children: [
                  Text(
                    'Av. Antônio Carlos Magalhães, 3244, Empresarial Thome de souza  - Caminho das Árvores, Salvador - BA, 41820-000',
                    style: GoogleFonts.lato(
                        textStyle:
                            TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                  Row(
                    children: [
                      Text(
                        'Sala 1108 ',
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 23,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '(71) 3021 - 8600',
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 23,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        onPressed: () {
                          _copyTextToClipboard('3021-8600');
                        },
                        icon: Icon(Icons.copy_outlined),
                        color: Colors.white,
                        hoverColor: Colors.black,
                      )
                    ],
                  ),
                ]),
              ),
              Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: 40,
                    ),
                    InkWell(
                      onTap: _launchWpp,
                      child: Image.asset(
                        'lib/assets/imgs/whatsapp.png',
                        height: 50,
                      ),
                    ),
                    SizedBox(
                      width: 45,
                    ),
                    InkWell(
                        onTap: _launchInsta,
                        child: Image.asset(
                          'lib/assets/imgs/insta.png',
                          height: 50,
                        )),
                  ],
                ),
              )
            ],
          ),
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
