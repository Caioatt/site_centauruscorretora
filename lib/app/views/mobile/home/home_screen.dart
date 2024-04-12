import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seu_projeto/app/colors.dart';
import 'package:seu_projeto/app/views/mobile/form/form_page_mobile.dart';
import 'package:seu_projeto/app/views/mobile/form/sucess_page.dart';
import 'package:seu_projeto/app/views/mobile/home/components/footer.dart';
import 'package:seu_projeto/app/views/mobile/home/components/seguradoras.dart';
import 'package:seu_projeto/app/views/mobile/home/components/seguro_type.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    'lib/assets/imgs/logo_centaurus.png',
                    height: 70,
                  ),
                  Expanded(child: SizedBox()),
                  ElevatedButton(
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
                        MaterialPageRoute(
                            builder: (context) => MailFormMobile()),
                      );
                    },
                    child: Container(
                      width: 100,
                      height: 30,
                      child: Center(
                        child: Text(
                          'Cotar Seguro',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  )
                ],
              ),
              Center(
                  child: Text(
                ' Aplicação rodando Versão Beta Teste 1.0',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(color: Colors.black, fontSize: 20),
                ),
              )),
              SizedBox(
                height: 30,
              ),
              Center(
                  child: Text(
                'Sobre Nós',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(color: Colors.black, fontSize: 28),
                ),
              )),
              SizedBox(
                height: 25,
              ),
              Container(
                width: 360,
                child: Center(
                    child: Text(
                  'Bem-vindo à Centaurus Corretora de Seguros! Há mais de três décadas, estamos comprometidos em fornecer soluções de seguros de qualidade em todo o Brasil, com sede em Salvador, Bahia. Nosso foco é simplificar a proteção de seus bens mais preciosos, oferecendo uma variedade de produtos personalizados. ',
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                )),
              ),
              Container(
                width: 360,
                child: Center(
                    child: Text(
                  'Operamos com ética e profissionalismo, priorizando a satisfação do cliente em cada interação. Conte conosco para proteger o que é mais importante para você. Entre em contato hoje mesmo e descubra como podemos ajudar a garantir a segurança de seus bens.',
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                )),
              ),

              SizedBox(
                height: 25,
              ),
              Center(
                  child: Text(
                'Seguros',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(color: Colors.black, fontSize: 28),
                ),
              )),
              SizedBox(
                height: 25,
              ),
              Container(
                //color: Colors.red,
                width: 330,
                height: 1200,
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        AutoImage(),
                        CaminhaoImage(),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Nautico(),
                        SizedBox(
                          width: 20,
                        ),
                        Residencial(),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Condominio(),
                        SizedBox(
                          width: 20,
                        ),
                        Empresarial(),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Vida(),
                        SizedBox(
                          width: 30,
                        ),
                        Saude(),
                      ],
                    ),
                    Row(children: [
                      SizedBox(
                        width: 20,
                      ),
                      Mobiles(),
                      SizedBox(
                        width: 25,
                      ),
                      Viagem()
                    ]),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ), //box de seguros

              SizedBox(
                height: 50,
              ),
              Center(
                  child: Text(
                'Seguradoras',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(color: Colors.black, fontSize: 28),
                ),
              )),
              SizedBox(
                height: 20,
              ),
              Seguradoras(),
              SizedBox(
                height: 35,
              ),
              Footer()
            ],
          ),
        ),
      ),
    );
  }
}
