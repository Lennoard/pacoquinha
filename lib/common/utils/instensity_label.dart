import 'package:tabata/features/training/domain/entities/training_intensity.dart';

String getIntensityLabel(intensity) {
  switch (intensity) {
    case TrainingIntensity.light:
      return "Treino Leve";
    case TrainingIntensity.moderate:
      return "Treino Moderado";
    case TrainingIntensity.intense:
      return "Treino Intenso";
    default:
      return "";
  }
}
