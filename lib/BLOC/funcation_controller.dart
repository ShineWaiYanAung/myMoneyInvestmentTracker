class ChartPercentageCalculator {
  final double ton;
  final double star;
  late final double starConversion;

  ChartPercentageCalculator({required this.ton, required this.star}) {
    starConversion = star * 0.0030369;
  }

   Map<String, double> percentageResult () {
    final double totalValue = ton + starConversion;

    final double tonPercentage = (ton / totalValue) * 100;
    final double starPercentage = (starConversion / totalValue) * 100;
    return {
      "TON": tonPercentage,
      "Star":starPercentage,
    };
  }
}
