package  
{
	import flash.display.MorphShape;
	import flash.display.MovieClip;
	import flash.display.Stage;
	import org.flixel.*;
	import org.flixel.plugin.funstorm.FlxMovieClip;
	import org.flixel.FlxG;
	import org.flixel.FlxCamera;
	import org.flixel.plugin.photonstorm.FlxVelocity;
	import org.flixel.plugin.photonstorm.FlxMath;
	import org.flixel.plugin.photonstorm.FlxWeapon;
	import org.flixel.plugin.photonstorm.BaseTypes.Bullet;
	import org.flixel.plugin.photonstorm.FlxDelay;

	public class PlayState extends FlxState
	{
		[Embed(source = '../assets/Stage.png')] private var backgroundPNG:Class;
		//[Embed(source = '../assets/Stages.swf')] private var _backgroundMC:Class;
		
		private var background:FlxSprite;
		
		private var cameraClone:FlxSprite;
		
		//GENERAL TEXT VARS
		private var debug:FlxText;
		private var playerEquip:FlxText;
		private var playerHealth:FlxText;
		private var playerScore:FlxText;
		private var playerLevel:FlxText;
		private var playerAmmo:FlxText;
		private var playerGold:FlxText;
		private var playerWave:FlxText;
		private var playerEnemyCount:FlxText;
		
		//CLASS VARIABLES
		public static var stageCenter:stageCenterPoint;
		public static var playerCenter:centerPoint;
		public static var bulletCenter:bulletCenterPoint;
		public static var goldCenter:goldCenterPoint;
		public static var orb:Orb;
		public static var player:Player;
		public static var playerBullets:BulletManager;
		public static var enemies:EnemyManager;
		
		//INITIALISES STATE
		public function PlayState() 
		{
			super();
		}
		
		override public function create():void 
		{
			super.create();
			
			GameConfig._currentState = "Play";
			
			//SETS THE BOUNDS FOR THE STAGE AND THE CAMERA
			//FlxG.showBounds(0, 0, 3200, 1760);
			FlxG.worldBounds.x = 0;
			FlxG.worldBounds.y = 0;
			FlxG.worldBounds.width = 1400;//3200;
			FlxG.worldBounds.height = 770;//1760;
			FlxG.camera.setBounds(0, 0, 1400, 770);// 3200, 1760);
			
			background = new FlxSprite(0, 0, backgroundPNG);
			add(background);
			
			//SETS PARAMETERS FOR THE TEXT DISPLAYS
			debug = new FlxText(0, 0, 400, "");
			playerEquip = new FlxText(0, 0, 400, "");
			playerScore = new FlxText(0, 20, 400, "");
			playerHealth = new FlxText(0, 40, 400, "");
			playerLevel = new FlxText(0, 60, 400, "");
			playerAmmo = new FlxText(0, 80, 400, "");
			playerGold = new FlxText(0, 100, 400, "");
			playerWave = new FlxText(0, 120, 400, "");
			playerEnemyCount = new FlxText(0, 140, 400, "");
			
			//SETS THE TEXT SCROLL FACTORS TO 0 SO IT IS UNAFFECTED BY CAMERA MOVEMENT
			debug.scrollFactor.x = 0;
			debug.scrollFactor.y = 0;
			playerEquip.scrollFactor.x = 0;
			playerEquip.scrollFactor.y = 0;
			playerHealth.scrollFactor.x = 0;
			playerHealth.scrollFactor.y = 0;
			playerScore.scrollFactor.x = 0;
			playerScore.scrollFactor.y = 0;
			playerLevel.scrollFactor.x = 0;
			playerLevel.scrollFactor.y = 0;
			playerAmmo.scrollFactor.x = 0;
			playerAmmo.scrollFactor.y = 0;
			playerGold.scrollFactor.x = 0;
			playerGold.scrollFactor.y = 0;
			playerWave.scrollFactor.x = 0;
			playerWave.scrollFactor.y = 0;
			playerEnemyCount.scrollFactor.x = 0;
			playerEnemyCount.scrollFactor.y = 0;
			
			//INITIALISES CLASSES
			stageCenter = new stageCenterPoint;
			playerCenter = new centerPoint;
			bulletCenter = new bulletCenterPoint;
			goldCenter = new goldCenterPoint;
			orb = new Orb;
			player = new Player;
			playerBullets = new BulletManager;
			enemies = new EnemyManager;
			
			//ADDS CLASSES TO STATE
			add(stageCenter);
			add(playerCenter);
			add(bulletCenter);
			add(goldCenter);
			add(orb);
			add(player);
			add(playerBullets);
			add(enemies);
			
			//LOADS BULLET CLASS
			playerBullets.loadWeapons();
			
			//SETS THE CAMERA TO FOLLOW THE PLAYER OBJECT
			FlxG.camera.follow(player, 3);
			
			//ADDS TEXT OBJECTS TO STAGE
			add(playerEquip);
			add(playerHealth);
			add(playerScore);
			add(playerLevel);
			add(playerAmmo);
			add(playerGold);
			add(playerWave);
			add(playerEnemyCount);
		}
		
		override public function update():void
		{
			super.update();
			
			//REGENERATE HP PER SECOND
			if (player.health != player.maxHealth && player.alive)
			{
				player.health = player.health + GameConfig._currentUpgrades[3];
				//trace(GameConfig._currentUpgrades[3]);
			}
			
			//REGENERATES MANA PER SECOND
			if (player.mana != player.maxMana && player.alive)
			{
				player.mana = player.mana + GameConfig._currentUpgrades[1];
				//trace(GameConfig._currentUpgrades[3]);
			}
			
			//PLAYER PHASING
			if (FlxG.keys.justPressed("SHIFT"))
			{
				if (player.mana > 100 && !player.phased)
				{
					player.mana -= 100;
					player.phased = true;
				}
				else if (player.phased)
				{
					player.phased = false;
				}
			}
			
			//DRAINS MANA WHILE THE PLAYER IS PHASED
			if (player.mana > 0 && player.alive && player.phased)
			{
				player.mana -= 5;
				//trace(GameConfig._currentUpgrades[3]);
			}
			else if (player.mana <= 0)
			{
				player.phased = false;
			}
			
			//CHANGES GAME STATE WHEN ALL WAVES ARE COMPLETED AND THE ENEMY
			if (enemies.waveEvent == "Completed")
			{
				changeStates();
			}
			
			
			
			//CHANGES THE ORBS POSITION DEPENDANT ON THE MOUSE RELATIVE TO PLAYER POSITION
			orb.updateAngle(FlxVelocity.angleBetweenMouse(playerCenter , false));
			
			
			//ENEMY COLLISIONS
			FlxG.overlap(enemies, player, player.enemyHitPlayer);
			//FlxG.collide(enemies, innerWall, enemies.reverseEnemy);
			
			//GOLD COLLISIONS
			FlxG.overlap(player, playerBullets.goldSmall.group, player.goldHitPlayer);
			FlxG.overlap(player, playerBullets.goldMedium.group, player.goldHitPlayer);
			FlxG.overlap(player, playerBullets.goldLarge.group, player.goldHitPlayer);
			
			//BULLET COLLISIONS
			//PRIMARY
			switch (GameConfig._primaryId)
			{
				//Basic/Gravity/Rapid/Spread
				case 0:	
				case 2:
				case 8:
				case 11:
				FlxG.overlap(playerBullets.primaryWeapon.group, enemies, enemies.bulletHitEnemy);
				//FlxG.collide(playerBullets.primaryMovieWeapon.group, enemies, enemies.bulletHitEnemy);
				break;
				
				//Knockback
				case 3:
				FlxG.collide(playerBullets.primaryWeapon.group, enemies, enemies.bulletHitEnemy);
				break;
				
				//Flame/Laser/Melee/Pierce/Shotgun
				case 1:
				case 4:
				case 5:
				case 7:
				case 10:
				FlxG.overlap(playerBullets.primaryWeapon.group, enemies, enemies.bulletPierceEnemy);
				break;
				
				//Mine/Rocket
				case 6:
				case 9:
				FlxG.overlap(playerBullets.primaryWeapon.group, enemies, enemies.bulletExplodeEnemy);
				FlxG.overlap(playerBullets.explosionWeapon.group, enemies, enemies.bulletPierceEnemy);
				break;
			}
			
			//SECONDARY
			switch (GameConfig._secondaryId)
			{
				//Basic/Gravity/Rapid/Spread
				case 0:	
				case 2:
				case 8:
				case 11:
				FlxG.overlap(playerBullets.secondaryWeapon.group, enemies, enemies.bulletHitEnemy);
				//FlxG.collide(playerBullets.primaryMovieWeapon.group, enemies, enemies.bulletHitEnemy);
				break;
				
				//Knockback
				case 3:
				FlxG.collide(playerBullets.secondaryWeapon.group, enemies, enemies.bulletHitEnemy);
				break;
				
				//Flame/Laser/Melee/Pierce/Shotgun
				case 1:
				case 4:
				case 5:
				case 7:
				case 10:
				FlxG.overlap(playerBullets.secondaryWeapon.group, enemies, enemies.bulletPierceEnemy);
				break;
				
				//Mine/Rocket
				case 6:
				case 9:
				FlxG.overlap(playerBullets.secondaryWeapon.group, enemies, enemies.bulletExplodeEnemy);
				FlxG.overlap(playerBullets.explosionWeapon.group, enemies, enemies.bulletPierceEnemy);
				break;
				
			}
			
			//BOMBS
			switch (GameConfig._primaryId)
			{
				//Basic/Rapid
				case 0:
				case 1:
				case 4:
				case 11:
				FlxG.overlap(playerBullets.bombWeapon.group, enemies, enemies.bulletPierceEnemy);
				break;
				
				//Pierce
				case 2:	
				case 7:
				case 8:
				case 10:
				FlxG.overlap(playerBullets.bombMovieWeapon.group, enemies, enemies.bulletPierceEnemy);
				break;
				
				//Mine/Rocket
				case 6:
				case 9:
				FlxG.overlap(playerBullets.bombMovieWeapon.group, enemies, enemies.bulletBombExplodeEnemy);
				FlxG.overlap(playerBullets.bombExplosionWeapon.group, enemies, enemies.bulletPierceEnemy);
				break;
				
				//Knockback
				case 3:
				FlxG.collide(playerBullets.bombWeapon.group, enemies, enemies.bulletHitEnemy);
				break;
				
				//Melee
				case 5:
				FlxG.overlap(playerBullets.bombMovieWeapon.group, enemies, enemies.bulletPierceEnemy);
				break;
			}
			
			
			
			//BOMB FIRED
			if (FlxG.keys.pressed("SPACE"))
			{
				switch (GameConfig._primaryId)
				{
					case 0:
					case 11:
					playerBullets.bombWeapon.fireSpread(FlxVelocity.angleBetweenMouse(playerCenter, true), 190, 19);
					break;
					
					//Mine/Rocket
					case 6:
					playerBullets.bombMovieWeapon.fireMultiple(FlxVelocity.angleBetweenMouse(playerCenter, true), 3);
					break;
					
					//Rocket
					case 9:
					playerBullets.bombMovieWeapon.fireSpread(FlxVelocity.angleBetweenMouse(playerCenter, true), 30, 4);
					break;
					
					//Shotgun
					case 10:
					playerBullets.bombMovieWeapon.fireMultiple(FlxVelocity.angleBetweenMouse(playerCenter, true), 10);	
					break;
					
					case 1:
					case 3:
					case 4:
					playerBullets.bombWeapon.fireFromAngle(FlxVelocity.angleBetweenMouse(playerCenter, true));
					break;
					
					case 2:
					playerBullets.bombMovieWeapon.fireSpread(270, 45, 5);
					break;
					
					case 5:
					case 7:
					case 8:
					playerBullets.bombMovieWeapon.fireFromAngle(FlxVelocity.angleBetweenMouse(playerCenter, true));
					break;
				}
				
			}
			//BULLETS FIRED
			if (FlxG.mouse.pressed() && player.alive)
			{
				//PRIMARY//
				switch (GameConfig._primaryId)
				{
					//Basic/Flame/Gravity/Knockback/Pierce/Melee/Rapid
					case 0:
					case 1:
					case 2:
					case 3:
					case 5:
					case 7:
					case 8:
					playerBullets.primaryWeapon.fireFromAngle(FlxVelocity.angleBetweenMouse(playerCenter, true));
					//playerBullets.primaryMovieWeapon.fireFromAngle(FlxVelocity.angleBetweenMouse(playerCenter, true));
					break;
					
					//Laser
					case 4:
					playerBullets.primaryWeapon.fireFromAngle(FlxVelocity.angleBetweenMouse(playerCenter, true));
					break;
					
					//Rocket/Mine
					case 6:
					case 9:
					playerBullets.primaryWeapon.fireFromAngle(FlxVelocity.angleBetweenMouse(playerCenter, true));
					break;
					
					
					//Shotgun
					case 10:
					playerBullets.primaryWeapon.fireMultiple(FlxVelocity.angleBetweenMouse(playerCenter, true), 4)
					break;
					
					//Spread
					case 11:
					playerBullets.primaryWeapon.fireSpread(FlxVelocity.angleBetweenMouse(playerCenter, true), 20,4)
					break;
				}
				
				switch (GameConfig._secondaryId)
				{
					//Basic/Flame/Gravity/Knockback/Pierce/Melee/Rapid
					case 0:
					case 1:
					case 2:
					case 3:
					case 5:
					case 7:
					case 8:
					playerBullets.secondaryWeapon.fireFromAngle(FlxVelocity.angleBetweenMouse(playerCenter, true));
					//playerBullets.primaryMovieWeapon.fireFromAngle(FlxVelocity.angleBetweenMouse(playerCenter, true));
					break;
					
					//Laser
					case 4:
					playerBullets.secondaryWeapon.fireFromAngle(FlxVelocity.angleBetweenMouse(playerCenter, true));
					break;
					
					//Rocket/Mine
					case 6:
					case 9:
					playerBullets.secondaryWeapon.fireFromAngle(FlxVelocity.angleBetweenMouse(playerCenter, true));
					break;
					
					//Shotgun
					case 10:
					playerBullets.secondaryWeapon.fireMultiple(FlxVelocity.angleBetweenMouse(playerCenter, true), 4)
					break;
					
					//Spread
					case 11:
					playerBullets.secondaryWeapon.fireSpread(FlxVelocity.angleBetweenMouse(playerCenter, true), 20,4)
					break;
				}
			}
			
			//CHEATS - ADD GOLD
			if (FlxG.keys.pressed("P"))
			{
				GameConfig._currentGold += 10000;
				GameConfig._maxGold += 10000;
			}
			
			//RESET CURRENT GAME STATE
			if (FlxG.keys.pressed("O"))
			{
				FlxG.resetState();
			}
			
			//SKIP STRAIGHT TO MENU STATE
			if (FlxG.keys.justPressed("ENTER"))
			{
				changeStates();
			}

			//UPDATE TEXT DISPLAYS
			playerEquip.text = "Equiped Books: " + GameConfig._primaryId + "/" + GameConfig._secondaryId;// + playerConfig.currentPrimary.wType + "/" +playerConfig.currentSecondary.wType;
			playerHealth.text = "Current Health: " + player.health + "/" + player.maxHealth;
			playerScore.text = "Current Score: " + FlxG.score;
			playerLevel.text = "Current Mana: " + player.mana + "/" + player.maxMana;// + playerConfig.currentPrimary.wCurrentLevel + ". Exp needed to level up: " + playerConfig.currentPrimary.wCurrentExp + "/" + playerConfig.currentPrimary.wMaxExp;
			playerAmmo.text = "Player Phased: " + player.phased;// + playerConfig.currentSecondary.wCurrentLevel + ". Exp needed to level up: " + playerConfig.currentSecondary.wCurrentExp + "/" + playerConfig.currentSecondary.wMaxExp;
			playerGold.text = "Current Gold: " + GameConfig._currentGold;// + playerConfig.currentGold;
			playerWave.text = "Current Wave: " + (enemies.currentWave+1) + "/" + enemies.maxWaves;
			playerEnemyCount.text = "Enemies remaining: " + enemies.waveLength + "/" + enemies.waveTotal;
		}
		
		//REMOVE THE PLAYSTATE CLASSES AND MOVE TO MENU STATE
		public function changeStates():void
		{
			if (GameConfig._currentLevel == GameConfig._maxLevel && GameConfig._maxLevel < 12)
			{
				GameConfig._maxLevel += 1;
			}
			GameConfig.saveConfigToData();
			
			enemies.waveEvent = "Summoning";
			
			remove(playerCenter);
			remove(bulletCenter);
			remove(goldCenter);
			remove(orb);
			remove(player);
			remove(playerBullets);
			remove(enemies);
			
			//remove(Registry);
			//player.x = 3200 / 2;
			//player.y = 1760 / 2;
			
			FlxG.switchState(new MenuState);
		}
	}
}