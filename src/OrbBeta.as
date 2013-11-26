package  
{
	import org.flixel.*;
	import flash.utils.getTimer;
	import org.flixel.plugin.photonstorm.FlxVelocity;
	import org.flixel.plugin.photonstorm.FlxWeapon;
	import org.flixel.plugin.photonstorm.BaseTypes.Bullet;
	
	public class Orb extends FlxSprite
	{
		[Embed(source = '../assets/orb.png')]
		private var orbPNG:Class;
		
		public var speed:int = 300;
		
		private var radius:Number = 100;
		
		private var currentMouseAngle:Number = 0;
		
		public function Orb() 
		{
			super(0, 0, orbPNG);
			
			loadGraphic(orbPNG,false,false,39,39,false);
			angle = 0;
			offset.x = 19.5;
			offset.y = 19.5;
		}
		
		//public function DegreestoRadians(degrees:Number) :Number
		//{
		//	return degrees * Math.PI / 180;
		//}
		
		public function updateAngle(_angle:Number):void
		{
			angle = _angle;
		}
		
		override public function update():void
		{
			super.update();
			
			//trace(angle);
			//FlxG.collide(bouncingBullet.group, walls);
			
			//If the player is dead, kill the orb
			if (Registry.player.health <= 0)
			{
				kill();
			}
			
			//Sets orb into a orbit around the player dependant on mouse position
			if (x != Registry.player.x + (Registry.player.width/2) + Math.cos(angle) * 100)
			{
				x = Registry.player.x + (Registry.player.width/2) + Math.cos(angle) * 100;
			}
			if (y != Registry.player.y + (Registry.player.height/2) + Math.sin(angle) * 100)
			{
				y = Registry.player.y + (Registry.player.height/2) + Math.sin(angle) * 100;
			}
			
			
			
			//if (FlxG.mouse.pressed())
			//{
			//	bouncingBullet.fire();
			//}
			
			//Bullets shot dependant on fire type
			/*if (FlxG.mouse.pressed() && getTimer() > lastFired + bulletDelay && exists)
			{
				switch (fireType)
				{
					case "Basic":
					//Registry.playerBullets.fire(x , y, angle);
					break;
					
					case "Spreadx2":
					//Registry.playerBullets.fire(x, y, angle-0.2);
					//Registry.playerBullets.fire(x, y, angle + 0.2);
					break;
					
					case "Basicx2":
					//Registry.playerBullets.fire(x+10, y+10, angle);
					//Registry.playerBullets.fire(x-10, y-10, angle);
					break;
					
					case "WeaponTest":
					//Registry.bouncingBullet.fireAtMouse();
					break;
					
				}
				
				lastFired = getTimer();
			}*/

		}
		
	}

}