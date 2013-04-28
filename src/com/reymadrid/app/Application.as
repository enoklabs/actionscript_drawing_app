package com.reymadrid.app
{
	import flash.display.Sprite;
	import com.reymadrid.data.ValidZipcodes;
	import com.reymadrid.tools.ZipcodeConverter;
	import com.reymadrid.views.InputView;
	import com.reymadrid.views.WeatherView;
	import com.reymadrid.vo.WeatherVO;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	public class Application extends Sprite
	{
		private var _woeid:String;
		private var _zc:ZipcodeConverter;
		private var _iv:InputView;
		private var _wv:WeatherView;
		private var _vo:WeatherVO;
		private var _validate:ValidZipcodes;
		private var _validZips:String;
		
		public function Application()
		{
			super();
			init();
		}
		
		private function init() : void
		{
			this._iv = new InputView();
			this.addChild(this._iv);
			this._iv.submitBtn.addEventListener(MouseEvent.CLICK, this.onSubmit);
			this._vo = new WeatherVO();
			return;
		}// end function
		
		private function onSubmit(event:MouseEvent) : void
		{
			this._iv.error = "";
			this._validate = new ValidZipcodes();
			this._validate.addEventListener(Event.COMPLETE, this.zipsLoaded);
			return;
		}// end function
		
		private function zipsLoaded(event:Event) : void
		{
			this._validZips = this._validate.validZips;
			if (this._iv.zipcode.length == 5)
			{
			}
			if (this._validZips.search(this._iv.zipcode) != -1)
			{
				this.convertZip(this._iv.zipcode);
				this.removeChild(this._iv);
			}
			else
			{
				this._iv.error = "* Please enter a valid U.S. zipcode. *";
			}
			return;
		}// end function
		
		private function convertZip(param1:String) : void
		{
			this._zc = new ZipcodeConverter(param1);
			this._zc.addEventListener(Event.COMPLETE, this.conversionComplete);
			return;
		}// end function
		
		private function conversionComplete(event:Event) : void
		{
			this._woeid = this._zc.woeid;
			this.xmlLoad();
			return;
		}// end function
		
		private function xmlLoad() : void
		{
			var _loc_1:* = new URLLoader();
			if (this._iv.degreeType == "F")
			{
				_loc_1.load(new URLRequest("http://weather.yahooapis.com/forecastrss?w=" + this._woeid));
			}
			else
			{
				_loc_1.load(new URLRequest("http://weather.yahooapis.com/forecastrss?w=" + this._woeid + "&u=c"));
			}
			_loc_1.addEventListener(Event.COMPLETE, this.onParse);
			return;
		}// end function
		
		private function onParse(event:Event) : void
		{
			var _loc_2:* = XML(event.target.data);
			var _loc_3:* = new Namespace("http://xml.weather.yahoo.com/ns/rss/1.0");
			this._vo.location = _loc_3::location.@city + ", " + _loc_3::location.@region + " (" + this._iv.zipcode + ")";
			this._vo.todayHigh = _loc_3::forecast[0].@high;
			this._vo.todayLow = _loc_3::forecast[0].@low;
			this._vo.todayCode = _loc_3::forecast[0].@code;
			this._vo.todayForecast = _loc_3::forecast[0].@text;
			this._vo.tomorrowHigh = _loc_3::forecast[1].@high;
			this._vo.tomorrowLow = _loc_3::forecast[1].@low;
			this._vo.tomorrowCode = _loc_3::forecast[1].@code;
			this._vo.tomorrowForecast = _loc_3::forecast[1].@text;
			this._vo.currentTemp = _loc_3::condition.@temp;
			this._vo.currentWindMPH = _loc_3::wind.@speed;
			this._vo.currentWindDirection = _loc_3::wind.@direction;
			this.loadWeather();
			return;
		}// end function
		
		private function loadWeather() : void
		{
			this._wv = new WeatherView();
			this._wv.location = this._vo.location;
			this._wv.degreeType = this._iv.degreeType;
			this._wv.todayHigh = this._vo.todayHigh;
			this._wv.todayLow = this._vo.todayLow;
			this._wv.todayCode = this._vo.todayCode;
			this._wv.todayForecast = this._vo.todayForecast;
			this._wv.tomorrowHigh = this._vo.tomorrowHigh;
			this._wv.tomorrowLow = this._vo.tomorrowLow;
			this._wv.tomorrowCode = this._vo.tomorrowCode;
			this._wv.tomorrowForecast = this._vo.tomorrowForecast;
			this._wv.currentTemp = this._vo.currentTemp;
			this._wv.currentWindMPH = this._vo.currentWindMPH;
			this._wv.speedType = this._iv.speedType;
			this._wv.currentWindDirection = this._vo.currentWindDirection;
			this.addChild(this._wv);
			this._wv.resetBtn.addEventListener(MouseEvent.CLICK, this.onReset);
			return;
		}// end function
		
		private function onReset(event:MouseEvent) : void
		{
			this.removeChild(this._wv);
			this.init();
			return;
		}
		
	}
}