  import flash.geom.Point;
  import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	import org.flixel.FlxU;
	
	
	/**
	 * uses multiple draw calls to make a black square with other
	 * black squares that do silly things via sin/linear interpolation
	 * 
	 * FUN CLASS PROJECT make a class thing to hold timer/state/etc states and
	 * do this all with wrapper functions

EXAMPLE!!!! https://dl.dropbox.com/u/53835171/good_anodyne_pics/20130124_2353_20.gif
	 */
	public class Black_Thing extends FlxSprite 
	{
		
		public function Black_Thing(_x:int,_y:int) 
		{
			super(_x,_y);	
			
			make_sin_table_180();
			makeGraphic(32, 32, 0xff000000);
		}
		
/// WOO
		override public function update():void 
		{
			super.update();
		}
		
		
		private var scale1:Number = 0.5; // initial value 
		private var mm1:Point = new Point(0.5, 2); // min max
	
		private var scale2:Number = 2;
		private var mm2:Point = new Point(0.5, 2);
		
		private var scale3:Number = 3;
		private var mm3:Point = new Point(0.75, 3);
		
		
		
		private var state1:int = 0;
		private var state2:int = 0;
		private var state3:int = 0;
		
		private var t3:Number = 0;
		private var t3_m:Number = 1;
		
		// vals between 0 and 1
		private var sin_table_180:Array;
		
		public function make_sin_table_180():void {
			sin_table_180 = new Array;
			for (var i:int = 0; i < 180; i++) {
				sin_table_180.push((1 + Math.sin( (i / 180.0) * 6.28))/2);
			}
			var i:int = 2;
		}
		
		private var rate:Number = 0.03;
		override public function draw():void 
		{
			alpha = 0.25;
			scale.x = scale.y = scale1;
			
			

			if (state1 == 0)  {
				scale1 += rate;
				if (scale1 > mm1.y) {
					state1 = 1;
				}
			} else if (state1 == 1) {
				scale1 -= rate;
				if (scale1 < mm1.x) {
					state1 = 0;
				}
			}
			super.draw();
			
			
			
			alpha = 0.5;
			scale.x = scale.y = scale2;
			

			if (state2 == 0)  {
				scale2 += rate;
				if (scale2 > mm2.y) {
					state2 = 1;
				}
			} else if (state2 == 1) {
				scale2 -= rate;
				if (scale2 < mm2.x) {
					state2 = 0;
				}
			}
			
			super.draw();
			
			alpha = 1;
			scale.x = scale.y = scale3;
			t3 += FlxG.elapsed;
			if (t3 > t3_m) {
				t3 = 0;
			}
			
			scale3 = sin_table_180[int(180 * (t3 / t3_m))] * (mm3.y - mm3.x) + mm3.x;
			
			angle = get_sin_table_180(t3, t3_m, -90, 90);
			super.draw();
			
			angle = 0;
			scale.x = scale.y = 1;
			alpha = 0.3;
			super.draw();
		}
		
		public function get_sin_table_180(t:Number,tm:Number,min,max):Number {
			return sin_table_180[int(180 * (t3 / t3_m))] * (max - min) + min;
		}
	}
