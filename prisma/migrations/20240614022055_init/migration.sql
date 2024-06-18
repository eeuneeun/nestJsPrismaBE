-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Algorithm" (
    "id" SERIAL NOT NULL,
    "originLink" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "condition" TEXT NOT NULL,
    "contents" TEXT NOT NULL,
    "evaluateInput" TEXT NOT NULL,
    "evaluateOutput" TEXT NOT NULL,
    "grade" INTEGER NOT NULL,
    "viewCount" INTEGER NOT NULL,

    CONSTRAINT "Algorithm_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Room" (
    "id" SERIAL NOT NULL,
    "manager" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "maxAttend" INTEGER NOT NULL,
    "generateTime" INTEGER NOT NULL,
    "expireTime" INTEGER NOT NULL,
    "difficulty" INTEGER NOT NULL,
    "roomId" INTEGER NOT NULL,

    CONSTRAINT "Room_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_name_key" ON "User"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Room_manager_key" ON "Room"("manager");

-- AddForeignKey
ALTER TABLE "Room" ADD CONSTRAINT "Room_roomId_fkey" FOREIGN KEY ("roomId") REFERENCES "Algorithm"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
