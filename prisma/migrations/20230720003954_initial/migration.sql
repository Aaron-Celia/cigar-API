-- CreateEnum
CREATE TYPE "Strengths" AS ENUM ('MILD', 'MILD_MEDIUM', 'MEDIUM', 'MEDIUM_FULL', 'FULL');

-- CreateTable
CREATE TABLE "Cigars" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "image_src" TEXT NOT NULL,
    "country" TEXT NOT NULL,
    "wrapper_type" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "strength" "Strengths" NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Cigars_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Shapes" (
    "id" SERIAL NOT NULL,
    "shape_name" TEXT NOT NULL,
    "dimensions" TEXT NOT NULL,
    "cigar_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Shapes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Options" (
    "id" SERIAL NOT NULL,
    "package_option" TEXT NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "shape_id" INTEGER NOT NULL,
    "cigar_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Options_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Cigars_name_key" ON "Cigars"("name");

-- AddForeignKey
ALTER TABLE "Shapes" ADD CONSTRAINT "Shapes_cigar_id_fkey" FOREIGN KEY ("cigar_id") REFERENCES "Cigars"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Options" ADD CONSTRAINT "Options_shape_id_fkey" FOREIGN KEY ("shape_id") REFERENCES "Shapes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Options" ADD CONSTRAINT "Options_cigar_id_fkey" FOREIGN KEY ("cigar_id") REFERENCES "Cigars"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
