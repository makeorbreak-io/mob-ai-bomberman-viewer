class Game extends hxd.App {
  var tiledMap: TiledMap;
  var bomb: Bomb;
  var elapsed = 0.;

  override function init() {
    hxd.Res.initEmbed();
    Config.init(s2d);

    tiledMap = new TiledMap("15x11.json", "tiles.png");
    s2d.addChild(tiledMap);

    addBomb();
  }

  override function update(dt: Float) {
    elapsed += dt;

    if (elapsed >= 2) {
      elapsed = 0;
      for (i in 0 ... 3)
        addBomb();
    }
  }

  static function main() {
    new Game();
  }

  private function addBomb() {
    bomb = new Bomb();
    var x = Math.floor(Math.random() * 16);
    var y = Math.floor(Math.random() * 16);

    bomb.setCell(x, y);

    s2d.addChild(bomb);
  }

}
