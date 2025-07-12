-- CreateEnum
CREATE TYPE "Stage" AS ENUM ('TODO', 'DOING', 'DONE');

-- CreateTable
CREATE TABLE "card" (
    "id" TEXT NOT NULL,
    "title" VARCHAR(30) NOT NULL,
    "text" TEXT NOT NULL,
    "stage" "Stage" NOT NULL DEFAULT 'TODO',

    CONSTRAINT "card_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "card_title_key" ON "card"("title");
