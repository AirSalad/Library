package  
{
	import org.flixel.*;
	import flash.utils.getTimer;
	import org.flixel.plugin.photonstorm.BaseTypes.Bullet;
	
	public class stageCenterPoint extends FlxSprite
	{
		public function stageCenterPoint() 
		{
			super(0, 0);
			//loadGraphic(playerPNG, false, true, 20, 20, false);
			makeGraphic(1, 1);
			visible = false;
		}
		override public function update():void
		{
			x = FlxG.stage.width / 2;
			y = FlxG.stage.height / 2;
		}
	}
}