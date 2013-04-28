package com.reymadrid.ui
{
	import com.reymadrid.events.ColorPickerEvent;
	import com.reymadrid.events.ImageEvent;
	import com.reymadrid.loaders.ImageLoader;
	
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class ColorPicker extends Sprite
	{
		private var _bmd:BitmapData;
		
		public function ColorPicker(img:String)
		{
			super();
			
			var ld:ImageLoader = new ImageLoader ( "assets/images/picker.jpg" );
			ld.addEventListener ( ImageEvent.IMAGE_LOADED, onLoad );
		}
		
		private function onLoad( e:ImageEvent ):void
		{
				
			this.addChild ( e.image );
			_bmd = e.image.bitmapData;
			this.addEventListener ( MouseEvent.MOUSE_DOWN, onSelect );
			
		}
		
		private function onSelect( e:MouseEvent ):void
		{
			var color:uint = _bmd.getPixel (e.localX, e.localY);
			var evt:ColorPickerEvent = new ColorPickerEvent ( ColorPickerEvent.COLOR_CHANGE)
			evt.color = color;
			dispatchEvent (evt);
		}
	}
}