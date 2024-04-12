import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:seu_projeto/app/colors.dart';
import 'package:seu_projeto/app/views/mobile/form/sucess_page.dart';
import 'package:seu_projeto/app/token_api.dart';

import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class MailgunService {
  static Future<void> sendEmail({
    required String apiKey,
    required String domain,
    required String from,
    required String to,
    required String subject,
    required String text,
  }) async {
    final url = Uri.parse('https://api.mailgun.net/v3/$domain/messages');
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Basic ${base64Encode(utf8.encode('api:$apiKey'))}',
      },
      body: {
        'from': from,
        'to': to,
        'subject': subject,
        'text': text,
      },
    );

    if (response.statusCode == 200) {
      print('E-mail enviado com sucesso!');
    } else {
      print('Falha ao enviar e-mail - ${response.statusCode}');
      throw Exception('Erro ao enviar e-mail');
    }
  }
}

class MailFormMobile extends StatefulWidget {
  @override
  _MailFormMobile createState() => _MailFormMobile();
}

class _MailFormMobile extends State<MailFormMobile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _cpfController = MaskedTextController(mask: '000.000.000-00');
  final _nomeController =
      MaskedTextController(mask: '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
  final _estadoCivilController = MaskedTextController(mask: '@@@@@@@@@');
  final _telefoneController = MaskedTextController(mask: '(00) 90000 - 0000');
  final _cepPernoiteController = MaskedTextController(mask: '00000 - 000');
  final _modeloVeiculoController = TextEditingController();
  final _placaController = MaskedTextController(mask: '@@@@@@@');
  final _anoFabricacaoController = MaskedTextController(mask: '0000');
  final _anoModeloController = MaskedTextController(mask: '0000');
  bool _possuiGaragem = false;
  bool _veiculo0km = false;
  bool _menor24DirigeVeiculo = false;
  bool _outrocondutor = false;
  final _cpfCondutor = MaskedTextController(mask: '000.000.000-00');
  final _nomeCondutor =
      MaskedTextController(mask: '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
  final _estadoCivilCondutor = MaskedTextController(mask: '@@@@@@@@@');

  bool _renovacao = false;
  final _sexoMenor24Controller = MaskedTextController(mask: 'AAA');
  final _classeBonusController = MaskedTextController(mask: '00');
  final _infosComplementares = MaskedTextController(
      mask:
          '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');

  Future<void> _enviarFormulario() async {
    try {
      await MailgunService.sendEmail(
        apiKey: tokenapi,
        domain: 'sandbox7337e1a97e2e44f99dbd60d48e9a8897.mailgun.org',
        from: 'calculocentaurus@centaurus.com.br',
        to: 'caioatt9@gmail.com',
        subject: 'Cotação de Seguro',
        text: _buildEmailContent(),
      );
      print('E-mail enviado com sucesso!');

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SucessPageMobile()),
      );
    } catch (error) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ErroPageMobile()),
      );
      print('Erro ao enviar e-mail: $error');
    }
  }

  String _buildEmailContent() {
    // Aqui você pode construir o conteúdo do e-mail com base nos dados do formulário
    return '''
    CPF: ${_cpfController.text}
    Nome: ${_nomeController.text}
    Estado Civil: ${_estadoCivilController.text}
    Telefone para Contato ${_telefoneController.text}
    Cep Pernoite ${_cepPernoiteController.text}
    outro condutor ${_outrocondutor}
    CPF condutor${_cpfCondutor.text}
    Nome do Condutor ${_nomeCondutor.text}
    Estado Civil Condutor ${_estadoCivilCondutor.text}
    Modelo do Veiculo ${_modeloVeiculoController.text}
    Ano de Fabricação ${_anoFabricacaoController.text}
    Ano Modelo ${_anoModeloController.text}
    Veiculo Possui Garagem? ${_possuiGaragem}
    Veiculo 0KM? ${_veiculo0km}
    Alguem menor de 24 anos dirige o veiculo? ${_menor24DirigeVeiculo}
    é uma renovação?${_renovacao}
    sexo menor 24 ${_sexoMenor24Controller.text}
    classe de bonus  ${_classeBonusController.text}
        ''';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Image.asset(
                  'lib/assets/imgs/logo_centaurus.png',
                  height: 150,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  'Cotar seguro auto',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor),
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Center(
                child: Container(
                  // color: Colors.blue,
                  width: 580,
                  child: Column(
                    children: [
                      Text(
                        '   Olá, por favor, preencha o formulário abaixo com todas as informações necessárias. Em até 1 hora, você receberá uma mensagem com sua cotação!\nCaso deseje cotar outro tipo de seguro, entre em contato pelo WhatsApp. ',
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontSize: 26,
                          ),
                        ),
                      ),
                      Text(
                        '                      \n\nHorário de funcionamento:',
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontSize: 26,
                          ),
                        ),
                      ),
                      Text(
                        '\nseg a sex 08:30 as 17:30',
                        textAlign: TextAlign.end,
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        )),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 45,
              ),
              Center(
                child: Text(
                  'Segurado',
                  // textAlign: TextAlign.end,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                    fontSize: 29,
                    fontWeight: FontWeight.w600,
                  )),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                  width: 650,
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        child: TextFormField(
                          controller: _cpfController,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.primaryColor, width: 2.5),
                                borderRadius: BorderRadius.circular(
                                    10.0), // Define as bordas arredondadas
                              ),
                              labelText: 'CPF',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 3.5),
                                borderRadius: BorderRadius.circular(
                                    10.0), // Define as bordas arredondadas
                              )),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        child: TextFormField(
                          controller: _nomeController,
                          decoration: InputDecoration(
                              labelText: 'Nome',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.primaryColor, width: 2.5),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 3.5),
                                borderRadius: BorderRadius.circular(
                                    10.0), // Define as bordas arredondadas
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        child: TextFormField(
                          controller: _estadoCivilController,
                          decoration: InputDecoration(
                              labelText: 'Estado Civil',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.primaryColor, width: 2.5),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 3.5),
                                borderRadius: BorderRadius.circular(
                                    10.0), // Define as bordas arredondadas
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        child: TextFormField(
                          controller: _telefoneController,
                          decoration: InputDecoration(
                              labelText: 'Telefone de Contato',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.primaryColor, width: 2.5),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 3.5),
                                borderRadius: BorderRadius.circular(
                                    10.0), // Define as bordas arredondadas
                              )),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        child: TextFormField(
                          controller: _cepPernoiteController,
                          decoration: InputDecoration(
                              labelText: 'CEP Pernoite',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.primaryColor, width: 2.5),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 3.5),
                                borderRadius: BorderRadius.circular(
                                    10.0), // Define as bordas arredondadas
                              )),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          CheckboxListTile(
                            title:
                                Text('Condutor do veiculo não é o segurado?'),
                            value: _outrocondutor,
                            onChanged: (value) {
                              setState(() {
                                _outrocondutor = value!;
                              });
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          _outrocondutor
                              ? Column(
                                  children: [
                                    Text(
                                      'Condutor',
                                      // textAlign: TextAlign.end,
                                      style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                        fontSize: 29,
                                        fontWeight: FontWeight.w600,
                                      )),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      height: 50,
                                      child: TextFormField(
                                        controller: _cpfCondutor,
                                        decoration: InputDecoration(
                                          labelText: 'CPF Condutor:',
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: AppColors.primaryColor,
                                              width: 2.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(width: 3.5),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),

                                    Container(
                                      height: 50,
                                      child: TextFormField(
                                        controller: _nomeCondutor,
                                        decoration: InputDecoration(
                                          labelText: 'Nome Completo:',
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: AppColors.primaryColor,
                                              width: 2.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(width: 3.5),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      height: 50,
                                      child: TextFormField(
                                        controller: _estadoCivilCondutor,
                                        decoration: InputDecoration(
                                          labelText:
                                              'Estado Civil do Condutor?',
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: AppColors.primaryColor,
                                              width: 2.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(width: 3.5),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    // Adicione mais campos aqui conforme necessário
                                  ],
                                )
                              : Container(), // Caso _outrocondutor seja falso, não exibir nada
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      //   Line(),
                      SizedBox(
                        height: 30,
                      ),
                      //caio7988
                      Row(
                        children: [
                          Expanded(child: Line()),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Veiculo',
                            // textAlign: TextAlign.end,
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                              fontSize: 29,
                              fontWeight: FontWeight.w600,
                            )),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(child: Line())
                        ],
                      ),

                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        height: 50,
                        child: TextFormField(
                          controller: _modeloVeiculoController,
                          decoration: InputDecoration(
                              labelText: 'Modelo Veículo',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.primaryColor, width: 2.5),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 3.5),
                                borderRadius: BorderRadius.circular(
                                    10.0), // Define as bordas arredondadas
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        child: TextFormField(
                          controller: _placaController,
                          decoration: InputDecoration(
                              labelText: 'Placa',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.primaryColor, width: 2.5),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 3.5),
                                borderRadius: BorderRadius.circular(
                                    10.0), // Define as bordas arredondadas
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        child: TextFormField(
                          controller: _anoFabricacaoController,
                          decoration: InputDecoration(
                              labelText: 'Ano Fabricação',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.primaryColor, width: 2.5),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 3.5),
                                borderRadius: BorderRadius.circular(
                                    10.0), // Define as bordas arredondadas
                              )),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        child: TextFormField(
                          controller: _anoModeloController,
                          decoration: InputDecoration(
                              labelText: 'Ano Modelo',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.primaryColor, width: 2.5),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 3.5),
                                borderRadius: BorderRadius.circular(
                                    10.0), // Define as bordas arredondadas
                              )),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      CheckboxListTile(
                        title: Text('veiculo 0km?'),
                        value: _veiculo0km,
                        onChanged: (value) {
                          setState(() {
                            _veiculo0km = value!;
                          });
                        },
                      ),
                      SizedBox(
                        height: 40,
                      ),

                      Row(
                        children: [
                          Expanded(child: Line()),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Questionario Riscos',
                            // textAlign: TextAlign.end,
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            )),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(child: Line())
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      CheckboxListTile(
                        title: Text('Possui Garagem?'),
                        value: _possuiGaragem,
                        onChanged: (value) {
                          setState(() {
                            _possuiGaragem = value!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title:
                            Text('Alguém com menos de 24 anos dirige veículo?'),
                        value: _menor24DirigeVeiculo,
                        onChanged: (value) {
                          setState(() {
                            _menor24DirigeVeiculo = value!;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _menor24DirigeVeiculo
                          ? Container(
                              height: 50,
                              child: TextFormField(
                                controller: _sexoMenor24Controller,
                                decoration: InputDecoration(
                                    labelText: 'Qual sexo?',
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.primaryColor,
                                          width: 2.5),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 3.5),
                                      borderRadius: BorderRadius.circular(
                                          10.0), // Define as bordas arredondadas
                                    )),
                              ),
                            )
                          : SizedBox(),
                      CheckboxListTile(
                        title: Text('Renovação?'),
                        value: _renovacao,
                        onChanged: (value) {
                          setState(() {
                            _renovacao = value!;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _renovacao
                          ? Container(
                              height: 50,
                              child: TextFormField(
                                controller: _classeBonusController,
                                decoration: InputDecoration(
                                    labelText: 'Classe de Bônus apolice atual ',
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.primaryColor,
                                          width: 2.5),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 3.5),
                                      borderRadius: BorderRadius.circular(
                                          10.0), // Define as bordas arredondadas
                                    )),
                              ),
                            )
                          : SizedBox(),

                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 50,
                        child: TextFormField(
                          controller: _infosComplementares,
                          decoration: InputDecoration(
                              labelText:
                                  'Informações Complementares, Ex: Coberturas desejads',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.primaryColor, width: 2.5),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 3.5),
                                borderRadius: BorderRadius.circular(
                                    10.0), // Define as bordas arredondadas
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
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
                  onPressed: _enviarFormulario,
                  child: Container(
                    width: 150,
                    height: 50,
                    child: Center(
                      child: Text(
                        'Cotar Seguro',
                        style: GoogleFonts.lato(
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Line extends StatelessWidget {
  const Line({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 3,
      color: AppColors.primaryColor,
    );
  }
}
