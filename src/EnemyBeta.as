package  
{
	import flash.display.MorphShape;
	import org.flixel.*;
	import org.flixel.plugin.funstorm.FlxMovieClip;
	import org.flixel.plugin.photonstorm.FlxMath;
	import org.flixel.plugin.photonstorm.FlxDelay;
	import org.flixel.plugin.photonstorm.FlxVelocity;
	import org.flixel.plugin.photonstorm.FlxWeapon;
	import flash.display.MovieClip;
	
	public class Enemy extends FlxMovieClip//FlxSprite
	{
		[Embed(source = '../assets/skull.png')] 
		public var enemyPNG:Class;
		
		//ENEMY MOVIECLIPS
		private var enemyMC:MovieClip;
		
		private var batMC:MovieClip;
		private var rodentMC:MovieClip;
		private var skullMC:MovieClip;
		private var slimeMC:MovieClip;
		private var wizardMC:MovieClip;
		private var wolfMC:MovieClip;
		
		
		private var fireTime:FlxDelay;
		private var delayTimer:FlxDelay;
		private var canShoot:Boolean = false;
		
		private var enemyElement:String = "None";
		private var enemyType:String = "None";//"Stationary" "Homing"
		private var enemyBullet:String = "None";//
		private var enemyLevel:Number = 1;
		private var enemyDamage:Number = 1;
		private var enemyRewards:Number = 1;
		private var enemyExperience:Number = 1;
		private var facingDirection:String = "Left";
		private var followType:String = "Basic";
		
		
		//private var enemySpeed:Number = 1;
		
		public function Enemy(eType:String = "Bat", eElement:String = "None", eLevel:int = 1) 
		{
			super(0, 0);// , enemyPNG);
			//loadGraphic(enemyPNG, false, true, 80, 88, false);
			//addAnimation("Fade", 1, 1, true);
			
			enemyType = eType;//RODENT etc...
			enemyElement = eElement;//FIRE WIND ICE etc...
			enemyLevel = eLevel;//1, 2 ,3
			/*enemyBullet = eBullet;
			damage = eDamage;
			enemyRewards = eRewards;
			enemyExperience = eExperience;
			health = eHealth;*/
			
			switch (eType)
			{
				case "Bat":
				batMC = new Bat;
				loadMovieClip(batMC, 100, 112, true, true);
				break;
				
				case "Rodent":
				rodentMC = new Rodent;
				loadMovieClip(rodentMC, 85, 56, true, true);
				break;
				
				case "Skull":
				skullMC = new Skull;
				loadMovieClip(skullMC, 80, 88, true, true);
				break;
				
				case "Slime":
				slimeMC = new Slime;
				loadMovieClip(slimeMC, 74, 55, true, true);
				break;
				
				case "Wizard":
				wizardMC = new Wizard;
				loadMovieClip(wizardMC, 118, 128, true, true);
				break;
				
				case "Wolf":
				wolfMC = new Wolf;
				loadMovieClip(wolfMC, 138, 140, true, true);
				break;
			}
			//trace("Enemy summoned:" + eType);
			//loadGraphic(rodentPNG, false, true, 85, 56);
			//if (eType == "Rodent")
			//{
				//loadMovieClip(enemyMC, enemyMCX, enemyMCY, true, true);
			//}
			
			//facingDirection = "Left";
			exists = false;
		}
		
		public function spawnUnit():void
		{
			x = int((Math.random()* (1300 - width))+100);// * (3600 - width));
			y = int((Math.random() * (670 - height)) + 100);// * (1760 - height));
			
			if ((x < Registry.player.x + 200&& x > Registry.player.x-200)&&(y < Registry.player.y - 200 && y > Registry.player.y-200))
			{
				spawnUnit();
			}
			else
			{
				//Movement types
				if (enemyType == "Roaming Random")
				{
					velocity.x = 0 + FlxMath.rand(-100, 100);
					velocity.y = 0 + FlxMath.rand(-100, 100);
				}
				if (enemyType == "Roaming Horizontal")
				{
					velocity.x = 0 + FlxMath.rand(-150, 150);
					velocity.y = 0;
				}
				if (enemyType == "Stationary")
				{
					velocity.x = 0;
					velocity.y = 0;
				}
				//Check if the enemy can shoot and if they can, start the shooting timer
				if (enemyBullet == "Basic")
				{
					canShoot = true;
				}
				if (enemyType == "Homing" || enemyType == "Homing Ranged")
				{
					followType == "Homing";
				}
			
				//health = 10;
				exists = true;
				//trace("Enemy Launched");
			}
		}
		
		public function launch(delay:int):void
		{
			//x = int((Math.random()* (2600 - width))+300);
			//y = int((Math.random()* (1160 - height))+300);
			//Update this so the enemies don't spawn directly next to the player
			
			//TIME THIS ONCE WITH delay
			if (delay > 0)
			{
				delayTimer = new FlxDelay(delay)
				delayTimer.callback = spawnUnit;
				delayTimer.start();
			}
			else
			{
				spawnUnit();
			}
			
			
		}
		
		override public function kill():void
		{
			Registry.goldCenter.x = x;
			Registry.goldCenter.y = y;
			
			Registry.playerBullets.goldSmall.fireMultiple(0, 3);
			if (enemyLevel >= 2)
			{
				Registry.playerBullets.goldMedium.fireMultiple(0, 3);
			}
			if (enemyLevel >= 3)
			{
				Registry.playerBullets.goldLarge.fireMultiple(0, 3);
			}
			
			
			super.kill();
			
			//Registry.player.grantExpToWeapons(enemyLevel);
			//GameConfig.playerDetails.grantExpToWeapons(enemyLevel);
			//remove(
			Registry.enemies.waveLength -= 1;
			//Registry.enemies.removeEnemy(enemyName);
			//Give the player score upon death
			FlxG.score += enemyLevel * 10;
		}
		
		override public function update():void
		{
			super.update();
			//Update this according to the postion of the player so the enemy will face them
			
			
			//Check if the enemy can fire and if the player is still alive
			if (canShoot)// && fireTime.hasExpired
			{
				if (enemyBullet == "Basic")
				{
					//Registry.enemyBullets.fire(x, y);
					//Registry.enemies.eNormalBulletA.setParent(this, "x", "y", width/2, height/2);
					//Registry.enemies.eNormalBulletA.fireFromAngle(FlxVelocity.angleBetween(this,Registry.playerCenter, true));
					//trace("Fired bullet");
				}
			}
			if (enemyType == "Homing")
			{
				var a:Number = FlxVelocity.angleBetween(this, Registry.player, false);
				velocity.x = Math.cos(a) * 50;
				velocity.y = Math.sin(a) * 50;
			}
			
			if (enemyType == "Homing Ranged")
			{
				var b:Number = FlxVelocity.angleBetween(this, Registry.player, false);
				if (FlxVelocity.distanceBetween(this, Registry.player) >= 200)
				{
					velocity.x = Math.cos(b) * 50;
					velocity.y = Math.sin(b) * 50;
				}
				else
				{
					velocity.x = 0;
					velocity.y = 0;
				}
			}
			if (enemyType == "Stationary" && (velocity.x > 0 || velocity.y > 0))
			{
				velocity.x = 0;
				velocity.y = 0;
			}
			
			
			if (followType == "Homing")
			{
				if (Registry.playerCenter.x < x)
				{
					changeAnimation("FacingLeft");
				}
				else if (Registry.playerCenter.x > x)
				{
					changeAnimation("FacingRight");
				}
			}
			
			if (followType == "Basic")
			{
				if (velocity.x > 0)
				{
					changeAnimation("FacingRight");
				}
				if (velocity.x < 0)
				{
					changeAnimation("FacingLeft");
				}
			}
			//Remove the enemy if they move/get knocked off the stage
			if (y > 1860)
			{
				kill();
				//exists = false;
			}
			else if (y < -100)
			{
				kill();
				//exists = false;
			}
			if (x > 3300)
			{
				kill();
				//exists = false;
			}
			else if (x < -100)
			{
				kill();
				//exists = false;
			}
		}
		
	}

}