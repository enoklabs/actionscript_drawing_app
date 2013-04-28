package com.reymadrid.ui
{
	import flash.display.Sprite;
	import com.reymadrid.events.*;
	import com.reymadrid.loaders.*;
	
	public class ImageViewer extends Sprite
	{
		private var _imageList:Array;
		private var _path:String;
		private var _currentImage:int;
		private var _ld:ImageLoader;
		
		public function ImageViewer()
		{
			this.init();
			return;
		}// end function
		
		private function init() : void
		{
			this._imageList = [];
			this._currentImage = 0;
			return;
		}// end function
		
		private function loadImg() : void
		{
			this._ld = new ImageLoader(this._path + this._imageList[this._currentImage]);
			this._ld.addEventListener(ImageEvent.IMAGE_LOADED, this.onLoad);
			return;
		}// end function
		
		private function onLoad(event:ImageEvent) : void
		{
			if (this.numChildren > 0)
			{
				this.removeChildAt(0);
			}
			this.addChild(event.image);
			return;
		}// end function
		
		public function display() : void
		{
			this.loadImg();
			return;
		}// end function
		
		public function next() : void
		{
			var _loc_1:* = this;
			var _loc_2:* = this._currentImage + 1;
			_loc_1._currentImage = _loc_2;
			if (this._currentImage == this._imageList.length)
			{
				this._currentImage = 0;
			}
			this._ld.addEventListener(ImageEvent.IMAGE_LOADED, this.onLoad);
			this._ld = new ImageLoader(this._path + this._imageList[this._currentImage]);
			return;
		}// end function
		
		public function previous() : void
		{
			var _loc_1:* = this;
			var _loc_2:* = this._currentImage - 1;
			_loc_1._currentImage = _loc_2;
			if (this._currentImage < 0)
			{
				this._currentImage = this._imageList.length - 1;
			}
			this._ld.addEventListener(ImageEvent.IMAGE_LOADED, this.onLoad);
			this._ld = new ImageLoader(this._path + this._imageList[this._currentImage]);
			return;
		}// end function
		
		public function set path(param1:String) : void
		{
			this._path = param1;
			return;
		}// end function
		
		public function set imageList(param1:Array) : void
		{
			this._imageList = param1;
			return;
		}// end function
		
		public function get currentImage() : int
		{
			return this._currentImage;
		}// end function
		
	}
}
