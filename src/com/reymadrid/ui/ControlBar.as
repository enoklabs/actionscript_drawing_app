package com.reymadrid.ui
{

	import com.reymadrid.managers.SliderManager;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import libs.ControlBarBase;
	
	
	public class ControlBar extends ControlBarBase
	{
		
		private var _strokePercent:Number;
		private var _shapeWidthPercent:Number;
		private var _shapeHeightPercent:Number;
		private var _shapeRadiusPercent:Number;
		private var _shapeButtons:Array;
		private var _colorButtons:Array;
		private var _circleOn:Boolean;
		private var _squareOn:Boolean;
		private var _rectOn:Boolean;
		private var _strokeOn:Boolean;
		private var _strokeColorOn:Boolean;
		private var _fillColorOn:Boolean;
		private var _strokeSlider:Slider;
		private var _sm:SliderManager;
		private var _strokeSize:Number;

		
		public function ControlBar()
		{			
			super();
			setup();
		}
		
		private function setup():void
		{
			_strokeSize = 2;
			createStrokeSlider();
			createButtons();
		}
	
		private function createStrokeSlider():void
		{
			_strokeSlider = new Slider ();
			_strokeSlider.x = 453;
			_strokeSlider.y = 110;
			this.SliderText.text = "0%";
			addChild ( _strokeSlider );
			_sm = new SliderManager ();
			_sm.setUpAssets ( _strokeSlider.mc_track, _strokeSlider.mc_handle );
			_sm.addEventListener ( Event.CHANGE, changeStroke );
		}
		
		private function createButtons():void
		{
			//Pen Button
			this.btnPen.mouseChildren = false;
			this.btnPen.buttonMode = true;
			this.btnPen.gotoAndStop ( 2 );
			_strokeOn = true;
			this.btnPen.addEventListener ( MouseEvent.CLICK, choosePenClick );
			
			//Cicle Button
			this.btnCircle.mouseChildren = false;
			this.btnCircle.buttonMode = true;
			this.btnCircle.stop ();
			_circleOn = false;
			this.btnCircle.addEventListener ( MouseEvent.CLICK, chooseCircleClick );
			
			//Rectangle Button
			this.btnRectangle.mouseChildren = false;
			this.btnRectangle.buttonMode = true;
			this.btnRectangle.stop ();
			_rectOn = false;
			this.btnRectangle.addEventListener ( MouseEvent.CLICK, chooseRectClick );
			
			_shapeButtons = [ btnPen, btnCircle, btnRectangle ];
			
			//Clear Canvas Button
			this.btnReset.mouseChildren = false;
			this.btnReset.buttonMode = true;
			
			
		}

		//Slider Event change stroke
		private function changeStroke( e:Event ):void
		{
			var p:Number = Math.ceil (_sm.percent);
			_strokeSize = ( _sm.percent );
			this.SliderText.text = p + "%";
			
		}
		
		
		//Choose Fill Colors                
		private function chooseFillColor( event:MouseEvent ):void
		{
			//Sets the Fill color state
			
			if ( _fillColorOn == false )
			{
				clearColorButtons ();
				this.activeColor.tfFillColor.gotoAndStop ( 2 );
				_fillColorOn = true;
			}
			else
			{
				clearColorButtons ();
				this.activeColor.tfFillColor.gotoAndStop ( 1 );
				_fillColorOn = false;
			}
			
		}
		
		private function chooseStrokeColor( event:MouseEvent ):void
		{
			//Sets the Stroke color state
			
			if ( _strokeColorOn == false )
			{
				clearColorButtons ();
				this.activeColor.tfStrokeColor.gotoAndStop ( 2 );
				_strokeColorOn = true;
			}
			else
			{
				clearColorButtons ();
				this.activeColor.tfStrokeColor.gotoAndStop ( 1 );
				_fillColorOn = false;
			}
			
		}
		
		//Setup Clear Buttons
		private function clearColorButtons():void
		{			
			for each ( var btn:MovieClip in _colorButtons )
			{
				if ( btn.currentFrame == 2 )
				{
					this.activeColor.tfFillColor.gotoAndStop ( 1 );
					this.activeColor.tfStrokeColor.gotoAndStop ( 1 );
					_fillColorOn = false;
					_strokeColorOn = false;
				}
			}
			
		}
		
		//Clears the Shape buttons
		private function clearShapeButtons():void
		{
			for each ( var btn:MovieClip in _shapeButtons )
			{
				if ( btn.currentFrame == 2 )
				{
					btn.gotoAndStop ( 1 );
					_circleOn = false;
					_squareOn = false;
					_rectOn = false;
					_strokeOn = false;
				}
			}
		}
		
		//Chooses Buttons   
		private function choosePenClick( e:MouseEvent ):void
		{
			//Sets the Stroke button state
			if ( _strokeOn == false )
			{
				clearColorButtons ();
				
				_strokeOn = true;
				this.btnPen.gotoAndStop (2);
			}
			else
			{
				clearColorButtons ();
				_strokeOn = false;
			}
			trace("I clicked Pen!!");
		}
		
		private function chooseCircleClick( e:MouseEvent ):void
		{
			//Sets the Circle button state
			if ( _circleOn == false )
			{
				clearShapeButtons ();
	
				_circleOn = true;
				this.btnPen.gotoAndStop (2);
				this.btnCircle.gotoAndStop(2);
				this.activeColor.gotoAndStop (1);
			}
			else
			{
				clearShapeButtons ();
				_circleOn = false;
			}
			trace("I clicked Circle!!");
		}
		
		private function chooseRectClick( e:MouseEvent ):void
		{
			//Sets the Rectangle button state
			if ( _rectOn == false )
			{
				clearShapeButtons ();
				_rectOn = true;
				this.btnRectangle.gotoAndStop (2);
			}
			else
			{
				clearShapeButtons ();
				_rectOn = false;
			}
			trace("I clicked Rectangle!!");
		}
		
		//Getters/Setters
		public function get strokeSize():Number
		{
			return _strokeSize;
			
		}
		
		public function get circleOn():Boolean
		{
			return _circleOn;
			
		}
		
		public function get rectOn():Boolean
		{
			return _rectOn;
			
		}
		
		public function get strokeOn():Boolean
		{
			return _strokeOn;
			
		}
		
		public function get strokeColorOn():Boolean
		{
			return _strokeColorOn;
			
		}
		
		public function get fillColorOn():Boolean
		{
			return _fillColorOn;
			
		}
	}
}