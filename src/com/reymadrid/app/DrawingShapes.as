package com.reymadrid.app
{
	import flash.display.Sprite;
	
	public class DrawingShapes extends Sprite
	{
		public function DrawingShapes()
		{
			super();
		}
		
		public function drawCircle( color:uint = 0x0000FF, radius:int = 5, strokeColor:uint = 0x000000,  strokeSize:int = 3):void
		{
			this.graphics.lineStyle ( strokeSize, strokeColor );
			this.graphics.beginFill ( color );
			this.graphics.drawCircle ( 0, 0, radius );
			this.graphics.endFill ();
			
		}
		
		public function drawRect( color:uint = 0x0000FF, strokeSize:int = 3, strokeColor:uint = 0x000000, width:int = 25, height:int = 15 ):void
		{
			this.graphics.lineStyle ( strokeSize, strokeColor );
			this.graphics.beginFill ( color );
			this.graphics.drawRect ( 0, 0, width, height );
			this.graphics.endFill ();
			
		}
		
	}
}