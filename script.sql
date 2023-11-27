CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

create type status_type as enum ('open', 'ordered');

create table carts (
    id uuid primary key default uuid_generate_v4(),
    user_id uuid default uuid_generate_v4(),
    created_at date default CURRENT_DATE,
    updated_at date default CURRENT_DATE,
    status status_type 
)

create table cart_items (
    cart_id uuid,
    product_id uuid,
    count integer,
    foreign key ("cart_id") references "carts" ("id")
)

insert into carts (status) values
('ordered'),
('open'),
('ordered')

insert into cart_items (cart_id, product_id, count) values
('9cab2791-1fcd-4891-9f45-6e8825244deb', '1dc4988d-8390-463d-885d-9bdd094126ae', 10),
('df30aa7c-dda9-4725-b954-0c2e58cee9df', '3630b54b-9aea-41cb-a4ab-c5fd8dbe51cb', 20),
('95a6a71c-e527-459a-ae02-62a968feea57', '8d885068-596c-4f74-af9f-f5e8a3a78307', 30)