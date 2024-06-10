
CREATE TABLE IF NOT EXISTS "users" (
    "id" BIGSERIAL PRIMARY KEY,
    "full_name" VARCHAR(255) NOT NULL,
    "nick_name" VARCHAR,
    "photo" VARCHAR, -- path yoki url uchun
    "birthday" DATE,
    "created_at" TIMESTAMPTZ DEFAULT NOW(), -- TIMESTAMP ni o'zidan ham foydalansam bo'lar edi. Lekin time zonda muammo bo'lmasligi uchun bundan foydalandim.
    "deleted_at" TIMESTAMPTZ,
    "updated_at" TIMESTAMPTZ DEFAULT NOW(),
    "created_by" VARCHAR NOT NULL, -- Bu joyda uuid bilan foreign key orqali ham bog'lashim mumkin edi.
    "updated_by" VARCHAR, -- UUID bo'ladi deb o'ylagandim.
    "deleted_by" VARCHAR
); -- CONSTRAINT ham qo'shish mumkin edi 