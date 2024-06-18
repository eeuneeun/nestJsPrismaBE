import { Injectable, Logger, NestMiddleware } from '@nestjs/common';
import { Request, Response, NextFunction } from 'express';

@Injectable()
export class LoggerMiddleware implements NestMiddleware {
    private logger = new Logger('HTTP');

    use(req: Request, res: Response, next: NextFunction): void {
      const { method, originalUrl } = req;
      const startTime = Date.now();
  
      res.on('finish', () => {
        const { statusCode } = res;
        const endTime = Date.now();
        const responseTime = endTime - startTime;
  
        this.logger.log(`${method} ${originalUrl} ${statusCode} - ${responseTime}ms`);
      });
  
      next();
    }
}



export function globalLogger(req: Request, res: Response, next: NextFunction) {
    console.log('==========================================');
    console.log(req);
    console.log(res);
    console.log(next);
    console.log('==========================================');
    next();
};