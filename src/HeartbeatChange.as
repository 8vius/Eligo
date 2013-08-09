package {
	
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxMouseControl;
	
	[SWF(width="640", height="480", backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]
	public class HeartbeatChange extends FlxGame {
		
		public function HeartbeatChange() {
			super(320,240,MenuState,2);
			
			FlxG.debug = true;
			//	If the FlxScrollZone Plugin isn't already in use, we add it here
			if (FlxG.getPlugin(FlxMouseControl) == null)
			{
				FlxG.addPlugin(new FlxMouseControl);
			}
		}
	}
}

