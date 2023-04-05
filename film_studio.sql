
create table if not exists copyright(
	copyright_id int NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	applicant varchar(30) NOT NULL,
	registration_date date NOT NULL,
	copyright_number int NOT NULL
);

create table if not exists film_info(
	film_info_id int NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	description text,
	country varchar(18),
	release_date date,
	premiere_info text,
	copyright_id int not null,
	constraint fk_copyright foreign key (copyright_id) REFERENCES copyright (copyright_id)
);

create table if not exists review(
	review_id int NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	Nickname varchar(12) NOT NULL,
	rating smallint,
	review text
);

create table if not exists author(
	author_id int NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	avatar varchar,
	fio varchar(40) NOT NULL,
	age smallint 
);

create table if not exists composer(
	composer_id int NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	fio varchar(40) NOT NULL,
	avatar varchar,
	age smallint
);

create table if not exists sponsor(
	sponsor_id int NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	s_name varchar(20) NOT NULL,
	s_date date,
	logo varchar
);


create table if not exists user_record(
	user_record_id int NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	fio varchar(40) NOT NULL,
	email varchar,
	birthday date NOT NULL,
	delivery_address varchar,
	payment_address varchar
);

create table if not exists artist(
	artist_id int NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	avatar varchar,
	fio varchar(40) not null,
	age smallint
);

create table if not exists film(
	film_id int NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	trailer varchar,
	f_name varchar(20) NOT NULL,
	cover varchar,
	duration smallint NOT NULL,
	film_info_id int not null,
	review_id int not null,
	author_id int not null,
	composer_id int not null,
	artist_id int not null,
	constraint fk_film_info foreign key (film_info_id) REFERENCES film_info (film_info_id),
	constraint fk_review foreign key (review_id) REFERENCES review (review_id),
	constraint fk_author foreign key (author_id) REFERENCES author (author_id),
	constraint fk_composer foreign key (composer_id) REFERENCES composer (composer_id),
	constraint fk_artist foreign key (artist_id) REFERENCES artist (artist_id)
);

create table if not exists user_order(
 	user_order_id int NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	o_type varchar,
	o_name varchar(100) ,
	price int,
	film_id int not null,
	constraint fk_film foreign key (film_id) REFERENCES film (film_id)
);

create table if not exists cart(
	cart_id int NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	total_amount money,
	quantity smallint,
	discount int,
	user_order_id int not null,
	constraint fk_user_order foreign key (user_order_id) REFERENCES user_order (user_order_id)
);

create table if not exists account(
	account_id int NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nickname varchar(15) NOT NULL,
	avatar varchar,
	access_level varchar(10) NOT NULL,
	user_record_id int not null,
	cart_id int not null,
	constraint fk_user_record foreign key (user_record_id) REFERENCES user_record (user_record_id),
	constraint fk_cart foreign key (cart_id) REFERENCES cart (cart_id)
);

create table if not exists dub_actor(
	dub_actor_id int NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	fio varchar(40) not null,
	avatar varchar,
	dub_character varchar(40) not null,
	avatar_character varchar
);


