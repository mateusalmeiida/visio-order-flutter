import 'package:flutter/material.dart';
import 'package:visio_order/data/colors_data.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    final double widthContainerText;
    final double sizeImage;
    final double widthContainerName;
    final double fontSize;
    if (screenWidth <= 400) {
      widthContainerText = 300;
      sizeImage = 70;
      widthContainerName = widthContainerText * 0.6;
      fontSize = 16;
    } else if (screenWidth <= 600) {
      widthContainerText = 425;
      sizeImage = 85;
      widthContainerName = widthContainerText * 0.5;
      fontSize = 17;
    } else if (screenWidth <= 800) {
      widthContainerText = 450;
      sizeImage = 100;
      widthContainerName = widthContainerText * 0.5;
      fontSize = 18;
    } else if (screenWidth <= 1000) {
      widthContainerText = 500;
      sizeImage = 115;
      widthContainerName = widthContainerText * 0.45;
      fontSize = 20;
    } else {
      widthContainerText = 650;
      sizeImage = 130;
      widthContainerName = widthContainerText * 0.35;
      fontSize = 22;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Visio Order'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: ColorsData.colorsAlgorithm['Insertion Sort']!)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 40, bottom: 40),
              child: Text(
                'Sobre',
                style: TextStyle(
                    fontFamily: 'BebasNeue',
                    fontSize: 30,
                    color: ColorsData.colorsAlgorithm['Insertion Sort']![1]),
              ),
            ),
            SizedBox(
              width: widthContainerText,
              child: SelectableText(
                  style: TextStyle(fontSize: fontSize),
                  textAlign: TextAlign.justify,
                  'Este aplicativo foi desenvolvido como parte de um Trabalho de Conclusão de Curso (TCC) em Engenharia da Computação, '
                  'com o objetivo de auxiliar no aprendizado de algoritmos de ordenação por meio de uma experiência visual e interativa. '
                  'Nele, você pode explorar diferentes algoritmos, ajustando a velocidade e observando o funcionamento passo a passo. '
                  'A interface intuitiva permite selecionar o algoritmo, definir o tamanho do conjunto de dados e até inserir valores manualmente para personalizar sua experiência.\n\n'
                  'Este aplicativo é uma ferramenta educacional projetada para facilitar a compreensão dos conceitos e da lógica por '
                  'trás dos algoritmos de ordenação, sendo ideal para estudantes e entusiastas da área de computação.\n\n'
                  'Link para o documento escrito:\n'
                  'https://drive.google.com/drive/folders/1N-U2Tuwl8mtECx2-4g0FxPRggXtkqlpC?usp=sharing'),
            ),
            Container(
              padding: EdgeInsets.only(top: 50),
              alignment: Alignment.topLeft,
              width: widthContainerText,
              child: Row(
                children: [
                  ClipOval(
                    child: Image(
                      image: AssetImage('assets/images/telaSobre1.jpg'),
                      width: sizeImage,
                      height: sizeImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: widthContainerName,
                        child: FittedBox(
                          child: Text(
                            'Mateus de Almeida Ribeiro',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ColorsData
                                    .colorsAlgorithm['Insertion Sort']![1]),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: widthContainerName,
                        child: FittedBox(
                          child: Text(
                            'github.com/mateusalmeiida',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
