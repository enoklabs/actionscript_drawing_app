package com.reymadrid.views
{
	import libs.WeatherBase;
	import com.reymadrid.ui.*;
	import flash.events.*;
	import flash.text.*;
	import libs.*;
	
	public class WeatherView extends WeatherBase
	{
		private var _degreeTypes:Array;
		
		public function WeatherView()
		{
			super();
			init();
		}
		private function init() : void
		{
			this.setupButton();
			this._degreeTypes = [tfDegreeType1, tfDegreeType2, tfDegreeType3, tfDegreeType4, tfDegreeType5];
			return;
		}
		
		private function setupButton() : void
		{
			resetBtn.gotoAndStop(1);
			resetBtn.addEventListener(MouseEvent.MOUSE_DOWN, this.mouseDown);
			return;
		}// end function
		
		private function imageByCode(param1:String) : String
		{
			var _loc_2:* = null;
			if (param1 == "0")
			{
				_loc_2 = "tornado.png";
			}
			else
			{
				if (param1 != "1")
				{
				}
				if (param1 == "2")
				{
					_loc_2 = "hurricaine.png";
				}
				else
				{
					if (param1 != "3")
					{
					}
					if (param1 != "4")
					{
					}
					if (param1 != "37")
					{
					}
					if (param1 != "38")
					{
					}
					if (param1 != "39")
					{
					}
					if (param1 != "45")
					{
					}
					if (param1 == "47")
					{
						_loc_2 = "tstorm3.png";
					}
					else
					{
						if (param1 != "5")
						{
						}
						if (param1 != "6")
						{
						}
						if (param1 != "7")
						{
						}
						if (param1 == "18")
						{
							_loc_2 = "sleet.png";
						}
						else
						{
							if (param1 != "8")
							{
							}
							if (param1 != "10")
							{
							}
							if (param1 == "35")
							{
								_loc_2 = "hail_mixed.png";
							}
							else
							{
								if (param1 != "9")
								{
								}
								if (param1 == "40")
								{
									_loc_2 = "light_rain.png";
								}
								else
								{
									if (param1 != "11")
									{
									}
									if (param1 == "12")
									{
										_loc_2 = "shower3.png";
									}
									else
									{
										if (param1 != "13")
										{
										}
										if (param1 != "14")
										{
										}
										if (param1 != "42")
										{
										}
										if (param1 == "46")
										{
											_loc_2 = "snow4.png";
										}
										else
										{
											if (param1 != "15")
											{
											}
											if (param1 != "16")
											{
											}
											if (param1 != "41")
											{
											}
											if (param1 == "43")
											{
												_loc_2 = "snow5.png";
											}
											else if (param1 == "17")
											{
												_loc_2 = "hail.png";
											}
											else if (param1 == "19")
											{
												_loc_2 = "dusty.png";
											}
											else
											{
												if (param1 != "20")
												{
												}
												if (param1 == "22")
												{
													_loc_2 = "fog.png";
												}
												else if (param1 == "21")
												{
													_loc_2 = "haze.png";
												}
												else
												{
													if (param1 != "23")
													{
													}
													if (param1 == "24")
													{
														_loc_2 = "windy.png";
													}
													else if (param1 == "25")
													{
														_loc_2 = "cold.png";
													}
													else if (param1 == "26")
													{
														_loc_2 = "cloudy5.png";
													}
													else if (param1 == "27")
													{
														_loc_2 = "cloudy4_night.png";
													}
													else if (param1 == "28")
													{
														_loc_2 = "cloudy4.png";
													}
													else if (param1 == "29")
													{
														_loc_2 = "cloudy2_night.png";
													}
													else
													{
														if (param1 != "30")
														{
														}
														if (param1 == "44")
														{
															_loc_2 = "cloudy2.png";
														}
														else if (param1 == "31")
														{
															_loc_2 = "clear_night.png";
														}
														else if (param1 == "32")
														{
															_loc_2 = "sunny.png";
														}
														else if (param1 == "33")
														{
															_loc_2 = "cloudy1_night.png";
														}
														else if (param1 == "34")
														{
															_loc_2 = "cloudy1.png";
														}
														else if (param1 == "36")
														{
															_loc_2 = "hot.png";
														}
														else if (param1 == "3200")
														{
															_loc_2 = "dunno.png";
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
			return _loc_2;
		}// end function
		
		private function mouseDown(event:MouseEvent) : void
		{
			resetBtn.gotoAndStop(2);
			resetBtn.addEventListener(MouseEvent.MOUSE_UP, this.mouseUp);
			return;
		}// end function
		
		private function mouseUp(event:MouseEvent) : void
		{
			resetBtn.gotoAndStop(1);
			resetBtn.removeEventListener(MouseEvent.MOUSE_UP, this.mouseUp);
			return;
		}// end function
		
		public function set degreeType(param1:String) : void
		{
			var _loc_2:* = null;
			for each (_loc_2 in this._degreeTypes)
			{
				
				_loc_2.text = param1;
			}
			return;
		}// end function
		
		public function set location(param1:String) : void
		{
			tfLocation.text = param1;
			return;
		}// end function
		
		public function set todayHigh(param1:String) : void
		{
			tfTodayHigh.text = param1;
			return;
		}// end function
		
		public function set todayLow(param1:String) : void
		{
			tfTodayLow.text = param1;
			return;
		}// end function
		
		public function set todayCode(param1:String) : void
		{
			var _loc_2:* = param1;
			var _loc_3:* = new ImageViewer();
			_loc_3.path = "images/icons/";
			var _loc_4:* = this.imageByCode(_loc_2);
			_loc_3.imageList = [_loc_4];
			_loc_3.x = -72;
			_loc_3.y = -79;
			var _loc_5:* = 0.5;
			_loc_3.scaleY = 0.5;
			_loc_3.scaleX = _loc_5;
			_loc_3.display();
			this.addChild(_loc_3);
			return;
		}// end function
		
		public function set todayForecast(param1:String) : void
		{
			tfTodayForecast.text = param1;
			return;
		}// end function
		
		public function set tomorrowHigh(param1:String) : void
		{
			tfTomorrowHigh.text = param1;
			return;
		}// end function
		
		public function set tomorrowLow(param1:String) : void
		{
			tfTomorrowLow.text = param1;
			return;
		}// end function
		
		public function set tomorrowCode(param1:String) : void
		{
			var _loc_2:* = param1;
			var _loc_3:* = new ImageViewer();
			_loc_3.path = "images/icons/";
			var _loc_4:* = this.imageByCode(_loc_2);
			_loc_3.imageList = [_loc_4];
			_loc_3.x = 124;
			_loc_3.y = -79;
			var _loc_5:* = 0.5;
			_loc_3.scaleY = 0.5;
			_loc_3.scaleX = _loc_5;
			_loc_3.display();
			this.addChild(_loc_3);
			return;
		}// end function
		
		public function set tomorrowForecast(param1:String) : void
		{
			tfTomorrowForecast.text = param1;
			return;
		}// end function
		
		public function set currentTemp(param1:String) : void
		{
			tfCurrentTemp.text = param1;
			return;
		}// end function
		
		public function set speedType(param1:String) : void
		{
			tfSpeedType.text = param1;
			return;
		}// end function
		
		public function set currentWindMPH(param1:String) : void
		{
			var _loc_2:* = Math.round(Number(param1));
			var _loc_3:* = String(_loc_2);
			tfWindMPH.text = _loc_3;
			return;
		}// end function
		
		public function set currentWindDirection(param1:String) : void
		{
			var _loc_2:* = Number(param1);
			if (_loc_2 == 0)
			{
				tfWindDirection.text = "";
			}
			else
			{
				if (_loc_2 > 348.75)
				{
				}
				if (_loc_2 < 11.25)
				{
					tfWindDirection.text = "N";
				}
				else
				{
					if (_loc_2 > 11.25)
					{
					}
					if (_loc_2 < 33.75)
					{
						tfWindDirection.text = "NNE";
					}
					else
					{
						if (_loc_2 > 33.75)
						{
						}
						if (_loc_2 < 56.25)
						{
							tfWindDirection.text = "NE";
						}
						else
						{
							if (_loc_2 > 56.25)
							{
							}
							if (_loc_2 < 78.75)
							{
								tfWindDirection.text = "ENE";
							}
							else
							{
								if (_loc_2 > 78.75)
								{
								}
								if (_loc_2 < 101.25)
								{
									tfWindDirection.text = "E";
								}
								else
								{
									if (_loc_2 > 101.25)
									{
									}
									if (_loc_2 < 123.75)
									{
										tfWindDirection.text = "ESE";
									}
									else
									{
										if (_loc_2 > 123.75)
										{
										}
										if (_loc_2 < 146.25)
										{
											tfWindDirection.text = "SE";
										}
										else
										{
											if (_loc_2 > 146.25)
											{
											}
											if (_loc_2 < 168.75)
											{
												tfWindDirection.text = "SSE";
											}
											else
											{
												if (_loc_2 > 168.75)
												{
												}
												if (_loc_2 < 191.25)
												{
													tfWindDirection.text = "S";
												}
												else
												{
													if (_loc_2 > 191.25)
													{
													}
													if (_loc_2 < 213.75)
													{
														tfWindDirection.text = "SSW";
													}
													else
													{
														if (_loc_2 > 213.75)
														{
														}
														if (_loc_2 < 236.25)
														{
															tfWindDirection.text = "SW";
														}
														else
														{
															if (_loc_2 > 236.25)
															{
															}
															if (_loc_2 < 258.75)
															{
																tfWindDirection.text = "WSW";
															}
															else
															{
																if (_loc_2 > 258.75)
																{
																}
																if (_loc_2 < 281.25)
																{
																	tfWindDirection.text = "W";
																}
																else
																{
																	if (_loc_2 > 281.25)
																	{
																	}
																	if (_loc_2 < 303.75)
																	{
																		tfWindDirection.text = "WNW";
																	}
																	else
																	{
																		if (_loc_2 > 303.75)
																		{
																		}
																		if (_loc_2 < 326.25)
																		{
																			tfWindDirection.text = "NW";
																		}
																		else
																		{
																			if (_loc_2 > 326.25)
																			{
																			}
																			if (_loc_2 < 348.75)
																			{
																				tfWindDirection.text = "NNW";
																			}
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
			return;
		}
	}
}