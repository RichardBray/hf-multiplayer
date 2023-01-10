import { Server } from "colyseus";
import { MyRoom } from "./rooms/MyRoom";
const port = process.env.port || 2567;

const gameServer = new Server();
gameServer.listen(port as number);

gameServer.define('test_room_name', MyRoom);