import 'package:flutter/material.dart';
import 'package:visio_order/data/colors_data.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width;
    final double sizeImage;
    if (MediaQuery.of(context).size.width <= 500) {
      width = 300;
      sizeImage = 70;
    } else if (MediaQuery.of(context).size.width <= 700) {
      width = 500;
      sizeImage = 100;
    } else {
      width = 700;
      sizeImage = 100;
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
              padding: EdgeInsets.only(top: 50, bottom: 50),
              child: Text(
                'Sobre',
                style: TextStyle(
                    fontFamily: 'BebasNeue',
                    fontSize: 30,
                    color: ColorsData.colorsAlgorithm['Insertion Sort']![1]),
              ),
            ),
            SizedBox(
              width: width,
              child: Text(
                  textAlign: TextAlign.justify,
                  'Este aplicativo foi desenvolvido como parte de um Trabalho de Conclusão de Curso (TCC) em Engenharia da Computação, '
                  'com o objetivo de auxiliar no aprendizado de algoritmos de ordenação por meio de uma experiência visual e interativa. '
                  'Nele, você pode explorar diferentes algoritmos, ajustando a velocidade e observando o funcionamento passo a passo. '
                  'A interface intuitiva permite selecionar o algoritmo, definir o tamanho do conjunto de dados e até inserir valores manualmente para personalizar sua experiência.\n\n'
                  'Este aplicativo é uma ferramenta educacional projetada para facilitar a compreensão dos conceitos e da lógica por '
                  'trás dos algoritmos de ordenação, sendo ideal para estudantes e entusiastas da área de computação.'),
            ),
            Container(
              padding: EdgeInsets.only(top: 50),
              alignment: Alignment.topLeft,
              width: width,
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
                      Text('Mateus de Almeida Ribeiro'),
                      SizedBox(
                        width: width * 0.6,
                        child: FittedBox(
                          child: Text(
                            style: TextStyle(fontSize: 20),
                            'github.com/mateusalmeiida',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
