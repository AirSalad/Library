package  
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxVelocity;

	public class EnemyBullet extends FlxSprite
	{
		[Embed(source = '../assets/enemyBullet.png')] private var bulletPNG:Class;
		
		//public var damage:int = 25;
		public var speed:int = 240;
		
		public function EnemyBullet() 
		{
			super(0, 0, bulletPNG);
			
			//	We do this so it's ready for pool allocation straight away
			exists = false;
		}

		public function fire(bx:int, by:int):void
		{
			x = bx;
			y = by;
			
			FlxVelocity.moveTowardsObject(this, Registry.player, speed);
			
			//velocity.x = Math.cos(angle) * 600;
			//velocity.y = Math.sin(angle) * 600;
			
			//x = Registry.player.x + (Registry.player.width/2) + Math.cos(angle) * 100;

			//y = Registry.player.y + (Registry.player.height/2) + Math.sin(angle) * 100;
			
			//trace("Enemy fired");
			
			exists = true;
		}
		
		override public function update():void
		{
			super.update();
			
			//	Bullet off the screen?
			if (exists && (y < 0 || y > 1760 || x < 0 || x > 3600))
			{
				exists = false;
			}
		}
		
		
	}

}