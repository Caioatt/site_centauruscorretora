import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seu_projeto/app/colors.dart';

class AutomovelPop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Coberturas Seguro Auto',
        style: GoogleFonts.lato(
            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
      ),
      content: Text(
          'Danos Materiais\nDanos Corporais\nDanos morais\nMorte/Invalidez\nCarro reserva\nAssistencia 24horas\nCobertura para Vidros\nPequnenos Reparos Martelinho de ouro\nOutras',
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

class CaminhaoPop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Coberturas Seguro Caminhaão',
        style: GoogleFonts.lato(
            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
      ),
      content: Text(
          'Danos Materiais\nDanos Corporais\nDanos morairs\nCobertura para carroceria\nmorte/invalidez\aAssistencia 24horas\nOutras',
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

class NauticoPop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Coberturas Seguro Nautico',
        style: GoogleFonts.lato(
            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
      ),
      content: Text(
          'Incendio\nCasco\nCobertura Para Teceiros\n Remoção de Destroços\nOutras',
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

class ResidencialPop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Coberturas Seguro Residencial',
        style: GoogleFonts.lato(
            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
      ),
      content: Text(
          'Incendio\nvendaval\ndanos eletricos\nAssitencia Resildencial\nResponsabilidade Civil\nOutras',
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

class EmpresarialPop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Coberturas Seguro Empresarial',
        style: GoogleFonts.lato(
            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
      ),
      content: Text(
          'Incendio\nVendaval\nDanos eletricos\nSubtração de Bens\nQuebra de Vidros\nOutras',
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

class CondominioPopUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Coberturas Seguro Condominio',
        style: GoogleFonts.lato(
            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
      ),
      content: Text(
          'Incendio\nVendaval\nDanos eletricos\nResponsabilidade Civil\nSeguro de Vida Funcionarios\nOutras',
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

class VidaPop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Coberturas Seguro Vida',
        style: GoogleFonts.lato(
            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
      ),
      content: Text('Morte\nInvalidez\nAuxilio Funeral\nDoenças Graves\nOutras',
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

class SuadePop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Coberturas Seguro Saude',
          style: GoogleFonts.lato(
              textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600))),
      content: Text('Bradesco\nSulamerica\nAmil\nHapVida\nOutras',
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

class DispositivosPop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Coberturas Seguro Dispostivos Portateis',
        style: GoogleFonts.lato(
            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
      ),
      content: Text(
          'Furto\nRoubo\nFurto e roubo\nDanos por querda\nDanos por agua',
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

class ViagemPop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Coberturas Seguro Viagem',
        style: GoogleFonts.lato(
            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
      ),
      content: Text(
          'Despesas Medicas\n Despesas Hospitalares\n Despesas Farmaceuticas',
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
