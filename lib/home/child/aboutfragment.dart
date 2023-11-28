import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutFragmentPage extends StatefulWidget {
  const AboutFragmentPage({super.key});

  @override
  _AboutFragmentWidget createState() => _AboutFragmentWidget();
}

class _AboutFragmentWidget extends State<AboutFragmentPage> {

  final String tip = "株式投資は、潜在的なリスクと利益の両方を伴う重要な財務活動です。株式投資を行う前に、次の重要な考慮事項に留意することが重要です:\n\nリスク認識: 株式市場は変動する可能性があり、投資家は資本損失に直面する可能性があります。投資する前に、株式市場に関連するリスクを十分に認識し、失うわけにはいかない資金の投資は避けてください。\n\n研究と教育: 株式投資の前に、徹底的な研究と教育が重要です。ファンダメンタルズと財務状況を理解してください。投資先の企業の情報を収集し、業界の動向を常に把握し、投資決定の精度を高めます。\n\n分散化: すべての資金を 1 つの銘柄または業界に集中させないようにしてください。分散投資は、ポートフォリオ全体のリスクを軽減し、投資の効率を高めるのに役立ちます。長期的な収益の安定性。\n\n長期投資: 株式市場は短期的には変動性がありますが、長期的には有利な収益をもたらす傾向があります。投資家は忍耐力を発揮し、優良株を長期間保有することを検討する必要があります。\ n\n定期的なポートフォリオのレビュー: 投資ポートフォリオを定期的に見直し、調整する必要があります。市場や企業の状況は変化する可能性があるため、最新の情報に基づいて投資戦略を調整する必要があります。\n\n取引コストの理解: 株式を売買する場合、関連するコストを理解してください。手数料や税金などの取引コスト。これらのコストは全体的な投資収益に影響を与える可能性があります。\n\n感情の規律: 市場の感情や短期的な変動に振り回されることを避けてください。合理的な投資決定を下し、市場の浮き沈みに対して冷静なアプローチを維持してください。\ n\nストップロス戦略の導入: 合理的なストップロス戦略を確立し、投資の最大損失限度を設定します。タイムリーなストップロス措置を導入することで資本を保護し、重大な損失を防ぐことができます。\n\n継続的な学習: 株式市場と投資環境は継続的に進化します。投資に精通した状態を維持するには、継続的な学習が不可欠です。市場の動向を常に把握し、新しい投資ツールや戦略を模索してください。\n\n専門家のアドバイスを求める: 必要に応じて、専門的なガイダンスや意見を得るために、プロの投資アドバイザーまたは金融専門家からアドバイスを求めてください。 \n\n株式投資にはある程度の複雑さが伴うため、各投資家は財務状況とリスク許容度に基づいて慎重に意思決定を行う必要があります。";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 15, right: 15),
              child: Card(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
                    child: Row(
                      children: [
                        Icon(Icons.privacy_tip_outlined),
                        SizedBox(width: 5,),
                        Expanded(
                          child: Text(
                            "プライバシーポリシー",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Icon(Icons.more_vert)
                      ],
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Card(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
                    child: Row(
                      children: [
                        Icon(Icons.privacy_tip_rounded),
                        SizedBox(width: 5,),
                        Expanded(
                          child: Text(
                            "ユーザー規約",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Icon(Icons.more_vert)
                      ],
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Card(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
                    child: Row(
                      children: [
                        Icon(Icons.verified_sharp),
                        SizedBox(width: 5,),
                        Expanded(
                          child: Text(
                            "V 1.0",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            Expanded(child: Padding(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15,bottom: 20),
              child: Card(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
                    child: Column(children: [
                      const Text(
                        "株式投資の考慮事項",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10,),
                      Expanded(child: Text(
                        tip,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 13),
                      ),)
                    ],),
                  ),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
