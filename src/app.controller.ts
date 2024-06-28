import { Body, Controller, Get, Post } from '@nestjs/common';
import { AppService } from './app.service';
import { RoomService } from './room/room.service';
import {Room as RoomModel} from '@prisma/client';

@Controller()
export class AppController {
  constructor(
    private readonly appService: AppService,
    private readonly roomService: RoomService
  ) {}

  @Get()
  getHello(): string {
    return this.appService.getHello();
  }

  
  @Post('room')
  async createDraft(
    @Body() postData: { title: string; content?: string; authorEmail: string },
  ): Promise<RoomModel> {
    const { title, content, authorEmail } = postData;
    return this.roomService.createRoom({
      title,
      content,
      author: {
        connect: { email: authorEmail },
      },
    });
  }

}
