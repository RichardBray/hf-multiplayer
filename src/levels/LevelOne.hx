package levels;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

import io.colyseus.Client;
import io.colyseus.Room;

import js.Browser;

import states.GameState;

class LevelOne extends GameState {
	var _player: FlxSprite;
	var _name: FlxText;
	// var room:Room<GameSchema>;
	var _playerPos: Array<Int> = [0, 0];
	var _playerColour: Int;
	var _playerIds: Array<String> = [];

	final _colors: Array<FlxColor> = [
		FlxColor.RED,
		FlxColor.BLACK,
		FlxColor.BROWN,
		FlxColor.CYAN,
		FlxColor.GREEN,
		FlxColor.YELLOW,
		FlxColor.LIME,
		FlxColor.MAGENTA,
		FlxColor.PURPLE,
		FlxColor.ORANGE
	];

	override public function create(): Void {
		super.create();
		_playerPos = [100 * getRandomNum(), 100 * getRandomNum()];
		_playerColour = getRandomNum();

		new FlxTimer().start(1, (timer -> {
			initClient();
		}));
	}

	@:pure function createPlayer(X: Int, Y: Int, Color: Int): FlxSprite {
		var player: FlxSprite = new FlxSprite(X, Y);
		player.makeGraphic(100, 120, _colors[Color]);
		player.maxVelocity.set(100, 200);
		player.drag.x = player.maxVelocity.x * 4;

		return player;
	}

	@:pure function getRandomNum(): Int {
		final randomNum = Math.floor(Math.random() * 10);
		return Std.int(randomNum);
	}

	@:pure function getRandomName(): String {
		final names: Array<String> = [
			"arshajii",
			"Brajeshwar",
			"occamschainsaw",
			"dihydro",
			"Gigacore",
			"tosh",
			"ghuntley",
			"todsacerdoti",
			"kunalch",
			"mik3y",
		];

		return names[getRandomNum()];
	}

	function initClient(): Void {
		var client = new Client('ws://localhost:2567');

		client.joinOrCreate("test_room_name", [], levels.GameSchema, (err, room) -> {
			if (err != null) {
					trace("JOIN ERROR: " + err);
					return;
			}
			trace("Connected to server!!!");
			if (!_playerIds.contains(room.sessionId)) {
				room.state.players.onAdd = (player, key) -> {
					Browser.console.log(player, "player");
					_player = createPlayer(player.x, player.y, player.colour);
					add(_player);
					_playerIds.push(key);
				};
			}


			room.send("player", {colour: _playerColour, x: 1, y: 1});
	});
	}

	override public function update(elapsed: Float): Void {
		// _player.acceleration.x = 0;

		// if (FlxG.keys.pressed.LEFT) _player.acceleration.x = -_player.maxVelocity.x * 4;

		// if (FlxG.keys.pressed.RIGHT) _player.acceleration.x = _player.maxVelocity.x * 4;

		super.update(elapsed);
	}
}