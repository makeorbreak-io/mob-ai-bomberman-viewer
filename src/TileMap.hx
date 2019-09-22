class TileMap {
}

// class TileMap extends hxd.App {
//   var rows:Int;
//   var columns:Int;
//   var tileSize:Int;
//   var scale:Int;
//   var tiles:h2d.Tile;
// 
//   override function init() {
//     var mapData: TiledMapData = haxe.Json.parse(hxd.Res.load("15x11.json").toText());
//     var tileImage = hxd.Res.load("tiles.png").toTile();
//     var group = new h2d.TileGroup(tileImage, s2d);
// 
//     var tw = mapData.tilewidth;
//     var th = mapData.tileheight;
//     var mw = mapData.width;
//     var mh = mapData.height;
//     var scale = s2d.width / (tw * mw);
// 
//     trace('scale: ${scale}');
// 
//     var tiles = tileImage.gridFlatten(tw);
// 
//     for(layer in mapData.layers) {
//       for(y in 0 ... mh) for (x in 0 ... mw) {
//         var tid = layer.data[x + y * mw];
// 
//         // Tiled maps use 0 for transparent tiles,
//         // making tiles 1-indexed
//         if (tid != 0) {
//           var tile = tiles[tid - 1];
//           tile.scaleToSize(tw * scale, th * scale);
// 
//           group.add(x * tw * scale, y * th * scale, tile);
//         }
//       }
//     }
//   }
// }
// 
// typedef TiledMapData = {
//   layers: Array<{
//     data:Array<Int>
//   }>,
//   tilewidth:Int,
//   tileheight:Int,
//   width:Int,
//   height:Int,
// };
