package  
{
	import flash.display.MovieClip;
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxMath;
	import org.flixel.plugin.photonstorm.FlxDelay;
	
	public class BatEnemy extends Enemy
	{
		//[Embed(source = '../assets/Bat.png')] 
		//public var batPNG:Class;
		
		public var batMC:MovieClip;
			
		public function BatEnemy(eLevel:int):void
		{
			super("Bat", "Roaming Horizontal", "None", eLevel, (eLevel * 10), eLevel, (eLevel * 10), (eLevel * 10));
			batMC = new Bat;
			
			//loadGraphic(batPNG, false, true, 81, 73);
			loadMovieClip(batMC, 100,112, true, true);
		}
	
	}
}