package states;

import flixel.FlxG;
import flixel.FlxState;
import flixel.util.FlxColor;

class GameState extends FlxState {

	override public function create() {
		super.create();
		bgColor = FlxColor.GRAY;


		FlxG.autoPause = false;
		FlxG.camera.antialiasing = true;
		FlxG.mouse.useSystemCursor = true;
		FlxG.mouse.visible = true;
	}
}
