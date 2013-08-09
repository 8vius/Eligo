package {
	import flash.ui.Mouse;
	
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxButtonPlus;
	
	public class MenuState extends FlxState {
		//[Embed(source="assets/letitle.png")]
		//private var title : Class;
		
		override public function create():void {
			var g:FlxSprite = new FlxSprite(0, 0, AssetRegistry.letitle);
			add(g);
			
			FlxG.mouse.show();
			Mouse.hide();
		}
		
		override public function update() : void {
			if (FlxG.mouse.justPressed()) {
				FlxG.switchState(new PlayState());
			}
		}
	}
}

