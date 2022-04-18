create table "users" (
    "username" varchar primary key,
    "hashed_password" varchar not null,
    "full_name" varchar not null,
    "email" varchar not null,
    "password_changed_at" timestamptz,
    "created_at" timestamp NOT NULL DEFAULT (now())
);

alter table "accounts" add foreign key ("owner") references "users" ("username");

create unique index on "accounts" ("owner");
alter table "accounts" add constraint "owner_currency_key" unique ("owner", "currency")