package  
{
	import flash.display.MovieClip;
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxVelocity;
	import org.flixel.plugin.photonstorm.FlxWeapon;
	import org.flixel.plugin.photonstorm.FlxMovieWeapon;
	
	public class BulletManager extends FlxGroup
	{	
		//Small 20x20/Medium 30x30/Large 45x45/Extra Large 150x150/Extra extra Large 250x250
		[Embed(source = '../assets/bullet.png')]private var bulletPNG:Class;
		
		[Embed(source = '../assets/playerExplosion.png')]private var explosionPNG:Class;
		[Embed(source = '../assets/playerSmash.png')]private var smashPNG:Class;
		
		[Embed(source = '../assets/bullet.png')]private var basicPNG:Class;
		[Embed(source = '../assets/bullet.png')]private var flamePNG:Class;
		[Embed(source = '../assets/bullet.png')]private var gravityPNG:Class;
		[Embed(source = '../assets/bullet.png')]private var knockbackPNG:Class;
		[Embed(source = '../assets/bullet.png')]private var laserPNG:Class;
		[Embed(source = '../assets/bullet.png')]private var meleePNG:Class;
		[Embed(source = '../assets/bullet.png')]private var minePNG:Class;
		[Embed(source = '../assets/bullet.png')]private var piercePNG:Class;
		[Embed(source = '../assets/bullet.png')]private var rapidPNG:Class;
		[Embed(source = '../assets/bullet.png')]private var rocketPNG:Class;
		[Embed(source = '../assets/bullet.png')]private var shotgunPNG:Class;
		[Embed(source = '../assets/bullet.png')]private var spreadPNG:Class;
		
		[Embed(source = '../assets/bullet.png')]private var basicBombPNG:Class;
		[Embed(source = '../assets/bullet.png')]private var flameBombPNG:Class;
		[Embed(source = '../assets/bullet.png')]private var gravityBombPNG:Class;
		[Embed(source = '../assets/bulletLarge.png')]private var knockbackBombPNG:Class;
		[Embed(source = '../assets/bullet.png')]private var laserBombPNG:Class;
		[Embed(source = '../assets/bullet.png')]private var meleeBombPNG:Class;
		[Embed(source = '../assets/bullet.png')]private var mineBombPNG:Class;
		[Embed(source = '../assets/bullet.png')]private var pierceBombPNG:Class;
		[Embed(source = '../assets/bullet.png')]private var rapidBombPNG:Class;
		[Embed(source = '../assets/bullet.png')]private var rocketBombPNG:Class;
		[Embed(source = '../assets/bullet.png')]private var shotgunBombPNG:Class;
		[Embed(source = '../assets/bullet.png')]private var spreadBombPNG:Class;
		
		
		private var bulletMC:MovieClip;
		
		private var basicMC:MovieClip;
		private var flameMC:MovieClip;
		private var gravityMC:MovieClip;
		private var knockbackMC:MovieClip;
		private var laserMC:MovieClip;
		private var meleeMC:MovieClip;
		private var mineMC:MovieClip;
		private var pierceMC:MovieClip;
		private var rapidMC:MovieClip;
		private var rocketMC:MovieClip;
		private var shotgunMC:MovieClip;
		private var spreadMC:MovieClip;
		
		private var basicBombMC:MovieClip;
		private var flameBombMC:MovieClip;
		private var gravityBombMC:MovieClip;
		private var knockbackBombMC:MovieClip;
		private var laserBombMC:MovieClip;
		private var meleeBombMC:MovieClip;
		private var mineBombMC:MovieClip;
		private var pierceBombMC:MovieClip;
		private var rapidBombMC:MovieClip;
		private var rocketBombMC:MovieClip;
		private var shotgunBombMC:MovieClip;
		private var spreadBombMC:MovieClip;
		
		private var goldSmallMC:MovieClip;
		private var goldMediumMC:MovieClip;
		private var goldLargeMC:MovieClip;
		
		
		private var explosionMC:MovieClip;
		private var explosionBombMC:MovieClip;
		
		public var currentWeapon:Object = { wId:int,
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
	
		//private var enemyReaction:* = PlayState.enemies.bulletHitEnemy;
		public var primaryWeapon:FlxMovieWeapon;
		public var secondaryWeapon:FlxMovieWeapon;
		public var explosionWeapon:FlxMovieWeapon;
		public var bombWeapon:FlxWeapon;
		public var bombMovieWeapon:FlxMovieWeapon;
		public var bombExplosionWeapon:FlxMovieWeapon;
		//public var testbombWeapon:FlxWeapon;
		public var primaryMovieWeapon:FlxMovieWeapon;
		//public var explosionWeapon:FlxWeapon;
		
		public var goldSmall:FlxMovieWeapon;
		public var goldMedium:FlxMovieWeapon;
		public var goldLarge:FlxMovieWeapon;
		
		
		
		private var defaultObject:Object = {   wId:int,
											wType:String,
											wBulletPool:int,
											wMagSize:int,
											wReloadSpeed:int,
											wBulletsFired:int,
											wCurrentLevel:int,
											wDamage:int,
											wLife:int,
											wFireRate:int,
											wVelocity:int,
											wMaxSpeed:int };
		
		private var basicObject:Object = {   wId:int,
											wType:String,
											wBulletPool:int,
											wMagSize:int,
											wMagSpeed:int,
											wReloadSpeed:int,
											wBulletsFired:int,
											wCurrentLevel:int,
											wDamage:int,
											wLife:int,
											wFireRate:int,
											wVelocity:int,
											wMaxSpeed:int };
		private var flameObject:Object;
		private var gravityObject:Object;
		private var knockbackObject:Object;
		private var laserObject:Object;
		private var meleeObject:Object;
		private var mineObject:Object;
		private var pierceObject:Object;
		private var rapidObject:Object;
		private var rocketObject:Object;
		private var shotgunObject:Object;
		private var spreadObject:Object;
		
		private var explosiveObject:Object;
		
		private var basicBombObject:Object;
		private var flameBombObject:Object;
		private var gravityBombObject:Object;
		private var knockbackBombObject:Object;
		private var laserBombObject:Object;
		private var meleeBombObject:Object;
		private var mineBombObject:Object;
		private var pierceBombObject:Object;
		private var rapidBombObject:Object;
		private var rocketBombObject:Object;
		private var shotgunBombObject:Object;
		private var spreadBombObject:Object;
		
		private var explosiveBombObject:Object;
		
		private var goldSmallObject:Object;
		private var goldMediumObject:Object;
		private var goldLargeObject:Object;
		
		public var rocketPositionX:Number;
		public var rocketPositionY:Number;
		
		public function BulletManager() 
		{
			super();
			
			bulletMC = new BasicBullet;
			basicMC = new BasicBullet;
			flameMC = new BasicBullet;
			gravityMC = new BasicBullet;
			knockbackMC = new BasicBullet;
			laserMC = new BasicBullet;
			meleeMC = new MeleeBullet;
			mineMC = new MineBullet;
			pierceMC = new PierceBullet;
			rapidMC = new BasicBullet;
			rocketMC = new BasicBullet;
			shotgunMC = new BasicBullet;
			spreadMC = new BasicBullet;
			
			basicBombMC = new BasicBullet;
			flameBombMC = new BasicBullet;
			gravityBombMC = new GravityBullet;
			knockbackBombMC = new BasicBullet;
			laserBombMC = new BasicBullet;
			meleeBombMC = new MeleeBombBullet;
			mineBombMC = new MineBombBullet;
			pierceBombMC = new PierceBombBullet;
			rapidBombMC = new BasicBullet;
			rocketBombMC = new BasicBullet;
			shotgunBombMC = new BasicBullet;
			spreadBombMC = new BasicBullet;
			
			explosionMC = new ExplosiveBullet;
			explosionBombMC = new ExplosiveBombBullet;
			
			goldSmallMC = new GoldSmallBullet;
			goldMediumMC = new GoldMediumBullet;
			goldLargeMC = new GoldLargeBullet;
			
			loadWeaponData();
			
		}
		private function loadWeaponData():void
		{
			//basicObject = defaultObject;
			//flameObject = defaultObject;
			//gravityObject = defaultObject;
			//knockbackObject = defaultObject;
			//laserObject = defaultObject;
			//meleeObject = defaultObject;
			//mineObject = defaultObject;
			//pierceObject = defaultObject;
			//rapidObject = defaultObject;
			//rocketObject = defaultObject;
			//shotgunObject = defaultObject;
			//spreadObject = defaultObject;
			
			/////////////////////////////////////////BOMBS/////////////////////////////////////////////////
			basicBombObject = { wId: 0,
							wType: "Basic",
							wBulletPool: 36,
							wMagSize: 36,
							wMagSpeed: 1000,
							wReloadSpeed: 0,
							wCurrentLevel: 0,
							wDamage: 10,
							wLife: 2000,
							wFireRate: 0,
							wVelocity: 300,
							wMaxSpeed: 300 };
			
			flameBombObject = { wId: 1,
							wType: "Flame",
							wBulletPool: 30,
							wMagSize: 30,
							wMagSpeed: 1000,
							wReloadSpeed: 0,
							wCurrentLevel: 0,
							wDamage: 5,
							wLife: 600,
							wFireRate: 0,
							wVelocity: 500,
							wMaxSpeed: 500 };
			
			gravityBombObject = { wId: 2,
							wType: "Gravity",
							wBulletPool: 10,
							wMagSize: 10,
							wMagSpeed: 1000,
							wReloadSpeed: 0,
							wCurrentLevel: 0,
							wDamage: 10,
							wLife: 2000,
							wFireRate: 0,
							wVelocity: 600,
							wMaxSpeed: 600 };
			
			knockbackBombObject = { wId: 3,
							wType: "Knockback",
							wBulletPool: 10,
							wMagSize: 1,
							wMagSpeed: 1000,
							wReloadSpeed: 0,
							wCurrentLevel: 0,
							wDamage: 1,
							wLife: 1000,
							wFireRate: 0,
							wVelocity: 1000,
							wMaxSpeed: 1000 };
			
			laserBombObject = { wId: 4,
							wType: "Laser",
							wBulletPool: 40,
							wMagSize: 0,
							wMagSpeed: 0,
							wReloadSpeed: 0,
							wCurrentLevel: 0,
							wDamage: 1,
							wLife: 2000,
							wFireRate: 0,
							wVelocity: 1000,
							wMaxSpeed: 600 };
							
			meleeBombObject = { wId: 5,
							wType: "Melee",
							wBulletPool: 1,
							wMagSize: 1,
							wMagSpeed: 1000,
							wReloadSpeed: 0,
							wCurrentLevel: 0,
							wDamage: 100,
							wLife: 100,
							wFireRate: 0,
							wVelocity: 0,
							wMaxSpeed: 0 };
							
			mineBombObject = { wId: 6,
							wType: "Mine",
							wBulletPool: 40,
							wMagSize: 5,
							wMagSpeed: 1000,
							wReloadSpeed: 0,
							wCurrentLevel: 0,
							wDamage: 20,
							wLife: 10000,
							wFireRate: 0,
							wVelocity: 50,
							wMaxSpeed: 100};
							
			pierceBombObject = { wId: 7,
							wType: "Pierce",
							wBulletPool: 40,
							wMagSize: 1,
							wMagSpeed: 1000,
							wReloadSpeed: 0,
							wCurrentLevel: 0,
							wDamage: 1,
							wLife: 3000,
							wFireRate: 0,
							wVelocity: 200,
							wMaxSpeed: 200 };
							
			rapidBombObject = { wId: 8,
							wType: "Rapid",
							wBulletPool: 40,
							wMagSize: 10,
							wMagSpeed: 1000,
							wReloadSpeed: 100,
							wCurrentLevel: 0,
							wDamage: 20,
							wLife: 20000,
							wFireRate: 25,
							wVelocity: 900,
							wMaxSpeed: 600 };
							
			rocketBombObject = { wId: 9,
							wType: "Rocket",
							wBulletPool: 40,
							wMagSize: 3,
							wMagSpeed: 1000,
							wReloadSpeed: 0,
							wCurrentLevel: 0,
							wDamage: 20,
							wLife: 20000,
							wFireRate: 0,
							wVelocity: 500,
							wMaxSpeed: 600 };
							
			shotgunBombObject = { wId: 10,
							wType: "Shotgun",
							wBulletPool: 40,
							wMagSize: 10,
							wMagSpeed: 1000,
							wReloadSpeed: 0,
							wCurrentLevel: 0,
							wDamage: 20,
							wLife: 2000,
							wFireRate: 0,
							wVelocity: 700,
							wMaxSpeed: 600 };
							
			spreadBombObject = { wId: 11,
							wType: "Spread",
							wBulletPool: 36,
							wMagSize: 36,
							wMagSpeed: 1000,
							wReloadSpeed: 0,
							wCurrentLevel: 0,
							wDamage: 20,
							wLife: 1000,
							wFireRate: 0,
							wVelocity: 500,
							wMaxSpeed: 600 };
							
			explosiveBombObject = { wId: 20,
							wType: "Exposive",
							wBulletPool: 40,
							wMagSize: 0,
							wMagSpeed: 0,
							wReloadSpeed: 0,
							wCurrentLevel: 0,
							wDamage: 20,
							wLife: 500,
							wFireRate: 0,
							wVelocity: 0,
							wMaxSpeed: 0 };
							
			/////////////////////////////////////////BULLETS/////////////////////////////////////////////////
			
			basicObject = { wId: 0,
							wType: "Basic",
							wBulletPool: 40,
							wMagSize: 1,
							wMagSpeed: 500,
							wReloadSpeed: 0,
							wCurrentLevel: 0,
							wDamage: (100 * GameConfig._equipmentLevels[0]),
							wLife: 2000,
							wFireRate: 0,
							wVelocity: (1000 +(100 * GameConfig._equipmentLevels[0])),
							wMaxSpeed: 600 };
			
			flameObject = { wId: 1,
							wType: "Flame",
							wBulletPool: 40,
							wMagSize: 0,
							wMagSpeed: 0,
							wReloadSpeed: 0,
							wCurrentLevel: 0,
							wDamage: 4,
							wLife: 700,
							wFireRate: 50,
							wVelocity: 250,
							wMaxSpeed: 100 };
			
			gravityObject = { wId: 2,
							wType: "Gravity",
							wBulletPool: 40,
							wMagSize: 2,
							wMagSpeed: 250,
							wReloadSpeed: 0,
							wCurrentLevel: 0,
							wDamage: 20,
							wLife: 20000,
							wFireRate: 50,
							wVelocity: 500,
							wMaxSpeed: 600 };
			
			knockbackObject = { wId: 3,
							wType: "Knockback",
							wBulletPool: 40,
							wMagSize: 0,
							wMagSpeed: 0,
							wReloadSpeed: 0,
							wCurrentLevel: 0,
							wDamage: 1,
							wLife: 20000,
							wFireRate: 500,
							wVelocity: 1000,
							wMaxSpeed: 600 };
			
			laserObject = { wId: 4,
							wType: "Laser",
							wBulletPool: 120,
							wMagSize: 0,
							wMagSpeed: 0,
							wReloadSpeed: 0,
							wCurrentLevel: 0,
							wDamage: 1,
							wLife: 700,
							wFireRate: 2,
							wVelocity: 500,
							wMaxSpeed: 600 };
							
			meleeObject = { wId: 5,
							wType: "Melee",
							wBulletPool: 40,
							wMagSize: 0,
							wMagSpeed: 0,
							wReloadSpeed: 0,
							wCurrentLevel: 0,
							wDamage: 10,
							wLife: 100,
							wFireRate: 500,
							wVelocity: 0,
							wMaxSpeed: 0 };
							
			mineObject = { wId: 6,
							wType: "Mine",
							wBulletPool: 40,
							wMagSize: 0,
							wMagSpeed: 0,
							wReloadSpeed: 0,
							wCurrentLevel: 0,
							wDamage: 1,
							wLife: 10000,
							wFireRate: 1000,
							wVelocity: 0,
							wMaxSpeed: 0 };
							
			pierceObject = { wId: 7,
							wType: "Pierce",
							wBulletPool: 40,
							wMagSize: 3,
							wMagSpeed: 1000,
							wReloadSpeed: 0,
							wCurrentLevel: 0,
							wDamage: 1,
							wLife: 2000,
							wFireRate: 750,
							wVelocity: 750,
							wMaxSpeed: 750 };
							
			rapidObject = { wId: 8,
							wType: "Rapid",
							wBulletPool: 40,
							wMagSize: 5,
							wMagSpeed: 1000,
							wReloadSpeed: 100,
							wCurrentLevel: 0,
							wDamage: 20,
							wLife: 20000,
							wFireRate: 50,
							wVelocity: 500,
							wMaxSpeed: 600 };
							
			rocketObject = { wId: 9,
							wType: "Rocket",
							wBulletPool: 40,
							wMagSize: 0,
							wMagSpeed: 0,
							wReloadSpeed: 0,
							wCurrentLevel: 0,
							wDamage: 20,
							wLife: 20000,
							wFireRate: 500,
							wVelocity: 500,
							wMaxSpeed: 600 };
							
			shotgunObject = { wId: 10,
							wType: "Shotgun",
							wBulletPool: 40,
							wMagSize: 4,
							wMagSpeed: 1000,
							wReloadSpeed: 0,
							wCurrentLevel: 0,
							wDamage: 20,
							wLife: 1000,
							wFireRate: 0,
							wVelocity: 700,
							wMaxSpeed: 600 };
							
			spreadObject = { wId: 11,
							wType: "Spread",
							wBulletPool: 40,
							wMagSize: 7,
							wMagSpeed: 1000,
							wReloadSpeed: 0,
							wCurrentLevel: 0,
							wDamage: 20,
							wLife: 20000,
							wFireRate: 0,
							wVelocity: 500,
							wMaxSpeed: 600 };
							
			explosiveObject = { wId: 20,
							wType: "Exposive",
							wBulletPool: 40,
							wMagSize: 0,
							wMagSpeed: 0,
							wReloadSpeed: 0,
							wCurrentLevel: 0,
							wDamage: 1,
							wLife: 200,
							wFireRate: 0,
							wVelocity: 0,
							wMaxSpeed: 0 };
							
			//////////////////GOLD//////////////////////////////
			goldSmallObject = { wId: 30,
							wType: "Gold Small",
							wBulletPool: 80,
							wMagSize: 0,
							wMagSpeed: 0,
							wReloadSpeed: 0,
							wCurrentLevel: 0,
							wDamage: 1,
							wLife: 4000,
							wFireRate: 0,
							wVelocity: 0,
							wMaxSpeed: 0 };
							
			goldMediumObject = { wId: 31,
							wType: "Gold Medium",
							wBulletPool: 80,
							wMagSize: 0,
							wMagSpeed: 0,
							wReloadSpeed: 0,
							wCurrentLevel: 0,
							wDamage: 2,
							wLife: 4000,
							wFireRate: 0,
							wVelocity: 0,
							wMaxSpeed: 0 };
							
			goldLargeObject = { wId: 32,
							wType: "Gold Large",
							wBulletPool: 80,
							wMagSize: 0,
							wMagSpeed: 0,
							wReloadSpeed: 0,
							wCurrentLevel: 0,
							wDamage: 5,
							wLife: 4000,
							wFireRate: 0,
							wVelocity: 0,
							wMaxSpeed: 0 };
		}
		public function loadWeapons():void
		{
			
			//GOLD
			goldSmall = new FlxMovieWeapon("Gold small", PlayState.goldCenter);
			//primaryWeapon.makeImageBullet(basicObject.wBulletPool, bulletPNG);
			goldSmall.makeMovieBullet(goldSmallObject.wBulletPool, goldSmallMC, 0, 0, 20, 20);
			goldSmall.setBulletDamage(goldSmallObject.wDamage);
			goldSmall.setFireRate(goldSmallObject.wFireRate);
			goldSmall.setBulletLifeSpan(goldSmallObject.wLife);
			goldSmall.setBulletSpeed(goldSmallObject.wVelocity);
			goldSmall.setBulletRandomFactor(360, 100, 1000);
			goldSmall.setParent(PlayState.goldCenter, "x", "y", -10, -10);
			goldSmall.setBulletMagazine(goldSmallObject.wMagSize, goldSmallObject.wMagSpeed);
			add(goldSmall.group);
			
			goldMedium = new FlxMovieWeapon("Gold medium", PlayState.goldCenter);
			//primaryWeapon.makeImageBullet(basicObject.wBulletPool, bulletPNG);
			goldMedium.makeMovieBullet(goldMediumObject.wBulletPool, goldMediumMC, 0, 0, 30, 30);
			goldMedium.setBulletDamage(goldMediumObject.wDamage);
			goldMedium.setFireRate(goldMediumObject.wFireRate);
			goldMedium.setBulletLifeSpan(goldMediumObject.wLife);
			goldMedium.setBulletSpeed(goldMediumObject.wVelocity);
			goldMedium.setBulletRandomFactor(360, 75, 1000);
			goldMedium.setParent(PlayState.goldCenter, "x", "y", -15, -15);
			goldMedium.setBulletMagazine(goldMediumObject.wMagSize, goldMediumObject.wMagSpeed);
			add(goldMedium.group);
			
			goldLarge = new FlxMovieWeapon("Gold large", PlayState.goldCenter);
			//primaryWeapon.makeImageBullet(basicObject.wBulletPool, bulletPNG);
			goldLarge.makeMovieBullet(goldLargeObject.wBulletPool, goldLargeMC, 0, 0,40, 40);
			goldLarge.setBulletDamage(goldLargeObject.wDamage);
			goldLarge.setFireRate(goldLargeObject.wFireRate);
			goldLarge.setBulletLifeSpan(goldLargeObject.wLife);
			goldLarge.setBulletSpeed(goldLargeObject.wVelocity);
			goldLarge.setBulletRandomFactor(360, 50, 1000);
			goldLarge.setParent(PlayState.goldCenter, "x", "y", -20, -20);
			goldLarge.setBulletMagazine(goldLargeObject.wMagSize, goldLargeObject.wMagSpeed);
			add(goldLarge.group);
			//////
			switch (GameConfig._primaryId)
			{
				case 0://Basic
				/*primaryMovieWeapon = new FlxMovieWeapon("Basic", PlayState.playerCenter);
				//primaryMovieWeapon.makeImageBullet(basicObject.wBulletPool, bulletPNG);
				primaryMovieWeapon.makeMovieBullet(basicObject.wBulletPool, basicMC);
				primaryMovieWeapon.setBulletDamage(basicObject.wDamage);
				primaryMovieWeapon.setFireRate(basicObject.wFireRate);
				primaryMovieWeapon.setBulletLifeSpan(basicObject.wLife);
				primaryMovieWeapon.setBulletSpeed(basicObject.wVelocity);
				primaryMovieWeapon.setParent(PlayState.playerCenter, "x", "y", -10, -10);
				primaryMovieWeapon.setBulletMagazine(basicObject.wMagSize, basicObject.wMagSpeed);
				add(primaryMovieWeapon.group);*/
					
				primaryWeapon = new FlxMovieWeapon("Basic", PlayState.playerCenter);
				//primaryWeapon.makeImageBullet(basicObject.wBulletPool, bulletPNG);
				primaryWeapon.makeMovieBullet(basicObject.wBulletPool, basicMC, 0, 0, 20, 20);
				primaryWeapon.setBulletDamage(basicObject.wDamage);
				primaryWeapon.setFireRate(basicObject.wFireRate);
				primaryWeapon.setBulletLifeSpan(basicObject.wLife);
				primaryWeapon.setBulletSpeed(basicObject.wVelocity);
				primaryWeapon.setParent(PlayState.playerCenter, "x", "y", -10, -10);
				primaryWeapon.setBulletMagazine(basicObject.wMagSize, basicObject.wMagSpeed);
				add(primaryWeapon.group);
				
				//bombWeapon = new FlxMovieWeapon("Basic Bomb", PlayState.playerCenter);
				bombWeapon = new FlxWeapon("Basic Bomb", PlayState.playerCenter);
				bombWeapon.makeImageBullet(basicBombObject.wBulletPool, basicPNG);
				//bombWeapon.makeMovieBullet(basicBombObject.wBulletPool, basicBombMC);
				bombWeapon.setBulletDamage(basicBombObject.wDamage);
				bombWeapon.setFireRate(basicBombObject.wFireRate);
				bombWeapon.setBulletLifeSpan(basicBombObject.wLife);
				bombWeapon.setBulletSpeed(basicBombObject.wVelocity);
				bombWeapon.setParent(PlayState.playerCenter, "x", "y", -10, -10);
				bombWeapon.setBulletMagazine(basicBombObject.wMagSize, basicBombObject.wMagSpeed);
				add(bombWeapon.group);
				break;
				
				case 1://Flame
				primaryWeapon = new FlxMovieWeapon("Flame", PlayState.playerCenter);
				//primaryWeapon.makeImageBullet(flameObject.wBulletPool, flamePNG);
				primaryWeapon.makeMovieBullet(flameObject.wBulletPool, flameMC, 0, 0, 20, 20);
				primaryWeapon.setBulletDamage(flameObject.wDamage);
				primaryWeapon.setFireRate(flameObject.wFireRate);
				primaryWeapon.setBulletLifeSpan(flameObject.wLife);
				primaryWeapon.setBulletSpeed(flameObject.wVelocity);
				primaryWeapon.setBulletRandomFactor(30, 100);
				primaryWeapon.setParent(PlayState.playerCenter, "x", "y", -10, -10);
				primaryWeapon.setBulletMagazine(flameObject.wMagSize, flameObject.wMagSpeed);
				add(primaryWeapon.group);
				
				bombWeapon = new FlxWeapon("Flame Bomb", PlayState.playerCenter);
				bombWeapon.makeImageBullet(basicBombObject.wBulletPool, flamePNG);
				//bombWeapon.makeMovieBullet(flameBombObject.wBulletPool, flameBombMC);
				bombWeapon.setBulletDamage(flameBombObject.wDamage);
				bombWeapon.setFireRate(flameBombObject.wFireRate);
				bombWeapon.setBulletLifeSpan(flameBombObject.wLife);
				bombWeapon.setBulletSpeed(flameBombObject.wVelocity);
				bombWeapon.setBulletRandomFactor(30, 300);
				bombWeapon.setParent(PlayState.playerCenter, "x", "y", -10, -10);
				bombWeapon.setBulletMagazine(flameBombObject.wMagSize, flameBombObject.wMagSpeed);
				add(bombWeapon.group);
				break;
				
				case 2://Gravity
				primaryWeapon = new FlxMovieWeapon("Gravity", PlayState.playerCenter);
				//primaryWeapon.makeImageBullet(gravityObject.wBulletPool, gravityPNG);
				primaryWeapon.makeMovieBullet(gravityObject.wBulletPool, gravityMC, 0, 0, 20, 20);
				primaryWeapon.setBulletDamage(gravityObject.wDamage);
				primaryWeapon.setFireRate(gravityObject.wFireRate);
				primaryWeapon.setBulletLifeSpan(gravityObject.wLife);
				primaryWeapon.setBulletSpeed(gravityObject.wVelocity);
				primaryWeapon.setParent(PlayState.playerCenter, "x", "y", -10, -10);
				primaryWeapon.setBulletGravity(0, 1500);
				primaryWeapon.setBulletMagazine(gravityObject.wMagSize, gravityObject.wMagSpeed);
				add(primaryWeapon.group);
				
				bombMovieWeapon = new FlxMovieWeapon("Gravity Bomb", PlayState.playerCenter);
				//bombWeapon.makeImageBullet(gravityBombObject.wBulletPool, gravityBombPNG);
				bombMovieWeapon.makeMovieBullet(gravityBombObject.wBulletPool, gravityBombMC, 0, 0, 20, 20);
				bombMovieWeapon.setBulletDamage(gravityBombObject.wDamage);
				bombMovieWeapon.setFireRate(gravityBombObject.wFireRate);
				bombMovieWeapon.setBulletLifeSpan(gravityBombObject.wLife);
				bombMovieWeapon.setBulletSpeed(gravityBombObject.wVelocity);
				bombMovieWeapon.setParent(PlayState.playerCenter, "x", "y", -10, -10);
				bombMovieWeapon.setBulletGravity(0, 1500);
				bombMovieWeapon.setBulletMagazine(gravityBombObject.wMagSize, gravityBombObject.wMagSpeed);
				add(bombMovieWeapon.group);
				break;
				
				case 3://Knockback
				primaryWeapon = new FlxMovieWeapon("Knockback", PlayState.playerCenter);
				//primaryWeapon.makeImageBullet(knockbackObject.wBulletPool, knockbackPNG);
				primaryWeapon.makeMovieBullet(knockbackObject.wBulletPool, knockbackMC, 0, 0, 20, 20);
				primaryWeapon.setBulletDamage(knockbackObject.wDamage);
				primaryWeapon.setFireRate(knockbackObject.wFireRate);
				primaryWeapon.setBulletLifeSpan(knockbackObject.wLife);
				primaryWeapon.setBulletSpeed(knockbackObject.wVelocity);
				primaryWeapon.setBulletElasticity(1);
				primaryWeapon.setParent(PlayState.playerCenter, "x", "y", -10, -10);
				primaryWeapon.setBulletMagazine(knockbackObject.wMagSize, knockbackObject.wMagSpeed);
				add(primaryWeapon.group);
				
				bombWeapon = new FlxWeapon("Knockback Bomb", PlayState.playerCenter);
				bombWeapon.makeImageBullet(knockbackBombObject.wBulletPool, knockbackBombPNG);
				//bombWeapon.makeMovieBullet(knockbackBombObject.wBulletPool, knockbackBombMC);
				bombWeapon.setBulletDamage(knockbackBombObject.wDamage);
				bombWeapon.setFireRate(knockbackBombObject.wFireRate);
				bombWeapon.setBulletLifeSpan(knockbackBombObject.wLife);
				bombWeapon.setBulletSpeed(knockbackBombObject.wVelocity);
				bombWeapon.setParent(PlayState.playerCenter, "x", "y", -22.5, -22.5);
				bombWeapon.setBulletMagazine(knockbackBombObject.wMagSize, knockbackBombObject.wMagSpeed);
				add(bombWeapon.group);
				break;
				
				case 4://Laser
				primaryWeapon = new FlxMovieWeapon("Basic", PlayState.playerCenter);
				//primaryWeapon.makeImageBullet(laserObject.wBulletPool, laserPNG);
				primaryWeapon.makeMovieBullet(laserObject.wBulletPool, laserMC, 0, 0, 20, 20);
				primaryWeapon.setBulletDamage(laserObject.wDamage);
				primaryWeapon.setFireRate(laserObject.wFireRate);
				primaryWeapon.setBulletLifeSpan(laserObject.wLife);
				primaryWeapon.setBulletSpeed(laserObject.wVelocity);
				primaryWeapon.setParent(PlayState.playerCenter, "x", "y", -10, -10);
				primaryWeapon.setBulletMagazine(laserObject.wMagSize, laserObject.wMagSpeed);
				add(primaryWeapon.group);
				
				bombWeapon = new FlxWeapon("Laser Bomb", PlayState.playerCenter);
				bombWeapon.makeImageBullet(laserBombObject.wBulletPool, laserBombPNG);
				//bombWeapon.makeMovieBullet(laserObject.wBulletPool, laserBombMC);
				bombWeapon.setBulletDamage(laserBombObject.wDamage);
				bombWeapon.setFireRate(laserBombObject.wFireRate);
				bombWeapon.setBulletLifeSpan(laserBombObject.wLife);
				bombWeapon.setBulletSpeed(laserBombObject.wVelocity);
				bombWeapon.setParent(PlayState.playerCenter, "x", "y", -10, -10);
				bombWeapon.setBulletMagazine(laserBombObject.wMagSize, laserBombObject.wMagSpeed);
				add(bombWeapon.group);
				break;
				
				case 5://Melee
				primaryWeapon = new FlxMovieWeapon("Melee", PlayState.playerCenter);
				//primaryWeapon.makeImageBullet(meleeObject.wBulletPool, meleePNG);
				//primaryWeapon.makePixelBullet(40, 100, 100, 0xffffffff, -50, -50);
				primaryWeapon.makeMovieBullet(meleeObject.wBulletPool, meleeMC, 0, 0, 250, 250);
				primaryWeapon.setBulletDamage(meleeObject.wDamage);
				primaryWeapon.setFireRate(meleeObject.wFireRate);
				primaryWeapon.setBulletLifeSpan(meleeObject.wLife);
				primaryWeapon.setBulletSpeed(meleeObject.wVelocity);
				primaryWeapon.setParent(PlayState.playerCenter, "x", "y", -125, -125);
			//	primaryWeapon.
				primaryWeapon.setBulletMagazine(meleeObject.wMagSize, meleeObject.wMagSpeed);
				add(primaryWeapon.group);
				
				bombMovieWeapon = new FlxMovieWeapon("Melee Bomb", PlayState.playerCenter);
				//bombWeapon.makeImageBullet(meleeBombObject.wBulletPool, meleeBombPNG);
				bombMovieWeapon.makeMovieBullet(meleeBombObject.wBulletPool, meleeBombMC,0,0,400,400);
				bombMovieWeapon.setBulletDamage(meleeBombObject.wDamage);
				bombMovieWeapon.setFireRate(meleeBombObject.wFireRate);
				bombMovieWeapon.setBulletLifeSpan(meleeBombObject.wLife);
				bombMovieWeapon.setBulletSpeed(meleeBombObject.wVelocity);
				bombMovieWeapon.setParent(PlayState.playerCenter, "x", "y", -200, -200);
				bombMovieWeapon.setBulletMagazine(meleeBombObject.wMagSize, meleeBombObject.wMagSpeed);
				add(bombMovieWeapon.group);
				break;
				
				case 6://Mine
				primaryWeapon = new FlxMovieWeapon("Mine", PlayState.playerCenter);
				//primaryWeapon.makeImageBullet(mineObject.wBulletPool, minePNG);
				primaryWeapon.makeMovieBullet(mineObject.wBulletPool, mineMC, 0, 0, 20, 20);
				primaryWeapon.setBulletDamage(mineObject.wDamage);
				primaryWeapon.setFireRate(mineObject.wFireRate);
				primaryWeapon.setBulletLifeSpan(mineObject.wLife);
				primaryWeapon.setBulletSpeed(mineObject.wVelocity);
				primaryWeapon.setParent(PlayState.playerCenter, "x", "y", -10, -10);
				primaryWeapon.setBulletMagazine(mineObject.wMagSize, mineObject.wMagSpeed);
				add(primaryWeapon.group);
				
				explosionWeapon = new FlxMovieWeapon("Explosion", PlayState.bulletCenter);//primaryWeapon);
				//explosionWeapon.makeImageBullet(mineObject.wBulletPool, explosionPNG);
				explosionWeapon.makeMovieBullet(explosiveObject.wBulletPool, explosionMC, 0, 0, 150, 150);
				explosionWeapon.setBulletDamage(explosiveObject.wDamage);
				explosionWeapon.setFireRate(explosiveObject.wFireRate);
				explosionWeapon.setBulletLifeSpan(explosiveObject.wLife);
				explosionWeapon.setBulletSpeed(explosiveObject.wVelocity);
				explosionWeapon.setParent(PlayState.bulletCenter, "x", "y", -75, -75);
				explosionWeapon.setBulletMagazine(explosiveObject.wMagSize, explosiveObject.wMagSpeed);
				add(explosionWeapon.group);
				
				bombMovieWeapon = new FlxMovieWeapon("Mine Bomb", PlayState.playerCenter);
				//bombWeapon.makeImageBullet(mineBombObject.wBulletPool, mineBombPNG);
				bombMovieWeapon.makeMovieBullet(mineBombObject.wBulletPool, mineBombMC,0,0,40,40);
				bombMovieWeapon.setBulletDamage(mineBombObject.wDamage);
				bombMovieWeapon.setFireRate(mineBombObject.wFireRate);
				bombMovieWeapon.setBulletLifeSpan(mineBombObject.wLife);
				bombMovieWeapon.setBulletSpeed(mineBombObject.wVelocity);
				bombMovieWeapon.setBulletRandomFactor(360, 50);
				bombMovieWeapon.setParent(PlayState.playerCenter, "x", "y", -20, -20);
				bombMovieWeapon.setBulletMagazine(mineBombObject.wMagSize, mineBombObject.wMagSpeed);
				add(bombMovieWeapon.group);
				
				bombExplosionWeapon = new FlxMovieWeapon("Mine Bomb", PlayState.bulletCenter);
				//bombExplosionWeapon.makeImageBullet(explosiveBombObject.wBulletPool, explosionBombPNG);
				bombExplosionWeapon.makeMovieBullet(explosiveBombObject.wBulletPool, explosionBombMC,0,0,250,250);
				bombExplosionWeapon.setBulletDamage(explosiveBombObject.wDamage);
				bombExplosionWeapon.setFireRate(explosiveBombObject.wFireRate);
				bombExplosionWeapon.setBulletLifeSpan(explosiveBombObject.wLife);
				bombExplosionWeapon.setBulletSpeed(explosiveBombObject.wVelocity);
				bombExplosionWeapon.setParent(PlayState.bulletCenter, "x", "y", -125, -125);
				bombExplosionWeapon.setBulletMagazine(explosiveBombObject.wMagSize, explosiveBombObject.wMagSpeed);
				add(bombExplosionWeapon.group);
				break;
				
				
				
				case 7://Pierce
				primaryWeapon = new FlxMovieWeapon("Pierce", PlayState.playerCenter);
				//primaryWeapon.makeImageBullet(pierceObject.wBulletPool, piercePNG);
				primaryWeapon.makeMovieBullet(pierceObject.wBulletPool, pierceMC, 0, 0, 30, 30);
				primaryWeapon.setBulletDamage(pierceObject.wDamage);
				primaryWeapon.setFireRate(pierceObject.wFireRate);
				primaryWeapon.setBulletLifeSpan(pierceObject.wLife);
				primaryWeapon.setBulletSpeed(pierceObject.wVelocity);
				primaryWeapon.setParent(PlayState.playerCenter, "x", "y", -15, -15);
				primaryWeapon.setBulletElasticity(1);
				primaryWeapon.setBulletMagazine(pierceObject.wMagSize, pierceObject.wMagSpeed);
				add(primaryWeapon.group);
				
				bombMovieWeapon = new FlxMovieWeapon("Pierce Bomb", PlayState.playerCenter);
				//bombWeapon.makeImageBullet(pierceBombObject.wBulletPool, pierceBombPNG);
				bombMovieWeapon.makeMovieBullet(pierceBombObject.wBulletPool, pierceBombMC, 0, 0, 100, 100);
				bombMovieWeapon.setBulletDamage(pierceBombObject.wDamage);
				bombMovieWeapon.setFireRate(pierceBombObject.wFireRate);
				bombMovieWeapon.setBulletLifeSpan(pierceBombObject.wLife);
				bombMovieWeapon.setBulletSpeed(pierceBombObject.wVelocity);
				bombMovieWeapon.setParent(PlayState.playerCenter, "x", "y", -50, -50);
				bombMovieWeapon.setBulletMagazine(pierceBombObject.wMagSize, pierceBombObject.wMagSpeed);
				add(bombMovieWeapon.group);
				break;
				
				case 8://Rapid
				primaryWeapon = new FlxMovieWeapon("Rapid", PlayState.playerCenter);
				//primaryWeapon.makeImageBullet(rapidObject.wBulletPool, rapidPNG);
				primaryWeapon.makeMovieBullet(rapidObject.wBulletPool, rapidMC, 0, 0, 20, 20);
				primaryWeapon.setBulletDamage(rapidObject.wDamage);
				primaryWeapon.setFireRate(rapidObject.wFireRate);
				primaryWeapon.setBulletLifeSpan(rapidObject.wLife);
				primaryWeapon.setBulletSpeed(rapidObject.wVelocity);
				primaryWeapon.setParent(PlayState.playerCenter, "x", "y", -10, -10);
				primaryWeapon.setBulletMagazine(rapidObject.wMagSize, rapidObject.wMagSpeed);
				add(primaryWeapon.group);
				
				bombMovieWeapon = new FlxMovieWeapon("Rapid Bomb", PlayState.playerCenter);
				//bombWeapon.makeImageBullet(rapidBombObject.wBulletPool, rapidBombPNG);
				bombMovieWeapon.makeMovieBullet(rapidBombObject.wBulletPool, rapidBombMC,0,0,20,20);
				bombMovieWeapon.setBulletDamage(rapidBombObject.wDamage);
				bombMovieWeapon.setFireRate(rapidBombObject.wFireRate);
				bombMovieWeapon.setBulletLifeSpan(rapidBombObject.wLife);
				bombMovieWeapon.setBulletSpeed(rapidBombObject.wVelocity);
				bombMovieWeapon.setParent(PlayState.playerCenter, "x", "y", -10, -10);
				bombMovieWeapon.setBulletMagazine(rapidBombObject.wMagSize, rapidBombObject.wMagSpeed);
				add(bombMovieWeapon.group);
				break;
				
				case 9://Rocket
				primaryWeapon = new FlxMovieWeapon("Rocket", PlayState.playerCenter);
				//primaryWeapon.makeImageBullet(rocketObject.wBulletPool, rocketPNG);
				primaryWeapon.makeMovieBullet(rocketObject.wBulletPool, rocketMC, 0, 0, 20, 20);
				primaryWeapon.setBulletDamage(rocketObject.wDamage);
				primaryWeapon.setFireRate(rocketObject.wFireRate);
				primaryWeapon.setBulletLifeSpan(rocketObject.wLife);
				primaryWeapon.setBulletSpeed(rocketObject.wVelocity);
				primaryWeapon.setParent(PlayState.playerCenter, "x", "y", -10, -10);
				primaryWeapon.setBulletMagazine(rocketObject.wMagSize, rocketObject.wMagSpeed);
				add(primaryWeapon.group);
				
				explosionWeapon = new FlxMovieWeapon("Explosion", PlayState.bulletCenter);//primaryWeapon);
				//explosionWeapon.makeImageBullet(mineObject.wBulletPool, explosionPNG);
				//explosionWeapon.makePixelBullet(40, 150, 150, 0xffffffff, -75, -75);
				explosionWeapon.makeMovieBullet(explosiveObject.wBulletPool, explosionMC, 0, 0, 150, 150);
				explosionWeapon.setBulletDamage(explosiveObject.wDamage);
				explosionWeapon.setFireRate(explosiveObject.wFireRate);
				explosionWeapon.setBulletLifeSpan(explosiveObject.wLife);
				explosionWeapon.setBulletSpeed(explosiveObject.wVelocity);
				explosionWeapon.setParent(PlayState.bulletCenter, "x", "y", -75, -75);
				explosionWeapon.setBulletMagazine(explosiveObject.wMagSize, explosiveObject.wMagSpeed);
				add(explosionWeapon.group);
				
				bombMovieWeapon = new FlxMovieWeapon("Rocket Bomb", PlayState.playerCenter);
				//bombWeapon.makeImageBullet(rocketBombObject.wBulletPool, rocketBombPNG);
				bombMovieWeapon.makeMovieBullet(rocketBombObject.wBulletPool, rocketBombMC,0,0,20,20);
				bombMovieWeapon.setBulletDamage(rocketBombObject.wDamage);
				bombMovieWeapon.setFireRate(rocketBombObject.wFireRate);
				bombMovieWeapon.setBulletLifeSpan(rocketBombObject.wLife);
				bombMovieWeapon.setBulletSpeed(rocketBombObject.wVelocity);
				bombMovieWeapon.setParent(PlayState.playerCenter, "x", "y", -10, -10);
				bombMovieWeapon.setBulletMagazine(rocketBombObject.wMagSize, rocketBombObject.wMagSpeed);
				add(bombMovieWeapon.group);
				
				bombExplosionWeapon = new FlxMovieWeapon("Mine Bomb", PlayState.bulletCenter);
				//bombExplosionWeapon.makeImageBullet(explosiveBombObject.wBulletPool, explosionBombPNG);
				bombExplosionWeapon.makeMovieBullet(explosiveBombObject.wBulletPool, explosionBombMC,0,0,250,250);
				bombExplosionWeapon.setBulletDamage(explosiveBombObject.wDamage);
				bombExplosionWeapon.setFireRate(explosiveBombObject.wFireRate);
				bombExplosionWeapon.setBulletLifeSpan(explosiveBombObject.wLife);
				bombExplosionWeapon.setBulletSpeed(explosiveBombObject.wVelocity);
				bombExplosionWeapon.setParent(PlayState.bulletCenter, "x", "y", -125, -125);
				bombExplosionWeapon.setBulletMagazine(explosiveBombObject.wMagSize, explosiveBombObject.wMagSpeed);
				add(bombExplosionWeapon.group);
				break;
				
				case 10://Shotgun
				primaryWeapon = new FlxMovieWeapon("Shotgun", PlayState.playerCenter);
				//primaryWeapon.makeImageBullet(shotgunObject.wBulletPool, shotgunPNG);
				primaryWeapon.makeMovieBullet(shotgunObject.wBulletPool, shotgunMC, 0, 0, 20, 20);
				primaryWeapon.setBulletDamage(shotgunObject.wDamage);
				primaryWeapon.setFireRate(shotgunObject.wFireRate);
				primaryWeapon.setBulletLifeSpan(shotgunObject.wLife);
				primaryWeapon.setBulletSpeed(shotgunObject.wVelocity);
				primaryWeapon.setBulletRandomFactor(15, 150);
				primaryWeapon.setParent(PlayState.playerCenter, "x", "y", -10, -10);
				primaryWeapon.setBulletMagazine(shotgunObject.wMagSize, shotgunObject.wMagSpeed);
				add(primaryWeapon.group);
				
				bombMovieWeapon = new FlxMovieWeapon("Shotgun Bomb", PlayState.playerCenter);
				//bombWeapon.makeImageBullet(shotgunBombObject.wBulletPool, shotgunPNG);
				bombMovieWeapon.makeMovieBullet(shotgunBombObject.wBulletPool, shotgunBombMC,0,0,20,20);
				bombMovieWeapon.setBulletDamage(shotgunBombObject.wDamage);
				bombMovieWeapon.setFireRate(shotgunBombObject.wFireRate);
				bombMovieWeapon.setBulletLifeSpan(shotgunBombObject.wLife);
				bombMovieWeapon.setBulletSpeed(shotgunBombObject.wVelocity);
				bombMovieWeapon.setBulletRandomFactor(10, 250);
				bombMovieWeapon.setParent(PlayState.playerCenter, "x", "y", -10, -10);
				bombMovieWeapon.setBulletMagazine(shotgunBombObject.wMagSize, shotgunBombObject.wMagSpeed);
				add(bombMovieWeapon.group);
				break;
				
				case 11://Spread
				primaryWeapon = new FlxMovieWeapon("Spread", PlayState.playerCenter);
				//primaryWeapon.makeImageBullet(spreadObject.wBulletPool, spreadPNG);
				primaryWeapon.makeMovieBullet(spreadObject.wBulletPool, spreadMC, 0, 0, 20, 20);
				primaryWeapon.setBulletDamage(spreadObject.wDamage);
				primaryWeapon.setFireRate(spreadObject.wFireRate);
				primaryWeapon.setBulletLifeSpan(spreadObject.wLife);
				primaryWeapon.setBulletSpeed(spreadObject.wVelocity);
				primaryWeapon.setParent(PlayState.playerCenter, "x", "y", -10, -10);
				primaryWeapon.setBulletMagazine(spreadObject.wMagSize, spreadObject.wMagSpeed);
				add(primaryWeapon.group);
				
				bombWeapon = new FlxWeapon("Spread Bomb", PlayState.playerCenter);
				bombWeapon.makeImageBullet(spreadBombObject.wBulletPool, spreadPNG);
				//bombWeapon.makeMovieBullet(spreadBombObject.wBulletPool, spreadBombMC);
				bombWeapon.setBulletDamage(spreadBombObject.wDamage);
				bombWeapon.setFireRate(spreadBombObject.wFireRate);
				bombWeapon.setBulletLifeSpan(spreadBombObject.wLife);
				bombWeapon.setBulletSpeed(spreadBombObject.wVelocity);
				bombWeapon.setParent(PlayState.playerCenter, "x", "y", -10, -10);
				bombWeapon.setBulletMagazine(spreadBombObject.wMagSize, spreadBombObject.wMagSpeed);
				add(bombWeapon.group);
				break;
				
			}
			
			switch (GameConfig._secondaryId)
			{
				case 0:
				secondaryWeapon = new FlxMovieWeapon("Basic", PlayState.orb);
				//secondaryWeapon.makeImageBullet(basicObject.wBulletPool, bulletPNG);
				secondaryWeapon.makeMovieBullet(basicObject.wBulletPool, basicMC, 0, 0, 20, 20);
				secondaryWeapon.setBulletDamage(basicObject.wDamage);
				secondaryWeapon.setFireRate(basicObject.wFireRate);
				secondaryWeapon.setBulletLifeSpan(basicObject.wLife);
				secondaryWeapon.setBulletSpeed(basicObject.wVelocity);
				secondaryWeapon.setParent(PlayState.orb, "x", "y", -10, -10);
				secondaryWeapon.setBulletMagazine(basicObject.wMagSize, basicObject.wMagSpeed);
				add(secondaryWeapon.group);
				break;
				
				case 1://Flame
				secondaryWeapon = new FlxMovieWeapon("Flame", PlayState.orb);
				//secondaryWeapon.makeImageBullet(flameObject.wBulletPool, flamePNG);
				secondaryWeapon.makeMovieBullet(flameObject.wBulletPool, flameMC, 0, 0, 20, 20);
				secondaryWeapon.setBulletDamage(flameObject.wDamage);
				secondaryWeapon.setFireRate(flameObject.wFireRate);
				secondaryWeapon.setBulletLifeSpan(flameObject.wLife);
				secondaryWeapon.setBulletSpeed(flameObject.wVelocity);
				secondaryWeapon.setBulletRandomFactor(30, 100);
				secondaryWeapon.setParent(PlayState.orb, "x", "y", -10, -10);
				secondaryWeapon.setBulletMagazine(flameObject.wMagSize, flameObject.wMagSpeed);
				add(secondaryWeapon.group);
				break;
				
				case 2://Gravity
				secondaryWeapon = new FlxMovieWeapon("Gravity", PlayState.orb);
				//secondaryWeapon.makeImageBullet(gravityObject.wBulletPool, gravityPNG);
				secondaryWeapon.makeMovieBullet(gravityObject.wBulletPool, gravityMC, 0, 0, 20, 20);
				secondaryWeapon.setBulletDamage(gravityObject.wDamage);
				secondaryWeapon.setFireRate(gravityObject.wFireRate);
				secondaryWeapon.setBulletLifeSpan(gravityObject.wLife);
				secondaryWeapon.setBulletSpeed(gravityObject.wVelocity);
				secondaryWeapon.setParent(PlayState.orb, "x", "y", -10, -10);
				secondaryWeapon.setBulletGravity(0, 1500);
				secondaryWeapon.setBulletMagazine(gravityObject.wMagSize, gravityObject.wMagSpeed);
				add(secondaryWeapon.group);
				break;
				
				case 3://Knockback
				secondaryWeapon = new FlxMovieWeapon("Knockback", PlayState.orb);
				//secondaryWeapon.makeImageBullet(knockbackObject.wBulletPool, knockbackPNG);
				secondaryWeapon.makeMovieBullet(knockbackObject.wBulletPool, knockbackMC, 0, 0, 20, 20);
				secondaryWeapon.setBulletDamage(knockbackObject.wDamage);
				secondaryWeapon.setFireRate(knockbackObject.wFireRate);
				secondaryWeapon.setBulletLifeSpan(knockbackObject.wLife);
				secondaryWeapon.setBulletSpeed(knockbackObject.wVelocity);
				secondaryWeapon.setBulletElasticity(1);
				secondaryWeapon.setParent(PlayState.orb, "x", "y", -10, -10);
				secondaryWeapon.setBulletMagazine(knockbackObject.wMagSize, knockbackObject.wMagSpeed);
				add(secondaryWeapon.group);
				break;
				
				case 4://Laser
				secondaryWeapon = new FlxMovieWeapon("Basic", PlayState.orb);
				//secondaryWeapon.makeImageBullet(laserObject.wBulletPool, laserPNG);
				secondaryWeapon.makeMovieBullet(laserObject.wBulletPool, laserMC, 0, 0, 20, 20);
				secondaryWeapon.setBulletDamage(laserObject.wDamage);
				secondaryWeapon.setFireRate(laserObject.wFireRate);
				secondaryWeapon.setBulletLifeSpan(laserObject.wLife);
				secondaryWeapon.setBulletSpeed(laserObject.wVelocity);
				secondaryWeapon.setParent(PlayState.orb, "x", "y", -10, -10);
				secondaryWeapon.setBulletMagazine(laserObject.wMagSize, laserObject.wMagSpeed);
				add(secondaryWeapon.group);
				break;
				
				case 5://Melee
				secondaryWeapon = new FlxMovieWeapon("Melee", PlayState.orb);
				//secondaryWeapon.makeImageBullet(meleeObject.wBulletPool, meleePNG);
				//secondaryWeapon.makePixelBullet(40, 100, 100, 0xffffffff, -50, -50);
				secondaryWeapon.makeMovieBullet(meleeObject.wBulletPool, meleeMC, 0, 0, 250, 250);
				secondaryWeapon.setBulletDamage(meleeObject.wDamage);
				secondaryWeapon.setFireRate(meleeObject.wFireRate);
				secondaryWeapon.setBulletLifeSpan(meleeObject.wLife);
				secondaryWeapon.setBulletSpeed(meleeObject.wVelocity);
				secondaryWeapon.setParent(PlayState.orb, "x", "y", -125, -125);
				secondaryWeapon.setBulletMagazine(meleeObject.wMagSize, meleeObject.wMagSpeed);
				add(secondaryWeapon.group);
				break;
				
				case 6://Mine
				secondaryWeapon = new FlxMovieWeapon("Mine", PlayState.orb);
				//secondaryWeapon.makeImageBullet(mineObject.wBulletPool, minePNG);
				secondaryWeapon.makeMovieBullet(mineObject.wBulletPool, mineMC, 0, 0, 20, 20);
				secondaryWeapon.setBulletDamage(mineObject.wDamage);
				secondaryWeapon.setFireRate(mineObject.wFireRate);
				secondaryWeapon.setBulletLifeSpan(mineObject.wLife);
				secondaryWeapon.setBulletSpeed(mineObject.wVelocity);
				secondaryWeapon.setParent(PlayState.orb, "x", "y", -10, -10);
				secondaryWeapon.setBulletMagazine(mineObject.wMagSize, mineObject.wMagSpeed);
				add(secondaryWeapon.group);
				
				explosionWeapon = new FlxMovieWeapon("Explosion", PlayState.bulletCenter);//secondaryWeapon);
				//explosionWeapon.makeImageBullet(mineObject.wBulletPool, explosionPNG);
				explosionWeapon.makeMovieBullet(explosiveObject.wBulletPool, explosionMC, 0, 0, 150, 150);
				explosionWeapon.setBulletDamage(explosiveObject.wDamage);
				explosionWeapon.setFireRate(explosiveObject.wFireRate);
				explosionWeapon.setBulletLifeSpan(explosiveObject.wLife);
				explosionWeapon.setBulletSpeed(explosiveObject.wVelocity);
				explosionWeapon.setParent(PlayState.bulletCenter, "x", "y", -75, -75);
				explosionWeapon.setBulletMagazine(explosiveObject.wMagSize, explosiveObject.wMagSpeed);
				add(explosionWeapon.group);
				break;
				
				
				
				case 7://Pierce
				secondaryWeapon = new FlxMovieWeapon("Pierce", PlayState.orb);
				//secondaryWeapon.makeImageBullet(pierceObject.wBulletPool, piercePNG);
				secondaryWeapon.makeMovieBullet(pierceObject.wBulletPool, pierceMC, 0, 0, 30, 30);
				secondaryWeapon.setBulletDamage(pierceObject.wDamage);
				secondaryWeapon.setFireRate(pierceObject.wFireRate);
				secondaryWeapon.setBulletLifeSpan(pierceObject.wLife);
				secondaryWeapon.setBulletSpeed(pierceObject.wVelocity);
				secondaryWeapon.setParent(PlayState.orb, "x", "y", -15, -15);
				secondaryWeapon.setBulletElasticity(1);
				secondaryWeapon.setBulletMagazine(pierceObject.wMagSize, pierceObject.wMagSpeed);
				add(secondaryWeapon.group);
				break;
				
				case 8://Rapid
				secondaryWeapon = new FlxMovieWeapon("Rapid", PlayState.orb);
				//secondaryWeapon.makeImageBullet(rapidObject.wBulletPool, rapidPNG);
				secondaryWeapon.makeMovieBullet(rapidObject.wBulletPool, rapidMC, 0, 0, 20, 20);
				secondaryWeapon.setBulletDamage(rapidObject.wDamage);
				secondaryWeapon.setFireRate(rapidObject.wFireRate);
				secondaryWeapon.setBulletLifeSpan(rapidObject.wLife);
				secondaryWeapon.setBulletSpeed(rapidObject.wVelocity);
				secondaryWeapon.setParent(PlayState.orb, "x", "y", -10, -10);
				secondaryWeapon.setBulletMagazine(rapidObject.wMagSize, rapidObject.wMagSpeed);
				add(secondaryWeapon.group);
				break;
				
				case 9://Rocket
				secondaryWeapon = new FlxMovieWeapon("Rocket", PlayState.orb);
				//secondaryWeapon.makeImageBullet(rocketObject.wBulletPool, rocketPNG);
				secondaryWeapon.makeMovieBullet(rocketObject.wBulletPool, rocketMC, 0, 0, 20, 20);
				secondaryWeapon.setBulletDamage(rocketObject.wDamage);
				secondaryWeapon.setFireRate(rocketObject.wFireRate);
				secondaryWeapon.setBulletLifeSpan(rocketObject.wLife);
				secondaryWeapon.setBulletSpeed(rocketObject.wVelocity);
				secondaryWeapon.setParent(PlayState.orb, "x", "y", -10, -10);
				secondaryWeapon.setBulletMagazine(rocketObject.wMagSize, rocketObject.wMagSpeed);
				add(secondaryWeapon.group);
				
				explosionWeapon = new FlxMovieWeapon("Explosion", PlayState.bulletCenter);//secondaryWeapon);
				//explosionWeapon.makeImageBullet(mineObject.wBulletPool, explosionPNG);
				//explosionWeapon.makePixelBullet(40, 150, 150, 0xffffffff, -75, -75);
				explosionWeapon.makeMovieBullet(explosiveObject.wBulletPool, explosionMC, 0, 0, 150, 150);
				explosionWeapon.setBulletDamage(explosiveObject.wDamage);
				explosionWeapon.setFireRate(explosiveObject.wFireRate);
				explosionWeapon.setBulletLifeSpan(explosiveObject.wLife);
				explosionWeapon.setBulletSpeed(explosiveObject.wVelocity);
				explosionWeapon.setParent(PlayState.bulletCenter, "x", "y", -75, -75);
				explosionWeapon.setBulletMagazine(explosiveObject.wMagSize, explosiveObject.wMagSpeed);
				add(explosionWeapon.group);
				break;
				
				case 10://Shotgun
				secondaryWeapon = new FlxMovieWeapon("Shotgun", PlayState.orb);
				//secondaryWeapon.makeImageBullet(shotgunObject.wBulletPool, shotgunPNG);
				secondaryWeapon.makeMovieBullet(shotgunObject.wBulletPool, shotgunMC, 0, 0, 20, 20);
				secondaryWeapon.setBulletDamage(shotgunObject.wDamage);
				secondaryWeapon.setFireRate(shotgunObject.wFireRate);
				secondaryWeapon.setBulletLifeSpan(shotgunObject.wLife);
				secondaryWeapon.setBulletSpeed(shotgunObject.wVelocity);
				secondaryWeapon.setBulletRandomFactor(15, 150);
				secondaryWeapon.setParent(PlayState.orb, "x", "y", -10, -10);
				secondaryWeapon.setBulletMagazine(shotgunObject.wMagSize, shotgunObject.wMagSpeed);
				add(secondaryWeapon.group);
				break;
				
				case 11://Spread
				secondaryWeapon = new FlxMovieWeapon("Spread", PlayState.orb);
				//secondaryWeapon.makeImageBullet(spreadObject.wBulletPool, spreadPNG);
				secondaryWeapon.makeMovieBullet(spreadObject.wBulletPool, spreadMC, 0, 0, 20, 20);
				secondaryWeapon.setBulletDamage(spreadObject.wDamage);
				secondaryWeapon.setFireRate(spreadObject.wFireRate);
				secondaryWeapon.setBulletLifeSpan(spreadObject.wLife);
				secondaryWeapon.setBulletSpeed(spreadObject.wVelocity);
				secondaryWeapon.setParent(PlayState.orb, "x", "y", -10, -10);
				secondaryWeapon.setBulletMagazine(spreadObject.wMagSize, spreadObject.wMagSpeed);
				add(secondaryWeapon.group);
				break;
			}
			
			
		}
		
		/*public function createWeapon(wId:int,wName:String,wImage:Class,wType:String,wMag:int,wDamage:int,wBulletsShot:int,wFireRate:int,wVelocity:int,wMaxSpeed:int,wLife:int,wCurrentExp:int,wMaxExp:int,wCurrentLevel:int,wMaxLevel:int,wGoldCost:int):void
		{
			if (wId == 1)
			{
					//this[primaryWeapon + i];
					primaryWeapon = new FlxWeapon(wName, Orb);
					primaryWeapon.makeImageBullet(wMag, wImage);
					primaryWeapon.setBulletDamage(wDamage);
					primaryWeapon.setFireRate(wFireRate);
					primaryWeapon.setBulletLifeSpan(wLife);
					//primaryWeapon.setBulletSpeed(300);
					primaryWeapon.setBulletAcceleration(wVelocity, wVelocity, wMaxSpeed, wMaxSpeed);
					primaryWeapon.setParent(PlayState.orb, "x", "y", -10, -10);
					
					if (wType == "Knockback")
					{
						primaryWeapon.setBulletElasticity(1);
					}
					if (wType == "Shotgun")
					{
						//for (var i = 0; i < wBulletsShot; i++)
						//{
						//primaryWeapon.setBulletRandomFactor(15, 100, new FlxPoint(15, 15));
					}
					if (wType == "FlameThrower")
					{
						//for (var i = 0; i < wBulletsShot; i++)
						//{
						//primaryWeapon.setBulletRandomFactor(60);
					}
					add(primaryWeapon.group);
				
			}
		}*/
		
		/*public function updateWeapons(weaponObject:Object):void
		{
			currentWeapon = weaponObject;
			
			if (currentWeapon.wType == "Normal")
			{
				normalBulletA.setBulletDamage(currentWeapon.wDamage);
				normalBulletA.setFireRate(currentWeapon.wFireRate);
				normalBulletA.setBulletSpeed(currentWeapon.wMaxSpeed);
			}
			
			if (currentWeapon.wType == "Rapid")
			{
				rapidBulletA.setBulletDamage(currentWeapon.wDamage);
				rapidBulletA.setFireRate(currentWeapon.wFireRate);
				rapidBulletA.setBulletSpeed(currentWeapon.wMaxSpeed);
				rapidBulletA.setBulletLifeSpan(currentWeapon.wLifeSpan);
			}
			
			if (currentWeapon.wType == "Bouncing")
			{
				bouncingBulletA.setBulletDamage(currentWeapon.wDamage);
				bouncingBulletA.setFireRate(currentWeapon.wFireRate);
				bouncingBulletA.setBulletSpeed(currentWeapon.wMaxSpeed);
			}
			
			if (currentWeapon.wType == "Shotgun")
			{
				shotgunBulletA.setBulletDamage(currentWeapon.wDamage);
				shotgunBulletA.setFireRate(currentWeapon.wFireRate);
				shotgunBulletA.setBulletSpeed(currentWeapon.wMaxSpeed);

				shotgunBulletB.setBulletDamage(currentWeapon.wDamage);
				shotgunBulletB.setFireRate(currentWeapon.wFireRate);
				shotgunBulletB.setBulletSpeed(currentWeapon.wMaxSpeed);

				shotgunBulletC.setBulletDamage(currentWeapon.wDamage);
				shotgunBulletC.setFireRate(currentWeapon.wFireRate);
				shotgunBulletC.setBulletSpeed(currentWeapon.wMaxSpeed);

				shotgunBulletD.setBulletDamage(currentWeapon.wDamage);
				shotgunBulletD.setFireRate(currentWeapon.wFireRate);
				shotgunBulletD.setBulletSpeed(currentWeapon.wMaxSpeed);

				shotgunBulletE.setBulletDamage(currentWeapon.wDamage);
				shotgunBulletE.setFireRate(currentWeapon.wFireRate);
				shotgunBulletE.setBulletSpeed(currentWeapon.wMaxSpeed);
			}
			
			if (currentWeapon.wType == "Spread")
			{
				spreadBulletA.setBulletDamage(currentWeapon.wDamage);
				spreadBulletA.setFireRate(currentWeapon.wFireRate);
				spreadBulletA.setBulletSpeed(currentWeapon.wMaxSpeed);
				
				spreadBulletB.setBulletDamage(currentWeapon.wDamage);
				spreadBulletB.setFireRate(currentWeapon.wFireRate);
				spreadBulletB.setBulletSpeed(currentWeapon.wMaxSpeed);
				
				spreadBulletC.setBulletDamage(currentWeapon.wDamage);
				spreadBulletC.setFireRate(currentWeapon.wFireRate);
				spreadBulletC.setBulletSpeed(currentWeapon.wMaxSpeed);
			}
			
			if (currentWeapon.wType == "Rocket")
			{
				rocketBulletA.setBulletDamage(currentWeapon.wDamage);
				rocketBulletA.setFireRate(currentWeapon.wFireRate);
				rocketBulletA.setBulletSpeed(currentWeapon.wMaxSpeed);
				
				rocketBulletSubA.setBulletDamage(currentWeapon.wDamage);
				rocketBulletSubA.setFireRate(currentWeapon.wFireRate);
				rocketBulletSubA.setBulletSpeed(currentWeapon.wMaxSpeed);
				rocketBulletSubA.setBulletLifeSpan(currentWeapon.wLifeSpan);
			}
			
			if (currentWeapon.wType == "Smash")
			{
				smashBulletA.setBulletDamage(currentWeapon.wDamage);
				smashBulletA.setFireRate(currentWeapon.wFireRate);
				smashBulletA.setBulletSpeed(currentWeapon.wMaxSpeed);
				smashBulletA.setBulletLifeSpan(currentWeapon.wLifeSpan);
			}
			
			if (currentWeapon.wType == "Flame")
			{
				flameBulletA.setBulletDamage(currentWeapon.wDamage);
				flameBulletA.setFireRate(currentWeapon.wFireRate);
				flameBulletA.setBulletSpeed(currentWeapon.wMaxSpeed);
				flameBulletA.setBulletLifeSpan(currentWeapon.wLifeSpan);

				flameBulletB.setBulletDamage(currentWeapon.wDamage);
				flameBulletB.setFireRate(currentWeapon.wFireRate);
				flameBulletB.setBulletSpeed(currentWeapon.wMaxSpeed);
				flameBulletB.setBulletLifeSpan(currentWeapon.wLifeSpan);

				flameBulletC.setBulletDamage(currentWeapon.wDamage);
				flameBulletC.setFireRate(currentWeapon.wFireRate);
				flameBulletC.setBulletSpeed(currentWeapon.wMaxSpeed);
				flameBulletC.setBulletLifeSpan(currentWeapon.wLifeSpan);
			}
			
			if (currentWeapon.wType == "Mine")
			{
				mineBulletA.setBulletDamage(currentWeapon.wDamage);
				mineBulletA.setFireRate(currentWeapon.wFireRate);
				mineBulletA.setBulletSpeed(currentWeapon.wMaxSpeed);
				mineBulletA.setBulletLifeSpan(currentWeapon.wLifeSpan);
			}
		}*/
		
		
		public function createExplosive(bullet:FlxObject, enemy:FlxObject):void
		{
			//trace("Rocket Dispatched");
			
			enemy.hurt(bullet.damage);
			
			rocketPositionX = bullet.x;
			rocketPositionY = bullet.y;
			
			//trace(rocketPositionX);
			//trace(rocketPositionY);
			
			//rocketBulletSubA.setFiringPosition(rocketPositionX, rocketPositionY, 0, 0);
			//rocketBulletSubA.fire();
			
			FlxG.score += 5;
			
			bullet.kill();
		}
	}

}