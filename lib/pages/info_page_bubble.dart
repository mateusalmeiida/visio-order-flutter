import 'package:flutter/material.dart';
import 'package:visio_order/data/colors_data.dart';

class InfoPageBubble extends StatelessWidget {
  const InfoPageBubble({super.key});

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
        title: Text('Bubble Sort'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: ColorsData.colorsAlgorithm['Bubble Sort']!)),
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
                    color: ColorsData.colorsAlgorithm['Bubble Sort']![1]),
              ),
            ),
            SizedBox(
              width: widthContainerText,
              child: SelectableText(
                  style: TextStyle(fontSize: fontSize),
                  textAlign: TextAlign.justify,
                  'O Bubble Sort percorre uma lista repetidamente, comparando pares de elementos adjacentes e trocando-os se estiverem na ordem errada. O algoritmo inicia comparando o primeiro elemento de uma lista com o segundo. Se os dois elementos estiverem fora de ordem (ou seja, o primeiro for maior do que o segundo, no caso de uma ordenação crescente), eles são trocados.\n\n'
                  'Em seguida, o algoritmo compara o segundo elemento com o terceiro, e assim por diante, até que o final da lista seja alcançado (Appiah & Martey, 2015). Segundo Miller e Ranum (2013), cada passagem pela lista coloca na posição correta o maior valor não ordenado.\n\n'
                  'Para conjunto de valores de tamanho n, o algoritmo realiza n-1 passagens. Na primeira passagem existem n-1 pares adjacentes a serem comparados. Na segunda passagem, o maior valor está ordenado e são necessárias apenas n-2 comparações entre os pares. Em cada passagem subsequente o número de comparações diminui em um, até que sejam feitas n-1 passagens e o conjunto de dados esteja ordenado (Miller & Ranum, 2013).\n\n'
                  'Possui complexidade O(n²) no melhor, no médio e no pior caso, o que indica que o algoritmo não obtém ganho de desempenho mesmo quando a lista já está ordenada (Silva, 2023).\n'),
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
                'APPIAH, O.; MARTEY, E. M. Magnetic bubble sort algorithm. International Journal of Computer Applications, v. 122, p. 975–8887, 07 2015.\n\n'
                'MILLER, B. N.; RANUM, D. L. Problem Solving with Algorithms and Data Structures using Python. ebook (creative commons edition). Runestone Interactive, 2013. Licensed under a Creative Commons Attribution-NonCommercial- ShareAlike 4.0 International License.\n\n'
                'SILVA, ARTHUR VINÍCIUS ROMUALDO DA, Análise de desempenho e complexidade dos Algoritmos de ordenação. Medium. 2023. Disponível em: <https://medium.com/@romualdo.v/an%C3%A1lise-de-desempenho-e-complexidade-dos-algoritmos-de-ordena%C3%A7%C3%A3o-f47449e93b33>. Acesso em: 17 nov. 2025.',
              ),
            ),
            SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
