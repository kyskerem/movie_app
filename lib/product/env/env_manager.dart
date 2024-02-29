import 'package:envied/envied.dart';

part 'env_manager.g.dart';

@Envied(path: '.env', obfuscate: true)
final class EnvManager {
  @EnviedField(varName: 'API_KEY')
  static String apiKey = _EnvManager.apiKey;
}
