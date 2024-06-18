/*
  Warnings:

  - You are about to drop the column `expireTime` on the `Room` table. All the data in the column will be lost.
  - You are about to drop the column `generateTime` on the `Room` table. All the data in the column will be lost.
  - You are about to drop the column `roomId` on the `Room` table. All the data in the column will be lost.
  - You are about to drop the `Algorithm` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[problemId]` on the table `Room` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[ownerId]` on the table `Room` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `expireAt` to the `Room` table without a default value. This is not possible if the table is not empty.
  - Added the required column `generateAt` to the `Room` table without a default value. This is not possible if the table is not empty.
  - Added the required column `ownerId` to the `Room` table without a default value. This is not possible if the table is not empty.
  - Added the required column `problemId` to the `Room` table without a default value. This is not possible if the table is not empty.
  - Added the required column `roomLink` to the `Room` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Room" DROP CONSTRAINT "Room_roomId_fkey";

-- AlterTable
ALTER TABLE "Room" DROP COLUMN "expireTime",
DROP COLUMN "generateTime",
DROP COLUMN "roomId",
ADD COLUMN     "expireAt" INTEGER NOT NULL,
ADD COLUMN     "generateAt" INTEGER NOT NULL,
ADD COLUMN     "ownerId" INTEGER NOT NULL,
ADD COLUMN     "problemId" INTEGER NOT NULL,
ADD COLUMN     "roomLink" TEXT NOT NULL;

-- DropTable
DROP TABLE "Algorithm";

-- CreateTable
CREATE TABLE "Problem" (
    "id" SERIAL NOT NULL,
    "originLink" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "condition" TEXT NOT NULL,
    "contents" TEXT NOT NULL,
    "evaluateInput" TEXT NOT NULL,
    "evaluateOutput" TEXT NOT NULL,
    "grade" INTEGER NOT NULL,
    "viewCount" INTEGER NOT NULL,

    CONSTRAINT "Problem_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Room_problemId_key" ON "Room"("problemId");

-- CreateIndex
CREATE UNIQUE INDEX "Room_ownerId_key" ON "Room"("ownerId");

-- AddForeignKey
ALTER TABLE "Room" ADD CONSTRAINT "Room_problemId_fkey" FOREIGN KEY ("problemId") REFERENCES "Problem"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Room" ADD CONSTRAINT "Room_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
