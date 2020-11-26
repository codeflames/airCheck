class Urls {
  static const baseUrl = "https://api.gios.gov.pl/pjp-api/rest/";
  static const allStations = "${baseUrl}station/findAll";
  static const stationSensors = "${baseUrl}station/sensors/";
  static const sensorData = "${baseUrl}data/getData/";
  static const stationPollutionQualityIndex = "${baseUrl}aqindex/getIndex/";
}
