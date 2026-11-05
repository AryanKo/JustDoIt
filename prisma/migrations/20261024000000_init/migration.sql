-- CreateTable
CREATE TABLE "Task" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "dueDate" TIMESTAMP(3),
    "assignedUser" TEXT,
    "tags" TEXT NOT NULL DEFAULT '[]',
    "groupName" TEXT NOT NULL DEFAULT 'Aethron',
    "subgroupName" TEXT,
    "status" TEXT NOT NULL DEFAULT 'TODO',
    "isStarred" BOOLEAN NOT NULL DEFAULT false,
    "isDeleted" BOOLEAN NOT NULL DEFAULT false,
    "deletedAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Task_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Group" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "parentGroup" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Group_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserIdentity" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "role" TEXT NOT NULL DEFAULT 'member',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "UserIdentity_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "Task_isDeleted_status_idx" ON "Task"("isDeleted", "status");

-- CreateIndex
CREATE INDEX "Task_groupName_subgroupName_idx" ON "Task"("groupName", "subgroupName");

-- CreateIndex
CREATE UNIQUE INDEX "Group_name_parentGroup_key" ON "Group"("name", "parentGroup");

-- CreateIndex
CREATE UNIQUE INDEX "UserIdentity_name_key" ON "UserIdentity"("name");

