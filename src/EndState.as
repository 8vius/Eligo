package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxButtonPlus;
	
	public class EndState extends FlxState
	{
		override public function create():void {
			var g:FlxSprite = new FlxSprite(0, 0, AssetRegistry.creditos);
			add(g);
			
			FlxG.mouse.show();
			//Mouse.hide();
		}
	}
}