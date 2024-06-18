import { MiddlewareConsumer, Module, NestModule, RequestMethod } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { EventsModule } from './events/events.module';
import { CrawlerModule } from './crawler/crawler.module';
import { LoggerMiddleware } from './logger.middleware';

@Module({
  imports: [
    EventsModule, CrawlerModule
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
