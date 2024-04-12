import 'package:flutter/material.dart';
import 'package:seu_projeto/app/views/desktop/form/form_page_desktop.dart';
import 'package:seu_projeto/app/views/desktop/home/components/carrosel_seguradoras.dart';
import 'package:seu_projeto/app/views/desktop/home/components/carrosel_seguros.dart';
import 'package:seu_projeto/app/views/desktop/home/components/footer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seu_projeto/app/colors.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    'lib/assets/imgs/logo_centaurus.png',
                    height: 100,
                  ),
                  Expanded(child: SizedBox()),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              30), // Ajuste o valor para definir o arredondamento desejado
                        ),
                        padding: EdgeInsets.all(0),
                        backgroundColor: AppColors.primaryColor),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MailFormDesktop()),
                      );
                    },
                    child: Container(
                      width: 130,
                      height: 45,
                      child: Center(
                        child: Text(
                          'Cotar Seguro',
                          style: GoogleFonts.lato(
                            textStyle:
                                TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
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
                width: 20,
              ),
              Center(
                  child: Text(
                'Sobre Nós',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 34,
                      fontWeight: FontWeight.w600),
                ),
              )),
              SizedBox(
                height: 20,
              ),
              Container(
                //color: Colors.red,
                width: 750,
                child: Center(
                    child: Text(
                  'Bem-vindo à Centaurus Corretora de Seguros! Há mais de três décadas, estamos comprometidos em fornecer soluções de seguros de qualidade em todo o Brasil, com sede em Salvador, Bahia. Nosso foco é simplificar a proteção de seus bens mais preciosos, oferecendo uma variedade de produtos personalizados. \nOperamos com ética e profissionalismo, priorizando a satisfação do cliente em cada interação. Conte conosco para proteger o que é mais importante para você. Entre em contato hoje mesmo e descubra como podemos ajudar a garantir a segurança de seus bens.',
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.w400),
                  ),
                )),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                  child: Text(
                'Seguros',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 34,
                      fontWeight: FontWeight.w600),
                ),
              )),
              SizedBox(
                height: 30,
              ),
              Carrossel(),
              SizedBox(
                height: 50,
              ),
              Center(
                  child: Text(
                'Seguradoras',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 34,
                      fontWeight: FontWeight.w600),
                ),
              )),
              SizedBox(
                height: 30,
              ),
              CarrosselSeguradoras(),
              FooterDesktop()
            ],
          ),
        ),
      ),
    );
  }
}
