create database if not exists feedback;
use feedback;

drop table if exists users, roles;

create table users (
    id bigint primary key auto_increment,
    username varchar(255) primary key,
    password varchar(255) not null
    

);

create table roles (
    username varchar(255) unique not null,
    role varchar(250) not null,
    primary key (username, role),
    foreign key (username) references users(username) on delete cascade
);

create table art_submission (
    id bigint primary key auto_increment,
    user_id bigint not null,
    title varchar(255) not null,
    image_url text not null, 
    is_public boolean default true,
    allow_anon_feedback boolean default true,
    created_at timestamp current_timestamp,
    foreign key (user_id) references users(id)
);

create table tags (
    id bigint primary key auto_increment,
    name varchar(100) unique not null

);

create table art_submission_tags (
    art_submission_id bigint not null,
    tag_id bigint not null,
    primary key (art_submission_id, tag_id),
    foreign key (art_submission_id) references art_submission_id on delete cascade,
    foreign key (tag_id) references tags(id) on delete cascade 
);

create table feedback (
    if bigint primary key auto_increment,
    art_submission_id bigint not null,
    reviewer_id bigint,
    compliment_one text not null,
    critique text not null,
    compliment_two text not null,
    is_anonymous boolean default false,
    created_at timestamp default current_timestamp,
    foreign key(art_submission_id) references art_submission(id),
    foreign key (reviewer_id) references users(id)


);

insert into tags (name) values
("digital"),("painting"),("photograph"),("sketch"),("woodworking"),("ceremanics"),("other");


insert into users (username, password) values ('admin', '$2a$10$tBTfzHzjmQVKza3VSa5lsOX6/iL93xPVLlLXYg2FhT6a.jb1o6VDq');
insert into roles (username, role) values ('admin', 'ADMIN');

insert into users (username, password) values ('user', '$2a$10$tBTfzHzjmQVKza3VSa5lsOX6/iL93xPVLlLXYg2FhT6a.jb1o6VDq');
insert into roles (username, role) values ('user', 'USER');
