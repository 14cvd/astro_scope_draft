enum AppIcon {
  main('main'),
  blog('blog'),
  match('match'),
  profile('profile'),
  shop('shop');

  const AppIcon(this._name);
  final String _name;
  String get svg => "asset/icon/ic_$_name.svg";
  String get svgColor => "asset/icon/ic_${_name}_color.svg";
}
