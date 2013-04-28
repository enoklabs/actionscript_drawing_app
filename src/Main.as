/*
Rey Madrid
04/17/13
FAT 1304 01
Assignment #2 - Weather Application
*/ 
package
{
	import flash.display.Sprite;
	import com.reymadrid.app.*;
	import flash.display.*;

	[SWF (height="400", width="600", backgroundColor="0x000000")]
	
	
	public class Main extends Sprite
	{
		
		public function Main()
		{
			this.init();
			return;
		}// end function
		
		private function init() : void
		{
			var _loc_1:* = new Application();
			_loc_1.x = stage.stageWidth / 2;
			_loc_1.y = 5;
			this.addChild(_loc_1);
			return;
		}// end function
		
	}
}
