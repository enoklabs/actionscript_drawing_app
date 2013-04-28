package com.reymadrid.events
{
	import flash.events.Event;
	import flash.display.Bitmap;
	
	public class ImageEvent extends Event
	{
		public var image:Bitmap;
		public static const IMAGE_LOADED:String = "image_loaded";
		
		public function ImageEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone() : Event
		{
			return new ImageEvent(type, bubbles, cancelable);
		}
	}
}