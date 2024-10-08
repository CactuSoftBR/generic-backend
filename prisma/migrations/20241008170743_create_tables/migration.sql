/*
  Warnings:

  - You are about to drop the `Metrics` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Metrics" DROP CONSTRAINT "Metrics_customerId_fkey";

-- DropTable
DROP TABLE "Metrics";

-- CreateTable
CREATE TABLE "metrics" (
    "id" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "latency" INTEGER,
    "packetLoss" INTEGER,
    "ping" BOOLEAN,
    "traffic" INTEGER,
    "customerId" TEXT NOT NULL,

    CONSTRAINT "metrics_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "metrics" ADD CONSTRAINT "metrics_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "customers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
