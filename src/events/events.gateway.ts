import {
    MessageBody,
    SubscribeMessage,
    WebSocketGateway,
    WebSocketServer,
    WsResponse,
  } from '@nestjs/websockets';
  import { from, Observable } from 'rxjs';
  import { map } from 'rxjs/operators';
  import { Server } from 'socket.io';
  
  @WebSocketGateway({
    cors: {
      origin: '*',
    },
  })
  export class EventsGateway {
    @WebSocketServer()
    server: Server;
  
    @SubscribeMessage('test')
    findAll(@MessageBody() data: any): Observable<WsResponse<number>> {
      console.log(data)
      return from([1, 2, 3]).pipe(map(item => ({ event: 'chat', data: item })));
    }
  
    // TOPIC FOR CHAT
    @SubscribeMessage('chat')
    async identity(@MessageBody() data: any): Promise<any> {
      console.log(data)
      return ({ event: 'chat', data: data });
    }
  }