package com.reymadrid.loaders
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLRequest;
	import com.reymadrid.events.ImageEvent;
	
	
	public class ImageLoader extends EventDispatcher
	{
		private var _ld:Loader;
		
		public function ImageLoader(loader:String)
		{
			this._ld = new Loader();
			this._ld.load(new URLRequest(loader));
			this._ld.contentLoaderInfo.addEventListener(Event.COMPLETE, this.onLoad);
			return;
		}// end function
		
		private function onLoad(event:Event) : void
		{
			var _loc_2:* = new ImageEvent(ImageEvent.IMAGE_LOADED);
			_loc_2.image = event.target.content;
			dispatchEvent(_loc_2);
			this._ld.contentLoaderInfo.removeEventListener(Event.COMPLETE, this.onLoad);
			this._ld.unload();
			this._ld = null;
			return;
		}// end function
		
	}
}
