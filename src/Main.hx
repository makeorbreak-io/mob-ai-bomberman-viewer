class Main extends hxd.App {
  var tile = 16;
  var w = 15;
  var h = 11;
  var scale = 1;
  var tilemap: TileMap;

  override function init() {
    trace('${s2d.width}, ${s2d.height}');

    var tiledMap = new TiledMap("15x11.json", "tiles.png");
    // tilemap = new TileMap();
  }

  override function update(dt: Float) {

    trace(dt);
  }

  static function main() {
    hxd.Res.initEmbed();
    new Main();
  }

}
