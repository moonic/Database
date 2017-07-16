mongo shell (javascript 语法)

help 总帮助
db.hepl() 数据库级别帮助
db.foo.help() 集合相关命令
db.foo.find() 文件
db.user.help() 用户
db.foo.update()
db.stats()  数据库状态.
db.version() 当前db版本
db.getMongo() 当前db的链接机器地址


用户

show users 

db.addUser("")
db.addUser(, , , )
db.auth() 	认证 安全模式
db.removeUser()

use foobar #进入数据库
db 		   # 查看当前数据库
show dbs  # 查看所有数据库
show collections  # 查看集合


# 创建集合 类SQL 设计
db.createCollection('app', {'capped':true, 'size':10240, 'max':17855200})  



# 插入集合
# 批量插入 最长消息是16MB 
#  采取信息点
#   使用循环
post = {"title" : "Hello word MongoDB",
		"conter" : "Here s my blog",
		"date" : Date()}

db.blog.insert(post) 插入到集合中
db.blog.insert( {"thins" : ["pin" , 3.14]} )
db.blog.save()
db.collection.insertOne():向指定集合中插入一条文档数据
db.collection.insertMany():向指定集合中插入多条文档数据

post.comments = []
db.blog.update({"title" : "my blog post"},post)

db.book.insert({"name" : "job" , "book" : "java"})


post = {  "name" : "joe" , "friends" : 32, "enemies" : 2 }
db.foo.insert(post)


#  更新文档

 db.foo.find()
 var joe = db.users.findOne({"name"  : "joe"})
 joe.relationships = {"friends" : joe.friends, " enemies" : joe.enemies}
 db.foo.find()
 delete joe.froends
 delete joe.name
 db.foo.update({"name" : "joe"},joe)
 db.foo.find()



# 原子修改器
$inc #只能为数值型
db.foo.insert({"url" : "xxx", "pageviews" : 50})
db.foo.update( {"url" : "xxx"},{"$inc" : {"pageviews" : 1}}) #pageviews+1
db.foo.upate({"url" : "xxx"}, {"$inc" : {"It" : 2}})


$set 
db.foo.update({"_id" : "xxx"}, {"$set" : {"book" : "c++"}}) 
db.foo.update({"name" : "job"}, {"$set" : {"book" : ["java" , "c++"]}) 

$mul 乘法 
db.products.save({ _id: 1, item: "ABC", price: 10.99 })
db.products.update({ _id: 1},$mul {price: 1.25 })
# 原始值为零
db.products.save({ _id: 2,  item: "Unknown"})
db.products.update(
   { _id: 2 },
   { $mul: { price: NumberLong(100) } }
)
{ "_id" : 2, "item" : "Unknown", "price" : NumberLong(0) }
# 原乘数倍数 支持不同类型
{ _id: 3,  item: "XYZ", price: NumberLong(10) }
db.products.update(
   { _id: 3 },
   { $mul: { price: NumberInt(5) } }
)
{ "_id" : 3, "item" : "XYZ", "price" : NumberLong(50) }

$min 最小代替
{ _id: 1, highScore: 800, lowScore: 200 }
db.scores.update( { _id: 1 }, { $min: { lowScore: 150 } } )
db.scores.update( { _id: 1 }, { $min: { lowScore: 250 } } )

$max   最大代替
...

$unset 
db.book.update({"name" : "joe"},{"$unset" : {"book" : 1}} )


# Array
$push 
db.blog.save({"title" : "score"})
db.blog.update( {"title" : "score"},{$push : {"comments" : { "name" : "job"}}})

$ne 
db.blog.update({"authors" : {"$ne" : "richie"}},{$push : {"authors" : "richie"}})

$addToSet

db.blog.save({"name" : "jack"}, {"emails" : "joe@1.com"})

db.blog.update( {"name" : "jack"}, {"$addToSet" : {"emails" : "jon@2.com"}})
db.blog.update( {"name" : "jack"}, {"$addToSet" : {"emails" : "jon@3.com"}})

$addToSet + $each 
 db.blog.update( {"name" : "jack"}, {"$addToSet" : {"emails" : {"$each" : ["jon@php.com","jon@java.com"]}}})

$pop 队列删除
db.blog.update({"name" : "jack"}, {"$pop" : {"emails" : 1 }})

$pull 匹配删除
db.lists.save({"todo" : ["dis","lang" , "dry"]})
db.lists.update({},{"$pull" : {"todo" : "lang"}})
$pullAll 

{ _id: 1, scores: [ 0, 2, 5, 5, 1, 0 ] }
db.survey.update( { _id: 1 }, { $pullAll: { scores: [ 0, 5 ] } } )


$sort

# 查找find
db.users.save({"name" : "jack" , "age" : 20 ,"email" : "tom@1.com"})
db.users.find() 
db.users.find({"age" : 20})
db.users.find("name" : 1)
db.users.find({},{"name" : 1})
db.users.find({},{"name" : 1,"_id" : 0}) #指定返回

# 查询条件
$it  < 
$lte <= db.users.find({"age" : {"$lte" : 20, "$it" : 30}})
$gt  > 
$gte >= db.users.find({"age" : {"$gt" : 20, "$lte" : 30}})

$ne
db.users.find({"name" : {"$ne" : "jack"}})


OR $in
db.users.update({"name" : "jack"}, {"$set" : {"score" : ["125","264","111"]}})
db.users.find({"score" : {"$in" : ["125"]}})
$nin 
db.users.find({"score" : {"$nin" : ["111","jack"]}})
$or 
db.users.find({"$or" : {"score" : {"$in" : ["123"]},{"" : ""}})
$where  遍历比较
db.foo.find({"$where" : "this.x + this.y == 10" })


db.foo.save({"apple" : 1,"banan" : 6, "peach" : 3 })
db.foo.save({"apple" : 8,"spinach" : 4, "water" : 4 })


limit skip sort 

db.foo.find().limit() 前面个数
db.foo.find().skip()  除去前面个数
db.foo.find().sort() 1 -1 排序


$rename 
db.students.save()
db.students.updateMany( {},{ $rename : { "nmae" : "name" } } )



Index 
# 每次DDL操作 而外开销 在集合中的索引标记 每个集合最大索引64个
db.users.ensureIndex({key : 1/-1})
db.users.ensureIndex({key.array_lenghit: 1})

# 删除集合 删除信息是永久的不能恢复

db.name.remove({}) # 集合内所有文档 不会删除集合
db.blog.remove({title : "my blog post"},post)
db.drop_collcetion()
db.name.drop()
db.dropDatebase()

Collection聚集集合
创建一个聚集集合
db.createCollection(“collName”, {size: 20, capped: 5, max: 100})
db.getCollection("account") 指定名称的聚集集合
db.getCollectionNames()	db的所有聚集集合
db.printCollectionStats() 聚集索引的状态

数字类型 32bit 64bit 64folat bit
doc = db.nums.findOne()
db.nums.insert({ "name" : "Jon Doe", "address" : {
    "street" : "123 Park Street",
    "city" : "Anytown",
    "state" : "NY"
}
})
