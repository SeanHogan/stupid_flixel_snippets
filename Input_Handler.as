package  
{
  import org.flixel.FlxG;
	/**
	 * A basic input handler - useful for mapping touch controls etc -
	 * abstract away where the input comes from (keyboard, touch, etc)
	 * @author Sean Hogan
	 */
	public class Input_Handler
	{
		
		// Just pressed
		public var JP_D:Boolean;
		public var JP_R:Boolean;
		public var JP_U:Boolean;
		public var JP_L:Boolean;
		public var JP_A1:Boolean;
		public var JP_A2:Boolean;
		
		// Pressed
		public var P_D:Boolean;
		public var P_R:Boolean;
		public var P_U:Boolean;
		public var P_L:Boolean;
		public var P_A1:Boolean;
		public var P_A2:Boolean;

		// Index into CONTROLS
		public var idx_UP:int = 0;
		public var idx_DOWN:int = 1;
		public var idx_RIGHT:int = 2;
		public var idx_LEFT:int = 3;
		public var idx_A1:int = 4;
		public var idx_A2:int = 5;
		
		// Default bindings for reading from the keyboard, you can change these elsewhere
		public var controls:Array = new Array("UP", "DOWN", "RIGHT", "LEFT", "X", "C");
		
		// This can be rewritten to be more concise but you get the point.
		// Read the state of an Input_Handler object to determine what should happen in your game
		public function update():void {
			
			P_D = FlxG.keys.pressed(controls[idx_DOWN]);
			
			if (FlxG.keys.pressed(controls[idx_UP])) {
				P_U = true;
			} else {
				P_U = false;
			}
			
			if (FlxG.keys.pressed(controls[idx_LEFT])) {
				P_L = true;
			} else {
				P_L = false;
			}
			
			if (FlxG.keys.pressed(controls[idx_RIGHT])) {
				P_R = true;
			} else {
				P_R = false;
			}
			
			if (FlxG.keys.pressed(controls[idx_A1])) {
				P_A1 = true;
			} else {
				P_A1 = false;
			}
			
			if (FlxG.keys.pressed(controls[idx_A2])) {
				P_A2 = true;
			} else {
				P_A2 = false;
			}
			
		
			JP_D = FlxG.keys.justPressed(controls[idx_DOWN]);
			JP_L = FlxG.keys.justPressed(controls[idx_LEFT]);
			JP_R = FlxG.keys.justPressed(controls[idx_RIGHT]);
			JP_U = FlxG.keys.justPressed(controls[idx_UP]);
			
			if (FlxG.keys.justPressed(controls[idx_A1])) {
				JP_A1 = true;
			} else {
				JP_A1 = false;
			}
			if (FlxG.keys.justPressed(controls[idx_A2])) {
				JP_A2 = true;
			} else {
				JP_A2 = false;
			}
		}
		
	}

}
