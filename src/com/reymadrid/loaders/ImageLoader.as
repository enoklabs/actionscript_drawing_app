package com.reymadrid.loaders
{
	import com.reymadrid.events.ImageEvent;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.net.URLRequest;
	
	
	public class ImageLoader extends EventDispatcher
	{
		private var _ld:Loader;
		
		public function ImageLoader(loader:String)
		{
			_ld = new Loader();
			_ld.load(new URLRequest(loader));
			_ld.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoad);
		}
		
		private function onLoad(event:Event) : void
		{
			var evt:ImageEvent = new ImageEvent(ImageEvent.IMAGE_LOADED);
			evt.image = event.target.content;
			dispatchEvent(evt);
			_ld.contentLoaderInfo.removeEventListener(Event.COMPLETE, onLoad);
			_ld.unload();
			_ld = null;
		}
		
	}
}
