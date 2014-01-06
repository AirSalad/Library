package  
{
	import flash.utils.getQualifiedClassName;

	public class Registry
	{
		public static var registry:Array;

		public static function set(classInstance:Object):void
		{
			var className:String = getQualifiedClassName(classInstance);

			if (typeof registry[className] === 'undefined')
			{
				registry[className] = classInstance;
			}
		}

		public static function get(className:String):Object
		{
			return (typeof registry[className] === 'undefined')? null : registry[className];
		}
	}
}