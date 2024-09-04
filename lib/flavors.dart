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
        return '[DEV] CI/CD';
      case Flavor.staging:
        return '[STG] CI/CD';
      case Flavor.production:
        return 'CI/CD';
      default:
        return 'title';
    }
  }

}
