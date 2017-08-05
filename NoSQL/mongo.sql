# mongo 的数据库模式是对象的数据模型
# 操作的数据类型为 对象形式的 key-value 

# mongodb的shell 解析器是javascript 的functino 解析器
  #也可交叉的使用python的解析 支持多种数据操作 PHP java GO 等常用web开发语言
  # 同时也支持 Big Data 的处理分析集合 MapReduce 操作和 sprk 操作
  # 比较好的兼容类型

# 由于mongodb消息发送一次最大为16mb 超过的要对消息惊喜切片处理通过多次来达到存储关系
  # 操作是基于集合的操作 语法上有仿照SQL语句创作的也有自己独特的语言
  
  
------  创建数据库------
use foodar ; --创造并进入数据库
show dbs ;   -- 查看数据库
show collections ; --查看集合
show tables ;     --仿SQL 查看集合
------------------------

--------- 数据库操作 ---------
drop.Database(); -删除数据库
var source = "source"; 
var dest = "dest"; 
var colls = db.getSiblingDB(source).getCollectionNames(); 
for (var i = 0; i < colls.length; i++) { 
    var from = source + "." + colls[i]; 
    var to = dest + "." + colls[i]; 
    db.adminCommand({renameCollection: from, to: to}); 
}   -- 数据库没有提供改名的 renamedatabase 只能通过函数来改名

----------------------------

----- 创建数据集合(表)--------------
I.   db.persion.insert({key: value})
II.  db.persion.collections({key: value})
III. db.persion.save({key: value})
IIII db.createCollection({key: value})
-----------------------------------

------  基本数据类型-----------
I 数值型 1 2  32bit 64bit 
I 字符型 "name"
I 数组   []
i 对象  _id : object
I 日期   Date（）
I 代码  key ： function（）{...}
I 内嵌文档 key: {"document"}
------------------------------

---------- 插入数据------------

{
   insert: <collection>,
   documents: [ <document>, <document>, <document>, ... ],
   ordered: <boolean>,
   writeConcern: { <write concern> },
   bypassDocumentValidation: <boolean>
}

db.persion.insert({_id: 1,name: "jock",age: 20,date: Date(), elam: "jack@cure.com"})
db.persion.insert({_id: 2,name: "tom",age: 15,date:  Date(), elam: "tom@cure.com"})
db.persion.insert({_id: 3,name: "tiem",age: 25,date: Date(), elam: "tiem@cure.com"})
db.persion.insert({_id: 4,name: "lose",age: 40,date: Date(), elam: [tiem@cure.com ,tiem1@cure.com,tiem2@cure.com]})

db.book.insert({ "_id" : 1, "friends" : 32, "enemies" : 2, "relationships" : { "friends" : 32, " enemies" : 2 }, "username" : "joe" })
db.book.insert({ "_id" : 2, "apple" : 1, "banan" : 6, "peach" : 3 })
db.book.insert({ "_id" : 3, "apple" : 8, "spinach" : 4, "water" : 4 })

db.blog.insert({ "_id" : 1, "title" : "blog post", "content": "nice", "authors" : [ "richie" ] })
db.blog.insert({ "_id" : 2, "title" : "score", "comments" :[ { "name" : "job" }, { "name" : "job" }, { "name" : "job", "age" : 25, "conten"
 : "nice post" } ] })
db.blog.insert({ "_id" : 3, "name" : "jack", "emails" : [ "joe@2.com", "jse@2.com", "jse@3.com", "jon@php.com" ] })

db.nums.insert({ "_id" : 1, "myInteger" : { "floatApprox" :3 } })
db.nums.insert({ "_id" : 2, "things" : [ "pie", 3.14 ] })
db.nums.insert({ "_id" :3, "name" : "Jon Doe", "address" :{ "street" : "123 Park Street", "city" : "Anytown", "state" : "NY" } })
db.stores.insert(
   [
     { _id: 1, name: "Java Hut", description: "Coffee and cakes" },
     { _id: 2, name: "Burger Buns", description: "Gourmet hamburgers" },
     { _id: 3, name: "Coffee Shop", description: "Just coffee" },
     { _id: 4, name: "Clothes Clothes Clothes", description: "Discount clothing" },
     { _id: 5, name: "Java Shopping", description: "Indonesian goods" }
   ]
)

> db.products.find()
{ "_id" : 2, "item" : "Unknown", "price" : NumberLong(0) }
{ "_id" : 3, "item" : "XYZ", "price" : NumberLong(50) }
{ "_id" : 1, "item" : "apple", "price" : 13.7375, "defaultQty" : 100 }
> db.scores.find()
{ "_id" : 1, "highScore" : 800, "lowScore" : 250 }

> db.survey.find()
{ "_id" : 1, "scores" : [ 2 ] }
{ "_id" : 2, "scores" : [ 2, 5, 5 ] }

db.collection.insertOne():向指定集合中插入一条文档数据
db.collection.insertMany():向指定集合中插入多条文档数据
# 插入的时候指定id 的编号 不然就自动生成id码无法操作
--------------------------------


----------- 查询 find------------------------
{
   "find": <string>,
   "filter": <document>,
   "sort": <document>,
   "projection": <document>,
   "hint": <document or string>,
   "skip": <int>,
   "limit": <int>,
   "batchSize": <int>,
   "singleBatch": <bool>,
   "comment": <string>,
   "maxScan": <int>,
   "maxTimeMS": <int>,
   "readConcern": <document>,
   "max": <document>,
   "min": <document>,
   "returnKey": <bool>,
   "showRecordId": <bool>,
   "snapshot": <bool>,
   "tailable": <bool>,
   "oplogReplay": <bool>,
   "noCursorTimeout": <bool>,
   "awaitData": <bool>,
   "allowPartialResults": <bool>,
   "collation": <document>
}
db.collection_name.find() -- 查询集合所有字段
db.persion.findOne()     --第一个
db.persion.find({key: value}) -- 对应键值
db.persion.find().limt()       -- 前多少个
db.persion.find().skip() 
db.persion.find().sort()

-----------------------------------


------------ update --------------
{
   update: <collection>,
   updates:
      [
         { q: <query>, u: <update>, upsert: <boolean>, multi: <boolean>, collation: <document> }
         ...
      ],
   ordered: <boolean>,
   writeConcern: { <write concern> },
   bypassDocumentValidation: <boolean>
}

{
  $set: { key: "value" },
  $inc: { key: int(2) }  -- 多的增 少的动
}
db.collection.updateOne(<filter>, <update>, <options>)
db.collection.updateMany(<filter>, <update>, <options>)
db.collection.replaceOne(<filter>, <replacement>, <options>)

db.psersion.update({_id: 1},{$inc: {age: 2}}) 
db.psersion.update({_id: 1},{$set: {age: 23}}) 
--注意执行顺序 set的更改大于inc
-------------------

-------- delete -------------

db.inventory.insertMany( [
   { item: "journal", qty: 25, size: { h: 14, w: 21, uom: "cm" }, status: "A" },
   { item: "notebook", qty: 50, size: { h: 8.5, w: 11, uom: "in" }, status: "P" },
   { item: "paper", qty: 100, size: { h: 8.5, w: 11, uom: "in" }, status: "D" },
   { item: "planner", qty: 75, size: { h: 22.85, w: 30, uom: "cm" }, status: "D" },
   { item: "postcard", qty: 45, size: { h: 10, w: 15.25, uom: "cm" }, status: "A" },
]);

db.collection.deleteMany()
db.collection.deleteOne()
db.persion.remove({key: value})

--------------------------

--------- 修饰符----------
{ _id: 1, item: { name: "ab", code: "123" }, qty: 15, tags: [ "A", "B", "C" ] }
{ _id: 2, item: { name: "cd", code: "123" }, qty: 20, tags: [ "B" ] }
{ _id: 3, item: { name: "ij", code: "456" }, qty: 25, tags: [ "A", "B" ] }
{ _id: 4, item: { name: "xy", code: "456" }, qty: 30, tags: [ "B", "A" ] }
{ _id: 5, item: { name: "mn", code: "000" }, qty: 20, tags: [ [ "A", "B" ], "C" ] }

$eq 匹配

db.inventory.find( { tags: { $eq: "B" } } )
db.inventory.find( { tags: "B" } )
db.inventory.find( { tags: { $eq: [ "A", "B" ] } } )
db.inventory.find( { tags: [ "A", "B" ] } )

$gt  >
Syntax: {field: {$gt: value} }
db.inventory.find( { qty: { $gt: 20 } } )
$ gte >=
db.inventory.find( { qty: { $gte: 20 } } )
$lte <=
db.inventory.find( { qty: { $lte: 20 } } )
$lt <
db.inventory.find( { qty: { $lt: 20 } } )
$ne =/
db.inventory.find( { qty: { $ne: 20 } } )
$in 与
db.inventory.find( { qty: { $in: [ 5, 15 ] } } )
$nin 或
db.inventory.find( { qty: { $nin: [ 5, 15 ] } } )
-------------------


------------Logical Query Operators----------------
$or
db.inventory.find( { $or: [ { quantity: { $lt: 20 } }, { price: 10 } ] } )
$and 
db.inventory.find( { $and: [ { price: { $ne: 1.99 } }, { price: { $exists: true } } ] } )
$not
db.inventory.find( { price: { $not: { $gt: 1.99 } } } )
$nor
db.inventory.find( { $nor: [ { price: 1.99 }, { sale: true } ]  } )

-------------------------------------------------------


-------------Element Query Operators---------------

 $exists
db.inventory.find( { qty: { $exists: true, $nin: [ 5, 15 ] } } )
db.inventory.find( { qty: { $exists: true } } )

$type


----------------------------------------------------
