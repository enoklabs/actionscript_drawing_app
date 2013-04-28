package com.reymadrid.views
{
	import flash.events.MouseEvent;
	import libs.InputViewBase;
	import libs.*;
	import flash.display.MovieClip;
	
	public class InputView extends InputViewBase
	{
		private var _zipcode:String;
		private var _error:String;
		private var _degreeType:String;
		private var _speedType:String;
		
		public function InputView()
		{
			this.init();
			return;
		}// end function
		
		private function init() : void
		{
			this.setupButtons();
			this.restrictInput();
			tfError.text = "";
			this._degreeType = "F";
			this._speedType = "MPH";
			return;
		}// end function
		
		private function setupButtons() : void
		{
			fahrBtn.gotoAndStop(2);
			celsiusBtn.gotoAndStop(1);
			submitBtn.gotoAndStop(1);
			fahrBtn.addEventListener(MouseEvent.CLICK, this.toggleFahr);
			celsiusBtn.addEventListener(MouseEvent.CLICK, this.toggleCelsius);
			submitBtn.addEventListener(MouseEvent.MOUSE_DOWN, this.mouseDown);
			tfInput.addEventListener(MouseEvent.CLICK, this.clearText);
			return;
		}// end function
		
		private function restrictInput() : void
		{
			tfInput.restrict = "0-9";
			tfInput.maxChars = 5;
			return;
		}// end function
		
		private function toggleFahr(event:MouseEvent) : void
		{
			if (fahrBtn.currentFrame == 1)
			{
				fahrBtn.gotoAndStop(2);
				celsiusBtn.gotoAndStop(1);
				this._degreeType = "F";
				this._speedType = "MPH";
			}
			return;
		}// end function
		
		private function toggleCelsius(event:MouseEvent) : void
		{
			if (celsiusBtn.currentFrame == 1)
			{
				celsiusBtn.gotoAndStop(2);
				fahrBtn.gotoAndStop(1);
				this._degreeType = "C";
				this._speedType = "KPH";
			}
			return;
		}// end function
		
		private function mouseDown(event:MouseEvent) : void
		{
			submitBtn.gotoAndStop(2);
			submitBtn.addEventListener(MouseEvent.MOUSE_UP, this.mouseUp);
			return;
		}// end function
		
		private function mouseUp(event:MouseEvent) : void
		{
			submitBtn.gotoAndStop(1);
			submitBtn.removeEventListener(MouseEvent.MOUSE_UP, this.mouseUp);
			return;
		}// end function
		
		private function clearText(event:MouseEvent) : void
		{
			tfInput.text = "";
			tfInput.removeEventListener(MouseEvent.CLICK, this.clearText);
			return;
		}// end function
		
		public function get zipcode() : String
		{
			this._zipcode = tfInput.text;
			return this._zipcode;
		}// end function
		
		public function set zipcode(param1:String) : void
		{
			this._zipcode = param1;
			tfInput.text = this._zipcode;
			return;
		}// end function
		
		public function get error() : String
		{
			this._error = tfError.text;
			return this._error;
		}// end function
		
		public function set error(param1:String) : void
		{
			this._error = param1;
			tfError.text = this._error;
			return;
		}// end function
		
		public function get degreeType() : String
		{
			var _loc_1:* = this._degreeType;
			return _loc_1;
		}// end function
		
		public function get speedType() : String
		{
			var _loc_1:* = this._speedType;
			return _loc_1;
		}// end function
		
	}
}
