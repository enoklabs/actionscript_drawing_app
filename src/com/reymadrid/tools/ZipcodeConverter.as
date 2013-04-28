package com.reymadrid.tools
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	public class ZipcodeConverter extends Sprite
	{
		private var _woeid:String;
		
		public function ZipcodeConverter(id:String)
		{
			this.query(id);
			return;
		}// end function
		
		private function query(zip:String) : void
		{
			var _loc_2:* = "SELECT woeid FROM geo.places WHERE text=" + zip + " LIMIT 1";
			var _loc_3:* = new URLLoader();
			_loc_3.load(new URLRequest("http://query.yahooapis.com/v1/public/yql?q=" + _loc_2));
			_loc_3.addEventListener(Event.COMPLETE, this.onParse);
			return;
		}// end function
		
		private function onParse(event:Event) : void
		{
			var _loc_2:* = XML(event.target.data);
			this._woeid = _loc_2..woeid;
			dispatchEvent(new Event(Event.COMPLETE));
			return;
		}// end function
		
		public function get woeid() : String
		{
			return this._woeid;
		}// end function
		
	}
}
