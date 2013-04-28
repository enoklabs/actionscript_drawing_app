package com.reymadrid.app
{
	import com.reymadrid.events.ColorPickerEvent;
	import com.reymadrid.ui.ColorPicker;
	import com.reymadrid.ui.ControlBar;
	import com.reymadrid.ui.Slider;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.geom.ColorTransform;
	import flash.ui.Mouse;
	import libs.CustomCursor;
	import libs.DrawingAppBase;
	
	public class DrawingApp extends DrawingAppBase
	{
		private var _cp:ColorPicker;
		private var _cb:ControlBar;
		private var _strokeSize:Number;
		private var _strokeColor:uint;
		private var _shapeWidth:Number;
		private var _shapeHeight:Number;
		private var _shapeRadius:Number;
		private var _sqSize:Number;
		private var _canvas:Sprite;
		private var _drawingShape:DrawingShapes;
		private var _shapes:Array;
		private var _fillColor:uint;
		private var _stroke:int;
		private var _shape:int;
		private var _draw:Boolean;
		private var _penCursor:CustomCursor =new CustomCursor();

		
		public function DrawingApp()
		{
			super();
			init();
		}
		
		private function init():void
		{
			_shapes = [];
			
			_strokeColor = 0x000000;
			_fillColor = 0x0000FF;
			
			_draw = false;
			
			//create new canvas
			_canvas = new Sprite();
			this.addChild(_canvas);
			_canvas.mask = CanvasMask;
			
			this.addEventListener(MouseEvent.MOUSE_MOVE, draw);
			this.addEventListener(MouseEvent.CLICK, drawOnCanvas);
			this.addEventListener(MouseEvent.MOUSE_DOWN, startDraw);
			this.addEventListener(MouseEvent.MOUSE_UP, stopDraw);
			
			//create new control bar
			_cb = new ControlBar();
			_cb.x = 0;
			_cb.y = 324;
			this.addChild(_cb);
			_cb.activeColor.stop();
			_cb.btnReset.addEventListener(MouseEvent.CLICK, clearCanvas);
			setupShapes();
			
			//create new Color Picker
			_cp = new ColorPicker("assets/images/picker.jpg");
		  	_cp.x = 27;
			_cp.y = -230;
			_cb.addChild (_cp);
			_cp.addEventListener (ColorPickerEvent.COLOR_CHANGE, colorChange);
			
			//Mouse Cursor
			Mouse.hide();
			this._penCursor.x=this.mouseX;
			this._penCursor.y=this.mouseY;
			this.addChild(_penCursor);
			this.addEventListener(Event.ENTER_FRAME,enterFrameEvent);
		}
		
		private function enterFrameEvent(e:Event):void{
			
			//Set custom mouse cursor position 
			if(this.mouseX>160 && this.mouseX<780 && this.mouseY>70 && this.mouseY<400)
			{
				this._penCursor.x=this.mouseX;
				this._penCursor.y=this.mouseY;
				Mouse.hide();	
			}else{
				Mouse.show();
				this._penCursor.y=-200;
			}
		}
		
		private function startDraw(e:MouseEvent):void
		{
			_draw = true;
			_canvas.graphics.moveTo ( this.mouseX, this.mouseY );
		}
		
		private function stopDraw( e:MouseEvent ):void
		{
			_draw = false;
		}
		
		private function setupShapes():void
		{
			_strokeSize = _cb.strokeSize;
			
		}
		private function clearCanvas(event:MouseEvent):void
		{
			for each ( var s:DrawingShapes in _shapes )
			{
				_canvas.removeChild ( s );
				_canvas.graphics.clear ();
				_shapes = [];
			}
			trace("canvas cleared!!");
		}
		
		private function drawOnCanvas( e:MouseEvent ):void
		{
			
			if (_cb.circleOn)
			{
				setupShapes ();
				_drawingShape = new DrawingShapes ();
				_drawingShape.drawCircle ( _strokeColor, _strokeSize, _strokeColor);
				_drawingShape.x = e.stageX;
				_drawingShape.y = e.stageY;
				_canvas.addChild (_drawingShape);
				_shapes.push (_drawingShape);
			}
			else if (_cb.rectOn)
			{
				setupShapes ();
				_drawingShape = new DrawingShapes ();
				_drawingShape.drawRect ( _strokeColor, _strokeSize, _strokeColor);
				_drawingShape.x = e.stageX;
				_drawingShape.y = e.stageY;
				_canvas.addChild (_drawingShape);
				_shapes.push (_drawingShape);
			}
		}
		
		private function draw( event:MouseEvent ):void
		{
			if ( _cb.strokeOn && _draw )
			{
				setupShapes ();
				
				_canvas.graphics.lineStyle ( _strokeSize, _strokeColor );
				_canvas.graphics.lineTo ( this.mouseX, this.mouseY );
			}
		}
		
		//Color Picker Event          
		private function colorChange( e:ColorPickerEvent ):void
		{
			var ct:ColorTransform = new ColorTransform ();
			ct.color = e.color;
			
			_cb.activeColor.transform.colorTransform = ct;
			_strokeColor = e.color;
			trace ( "Stroke color:" + e.color );
		}
	}
}