enum Flavor {
  development,
  staging,
  production,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.development:
        return 'Money Pig Development';
      case Flavor.staging:
        return 'Money Pig Staging';
      case Flavor.production:
        return 'Money Pig';
      default:
        return 'title';
    }
  }

}
