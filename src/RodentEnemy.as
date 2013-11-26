package  
{
	import flash.display.MovieClip;
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxMath;
	import org.flixel.plugin.photonstorm.FlxDelay;
	
	public class RodentEnemy extends Enemy
	{
		//[Embed(source = '../assets/RODENT.png')] 
		//public var rodentPNG:Class;
		
		public var rodentMC:MovieClip;
			
		public function RodentEnemy(eLevel:int):void
		{
			super("Rodent", "Roaming Random", "None", eLevel, (eLevel * 2), eLevel, (eLevel * 10), (eLevel * 10));
			rodentMC = new Rodent;
			
			//loadGraphic(rodentPNG, false, true, 85, 56);
			loadMovieClip(rodentMC, 85, 56, true, true);
			
		}
	
	}
}