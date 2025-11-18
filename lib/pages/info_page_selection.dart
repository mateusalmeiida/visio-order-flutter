import 'package:flutter/material.dart';
import 'package:visio_order/data/colors_data.dart';

class InfoPageSelection extends StatelessWidget {
  const InfoPageSelection({super.key});

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
        title: Text('Selection Sort'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: ColorsData.colorsAlgorithm['Selection Sort']!)),
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
                    color: ColorsData.colorsAlgorithm['Selection Sort']![1]),
              ),
            ),
            SizedBox(
              width: widthContainerText,
              child: SelectableText(
                  style: TextStyle(fontSize: fontSize),
                  textAlign: TextAlign.justify,
                  'O Selection Sort utiliza ordenação por seleção. Dado um conjunto de valores, seu processamento é feito dividindo a lista em duas partições: ordenada e não ordenada. Inicialmente, a parte ordenada é vazia e a parte não ordenada contém todos os elementos. A cada iteração o menor elemento da parte não ordenada é selecionado e colocado na sua posição correta dentro da sequência final, passando para a partição ordenada (Brunet, 2019).\n\n'
                  'Para uma ordenação crescente, o algoritmo escolhe o primeiro elemento da parte não ordenada que está na posição i e o considera o menor até o momento. Em seguida ele percorre o restante da parte não ordenada, comparando cada elemento com o menor já encontrado. Caso encontre um valor menor, ele marca a posição desse novo menor valor. Ao final dessa varredura, o elemento na posição marcada (o menor encontrado) troca de lugar com o elemento da posição i. Dessa forma, o elemento não ordenado de menor valor é colocado na sua posição correta\n\n'
                  'O algoritmo repete esse processo, considerando i+1 como a nova posição de início da parte não ordenada, seguindo assim até que toda a lista esteja ordenada. Para um vetor de tamanho n, o Selection Sort precisa de n-1 comparações até selecionar o elemento que ocupará o índice 1. Para o índice 2, são necessárias n-2 comparações. A última iteração precisará de apenas uma comparação para ser concluída (Brunet, 2019). Assim como o Bubble Sort, sua complexidade é O(n²) em todos os casos (Silva, 2023).\n'),
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
                  'BRUNET, J. A. Ordenação por Comparação: Selection Sort. 2019. Disponível em: <https://joaoarthurbm.github.io/eda/posts/selection-sort/>. Acesso em: 09 set. 2024.\n\n'
                  'SILVA, ARTHUR VINÍCIUS ROMUALDO DA, Análise de desempenho e complexidade dos Algoritmos de ordenação. Medium. 2023. Disponível em: <https://medium.com/@romualdo.v/an%C3%A1lise-de-desempenho-e-complexidade-dos-algoritmos-de-ordena%C3%A7%C3%A3o-f47449e93b33>. Acesso em: 17 nov. 2025.'),
            ),
            SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
