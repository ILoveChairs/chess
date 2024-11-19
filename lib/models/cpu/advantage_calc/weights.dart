
/// # Advantage Weights
/// 
/// These variables are a way to modify the weight that an advantage adds to
/// the total result of the advantage calculation without modifying code
/// directly.
/// 
/// Material advantage is an exception as it has absolute advantage points.
library;

/// Defines constant weights for advantages to multiply to the end result.
enum Weights {
  /// Weight for attack advantage
  attack(0.1),
  /// Weight for promotion advantage
  promotion(0.1),
  /// Weight for position advantage
  position(0.1),
  /// Weight for security advantage
  security(0.1);
  /// Creates enum
  const Weights(this.weight);
  /// Weight for advantage
  final double weight;
}
