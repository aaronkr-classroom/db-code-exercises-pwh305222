table users;

select user_level from users;

-- check 유저 레벨은 1~100만 가능하다
alter table users
add constraint chk_user_level
check (user_level >= 1 and user_level <= 100);

update users
set user_level = 101
where user_id = 1;

-- 2: 접속 상태는 online 또는 offline만 가능하다
alter table users
add constraint chk_user_status
check (status in ('online', 'connecting', 'offline'));

update users
set status = 'sleeping'
where user_id = 2;

-- 3: 아이템 가격은 0원 이상이어야 한다
select price from items;

alter table items
add constraint chk_item_price
check (price >= 0);

update items
set price = -10
where item_id = 1001;

-- 4: 아이템 등급을 정해진 값만 가능하다 (S, A, B, C, D, E, F)
select grade from items;

alter table items
add constraint chk_item_grade
check (grade in ('S', 'A', 'B', 'C', 'D', 'E', 'F'))

update items
set grade = 'H'
where item_id = 1001;

-- 5: 닉네임은 중복되면 안 된다
alter table users
add constraint uq_user_nickname
unique (nickname);

insert into users values
(6, '홍길동', 'DragonKing', 10, '2026-05-18', 'home@home.com', 'offline');

select constraint_name, table_name
from information_schema.table_constraints
where constraint_type = 'foreign key'
	and table_name = 'plays';

-- plays_user_id_fkey
-- plays_game_id_fkey
-- user_items_user_id_fkey
-- user_items_item_id_fkey

alter table play
drop constraint play_user_id_fkey;
alter table play
drop constraint play_game_id_fkey;
alter table user_items
drop constraint user_items_user_id_fkey;
alter table user_items
drop constraint user_items_item_id_fkey;

-- 새 fk 추가
-- 1: 유저가 삭제되면 플레이 기록도 삭제되게 하기
alter table play
add constraint fk_play_users
foreign key (user_id)
references users(user_id)
on delete cascade;

-- 2: 게임은 플레이 기록이 있으면 삭제하지 못하게 하기
alter table play
add constraint fk_play_games
foreign key (game_id)
references games(game_id)
on delete restrict;

-- 3: 유저가 삭제되면 보유 아이템 기록도 삭제되게 하기
alter table user_items
add constraint fk_user_items_users
foreign key (user_id)
references users(user_id)
on delete cascade;

-- 4: 아이템 누군가 보유 중이면 삭제하지 못하게 하기
alter table user_items
drop constraint fk_user_items_items;

alter table user_items
add constraint fk_user_items_items
foreign key (item_id)
references items(item_id)
on delete restrict; --수정

-- cascade 테스트
select * from play where user_id = 1;
select * from user_items where user_id = 1;

delete from users
where user_id = 1;

-- restrict 테스트
table games;

delete from games where game_id = 101;
delete from items where item_id = 1004;



















