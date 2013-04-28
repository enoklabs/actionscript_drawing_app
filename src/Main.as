/*
Rey Madrid
04/25/13
FAT 1304 01
Assignment #3 - Drawing Application
*/ 
package
{
	import com.reymadrid.app.DrawingApp;
	import flash.display.Sprite;

	[SWF (height="480", width="800")]
	
	public class Main extends Sprite
	{
		
		public function Main()
		{
			//initialize Main Drawing Application
			init();
		}
		
		private function init() : void
		{
			//display app on screen
			var app:DrawingApp = new DrawingApp();
			app.x = -3;
			app.y = 0;
			addChild(app);
		}	
	}
}
