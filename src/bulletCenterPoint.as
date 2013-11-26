package  
{
	import org.flixel.*;
	import flash.utils.getTimer;
	import org.flixel.plugin.photonstorm.BaseTypes.Bullet;
	
	public class bulletCenterPoint extends FlxSprite
	{
		public function bulletCenterPoint() 
		{
			super(0, 0);
			//loadGraphic(playerPNG, false, true, 20, 20, false);
			makeGraphic(1, 1);
			visible = false;
		}
		/*override public function update():void
		{
			
		}*/
	}
}