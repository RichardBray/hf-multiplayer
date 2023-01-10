package levels;

import io.colyseus.serializer.schema.Schema;
import io.colyseus.serializer.schema.types.MapSchema;

class Player extends Schema {
  @:type("number")
	public var x: Int;
  @:type("number")
	public var y: Int;
  @:type("number")
	public var colour: Int;
}


class GameSchema extends Schema {
	@:type("map", Player)
	public var players: MapSchema<Player> = new MapSchema<Player>();
}