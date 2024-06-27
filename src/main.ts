import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { globalLogger } from './logger.middleware';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  // app.use(globalLogger);
  await app.listen(8080);
  
  console.log(`Coding_Us 실행 URL : ${await app.getUrl()}`);
}
bootstrap();
