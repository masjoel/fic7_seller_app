// // import 'package:flutter dotenv/flutter dotenv.dart'
// class Environment {
//   Future<void> init() async {
//     String envFileName = '.env';
//     await dotenv.load(fileName: envFileName);
//   }
//   Future<void> configureAppDev() async {
//     await dotenv.load(fileName: ".env.development");
//   }
//   Future<void> configureAppDev() async {
//     await dotenv.load(fileName: ".env.production");
//   }
//   static String getEnv(String key) => dotenv.env[key].tostring();
//   static String get baseUrl => getEnv('BASE URL');
//   static String get apikey => getEnv ('API KEY');
//   static String get enterpriseUrl => getEnv ('ENTERPRISE _BASE _URL');
// }