import { Room, Client } from "colyseus";
import { MyRoomState, Player } from "./schema/MyRoomState";

export class MyRoom extends Room<MyRoomState> {
  onCreate () {
    this.setState(new MyRoomState());
    this.onMessage("*", (_client, type, message) => {
      console.log(type, "type")
      if (type === "player") {
        console.log(message, "message")
      }
    });

  }

  onJoin (client: Client) {
    const player = new Player();
    player.x = 200;
    player.y = 200;
    player.colour = 0;
    this.state.players.set(client.sessionId, player);
    console.log(client.sessionId, "joined!");
  }

  onLeave (client: Client, consented: boolean) {
    console.log(client.sessionId, "left!");
  }

  onDispose() {
    console.log("room", this.roomId, "disposing...");
  }

}
