class Game extends hxd.App {
  var tiledMap: TiledMap;
  var bomb: Bomb;
  var elapsed = 0.;

  override function init() {
    hxd.Res.initEmbed();
    Config.init(s2d);

    tiledMap = new TiledMap("15x11.json", "tiles.png");
    s2d.addChild(tiledMap);

    addEntity(new Bomb());

    addEntity(new Coin());
    addEntity(new Coin());
  }

  override function update(dt: Float) {
    elapsed += dt;

    if (elapsed >= 2) {
      elapsed = 0;
      for (i in 0 ... 3)
        addEntity(new Bomb());
    }
  }

  static function main() {
    new Game();
  }

  private function addEntity(entity: Dynamic) {
    var x = Math.floor(Math.random() * 15);
    var y = Math.floor(Math.random() * 10);

    entity.setCell(x, y);

    s2d.addChild(entity);
  }
}
