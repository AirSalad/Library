package  
{
	import flash.display.MovieClip;
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxMath;
	import org.flixel.plugin.photonstorm.FlxDelay;
	
	public class WolfEnemy extends Enemy
	{
		//[Embed(source = '../assets/WOLFHEAD.png')] 
		//public var wolfPNG:Class;
		
		public var wolfMC:MovieClip;
		
		public function WolfEnemy(eLevel:int):void
		{
			super("Wolf", "Homing", "None", eLevel, (eLevel * 10), eLevel, (eLevel * 10), (eLevel * 100));
			wolfMC = new Wolf;
			
			//loadGraphic(wolfPNG, false, true, 116, 118);
			loadMovieClip(wolfMC, 138, 140, true, true);
		}
	
	}
}