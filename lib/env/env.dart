import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'EXAMPLE_KEY', obfuscate: true)
  static final String exampleApiKey = _Env.exampleApiKey;
}
