package;

import flixel.FlxGame;

import levels.LevelOne;

import openfl.display.Sprite;



class Main extends Sprite {
	public function new() {
		super();
		addChild(new FlxGame(1280, 720, LevelOne, true));
	}
}