import h2d.Anim;
import h2d.Object;
import h2d.Tile;

class Bomb extends Anim {
  override public function new(?frames: Array<Tile>, ?speed: Float, ?parent: Object) {
    frames = [
      for (i in 1...7)
        hxd.Res.load('bomb${i}.png').toTile()
    ];
    speed = 3;

    super(frames, speed, parent);

    scale(Config.get("scale") * Config.get("dpi_scale"));
  }

  public function setCell(x: Int, y: Int): Void {
    this.x = x * Config.get("stw");
    this.y = y * Config.get("sth");
  }

  override function onAnimEnd(): Void {
    remove();
  }
}
