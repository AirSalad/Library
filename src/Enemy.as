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
		private var teleportTimer:FlxDelay;
		private var teleportDuration:int = 3600;
		private var protectionTimer:FlxDelay;
		private var canShoot:Boolean = false;
		
		private var enemyElement:String = "None";
		private var enemyType:String = "None";//"Stationary" "Homing"
		private var enemyBullet:String = "None";//
		private var enemyLevel:Number = 1;
		private var enemyDamage:Number = 1;
		private var enemyRewards:Number = 1;
		private var enemyExperience:Number = 1;
		private var enemyMovementSpeed:Number = 100;
		private var enemyMaxMovementSpeed:Number = 100;
		private var facingDirection:String = "Left";
		
		private var movementType:String = "Basic";
		private var enemyEvent:String = "Summoning";
		//private var enemyDirection:String = "None";
		private var enemyCollideWithStage:Boolean = false;
		private var bounceDirection:String = "None";
		
		private var homingStartRange:int = 500;
		private var homingStopRange:int = 200;
		private var dashRange:int = 250;
		
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
				movementType = "Roaming Horizontal";
				break;
				
				case "Rodent":
				rodentMC = new Rodent;
				loadMovieClip(rodentMC, 85, 56, true, true);
				movementType = "Roaming Random";
				enemyMaxMovementSpeed = 50 * enemyLevel;
				enemyMovementSpeed = 50 * enemyLevel;
				enemyCollideWithStage = true;
				break;
				
				case "Skull":
				skullMC = new Skull;
				loadMovieClip(skullMC, 80, 88, true, true);
				movementType = "Teleport Random";
				teleportTimer = new FlxDelay(teleportDuration);
				teleportTimer.callback = spawnUnit;
				break;
				
				case "Slime":
				slimeMC = new Slime;
				loadMovieClip(slimeMC, 74, 55, true, true);
				//movementType = "Roaming Horizontal";
				break;
				
				case "Wizard":
				wizardMC = new Wizard;
				loadMovieClip(wizardMC, 118, 128, true, true);
				movementType = "Homing";
				homingStartRange = 1500;
				homingStopRange = 250;
				enemyMaxMovementSpeed = 30 * enemyLevel;
				enemyMovementSpeed = 30 * enemyLevel;
				break;
				
				case "Wolf":
				wolfMC = new Wolf;
				loadMovieClip(wolfMC, 138, 140, true, true);
				movementType = "Homing";
				homingStartRange = 1000;
				homingStopRange = 80;
				enemyMaxMovementSpeed = 50 * enemyLevel;
				enemyMovementSpeed = 50 * enemyLevel;
				//velocity = 50 * enemyLevel;
				break;
			}
			//trace("Enemy summoned:" + eType);
			//loadGraphic(rodentPNG, false, true, 85, 56);
			//if (eType == "Rodent")
			//{
				//loadMovieClip(enemyMC, enemyMCX, enemyMCY, true, true);
			//}
			
			//facingDirection = "Left";
			isInvulnerable = true;
			protectionTimer = new FlxDelay(3000);
			protectionTimer.start();
			exists = false;
		}
		
		public function spawnUnit():void
		{
			x = int((Math.random()* (1300 - width))+100);// * (3600 - width));
			y = int((Math.random() * (670 - height)) + 100);// * (1760 - height));
			
			if ((x < PlayState.player.x + 200 && x > PlayState.player.x-200)&&(y < PlayState.player.y - 200 && y > PlayState.player.y-200))
			{
				spawnUnit();
			}
			else
			{
				//Movement types
				if (movementType == "Roaming Random")
				{
					velocity.x = Math.cos(FlxMath.rand(-enemyMovementSpeed, enemyMovementSpeed));
					velocity.y = Math.sin(FlxMath.rand(-enemyMovementSpeed, enemyMovementSpeed));
					if (velocity.x <= 0)
					{
						velocity.x = velocity.x - enemyMovementSpeed;
					}
					else
					{
						velocity.x = velocity.x + enemyMovementSpeed;
					}
					if (velocity.y <= 0)
					{
						velocity.y = velocity.y - enemyMovementSpeed;
					}
					else
					{
						velocity.y = velocity.y + enemyMovementSpeed;
					}
				}
				
				if (movementType == "Teleport Random")
				{
					teleportTimer.start();
				}
				if (movementType == "Roaming Horizontal")
				{
					if (PlayState.player.x <= x)
					{
						velocity.x = -enemyMovementSpeed;
						//enemyDirection = "West";
					}
					else
					{
						velocity.x = enemyMovementSpeed;
						//enemyDirection = "East";
					}
					velocity.y = 0;
				}
				
				if (movementType == "Stationary")
				{
					velocity.x = 0;
					velocity.y = 0;
				}
				//Check if the enemy can shoot and if they can, start the shooting timer
				if (enemyBullet == "Basic")
				{
					canShoot = true;
				}
				
				//DIRECTION SWITCH
				if (movementType == "Roaming Random" || movementType == "Roaming Horizontal")
				{
					if (velocity.x >= 0)
					{
						changeAnimation("FacingRight");
					}
					else if (velocity.x < 0)
					{
						changeAnimation("FacingLeft");
					}
				}
				if (movementType == "Homing")
				{
					if (PlayState.playerCenter.x < x)
					{
						changeAnimation("FacingLeft");
					}
					else if (PlayState.playerCenter.x > x)
					{
						changeAnimation("FacingRight");
					}
				}
				
				exists = true;
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
			PlayState.goldCenter.x = x;
			PlayState.goldCenter.y = y;
			
			PlayState.playerBullets.goldSmall.fireMultiple(0, FlxMath.rand(2, 5));
			if (enemyLevel >= 2)
			{
				PlayState.playerBullets.goldMedium.fireMultiple(0, FlxMath.rand(2, 5));
			}
			if (enemyLevel >= 3)
			{
				PlayState.playerBullets.goldLarge.fireMultiple(0, FlxMath.rand(2, 5));
			}
			
			
			super.kill();
			
			//player.grantExpToWeapons(enemyLevel);
			//GameConfig.playerDetails.grantExpToWeapons(enemyLevel);
			//remove(
			PlayState.enemies.waveLength -= 1;
			//enemies.removeEnemy(enemyName);
			//Give the player score upon death
			FlxG.score += enemyLevel * 10;
		}
		
		public function summoningComplete():void
		{
			isInvulnerable = false;
			enemyEvent = "Normal";
		}
		
		override public function update():void
		{
			//trace("This is a test");
			super.update();
			//Update this according to the postion of the player so the enemy will face them
			
			if (protectionTimer.hasExpired)
			{
				summoningComplete();
			}
			//Check if the enemy can fire and if the player is still alive
			if (canShoot)// && fireTime.hasExpired
			{
				startShooting();
			}
			
			if (movementType == "Teleport Random" && teleportTimer.hasExpired)
			{
				teleportTimer.start();
			}
			
			/**
			 * MOVEMENT TYPES
			 * Stationary = No velocity. Just stands still
			 * Homing = Follows the target based on movement speed, distance to start and distance to stop
			 */
			if (movementType == "Homing")
			{
				if (FlxVelocity.distanceBetween(this, PlayState.player) <= homingStartRange)
				{
					var b:Number = FlxVelocity.angleBetween(this, PlayState.player, false);
					if (FlxVelocity.distanceBetween(this, PlayState.player) >= homingStopRange)
					{
						velocity.x = Math.cos(b) * enemyMovementSpeed;
						velocity.y = Math.sin(b) * enemyMovementSpeed;
					}
					else
					{
						velocity.x = 0;
						velocity.y = 0;
					}
				}
				else
				{
					velocity.x = 0;
					velocity.y = 0;
				}
			}
			
			if (enemyElement == "Wind")
			{
				if (FlxVelocity.distanceBetween(this, PlayState.player) <= dashRange)
				{
					enemyMovementSpeed = enemyMaxMovementSpeed * 2;
				}
				else
				{
					enemyMovementSpeed = enemyMaxMovementSpeed;
				}
			}
			
			/*if (movementType == "Homing Ranged")
			{
				var b:Number = FlxVelocity.angleBetween(this, PlayState.player, false);
				if (FlxVelocity.distanceBetween(this, PlayState.player) >= 200)
				{
					velocity.x = Math.cos(b) * 50;
					velocity.y = Math.sin(b) * 50;
				}
				else
				{
					velocity.x = 0;
					velocity.y = 0;
				}
			}*/
			if (movementType == "Stationary" && (velocity.x > 0 || velocity.y > 0))
			{
				velocity.x = 0;
				velocity.y = 0;
			}
			
			
			if (movementType == "Homing")
			{
				if (PlayState.playerCenter.x < x)
				{
					changeAnimation("FacingLeft");
				}
				else if (PlayState.playerCenter.x > x)
				{
					changeAnimation("FacingRight");
				}
			}
			
			if (movementType == "Roaming Random" || movementType == "Roaming Horizontal")
			{
				if (velocity.x >= 0)
				{
					changeAnimation("FacingRight");
				}
				else if (velocity.x < 0)
				{
					changeAnimation("FacingLeft");
				}
			}
			
			/*if (movementType == "Basic")
			{
				if (velocity.x > 0)
				{
					changeAnimation("FacingRight");
				}
				if (velocity.x < 0)
				{
					changeAnimation("FacingLeft");
				}
			}*/
			//Remove the enemy if they move/get knocked off the stage
			//if ((!movementType == "Homing") && !enemyCollideWithStage)
			//{
				//trace("Enemy teleporting touched boarder");
			if (enemyCollideWithStage)
			{
				if (y > 770 - this.height)
				{
				//	trace("Enemy bounce:" + x +"/" +y);
					bounceEnemy("N");
				}
				else if (y < 0)
				{
				//	trace("Enemy bounce:" + x +"/" +y);
					bounceEnemy("S");
				}
				if (x > 1400 - this.width)
				{
				//	trace("Enemy bounce:" + x +"/" +y);
					bounceEnemy("E");
				}
				else if (x < 0)
				{
				//	trace("Enemy bounce:" + x +"/" +y);
					bounceEnemy("W");
				}
			}
			else if (!enemyCollideWithStage)
			{
				if (y > 870)
				{
				//	trace("Enemy out of bounds:" + x +"/" +y);
					teleportEnemy("N", 0, y - 770 - (this.width / 2));
				}
				else if (y < -100)
				{
				//	trace("Enemy out of bounds:" + x +"/" +y);
					teleportEnemy("S", 0, y - 770 + (this.width / 2));
				}
				if (x > 1500)
				{
				//	trace("Enemy out of bounds:" + x +"/" +y);
					teleportEnemy("E", x - 1400 - (this.width / 2));
				}
				else if (x < -100)
				{
				//	trace("Enemy out of bounds:" + x +"/" +y);
					teleportEnemy("W", x - 1400 + (this.width / 2));
				}
			}
			//}
			/*else if ((!movementType == "Homing") && enemyCollideWithStage)
			{
				if (y > 770)
				{
					trace("Enemy out of bounds:" + x +"/" +y);
					teleportEnemy("N", 0,y-770-(this.width / 2))
				}
				else if (y < 0)
				{
					trace("Enemy out of bounds:" + x +"/" +y);
					teleportEnemy("S", 0,y-770+(this.width / 2))
				}
				if (x > 1400)
				{
					trace("Enemy out of bounds:" + x +"/" +y);
					teleportEnemy("E", x-1400-(this.width / 2))
				}
				else if (x < 0)
				{
					trace("Enemy out of bounds:" + x +"/" +y);
					teleportEnemy("W", x - 1400 + (this.width / 2))
				}
			}*/
			
			if (enemyEvent == "Summoning")
			{
				changeAnimation("Summoning");
			}
		}
		
		private function teleportEnemy(teleportDirection:String = "E", enemyXPos:int= 0, enemyYPos:int= 0):void
		{
			if (teleportDirection == "E" || teleportDirection == "W")
			{
				enemyXPos = -enemyXPos;
				this.x = enemyXPos;
			}
			else if (teleportDirection == "N" || teleportDirection == "S")
			{
				enemyYPos = -enemyYPos;
				this.y = enemyYPos;
			}
			enemyEvent = "Teleporting";
			changeAnimation("Teleporting");
		}
		
		private function bounceEnemy(bounceDirection:String = "E"):void
		{
			if (bounceDirection == "E" || bounceDirection == "W")
			{
				velocity.x = -velocity.x;
			}
			else if (bounceDirection == "N" || bounceDirection == "S")
			{
				velocity.y = -velocity.y;
			}
		}
		private function startShooting():void
		{
			if (enemyBullet == "Basic")
				{
					//enemyBullets.fire(x, y);
					//enemies.eNormalBulletA.setParent(this, "x", "y", width/2, height/2);
					//enemies.eNormalBulletA.fireFromAngle(FlxVelocity.angleBetween(this,playerCenter, true));
					//trace("Fired bullet");
				}
		}
		
	}

}