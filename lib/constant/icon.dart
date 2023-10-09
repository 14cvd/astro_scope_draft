enum AppIcon {
  main('main'),
  blog('blog'),
  match('match'),
  profile('profile'),
  call('call'),
  danger('danger'),
  document('document'),
  home('home'),
  notification('notification'),
  password('password'),
  profile1('profile1'),
  wallet('wallet'),
  shield('shield'),
  shop('shop');

  const AppIcon(this._name);
  final String _name;
  String get svg => "asset/icon/ic_$_name.svg";
  String get svgColor => "asset/icon/ic_${_name}_color.svg";
}
