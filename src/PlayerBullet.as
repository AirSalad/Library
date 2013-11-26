package  
{
	import org.flixel.FlxSprite;
	import org.flixel.plugin.photonstorm.FlxVelocity;
	

	public class PlayerBullet extends FlxSprite
	{
		[Embed(source = '../assets/bullet.png')]
		private var bulletPNG:Class;
		
		public var damage:int = 1;
		public var speed:int = 300;
		
		public function PlayerBullet() 
		{
			super(0, 0, bulletPNG);
			
			//	We do this so it's ready for pool allocation straight away
			exists = false;
			offset.x = 10;
			offset.y = 10;
		}
		
		public function fire(bx:int, by:int, _angle:Number):void
		{
			x = bx;
			y = by;
			angle = _angle;
			
			velocity.x = Math.cos(angle) * 600;
			velocity.y = Math.sin(angle) * 600;

			exists = true;
		}
		
		override public function update():void
		{
			super.update();
			
			if (exists && y < -height)
			{
				exists = false;
			}
			else if (exists && (y > 1760))
			{
				exists = false;
			}
			
			if (exists && (x < 0))
			{
				exists = false;
			}
			else if (exists && (x > 3200))
			{
				exists = false;
			}
		}
		
	}

}