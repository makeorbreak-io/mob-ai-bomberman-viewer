class Config {
  static var opts: Map<String, Int>;

  public static function init(s2d: h2d.Scene): Void {
    opts = [
      "scale" => 8,
      "th" => 16,
      "tw" => 16,
      "stw" => 8 * 16,
      "sth" => 8 * 16,
      "vh" => s2d.height,
      "vw" => s2d.width,
    ];
  }

  public static function get(key: String): Int {
    return opts[key];
  }

  public static function set(key: String, value: Int): Void {
    opts[key] = value;
  }
}
