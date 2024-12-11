class PathConfig {
  static const assetPrefix = String.fromEnvironment('ASSET_PREFIX', defaultValue: '');

  static String getAssetPath(String path) => '$assetPrefix$path';
}
