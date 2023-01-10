import { Schema, MapSchema, type } from "@colyseus/schema";

export class Player extends Schema {
  @type("number") x: number;
  @type("number") y: number;
  @type("number") colour: number;
}


export class MyRoomState extends Schema {
  @type({ map: Player })
  players = new MapSchema<Player>();
}