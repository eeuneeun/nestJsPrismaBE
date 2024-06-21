/*
  Warnings:

  - You are about to drop the column `condition` on the `Problem` table. All the data in the column will be lost.
  - You are about to drop the column `contents` on the `Problem` table. All the data in the column will be lost.
  - You are about to drop the column `evaluateInput` on the `Problem` table. All the data in the column will be lost.
  - You are about to drop the column `evaluateOutput` on the `Problem` table. All the data in the column will be lost.
  - You are about to drop the column `grade` on the `Problem` table. All the data in the column will be lost.
  - You are about to drop the column `originLink` on the `Problem` table. All the data in the column will be lost.
  - You are about to drop the column `viewCount` on the `Problem` table. All the data in the column will be lost.
  - Added the required column `description` to the `Problem` table without a default value. This is not possible if the table is not empty.
  - Added the required column `difficulty` to the `Problem` table without a default value. This is not possible if the table is not empty.
  - Added the required column `link` to the `Problem` table without a default value. This is not possible if the table is not empty.
  - Added the required column `memoryLimit` to the `Problem` table without a default value. This is not possible if the table is not empty.
  - Added the required column `passCount` to the `Problem` table without a default value. This is not possible if the table is not empty.
  - Added the required column `peopleCount` to the `Problem` table without a default value. This is not possible if the table is not empty.
  - Added the required column `timeLimit` to the `Problem` table without a default value. This is not possible if the table is not empty.
  - Added the required column `tryCount` to the `Problem` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Problem" DROP COLUMN "condition",
DROP COLUMN "contents",
DROP COLUMN "evaluateInput",
DROP COLUMN "evaluateOutput",
DROP COLUMN "grade",
DROP COLUMN "originLink",
DROP COLUMN "viewCount",
ADD COLUMN     "description" TEXT NOT NULL,
ADD COLUMN     "difficulty" TEXT NOT NULL,
ADD COLUMN     "link" TEXT NOT NULL,
ADD COLUMN     "memoryLimit" TEXT NOT NULL,
ADD COLUMN     "passCount" TEXT NOT NULL,
ADD COLUMN     "peopleCount" TEXT NOT NULL,
ADD COLUMN     "problemInput" TEXT,
ADD COLUMN     "problemLimit" TEXT,
ADD COLUMN     "problemOutput" TEXT,
ADD COLUMN     "sampleInput" TEXT,
ADD COLUMN     "sampleInput2" TEXT,
ADD COLUMN     "sampleInput3" TEXT,
ADD COLUMN     "sampleOutput" TEXT,
ADD COLUMN     "sampleOutput2" TEXT,
ADD COLUMN     "sampleOutput3" TEXT,
ADD COLUMN     "source" TEXT,
ADD COLUMN     "timeLimit" TEXT NOT NULL,
ADD COLUMN     "tryCount" TEXT NOT NULL;
