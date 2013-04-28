package com.reymadrid.managers
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	public class SliderManager extends EventDispatcher
	{
		protected var _track:Sprite;
		protected var _handle:Sprite;
		
		public var percent:Number;
		
		public function SliderManager(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public function setUpAssets(track:Sprite, handle:Sprite):void
		{
			_track = track;
			_handle = handle;
			
			_handle.buttonMode = true;
			_handle.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			updateHandle();
		}
		
		private function onMouseDown(event:MouseEvent):void
		{
			_handle.stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			_handle.startDrag(false, new Rectangle(0,0,(_track.width - _handle.width),0));
			_handle.addEventListener(Event.ENTER_FRAME, calcPercent);
		}
		
		private function onMouseUp(event:MouseEvent):void
		{
			_handle.stopDrag();
			_handle.stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			_handle.removeEventListener(Event.ENTER_FRAME, calcPercent);
		}
		
		private function calcPercent (event:Event):void
		{
			var per:Number = _handle.x / (_track.width - _handle.width);
			per = _handle.x;
			
			if(percent != per)
			{
				percent = per;
				this.dispatchEvent(new Event(Event.CHANGE));
				trace("Stroke Percent: "+ per+ "%");
			}
		}
		
		protected function updateHandle():void
		{
			if(_handle && _track)
			{
				_handle.x = (_track.width - _handle.width) * percent;
			}
		}
	}
}