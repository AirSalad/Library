package  
{
	import org.flixel.*;
	import flash.utils.getTimer;
	import org.flixel.plugin.photonstorm.BaseTypes.Bullet;
	
	public class centerPoint extends FlxSprite
	{
		public function centerPoint() 
		{
			super(0, 0);
			//loadGraphic(playerPNG, false, true, 20, 20, false);
			makeGraphic(1, 1);
			visible = false;
		}
		override public function update():void
		{
			x = PlayState.player.x +48;
			y = PlayState.player.y +62;
		}
	}
}