import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seu_projeto/app/colors.dart';
import 'package:seu_projeto/app/views/desktop/home/home_screen.dart';
import 'package:seu_projeto/app/views/mobile/home/home_screen.dart';

class ErroPageMobile extends StatelessWidget {
  const ErroPageMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Image.asset(
              'lib/assets/imgs/logo_centaurus.png',
              height: 70,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text('Ocorreu um ero e a cotação nao foi enviada!',
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                color: const Color.fromARGB(255, 46, 43, 43),
                fontSize: 22,
              ))),
          Center(
            child: Text(
              'Contate suporte em (71) 99179 - 5033',
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        20), // Ajuste o valor para definir o arredondamento desejado
                  ),
                  padding: EdgeInsets.all(0),
                  backgroundColor: AppColors.primaryColor),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeMobile()),
                );
              },
              child: Container(
                width: 100,
                height: 30,
                child: Center(
                  child: Text(
                    'Voltar',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SucessPageMobile extends StatelessWidget {
  const SucessPageMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Image.asset(
              'lib/assets/imgs/logo_centaurus.png',
              height: 70,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text('Cotação enviada com sucesso!',
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                color: const Color.fromARGB(255, 46, 43, 43),
                fontSize: 22,
              ))),
          Center(
            child: Text(
              '     Prazo de 60 minutos\npara retorno no whaatspp',
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        20), // Ajuste o valor para definir o arredondamento desejado
                  ),
                  padding: EdgeInsets.all(0),
                  backgroundColor: AppColors.primaryColor),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeMobile()),
                );
              },
              child: Container(
                width: 100,
                height: 30,
                child: Center(
                  child: Text(
                    'Voltar',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
