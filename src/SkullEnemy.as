package  
{
	import flash.display.MovieClip;
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxMath;
	import org.flixel.plugin.photonstorm.FlxDelay;
	import org.flixel.plugin.photonstorm.FlxVelocity;
	
	public class SkullEnemy extends Enemy
	{
		//[Embed(source = '../assets/SKULL.png')] 
		//public var skullPNG:Class;
		
		public var skullMC:MovieClip;
			
		public function SkullEnemy(eLevel:int):void
		{
			super("Skull", "Stationary", "None", eLevel, (eLevel * 2), eLevel, (eLevel * 10), (eLevel * 10));
			skullMC = new Skull;
			
			//loadGraphic(skullPNG, false, true, 80, 88);
			loadMovieClip(skullMC, 80, 88, true, true);
			//FlxVelocityB.moveTowardsObject(SkullEnemy, Registry.player, 100);
		}
	
	}
}