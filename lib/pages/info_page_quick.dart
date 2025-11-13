import 'package:flutter/material.dart';
import 'package:visio_order/data/colors_data.dart';

class InfoPageQuick extends StatelessWidget {
  const InfoPageQuick({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double widthContainerText;
    final double fontSize;
    if (screenWidth <= 400) {
      widthContainerText = 300;
      fontSize = 16;
    } else if (screenWidth <= 600) {
      widthContainerText = 425;
      fontSize = 17;
    } else if (screenWidth <= 800) {
      widthContainerText = 450;
      fontSize = 18;
    } else if (screenWidth <= 1000) {
      widthContainerText = 500;
      fontSize = 20;
    } else {
      widthContainerText = 650;
      fontSize = 22;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Quick Sort'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: ColorsData.colorsAlgorithm['Quick Sort']!)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 40, bottom: 40),
              child: Text(
                'Descrição do Algoritmo',
                style: TextStyle(
                    fontFamily: 'BebasNeue',
                    fontSize: 30,
                    color: ColorsData.colorsAlgorithm['Quick Sort']![1]),
              ),
            ),
            SizedBox(
              width: widthContainerText,
              child: SelectableText(
                  style: TextStyle(fontSize: fontSize),
                  textAlign: TextAlign.justify,
                  'Este aplicativo foi desenvolvido como parte de um Trabalho de Conclusão de Curso (TCC) em Engenharia da Computação, '
                  'com o objetivo de possibilitar uma experiência visual e interativa dos principais algoritmos de ordenação conhecidos. '
                  'Nele, você pode explorar diferentes algoritmos, ajustando a velocidade e observando o funcionamento passo a passo. '
                  'A interface intuitiva permite selecionar o algoritmo, definir o tamanho do conjunto de dados e até inserir valores manualmente para personalizar sua experiência.\n\n'
                  'Este aplicativo é uma ferramenta projetada para possibilitar a visualização dos conceitos e da lógica por '
                  'trás dos algoritmos de ordenação.\n\n'),
            ),
            SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
