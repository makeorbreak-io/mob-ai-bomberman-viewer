import h2d.Tile;
import h2d.TileGroup;
import h2d.Scene;

class TiledMap extends TileGroup {
  var mapData: TiledMapData;
  var tileset: Array<Tile>;

  override public function new(map, tiles) {
    mapData = haxe.Json.parse(hxd.Res.load(map).toText());
    tile = hxd.Res.load(tiles).toTile();

    super(tile);

    var tw = mapData.tilewidth;
    var th = mapData.tileheight;
    var mw = mapData.width;
    var mh = mapData.height;
    var scale = Config.get("scale");

    tileset = tile.gridFlatten(tw);

    for(layer in mapData.layers) {
      for(y in 0...mh) for (x in 0...mw) {
        var tid = layer.data[x + y * mw];

        // Tiled maps use 0 for transparent tiles,
        // making tiles 1-indexed
        if (tid != 0) {
          var tile = tileset[tid - 1];
          tile.scaleToSize(tw * scale, th * scale);

          add(x * tw * scale, y * th * scale, tile);
        }
      }
    }
  }
}

typedef TiledMapData = {
  layers: Array<{
    data:Array<Int>
  }>,
  tilewidth:Int,
  tileheight:Int,
  width:Int,
  height:Int,
}
