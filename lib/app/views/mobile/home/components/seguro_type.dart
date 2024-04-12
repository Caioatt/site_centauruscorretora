import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seu_projeto/app/colors.dart';
import 'package:seu_projeto/app/views/mobile/home/components/popUp_mobile.dart';

class AutoImage extends StatelessWidget {
  const AutoImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
              child: Text(
            'Automoveis',
            style: GoogleFonts.lato(
              textStyle: TextStyle(color: Colors.black, fontSize: 25),
            ),
          )),
          Image.asset(
            'lib/assets/imgs/carro.png',
            height: 100,
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AutomovelPop();
                },
              );
            },
            child: Text(
              'Ver Corbeturas',
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600)),
            ),
          )
        ],
      ),
    );
  }
}

class CaminhaoImage extends StatelessWidget {
  const CaminhaoImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
              child: Text(
            'Caminhão',
            style: GoogleFonts.lato(
              textStyle: TextStyle(color: Colors.black, fontSize: 25),
            ),
          )),
          SizedBox(
            height: 10,
          ),
          Image.asset(
            'lib/assets/imgs/caminhao.png',
            height: 90,
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CaminhaoPop();
                },
              );
            },
            child: Text(
              'Ver Corbeturas',
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600)),
            ),
          )
        ],
      ),
    );
  }
}

class Nautico extends StatelessWidget {
  const Nautico({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
              child: Text(
            'Nautico',
            style: GoogleFonts.lato(
              textStyle: TextStyle(color: Colors.black, fontSize: 25),
            ),
          )),
          Image.asset(
            'lib/assets/imgs/nautico.png',
            height: 90,
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return NauticoPop();
                },
              );
            },
            child: Text(
              'Ver Corbeturas',
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600)),
            ),
          )
        ],
      ),
    );
  }
}

class Residencial extends StatelessWidget {
  const Residencial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
              child: Text(
            'residencial',
            style: GoogleFonts.lato(
              textStyle: TextStyle(color: Colors.black, fontSize: 25),
            ),
          )),
          Image.asset(
            'lib/assets/imgs/residencial.png',
            height: 95,
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ResidencialPop();
                },
              );
            },
            child: Text(
              'Ver Corbeturas',
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600)),
            ),
          )
        ],
      ),
    );
  }
}

class Condominio extends StatelessWidget {
  const Condominio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
              child: Text(
            'Condominio',
            style: GoogleFonts.lato(
              textStyle: TextStyle(color: Colors.black, fontSize: 25),
            ),
          )),
          Image.asset(
            'lib/assets/imgs/condominio.png',
            height: 105,
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CondominioPop();
                },
              );
            },
            child: Text(
              'Ver Corbeturas',
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600)),
            ),
          )
        ],
      ),
    );
  }
}

class Empresarial extends StatelessWidget {
  const Empresarial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
              child: Text(
            'Empresarial',
            style: GoogleFonts.lato(
              textStyle: TextStyle(color: Colors.black, fontSize: 25),
            ),
          )),
          Image.asset(
            'lib/assets/imgs/empresarial.png',
            height: 90,
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return EmpresarialPop();
                },
              );
            },
            child: Text(
              'Ver Corbeturas',
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600)),
            ),
          )
        ],
      ),
    );
  }
}

class CondominioPop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Coberturas Seguro Condominio',
        style: GoogleFonts.lato(
            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
      ),
      content: Text('Incendio\nVendaval\nDanos eletricos',
          style: GoogleFonts.lato(
              textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500))),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Fechar',
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor))),
        ),
      ],
    );
  }
}

class Vida extends StatelessWidget {
  const Vida({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
              child: Text(
            'vida',
            style: GoogleFonts.lato(
              textStyle: TextStyle(color: Colors.black, fontSize: 25),
            ),
          )),
          Image.asset(
            'lib/assets/imgs/vida.png',
            height: 110,
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return VidaPop();
                },
              );
            },
            child: Text(
              'Ver Corbeturas',
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600)),
            ),
          )
        ],
      ),
    );
  }
}

class Saude extends StatelessWidget {
  const Saude({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
              child: Text(
            'Saude',
            style: GoogleFonts.lato(
              textStyle: TextStyle(color: Colors.black, fontSize: 25),
            ),
          )),
          Image.asset(
            'lib/assets/imgs/saude.png',
            height: 90,
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return SuadePop();
                },
              );
            },
            child: Text(
              'Ver Corbeturas',
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600)),
            ),
          )
        ],
      ),
    );
  }
}

class Viagem extends StatelessWidget {
  const Viagem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
              child: Text(
            'Viagem',
            style: GoogleFonts.lato(
              textStyle: TextStyle(color: Colors.black, fontSize: 25),
            ),
          )),
          Image.asset(
            'lib/assets/imgs/viagem.png',
            height: 90,
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return DispositivosPop();
                },
              );
            },
            child: Text(
              'Ver Corbeturas',
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600)),
            ),
          )
        ],
      ),
    );
  }
}

class Mobiles extends StatelessWidget {
  const Mobiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
              child: Text(
            'Dispositivos',
            style: GoogleFonts.lato(
              textStyle: TextStyle(color: Colors.black, fontSize: 25),
            ),
          )),
          Image.asset(
            'lib/assets/imgs/iphone.png',
            height: 110,
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return DispositivosPop();
                },
              );
            },
            child: Text(
              'Ver Corbeturas',
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600)),
            ),
          )
        ],
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Coberturas Seguro Auto'),
      content: Text('Danos Materiais.\nDanos Corporais'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}
