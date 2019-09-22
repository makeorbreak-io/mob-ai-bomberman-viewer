class TiledMap extends Object {
  var mapData: TiledMapData;
  var tileImage: Tile;
  var tileset: Array<Tile>;

  override public function new(map, tileset) {
    mapData = haxe.Json.parse(hxd.Res.load(map).toText());
    tileImage = hxd.Res.load(tileset).toTile();

    var tw = mapData.tilewidth;
    var th = mapData.tileheight;
    var mw = mapData.width;
    var mh = mapData.height;
    var scale = s2d.width / (tw * mw);

    tileset = tileImage.gridFlatten(tw);

    for(layer in mapData.layers) {
      for(y in 0 ... mh) for (x in 0 ... mw) {
        var tid = layer.data[x + y * mw];

        // Tiled maps use 0 for transparent tiles,
        // making tiles 1-indexed
        if (tid != 0) {
          var tile = tiles[tid - 1];
          tile.scaleToSize(tw * scale, th * scale);

          group.add(x * tw * scale, y * th * scale, tile);
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
