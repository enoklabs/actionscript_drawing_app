package com.reymadrid.data
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.net.URLLoader;
	
	public class ValidZipcodes extends Sprite
	{
		private var _validZips:String;
		
		public function ValidZipcodes()
		{
			super();
			loadData();
		}
		private function loadData() : void
		{
			var _loc_1:* = new URLLoader();
			_loc_1.load(new URLRequest("data/zipcodes.txt"));
			_loc_1.addEventListener(Event.COMPLETE, this.onLoad);
			return;
		}// end function
		
		private function onLoad(event:Event) : void
		{
			this._validZips = event.target.data;
			dispatchEvent(new Event(Event.COMPLETE));
			return;
		}// end function
		
		public function get validZips() : String
		{
			return this._validZips;
		}// end function
		
	}
}