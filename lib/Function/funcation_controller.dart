class ChartPercentageCalculator {
  final double ton;
  final double star;

  ChartPercentageCalculator({required this.ton, required this.star}) ;


  Map<String, double> percentageResult () {
    final double totalValue = ton + star;

    final double tonPercentage = (ton / totalValue) * 100;
    final double starPercentage = (star / totalValue) * 100;
    print(tonPercentage);
    print(starPercentage);
    return {
      "TON": tonPercentage,
      "Star":starPercentage,
    };


  }
}