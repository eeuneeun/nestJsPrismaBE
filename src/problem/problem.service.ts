import { Injectable } from '@nestjs/common';
import { CreateProblemDto } from './dto/create-problem.dto';
import { UpdateProblemDto } from './dto/update-problem.dto';
import { PrismaService } from 'src/prisma.service';
import { Problem, Prisma } from '@prisma/client';


@Injectable()
export class ProblemService {
  constructor(private prisma: PrismaService) {}

  create(){
  // create(createProblemDto: CreateProblemDto): Promise<Problem | null>{
    console.log('This action adds a new problem');
    // return this.prisma.problem.create({
    // });
  }

  findAll() {
    console.log(`This action returns all problem`);
    return 'all'
  }

  findOne(id: number) {
    return `This action returns a #${id} problem`;
  }

  update(id: number, updateProblemDto: UpdateProblemDto) {
    return `This action updates a #${id} problem`;
  }

  remove(id: number) {
    return `This action removes a #${id} problem`;
  }
}
