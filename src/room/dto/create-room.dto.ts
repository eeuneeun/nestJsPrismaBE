export class CreateRoomDto {
    id   :      Number;
    manager   : String;
    title     : String;
    maxAttend : Number;
    generateAt: Number;
    expireAt  : Number;
    difficulty: Number;
    roomLink  : String;
    problemId : Number;
    owner     : String;
    ownerId   : Number;
}
