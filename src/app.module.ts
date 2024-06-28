import { MiddlewareConsumer, Module, NestModule, RequestMethod } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { EventsModule } from './events/events.module';
import { CrawlerModule } from './crawler/crawler.module';
import { LoggerMiddleware } from './logger.middleware';
// import { ProblemModule } from './problem/problem.module';
import { AuthModule } from './auth/auth.module';
import { UsersModule } from './users/users.module';
import { RoomModule } from './room/room.module';

@Module({
  imports: [
    EventsModule, 
    CrawlerModule, 
    AuthModule, 
    UsersModule, RoomModule, 
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule implements NestModule {
  configure(consumer: MiddlewareConsumer) {
    consumer
      .apply(LoggerMiddleware)
      // .forRoutes('crawler')
      .forRoutes('*')
  }
}
