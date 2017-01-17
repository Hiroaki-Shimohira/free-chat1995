# README

#Users
|culumn|type|index|null|
|:--:|:--:|:--:|:--:|
|name|string||false|
|email|string||false|

###associacion
- has_many masseges
- has_many chat_group_users
- has_many chat_groups through chat_group_users


#chat_groups
|culumn|type|index|null|
|:--:|:--:|:--:|:--:|
|name|string||false|

###association
- has_many masseges
- has_many chat_group_users
- has_many users through chat_group_users


#massages
|culumn|type|index|null|
|:--:|:--:|:--:|:--:|
|body|text||false|
|image|string|||
|user_id|integer|true||
|chat_group_id|integer|true||

###association
- belongs_to user
- belongs_to chat_group


#chat_groups_users
|culumn|type|index|null|
|:--:|:--:|:--:|:--:|
|user_id|integer|true||
|chat_group_id|integer|true||

###sociation
- belongs_to user
- belongs_to chat_group
