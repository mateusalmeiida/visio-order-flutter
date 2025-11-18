import 'package:flutter/material.dart';
import 'package:visio_order/data/colors_data.dart';

class InfoPageMerge extends StatelessWidget {
  const InfoPageMerge({super.key});

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
        title: Text('Merge Sort'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: ColorsData.colorsAlgorithm['Merge Sort']!)),
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
                    color: ColorsData.colorsAlgorithm['Merge Sort']![1]),
              ),
            ),
            SizedBox(
              width: widthContainerText,
              child: SelectableText(
                  style: TextStyle(fontSize: fontSize),
                  textAlign: TextAlign.justify,
                  'O Merge Sort utiliza uma abordagem de divisão e conquista, desmembrando a lista a ser ordenada em sublistas menores, classificando de forma independente essas sublistas e depois combinando-as para obter a lista original ordenada (Cormen et al., 2012). \n\n'
                  'O algoritmo inicia dividindo a lista pela metade e considera cada parte como uma lista independente, essa divisão acontecerá mesmo que a lista tenha um número ímpar de elementos, alocando o elemento extra em um dos segmentos (Miller & Ranum, 2013). As sublistas resultantes são novamente divididas pela metade, esse processo é feito até que cada partição tenha apenas um ou nenhum elemento.\n\n'
                  'Cada nova divisão dentro das sublistas é considerada uma nova chamada do Merge Sort, onde cada chamada lida com duas sublistas, mas depende do retorno das chamadas subsequentes (Cormen et al., 2012). Listas vazias ou com apenas um elemento, são consideradas como o caso base, ou seja, estão sempre ordenadas (Miller & Ranum, 2013).\n\n'
                  'Após isso, ocorre o processo de combinação das sublistas, chamado de intercalação. Para cada iteração de intercalação, são utilizados três índices, dois para percorrer os elementos da primeira e segunda sublistas respectivamente, e o terceiro para armazenar os valores de volta na lista principal. \n\n'
                  'Em cada passo, os elementos das duas sublistas são comparados. Para uma ordenação crescente por exemplo, o menor deles é retirado da sua sublista e inserido na lista principal, assegurando que a lista resultante esteja ordenada (Miller & Ranum, 2013).\n\n'
                  'O Merge Sort tem complexidade O(n log n) em todos os casos. À medida que a lista cresce, ele é mais eficiente do que algoritmos O(n²), pois seu tempo de execução aumenta de forma mais lenta (Silva, 2023).\n'),
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
                  'CORMEN, T. H. et al. Algoritmos: Teoria e Prática. 3. ed: Elsevier, 2012.\n\n'
                  'MILLER, B. N.; RANUM, D. L. Problem Solving with Algorithms and Data Structures using Python. ebook (creative commons edition). Runestone Interactive, 2013. Licensed under a Creative Commons Attribution-NonCommercial- ShareAlike 4.0 International License.\n\n'
                  'SILVA, ARTHUR VINÍCIUS ROMUALDO DA, Análise de desempenho e complexidade dos Algoritmos de ordenação. Medium. 2023. Disponível em: <https://medium.com/@romualdo.v/an%C3%A1lise-de-desempenho-e-complexidade-dos-algoritmos-de-ordena%C3%A7%C3%A3o-f47449e93b33>. Acesso em: 17 nov. 2025.'),
            ),
            SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
