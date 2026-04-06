table UserAccount{
	user_id int [pk]
	email varchar 
	password varchar 
	created_at timestamp
}

table Character{
	character_id int [pk]
	user_id int
	name varchar 
	level int
	class varchar 
}

table Item{
	item_id int [pk]
	name varchar 
	type varchar 
}

table Inventory{
	character_id int
	item_id int
	quantity int
	indexes {
		(character_id, item_id)
	}
}

Ref: Character.user_id > UserAccount.user_id
Ref: Inventory.character_id > Character.character_id
Ref: Inventory.item_id > Item.item_id