package 
{
	import org.flixel.*
	import org.flixel.plugin.photonstorm.*;
	import org.flixel.plugin.funstorm.FlxMovieClip;
	import flash.display.*;
	
	public class Upgrades extends FlxGroup
	{
		public var playerGold:int;
		public var shopCosts:Array;
		public var shopItems:Array;
		public var itemDetails:Object = {   wId:int,
											wType:String,
											wDamage:int,
											wFireRate:int,
											wVelocity:int,
											wMaxSpeed:int,
											wCurrentExp:int,
											wMaxExp:int,
											wCurrentLevel:int,
											wMaxLevel:int,
											wGoldCost:int };
												
		public var currentPrimary:Object = {    wId:int,
												wType:String,
												wDamage:int,
												wFireRate:int,
												wVelocity:int,
												wMaxSpeed:int,
												wCurrentExp:int,
												wMaxExp:int,
												wCurrentLevel:int,
												wMaxLevel:int,
												wGoldCost:int };
		}
		public function Upgrades():void
		{
			super();
		}
		public function createUpgradeBG():void
		{
			
		}
		public function updateUpgrades():void
		{
			
		}
	}
	
}