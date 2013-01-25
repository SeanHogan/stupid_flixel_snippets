// Stick this in FlxG.as cuz we need the references to _cache

static public function scramble_cache():void {
  		
			var keys:Array = new Array();
			var refs:Array = new Array();
			for (var key:String in _cache) {
				keys.push(key);
				if (_cache[key] != null) {
					refs.push(_cache[key]);	
				}
			}
			
			while (keys.length > 0 && refs.length > 0) {
				key = keys.pop();
				var idx:int = refs.length * Math.random();
				var ref:BitmapData;
					ref = refs.splice(idx, 1)[0];
// If you use a consistent naming scheme for your tileset embeds and you do use tilemaps
// Then if you don't do this things will choke if your tileset tries to find a mapping for a tile
// into an image that is too small when its bitmapdata reference gets swapped
					if (key.indexOf("Tile") != -1) {
						var x:int = 0;
						var y:int = 0;
						
// Anyways if we do get a tilemap, it's mad lame if we do use its original graphic,
// so pick another graphic and just tile itover the tilemap's data for FUN and excitement see
// https://pbs.twimg.com/media/BBQaoRNCUAA40Kd.png:large for ACTION
						refs.splice(refs.indexOf(_cache[key]),1);
						while (x < _cache[key].width) {
							while (y < _cache[key].height) {
								_cache[key].copyPixels(ref, ref.rect, new flash.geom.Point(x, y));
								y += ref.height;
							}
							y = 0;
							x += ref.width;
						}
					} else {
						_cache[key] = ref;
					}
			}
		}
