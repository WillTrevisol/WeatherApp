const String key = String.fromEnvironment('KEY');

class Config {

  static String serverAddress = 'https://api.hgbrasil.com/weather?key=$key';
  static String igbeAddress = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados';
  
}