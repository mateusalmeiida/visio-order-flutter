import 'package:flutter/material.dart';
import 'package:visio_order/data/colors_data.dart';

class InfoPageInsertion extends StatelessWidget {
  const InfoPageInsertion({super.key});

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
        title: Text('Insertion Sort'),
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
                'Descrição do Algoritmo',
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
                  'O algoritmo de ordenação por inserção, ou Insertion Sort, ordena um vetor separando-o em duas partições, a partição ordenada e a não ordenada. A partição ordenada começa com um único elemento, que corresponde ao primeiro índice do vetor que se quer ordenar. A partição não ordenada possui o restante dos elementos do vetor. A cada iteração um elemento é retirado da partição não ordenada e inserido na partição ordenada, seguindo as regras de ordenação definidas (Sodhi et al, 2013). Ao final da execução, a segunda partição deve estar vazia e a primeira deve conter todo o vetor devidamente ordenado.\n\n'
                  'Para ordenar um vetor de tamanho n em ordem crescente, o Insertion Sort inicia inserindo o elemento de índice 1 na partição ordenada, e os elementos restantes (índice 2 a n) são colocados na partição não ordenada. O algoritmo percorre a partição não ordenada, retirando os seus elementos e inserindo-os na posição correta dentro da partição ordenada.\n\n'
                  'Um elemento x retirado da partição não ordenada é alocado como um novo elemento e ocupa inicialmente o último índice da partição ordenada. A partir dessa posição i, o algoritmo começa a compará-lo com os elementos anteriores da partição ordenada, começando do índice i-1. Se o valor contido no índice i-1 for maior do que x, os dois trocam de lugar, e o algoritmo continua comparando x com os elementos em posições cada vez menores (i-2, i-3, i-4, ...), até que encontre um valor menor ou igual a x, ou até que x alcance o índice 1. Esse processo é repetido para todos os elementos contidos na partição não ordenada. O algoritmo termina quando o último elemento da partição não ordenada for inserido na sua posição correta dentro da partição ordenada (Brunet, 2019).\n\n'
                  'Possui complexidade O(n²) no caso médio e no pior caso. No melhor caso, quando a lista já está ordenada, a complexidade é O(n) (Silva, 2023).\n'),
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
                  'BRUNET, J. A. Ordenação por Comparação: Insertion Sort. 2019. Disponível em: <https://joaoarthurbm.github.io/eda/posts/insertion-sort/>. Acesso em: 20 set. 2024.\n\n'
                  'SODHI, T. S.; KAUR, S.; KAUR, S. Enhanced insertion sort algorithm. International Journal of Computer Applications, Foundation of Computer Science (FCS), NY, USA, New York, USA, v. 64, n. 21, p. 35–39, February 2013. ISSN 0975-8887. Disponível em: <https://ijcaonline.org/archives/volume64/number21/10761-5724/>.\n\n'
                  'SILVA, ARTHUR VINÍCIUS ROMUALDO DA, Análise de desempenho e complexidade dos Algoritmos de ordenação. Medium. 2023. Disponível em: <https://medium.com/@romualdo.v/an%C3%A1lise-de-desempenho-e-complexidade-dos-algoritmos-de-ordena%C3%A7%C3%A3o-f47449e93b33>. Acesso em: 17 nov. 2025.'),
            ),
            SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
