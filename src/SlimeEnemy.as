package  
{
	import flash.display.MovieClip;
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxMath;
	import org.flixel.plugin.photonstorm.FlxDelay;
	
	public class SlimeEnemy extends Enemy
	{
		//[Embed(source = '../assets/SLIME CORE.png')] 
		//public var slimePNG:Class;
			
		public var slimeMC:MovieClip;
		
		public function SlimeEnemy(eLevel:int):void
		{
			super("Slime", "Stationary", "Basic", eLevel, (eLevel * 2), eLevel, (eLevel * 10), (eLevel * 10));
			slimeMC = new Slime;
			
			//loadGraphic(slimePNG, false, true, 71, 61);
			loadMovieClip(slimeMC, 74, 55, true,true);
		}
	
	}
}