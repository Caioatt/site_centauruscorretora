import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seu_projeto/app/colors.dart';
import 'package:seu_projeto/app/views/desktop/home/components/popUp_desktop.dart';

class CarrosselItem {
  final String imagePath;
  final String text;
  final double imageHeight;
  final double imageWidth;
  final DialogType dialogType;

  CarrosselItem({
    required this.imagePath,
    required this.text,
    required this.imageHeight,
    required this.imageWidth,
    required this.dialogType,
  });

  Widget buildDialog(BuildContext context) {
    switch (dialogType) {
      case DialogType.Custom:
        return CustomDialog();
      case DialogType.OtherType:
        return OtherDialog();
      case DialogType.Automovel:
        return AutomovelPop();
      case DialogType.Caminhao:
        return CaminhaoPop();
      case DialogType.Nautico:
        return NauticoPop();
      case DialogType.Residencial:
        return ResidencialPop();
      case DialogType.Empresarial:
        return EmpresarialPop();
      case DialogType.Vida:
        return VidaPop();
      case DialogType.Saude:
        return SuadePop();
      case DialogType.Dispositivos:
        return DispositivosPop();
      case DialogType.Condominio:
        return CondominioPopUp();
      case DialogType.Viagem:
        return ViagemPop();
    }
  }
}

enum DialogType {
  Custom,
  OtherType,
  Automovel,
  Caminhao,
  Nautico,
  Residencial,
  Condominio,
  Empresarial,
  Vida,
  Saude,
  Dispositivos,
  Viagem,

  // Adicione mais tipos de diálogos conforme necessário
}

class Carrossel extends StatefulWidget {
  @override
  _CarrosselState createState() => _CarrosselState();
}

class _CarrosselState extends State<Carrossel> {
  late final PageController _controller;

  final List<CarrosselItem> items = [
    CarrosselItem(
        imagePath: 'lib/assets/imgs/carro.png',
        text: 'Automoveis',
        imageHeight: 150.0,
        imageWidth: 200.0,
        dialogType: DialogType.Automovel),
    CarrosselItem(
        imagePath: 'lib/assets/imgs/caminhao.png',
        text: 'Caminhão',
        imageHeight: 130.0,
        imageWidth: 250.0,
        dialogType: DialogType.Caminhao),
    CarrosselItem(
        imagePath: 'lib/assets/imgs/nautico.png',
        text: 'Nautico',
        imageHeight: 150.0,
        imageWidth: 220.0,
        dialogType: DialogType.Nautico),

    CarrosselItem(
        imagePath: 'lib/assets/imgs/residencial.png',
        text: 'Residencial',
        imageHeight: 150.0,
        imageWidth: 220.0,
        dialogType: DialogType.Residencial),

    CarrosselItem(
        imagePath: 'lib/assets/imgs/empresarial.png',
        text: 'Empresarial',
        imageHeight: 150.0,
        imageWidth: 180.0,
        dialogType: DialogType.Empresarial),

    CarrosselItem(
        imagePath: 'lib/assets/imgs/condominio.png',
        text: 'Condominio',
        imageHeight: 150.0,
        imageWidth: 180.0,
        dialogType: DialogType.Condominio),

    CarrosselItem(
        imagePath: 'lib/assets/imgs/vida.png',
        text: 'Vida',
        imageHeight: 150.0,
        imageWidth: 190.0,
        dialogType: DialogType.Vida),

    CarrosselItem(
        imagePath: 'lib/assets/imgs/saude.png',
        text: 'Saude',
        imageHeight: 170.0,
        imageWidth: 210.0,
        dialogType: DialogType.Saude),

    CarrosselItem(
        imagePath: 'lib/assets/imgs/iphone.png',
        text: 'Dispositivos Eletronicos',
        imageHeight: 160.0,
        imageWidth: 190.0,
        dialogType: DialogType.Dispositivos),

    CarrosselItem(
        imagePath: 'lib/assets/imgs/viagem.png',
        text: 'Viagem',
        imageHeight: 160.0,
        imageWidth: 190.0,
        dialogType: DialogType.Viagem),
    // Adicione mais itens conforme necessário
  ];

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
              return Container(
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
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return item.buildDialog(context);
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
            },
          ),
        ),
      ],
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

class OtherDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Other Popup Title'),
      content: Text('This is another popup message.'),
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
