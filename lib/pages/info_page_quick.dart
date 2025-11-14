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
                  'O Quick Sort utiliza a abordagem de divisão e conquista. Ele seleciona um valor como pivô que ajuda a dividir a lista em duas sublistas. A escolha do pivô pode ser feita de várias maneiras, por exemplo, o primeiro elemento da lista. Depois de divididas, as sublistas também chamam o Quick Sort para serem ordenadas, por isso, o algoritmo é recursivo. O caso base é uma lista com um ou nenhum elemento, considerada ordenada por definição (Miller & Ranum, 2013).\n\n'
                  'Após selecionar o elemento pivô, o particionamento inicia posicionando dois marcadores: o esquerdo, marcando a primeira posição após o pivô, e o direito, marcando a última posição da lista. O objetivo é separar os valores maiores que o pivô em um sublista diferente dos valores menores. O marcador esquerdo se move para a direita, caso encontre um valor maior do que o pivô, ele para. O marcador direito se move para a esquerda, caso encontre um valor menor do que o pivô, ele para. Se os dois marcadores pararem, os elementos indicados pelos dois devem trocar de posição.\n\n'
                  'Depois de trocarem de posição os marcadores seguem fazendo o mesmo processo. Quando o marcador direito indicar uma posição menor do que a indicada pelo marcador esquerdo, eles param. O elemento pivô troca de lugar com o elemento indicado pelo marcador direito e o ponto de divisão é definido. A lista estão é dividida em duas sublistas, uma à esquerda e outra à direita do elemento pivô.\n\n'
                  'A lista da esquerda contém elementos menores ou iguais ao pivô, enquanto a lista da direita contém elementos maiores ou iguais a ele (Miller & Ranum, 2013). O Quick Sort é chamado recursivamente pelas duas sublistas geradas. A lista original estará ordenada após a execução de todas as instâncias do algoritmo que forem chamadas\n'),
            ),
            SizedBox(
              width: widthContainerText,
              child: SelectableText(
                  style: TextStyle(fontSize: fontSize, color: Colors.grey),
                  textAlign: TextAlign.center,
                  'Referências'),
            ),
            SizedBox(height: 5),
            SizedBox(
              width: widthContainerText,
              child: SelectableText(
                style: TextStyle(fontSize: fontSize, color: Colors.grey),
                textAlign: TextAlign.justify,
                'MILLER, B. N.; RANUM, D. L. Problem Solving with Algorithms and Data Structures using Python. ebook (creative commons edition). Runestone Interactive, 2013. Licensed under a Creative Commons Attribution-NonCommercial- ShareAlike 4.0 International License.',
              ),
            ),
            SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
