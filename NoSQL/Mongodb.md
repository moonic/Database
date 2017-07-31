# NoSQL database mongoDB
>  O'Reilly Media Inc Unix x , Internet System option '

* mongoDB 的易用性，分布式环境的单点下性能的海量数据支持的要求没有那么重要,要找到易用的

* SourceForge execute mongodb save Auto Sharding 

* 为什么要使用非关系型数据库
	* 使用MySQL的过程开始有很少的数据一台服务器就可以了建立备份对大量
	读取防止碟机，最好要将数据分切到各个集群重构大量的应用逻辑来切分，就被自己的数据结构给限制住了

	* 集群的大量数据要更改模式，时间很长DBA投入时间，可以可以在核心服务器内置更多的此类功能
	MonogoDB 的实用性，他在功能性和复杂性取得更好的平衡支持现在Web

* MongoDB是一种强大灵活可扩展的数据存储方式 扩展了非关系数据库的众多功能 比如辅助索引 访问查询(range query) 和排序
	* 比如内置的对MapReduce 的聚合式支持，已经对物理空空间的索引支持



* 丰富 的数据模型
	* 是面向文档的数据库，不是关系数据库为了方便的扩展。
	*  原来的 row 换成 document 模型 密西文档的方式可以将文档的
	* 数据或者属猪内嵌起来，索引使用一条记录就会感觉非常自然

* 扩展
	* 数据的不断增加，如何扩展他们的数据库升级还是扩展数据分散到许多机器上？ 扩展能持续增加存储空间和提升性能
	* mongodb 采用模型文档的数据模型，在多台服务器分割数据采用集群的
	* 数据负载 自动重排文档


* 基本概念

	文档是数据的基本单元类似关系数据库的管理的系统行
	聚合可以看成是没有模式的表
	单个实例可以容纳多个独立的数据库没有有对自己集合的权限
	JavaScript shell 管理实例数据作用非常大
	有一个特殊的 _id 在文档的集合是唯一的

	多个key 关联的有序放在一起就是文档
		列入在JavaScript最后文档表示为对象

	一个键的文档
	
		{"greeting":"Hello word"}
	
	多个键值对

		{"greeting":"Hello word","foo":3}
	
	键值的对是有顺序的

		{"foo":3,"greeting":"Hello word"}
		完全不一样
// 通常文档的顺序不重要 但是有程序默认对文档呈现的不顾及顺序


文档的键是字符串可以使用UTF-

	不能有空字符 和 . $ 有意义 _开头键是有用 

	区分大小写

		{"foo":3}
		{"foo":"3"}

		{"foo":3}
		{"Foo":3}

不能有重复的的键

集合就是一组文档
	类似关系数据库的行 集合就如同表


集合是无模式的
	文档是各式各样的，下面二个文档可以存在一个集合中

	{"greetng":"Hello word"}
	{"foo": 5}

各样的文件混合在一个集合里面对于开发管理员来说是噩梦
	返回所需的文档种类

在集合的特定集合类型文档在数据上不划算
	把同类型的文档放在一个集合中，数据会更加集中

	创建索引的时候，文档会有附加结构，索引是按照集合来定义的
	同种类型的文档翻入一个集合可以让索引更加有效

命名
	不能是空字符串""，不能含空字符，结尾
	不能system开头， system.namespaces 	
	不能有保留字符$出现


database mongodb 

	多个文档组成的集合，可以组成多个数据库我去独立有独立的权限控制
	在不同的文件下面

	命名
		全小写
		最多64字节

MongoDB shell 

	自带一个javascript shell 与实列交互，可用管理操作，运行实列

execute shell 

	./mongo 

	shell 是完备的JavaScript解释器可以运行js程序

	可以定义和调用JavaScript函数


* shell 是一个独立的客户端 会丽娜姐服务器的test数据库
	* 将数据复制给全局变量 db 
	* 非JavaScript的语法 扩展方便 sql shell 

	use foobar 
	
shell 操作
	create 
		insert function document save map 

		post = {"title":'my blog post',
		"content" : "Here's my blog post",
		"date":new Date()}

		{

			"title":"my blog oist",
			"content":"Here's my blog post",
			"date":'Sat dec 12 2015 11:21:21 '
		}

	db.blog.insert(post);


	db.blog.find()


	会有一个额外的_id 突然出现

	db.blog.fondOne()
	// 查看一个文档


* update 

	psot.comments = []

	db.blog.update({title:"My blog post",post})

	db.blog.find()

* delete
	
	remove 永久性的删除文档

	db.blog.remove({title:"My blog post"})

mongo 是 javscript shell 通过查看 javascript 文档获得很多帮助

db.help() 查看数据库级别的命令帮助
db.foo.help()

* 了解函数公用的技巧在输入的时候不输入括号就会显示函数的源代码

db.foo.update


* 奇怪的集合名

db.集合名来访问集合一般不会有问题集合刚好是数据库类的属性就会有问题

db.version
function(){

	return this.serverBuildInfo().version;
}

在db 找不到属性的时候才会作为集合凤返回

db.getCollection("version");

blog 每个子集的执行操作迭代就好了

	var collections = ["posts","comments","authirs"];

	for ( i in collections){

		doStuff(db.blog[collections[i]]);
	}

	nonde

	doStuff(db.blog.posts);
	doStuff(db.blog.comments);
	doStuff(db.blog.authors);


data type 

	支持多种数据类型作为文档的值


* 基本数据类型
	* MongoDB有3 种数字类型 (int32,int64 ,folat64)

doc = db.nums.findOne()

插入的整数不能精却作为双精度显示会添加二个键表示位数

db.nums,findOne()

* 数组
	* 一组值，可以作为有序对象来操作，也可以作为无序对象来操作

	{"things":["pie",3.14]}

	可以包含不同类型的元素

* 内嵌文档

{
	"name" : "Jon Doe",
	"address":{

		"street":"123 Park Street"
		"city" : "Anytown",
		"state" : "NY"
	}
}

_id and objectld
	_id key 可以是任何数据类型的默认为这个对象，唯一的保证这个
	是唯一标识

* objectld

	_id 的默认类型 

设计来作为分布式数据库处理多个节点是核心要求

占用 12个字节的存储空间，美国字节二位十六进制数字，是一个24位的字符串
是实际存储数据的二倍长

* 每个文档都有唯一的 _id 来确保每个都能被标识 都有一个值
	
	如果插入没有id会自动创建一个，可以用服务器来做这件事，是产生的时候额外开销

	在客户端生成obejctid 可以插入文档


* 插入并保存文档

	db.foo.insert({"bar":"baz"})


* 批量插入

	应用程序中，一次插入数百个窗前采集点到分析集合
	只有插入到多个文档是集合的时候这个方法才有效
	不能使用批量出入一个或者多个集合的使用至是导入原始数据

	消息长度最大是16mb


* 原理和作用

	将数据装成BSON 形式的然后将其送入数据库，不做别的验证
		允许插入无效的数据，让数据库更加安全

	所有主流鱼鱼会在传递数据进行有效的测验


* 删除 文档
	
	db.users.remove()

	db.mailing.list.remove({"opt-out":true})

	永久性的不能撤销，不能恢复


* 文档替换

	var joe = db.users.findOne({'name:"joe'}};
	joe.relationships = {"frieds":joe.griends,"enemies":joe.enemies };
	{

		"friends" : 32,
		"enemies" : 2 
	}

	joe.username = joe,name;

	delete joe.froeds;

	delete joe,enemies;

	delete joe,name;

	db.users.update({"name":joe},joe);

	findOne 查看更新的文档结构

	db.people.find()


	joe = db.people.findOne({"name":"joe","age":20});

	joe.age ++ 
	db.people.update({"name":"joe"},joe);


* 使用修改器
	* $set 修改器

	db.users.findOne()

	db.users.update({"_id":objectId("4b2365b06723456f35f94b60a13")}),
	{"$set":{"favorite book":"war and peace"}}

	db.users.findOne()
	{
		"_id"
		"name" : "joe",
		"age" :   30,
		"sex" :  "male",
		"location" : "Iisconsin",
		"favorite book" : 'war and peace'
	}	

	db.user.update({"name":"joe"},
		"$set":{"favorite book" : "green eggs an ham"})

	Array
		db.user.update({"name":"joe"},
		"$set":{"favorite book" : "green eggs an ham","ender s game"})

	$ubset delete book

		db.users.update({"name":"joe"},
			"$unset":{"favorite book" : 1 })

	$set dml posts.document

		db.blog.posts.findOne()

		db.blog.posts.update({"authro.name":"joe"},{$set:{"authro.name":"joe"}})	

		db.blog.posts.findOne()

		$ set foo bar 

		nonde 
			db.loll.update(criteria,{"foo":"bar"})

		$inc modifers

			insert key type , key on create key 

* 建立一个游戏集合，将游戏的变化分布在存储数据库中
			可以出入一个包含游戏名好玩家文档标识不同的游戏

		db.games.insert({"game":"pinball","user":"joe"})

		db.games.update({"game":"pinball","user":"joe"})

		游戏中出现碰撞

		$inc modifers

			db.games.update({"game":"pinball","user":"joe"},
			{"$inc":{"score":50}})

		db.games.findOne()

		分键数（score） 本来不存在 $inc 创建了这个键

		$inc and $set execute insert deelte count 
		$inc int logint float 
		language null boolean int char[] Array String 


		Array modifers 

			execute array data count hase index list

		$push 已有的数组加入一个元素 comments Array pust

			db.blog.posts.findOne()

			db.blog.psots.update({"title":"A blog post"},
								 {$pust:{"comments"}}
								 {"name":"joe","email":"joe#xample"})\

			db.blog.psots.findOne()


			db.blog.psots.update({"title":"A blog psots"},
							$pust:{"comments":"name" ,"bob":"conetext"}

		添加新地址可以使用 $addToSet 避免重复

			db.user.update({"_id":object_id{"4b2365b06723456f35f94b60a13"}},
							"$addToSet":{"email":"joe@game.com"}) $addToSet 避免重复

			db.user.update({"_id":object_id{"4b2365b06723456f35f94b60a13"}},
							"$addToSet":{"email":[
								"joe@game1.com",
								"joe@game2.com",
								"joe@game3.com",
								"joe@game4.com"
								]})
		$addToSet and $each 组合起来可以添加多个不同的值
		$ne and $pust 组合不能实现

		db.users.update({"_id":object_id:("4b2365b06723456f35f94b60a13")},
						{"$addToSet":
						"emails":{"$each":["joe@game1.com", "joe@game2.com", "joe@game3.com", "joe@game4.com"]}}

		db.users.findOne({"_id":object_id:("4b2365b06723456f35f94b60a13")})

		从数组中删除元素的方法 可以把数组看为列或者栈 $pop 修改器从元素的一段来删除元素
				// 从侧头开始删除
				$pop:{key:-1}

		指定删除元素 而不是依据位置可以使用

		db.lists.insert({"todo":["dishes","laundry","dry cleaing"]})

		db.lists.update({},{"$pull":{"todo":"laundry"}})

		db.lists.find()

		数组的定位修改器

			db.blog.posts.findOne()

			db.blog.updat({"post":post_id},
				{$inc:{"comments":1}})

		不预先查询文档就不知道要修改数组的下表，定位操作符$

		db.blog.update({"comments.authro":"john"},
					   {"comments.$authro":"jim"},)

		修改器运行

			python code 

				form pymongo import connection 

				import tim 
					db = connection().performnce_test
					db.drop_connection("updates")
					collection = db.updates

					collection.insert({"x",1})

					start = time.time()

					for i in range(1000)
						collection.update({},{"$inc":{"x"1}})

* 使用修改器 $push 的修改器是推荐使用的，可以将内嵌数组独立起来发在一个集合

		updert 更新
			没有文档个性条件，就会创建一个新的文档

			db.analytics.update({"url":"/blog"},{$inc:{"version",1},true})

			db.math.remove()
			db.math.update({"conte":25},{"$in":{"conte":3},true})
			db.math.findOne()

			remove 清空了集合 里面就没有文档了 可以创建一个count的值

		save shell 

			快速修改文档

				var  x = db.foo.findOne()
				x .num = 42
				db.foo.save(x)

			也可这样写

				db,foo,uodate({"_id":x.id},x)

		return update document	
			getLastError 获取的信息有限制 调用的个性不同还要慢点

			status 是一个字符串 可以是 ready running done
			找到状态为 done
				ps = db.processesfind({'status':"ready"}.sort({"priority":-1}).
					db.processesfind.update({"_id":ps_id},{"$set":{"status":"ready"}}))
				db.sometginf(ps);
				db.processes.update({"_id":ps.id},{"$set":{"status":"done"}})

		会导致竞态条件，在二个线程在同时运行 A线程在同步进行

		//  多线程同步运行
		var curres = db.processes.find({"status":"ready"}.sort{"priority"：-1}.limt(1))

		while ((ps = curres.next()) ! = null){
			ps.update({"_id":ps._id,"status":"ready"}
					  {"$set":{"status"："running"}})
			//线程迭代
			var lastOf = db.runCommand({agetLastroerr:1})

				if(lastOf.n == 1 ){

					db.something(ps);
					// execute procedure updates 
					db.processes.update({"_id":"ps._id"},{"$set":{"status":"done"}})
					break;

				}	
				curres  = db.processes.find({"status":"ready"}.sort{"priority":-1}.limt(1));
		}


		A 进程会一占用进程 B 进程强占失败 会一直待在那 这样就会适合使用
		findAndModify 

		ps = db.runCommand({"findAndModify":"processes",
							"query":{"status":"ready"},
							sort:{"priority":-1},
							update:{"$set":{"status":"running"}}})

		返回的文档 依然是ready返回结果更新

		db.processes.findOne()

* findAndModify 命令对应的值如下
		query 查询文档 用来所寻找 文档条件

		sort 
			排序结果的条件

		update 
			修改器文档，找到对应的文档执行更新

		remove 
			是否删除文档

		new 
			boolean 类型返回的文档是更新后的文档


* 查询文档

```sh
	find 

		db.c.find()
		// retunr c domceunt 

		// retunr age  = 27 document
		db.users,find({"age":27})

		// 插入多个键组合在一起
		db.users.fine({"usernmae":"joe"})

		// and .. and 	n 
		db.users.find({"username":"joe","age"})

		//指定返回值
		// _id 总会被返回
			db.users,fined({},{"username":1,"email":1})
			
			// 不希望返回有这个建值
			db.users.find({},{"fatal_weakness":0})

			// 阻止返回ID
			db.users.find({},{"usernmae":0,"_id ":0})

	查询条件

		db.users.find({"age" : {"$gte" :18,"$lte":30}})

		// $ne 能应用于所有数据类型
		start = new Date("01/01/2007");
		db.user.find({"username":{"$ne":"joe"}})

domceunt
		Or select 

			$or 更加通用，用来完成多个键值的任意组合给定值

			db.raffle.find({"ticjet_no":{"$in":{123456,"joe"}}})

			$in 对应的 是$inn 返回数组中所有条件不匹配的文档

			db.raffle.find({"ticket_on":{"$ini":[725,252, 390]}})

			返回没有号码的人

			// 包含的可能条件数组作为参数

			// 和普通的and 查询一样
			db.raffl.find({"or":[{"ticket_on": 725 },{"winner":true}]})

			$not 
				元条件语句，可以放在任何条件上
					可以使用$mod 来查询值的一个给定值，会返回第二个结果

				db.users.find({"id_num":{"$mod":[5,1]}})

				// retunr values 1,6,11,16 user 

				db.users,find({"id_num":{"$not":{"$mod":[5,1]}}})

				// 联合使用的方法极为有用

	条件语句的规则


		// age 20 - 30 reutren age ser
		db.users.find({"age":{"$lt":30,"$gt":20}})

		null 不仅匹配自身而且匹配不存在的

			db.c.find({"y":null})

			db.c.find({"z":null})

		// null 不仅匹配自己而且还匹配不存在的所有文档

		db.c.find({"z":null})

		db.c,fined("z":{"$in":[null],"exists":true})

		// 没有 $eq 操作符

		// 正则表达式

			db.users.find({"name":/joet?/i})
			// 可以为前缀正则表达式 查询创建的缩影 这个类型的会非常高效 

			db.foo.insert({"bar":/baz/})
			db.foo.find({"bar":/baz/ })


		// 查询数组

			db.foo.insert({"fruit":["apple","banana","peach"]})
			db.foo.find({"furit":"banana"})

		// 会成功匹配该文档 不合法的进行查询

		$all
		// 多个元素匹配数组

			db.foo.insert({"_id":1,"fruit";["apple","banana","peach"]})
			db.foo.insert({"_id":3,"fruit";["apple","kumquat","peach"]})
			db.foo.insert({"_id":2,"fruit";["chery","banana","peach"]})

		// 查找  aoole banan document $all 

		// 数组 的元素不能少 顺序不能颠倒 才能成功匹配到数组元素对象中
		db.foo.find({"fruit":["apple","banana","peach"]})

		// key index 指定下标
		db.foo.find({"fruit.2":"peach"})

		$size 
		// 指定长度来查询数组
		db.food.find({"fruit":{"$size":3}})

		db.food.update({"$pust":{"fruit":"strawberry"},"$inc":{"size": 1}})

			db.food.find({"size":{"$gt":3}})

		// 不能与$addToset 操作相同

		$slice 操作符
			db.blog.posts.findOne(criteria,{"connection":{"$slice" : -10}})
			// 也可以接偏移retuen lenght

			db.blog.posts.findOne(criteria,{"comments":{"$slice": [23,10]}})

			// 跳过23 个元素 return 24 - 33 个元素 如果不够就返回23个之后的所有元素
			// 如果不特殊申明就使用 $silce 返回为提及的key


		// $slice 获取最后一条评论 
			db.blog.posts.findOne(criteria,{"comments":{"$slice": -1}})

			title content 都被返回了 没有显示的出现在说明符中

		// 查询内嵌document 

			db.people.find({"name":{"fitst":"joe","last":"schmoe"}})
			
			db.blog.find()

		$While 查询

			// 多个条目retunr list 
			db.foo .insert({"apple":1,"banana":6,"peach":3})

			db.foo.insert({"apple":5,"spince":4,"watermlon":4})

			// 第二个文档最后sobache and wahtermlon 的typel equest

			// 使用$ 条件来做这个

			//  javascript execunte 
				db.foo.ind({"watermlon":function(){

					for (var curres in this)
						for(var other in this){
							if(curres != other && this[curres] == this(other))
								return truel
						}
							return false;	
				}}) 


			// execute String this $while select 
				db.foo.find({"$where":"this.x + this.y == 0"})
				db.foo.find({"$where": function(){return this.x  + this.y  == 0}})
			// 调用函数并且赋值

			// 避免是使用 $where 查询 BSON 转换为javascript对象



			// 游标
	
			for(i = 0 ; i<100; i++){
				db.c.insert({x : i})
			}

			var curre = db.colleciton.find()

			// 每次使用都可以看到结果集合的显示在 及界面上



			while (curre.hasNext()){

					obj = curre.next();
			}

			// 游标使用了迭代的结果

			var currsor = db.people.find();

			currsor.forNach(function (x){

				print (x.name)
				// ......

			});

			调用 shell 的时候并没有立刻查询数据库而是等待开始获取结果集的时候才发生送查询

				返回游标本事

				var currsor = db.foo.find().sort({"X": 1}).limit(x).skip(10);
				var currsor = db.foo.find().limit(x).sort({"X": 1}).skip(10);
				var currsor = db.foo.find().skip(10).sort({"X": 1}).limit(x);
			// 查询还没有执行 这些function 只是构建函数

			currsor.hasNext()

			查询被发给服务器 获取当前100个结果集 下次调用 next或者hasnext
			就不用到服务器去查找这组结果

			limt , skip.sort 
				// reunt 3 document
				db.c.find().limit(3)
				// 返回除了前面3的以外全部的结果集
				db.c.find().skip(3)

			stock 用一个对象作为参数 对应的文件名称 是可以order by asc desc 

			// 过结果过多会导致性能出现问题
			db.stock.find({"desc":"mp3"}).limit(50).sort({"price": -1 })

	高级查询选项
		var currsor = db.foo.find({"foo":"bar"})

		// 不是件 作为查询结果直接返回给数据库，而是将查询装在一个更大的文档中会直接转换
		var currsor = db.foo.find({"foo":"bar"}).sort({"x":1})

	// 其他的有用项
		$maxscan : integer 
		$min 　  : document
		$max 	 : document
		$hint 	 : document
		$explain : boolean

	取得一致结果

	currsor =db.foo.find();

	while(currsor.hasNext()){

		var doc = currsor .next();
		doc = processes(doc);
		db.foo.save(doc);
	}
```


	Indexs 

	MongoDB index 传统的关系型数据库的所听是意义的大多数优化Oracle mysql的索引同样适用于

	db.people.find({"username":"mark"})
	// 对于一个集合一个索引只能创建一次反复创建的没用的
	db.people.ensuteIndex({"username":1})

	// 可以加速对这个键的查询速度，避免然服务器查询整个扫描 集合很大会麻烦

	index name 

		db.foo.ensuteIndex({"a":1,"b":1,"c":1 },{"name":"alphabet"})


		getLastError 是否成功的创建 了index 

	// 复合唯一索引
	
	{files_id:objectId{"4b23c"},n : 1}
	{files_id:objectId{"4b23c"},n : 2}
	{files_id:objectId{"4b23c"},n : 3}
	{files_id:objectId{"4b23c"},n : 4}

	// 但是id的值相同 但是n 不同再次插入的时候纠纷显示重复的错误
	
	explain and hint

	db.foo.find().explain()

	// return 查询的已经创建的索引
	
	只有64个文档 没有索引的数据库做一次最简单的查询

	db.peolle.find().explain()
	{
		"cursor" : "BasicCursor",
		"indexBounds" : [],
		"nscanned"    : 64,
		"n"  		  : 64,
		"millis"	  : 0 ,
		"allPlans"	  :  [

			{"curosr" : "BasicCursor",
			 "indexBounds" : []
			}
		] 
	}

	"cursour" : "BasicCursor"

	// 查询没有 索引并不意外因为没有查询条件，一会看到索引条件

	"nscanned" : 64 

	// 这个数字代表数据库查找了多少文档，返回这个结果的数量

	db.c.find({age:{$gt:20,$lt:30}}).explain()

	// 因为有了索引和 什么的列子 不一样 发生了几次改变
	

	db.system.indexes.find({"ns":"test.c","name";"age_1"});

	db.c.find({age:{$gt:10},username:"sally"}).explain()

	如果发现了非预期引用 的索引用hint 强制使用

	索引管理

		索引的元信息存储在 数据库的system.indexes 集合
			是一个保留集合不能对其插入或删除文档通过
		nesureIndex 或者 dropIndexes 进行

		system.namespaces 
			{"name":"test.foo"}
			{"name":"test.foo.$_id_"}

	在名字和年龄的复合索引 system.namesapces 

		{"name" : "test.foo.$name_1_age_1"}

	集合命名的长度 124 byte 会额外使用6个字节
		集合最大的命名为 124 个字节 如果超过这个字节，调用集合就会发生指向不明，
			无法直接调用 因为 建值的指向 不同兼容

	修改索引
		//  这样修改索引浪费时间 同时也消耗很多资源在此不能应答
		db.people.ensureIndex({"username":1},{"background":ture})

	阻塞的做法 会让索引建立的更块，同时意味着不能应答

	// 使用集合来找出索引名 因为驱动程序的不同而不同
	// 复合查找索引
	db.runCommand({"dropIndexes":"foo","index":"alphabet"})

	// delete index 
	db.runCommand({"dropIndexes":"foo","index":"*"})

	地理空间索引

		//  MongoDB 为坐标查询提供了专门的索引
		
		db.map.ensureIndex({"gps":"2d"})

	gps 是形式的一对 key 一个包含二个元素的数组是二个key 的内嵌文档
	{"gps":[0,100]}
	{"gps":{"x":-30,"y":30}}
	{"gps":{"latitude":-180,,"longitude":180}}

	// 指定最大最小值
	db.star.trek.ensureIndex({"light-years":"2d"},{"min"::-1000,"max"}:1000)

	// create 2000 光年	
	// retuen 10 fine  
	db.map.find({"gps":{"$near":[40,-73]}}.limit(10))

	db.runCommand({geoNear:"map",near:[40,73],num:10})

	geoNear 会返回没文档到查询点的内容 如果小4MB是唯一的选择

	还能找到指定形状内的文档 获取不同文件的参数作为点


	复合地理空间索引

		db.nesureIndex({"location":"2d","desc":1})
		// 给予指定名称 和id地址 就可以找到附近的实物了
		// 创建一个二维平面用户定义有帮助

	聚合工具

	Count 
		return document fine count 

		db.foo.count();

		db.foo.count({"x":1})

	Distinct 
		找出给定键的所用不同值，同时指定集合的键
		// 获取不同的age 值
		
		db.runCommand({"distinct":"people","key":"age"})

	group 聚合 == SQL group by 

	db.runCommand({"group":{"ns":"stocks","key":"day"}})

	// 指定分组的集合
	"key":"day"

	"$reduce" : funuction(doc,prev){...}

	condition 迭代满足条件的的文档

	db.runCommand({"group":{"ns":"stocks",
							"key":"day",
							"initial":{"time":0},
							"$reduce":funtion(doc.prev){
								if(doc.time . prev.time){
									prev.price = doc.price;
									prev.time  = doc.tme; 
								}}
							}},
					"conditiion":{"day":{"$gt":"2010/09/30"}})

	//  命令的返回使用 key 有多个不同的值

	db.runCommand({"group":{...}}
				{
					"retval" :
					[ 
						{
							"day" : "2015/01/28"
							"time": "Mon Oct 04 2015 "
						   "price": 4.7 
						},
					]
				"count" : 734,
				"keys"  : 30,
				"ok"	: 1
				})

	每组的price "time" 是初始设置 "retval"的内嵌文档

		使用完成器
			finalizer 精简 从数据库传到用户

		group tag 

			db.popsts.group({"key":{"tags":true},
						"initial":{"tags":{}},
						"$reduce":function(doc,prev){
							for( i in doc,tags){
								if (doc.tags[i] in )
									prev.tags [doc.tags[i]]
							}else{
									prev.tags[doc.tags[i]] = 1;
							}
						}})

		返回的结果是
			[
				{"day":"2016/08/12","tags":{"nosql":4,"winter":10,"sledding":2}},
				{"day":"2016/08/12","tags":{"soda":5,"php":2}},
				{"day":"2016/08/12","tags":{"ython":6,"wineter":4,"nosql":15}}
			]

	db.runCommand({"group":{"ns":"posts",
							"key":{"tages":true},
							"initial":{"tags":{}},
							"$reduce":function(doc,prev){
								for (i in doc.tags)
									if(doc.tags[i] in prev.tags){

										prev.tags[doc.tags[i]]++;
									}else{
										prev.tags[doc.tags[i]] = 1;

									}},
					"finalize" : function(prev){

						var mostPopular = 0;
						for(i in prev.tags[i] > mostPopular){
							prev,tag = i;
							mostPopular = prev.tags[i];
						}
					}
					delete prev.tags
							}})
	返回结果 服务器返回 也能重新返回新值

	将函数做为键使用

		分组条件非常复杂 不仅是一个键 可以使用group 计算有多少博客的文章
			db.posts.group({"ns":"posts",
							"$keyf":funciton(x){
								return x.category.toLowerCase();
							},
							"initializer":1})
			//  使用$keyf 依据各自复杂条件进行分组

	MapReduce
		聚合工具最中的明星 count,distinct,group 
			将映射的map 反映到综合 反射到文档
				要么操作无作为
					产生的 x 值 然后就是中间环节 称做洗牌(shuffle)
		按照参生


			查看
// 数据库命令
Database Lasterror

	对多少个文档起作用 如何实现的 常用命令

	// 查询 更行的x 键值的数量 并返回是否成
	db.count.update({x:1},{$inc{x:1}},false ,true)

	drop 在shell 删除一个集合

	db.runCommand({"drop":"test"})
	{

		"niIndexesWas":1,
		"msg" : "indexes dropped for collection",
		"ns"  : "test.test",
		"ok"  : true 
	}
	Mongodb 1.0 version


	db.runCommand({"drop":"test"},
		"errmsg":"ns not found":"ok":"false");

	作为特殊的查询来实现的 针对$cmd 集合来使用 runCommand 接受命令的文档

		使用drop调用实际上
		db.$cmd.findOne({"drop":"test"})

	builidInfo  :  1 
		return MonogoDB option system bingting 

	collStats 
		{"collStats":collection}
		//  reunt collStats 

	distinct 
		//  列出集合中满足查询的给的定值不同的所有值
		{"distinct":collection,"key":key,"query":query}

	
			drop 
				{"drop":collection}
	
			dropDatabase 
				{"dropDatabase":1}
	
			dropIndexes 
				{"dropIndexes":collection,"index":name}	

	findAndModify 
		getLastError 
			{"getLastError":1{"w":w[,"wtimeout":timeout]}}
			对集合最后一次操作命令收集
		ListCommands 
			{"listcommands" : 1}

		listDatabases 
			{"listDatabases":1}
		// 列出服务器的所有数据库

		ping 
		{"ping":1}
		//　服务器连接是否正常 服务器上锁的也会return

		renmaeColleiont 
			{"renmaeColleiont":a,"to":b}

		repairDatabase
			{"repairDatabase":1 }

		serverStatus 
			{"serverStatus":1}


固定集合  就和Oracle数据库分配块的固定大小
	 Oracle 表是以堆的形式存在 NoSQL 是以链 的关系存在
	给予固定块的 内容
	是非关系型数据库 以集合作为数据类型 所以使用固定集合

	新插入的文档会在新的使用自动淘汰
		队列满了 新的元素会将早的元素替换掉

	不能删除文档 更新不会导致文档的移动可用保证在固定的集合创建index
		_id nonder index

	type execute 

		固定集合的功能与limite  进行的出入速度快 不用分配内存空间

		按照插入顺序 输入查询速度快的存储性能快

	创建固定集合
	// 确定集合名 返回集合长度
		db.createCollection{"my_collection",{capped:ture,size:200,max:200} }

	// 自然排序 {"$natural":-1} 排序
		db.my_collection.find().sort({"$natural":-1})


	尾部游标

		php 的尾部游标
		$cursor  = $collection -> find() -> tailable();
			while(ture){
				if(!$cursor ->hasNext()){

					if($cursor->dead()){
						break;
					}
					sleep(1);
				}
			}
			// 判断 散列 集合 标尺是否重构
			else{
				while(currsor->hasNext()){
					do_stuff(currsor ->getNext())
				}
			}


GridFs save Files 

	存储大二进制文件的
		简化要求
		使用已建的复制分片机制对于文件的扩展是没有问题的
		存储以 2GB 为一块的结构 产生不同的磁盘碎片

	使用 GridFs：mongofiles  // 文件处理系统
	
	$each "Hello word" > foo.txt 

	$ ./mongofiles put foo.txt 
	connected to : TCP/IP 127.0.0.1

	// 获取_id的键值对
	adder file("_id":"objectld('4c0d2a6c35c12c564c89c5c123cs5456d')")

	done!
	$ ./mongofiles list 
	connected to :　127.0.0.1
	done write to : foo.txt 
	done write to: foo.txt
	$ cat foo.txt
	Hello word 

	mongofiles 的3个操作 put list get 

		put 将文件添加到GridFS 中

		search 按照文件名查找文件
		delete 删除 

	通过mongodb 驱动操作GridFs

	// pymonogo 启动来调动 操作列表

	from pymongo import connection 
	import gridfs 
	// 	调用db中的文档
	// 调用驱动 connection 
	// 调用文件id 文件名 path
		db = connection().test
		fs = grodfs.GridFs(db)
		file_id = fs.put("Hello wrod",filename = "foo.txt")
		fs.list()

		fs.get(file_id).read()

		和本身 的操作驱动很相似 mongofiles 

	内部原理

		在集合块的结构是非常简单的

		{
			// 文件的唯一 id  length 总的字节数
			"_id":objectld("")
			"n" : 0,
			"data": BinData("")
			"files_id":objectld("")
		}
		文档结构块是简单的 data包含块的二进制文件元数据块放在一个集合

		可以使用 md5 检验是这个值 确保文件能上传

		db.fs.files.distinct("filename");


	服务器脚本

		db.eval
			可以在客户端 执行 JavaScript 的字符串传给Mongodb

			db.eval("return 1 ;")

			db.eval("function(u){print ('hello ', 'u'+'!')}",{usernmae})
			// 可以出传递多个参数

	save javscript

		db.system.js.insert({"_id","x","value":1})
		db.system.js.insert({"_id","y","value":2})
		db.system.js.insert({"_id","z","value":3})

		db.eval("return x+y+z;")

		db.system.js.insert({"_id":"log","value":

			function (msg,eval) {
				var levels = ["debug","warn","error","false"];
				levels = levels ? levels:0;
				var now = new Date();
				print(now +"" +levels[levels]+msg)

			} })
		// 可以在任意 的javascript调用这个函数
		db.eval("x =1;log('x is'+x); x =2; log ('x is Then 1',1);")

		安全性防止关系型数据库的注入攻击

			func = "function(){print('Hello');db.dropDatabase();print('!')}"
		限定作用域
			PHP
				$func = new mongocode("function(){hello + username}"
						array("username" = > $username)
					);
			// 指向该用户数组作用域

	特性

		数据库 引用 DBRef url 
			唯一确定的文档应用 自动加载的方式同自动加载web页面一样

		内嵌文档
			{"$ref":collection,"$id":id_value}

			DBRef 的顺序的不能改变的 第一个必须是$ref 接下来就是可选的

			{"_id":5,"author":"mike"."text":"mongodb is fun"}

			// 对其他的文档引用没一条作为一个dbref存储
			{"_id":5,"author":"krisina"."text":"mongodb is fun",
				"references":[{"$ref":"users","$id":"mike"}]
			}

		什么时候使用DBRef 引用关系

		   可以使用不同是机制对其他文档的应用关系 author 文档的键是字符串可以使用UT
		      保存_id 相当不错 对开发的文档也可以使用这个属性
		      DBRef
			存储不同的集合文档引用的时候 最好使用这个对象
			   驱动工具的特殊功能这样更加精简
////

	Mongodb 管理

		以后再补


////

	Mongodb Copy

		功能的设置正确再正确的生产环境使用复制功能

			主从复制
				可用于备份 扩展 故障 恢复 读扩展

			配置 
				主从节点

		mkdir -p !/dbs/master
		$./mongod --dbpaht ~/dbs/slave --port 10001

		设置节点

			$mkdir -p ~/dbs/slave
			$./mongod -- dbpath ~/dbs/slave -- port 1001
			localhost : 100000

		一个集群用多少个节点没有限制
			但是上千个节点对单个主机进行的查询也会崩溃的

		主从复制

			-- noly 
				节点下的数据库
			-- slavedelay 
				添加节点 延迟性 对主从控制器的使用
			-- fastsync 
				节点的快照作为基础启动节点 从开始就是节点快照
			-- author
				节点同步不同
			-- iokogSize 
				oplog 的大小 单位是 MB 
	初始化副本集

			$mkdir -p /dbs/nodel !/dbs/node2
		启动的使用为服务器 创建目录
			给副本取名字

				blort 副本还有同伴 位置还没有启动
			mongod --dbpath !/dbs/node2 --port 1000 blort:1002
			mongod --dbpath !/dbs/node2 --port 1001 blort:1003
			mongod --dbpath !/dbs/node2 --port 1002 blort:1001

			开启多台服务

				shell 连接服务器
					mongo morton:10001/admin 
						Mongodb shell version : 1.5.3
					connection to localhost : 100001/admin
					type "hello word" for help
					db.runCommand({"$replSetInitiate"})
					{	
						// blort 
						"_id" :"blort";
						"host"："morton:100[]"
						{
							"_id":1,
							"host":"morton:10001"
						}
						  {
						  	"_id" :2,
						  	"host":"morton:10002"
						  }
						  	{
						  		"_id" :3,
						  		"host":"morton:10003"
						  	}	}
					{
						"info":"config now saved locally.Should come online in about a ";
						"ok" : ture
					}

	"_id" : N
	"host": hostname
	键指定主机名

		// 默认优先级为 1  端口号 10003 
		standard members.push({"_id":3,
							   "host":"morton : 10003"，
								"priority":40})

		"arbiterOnl" key 作为仲裁点	
			members.push({
				"_id":4,
				"host" :"morton: 10004"
				"arbiterOnl" : true
			});
		// 备份节点从活跃节点抽取 写入本地的oplog作为活跃点


	在服务器上执行操作
		从节点 作为故障恢复机制 ，防止主节点的数据丢失或者停止服务
			还有别的用法，从节点 作为备份的数据源 进行数据处理


	读取扩展

		将查询从节点上，负责到查询节点，是写入密集型
			使用自动分片来进行扩展

	  从节点做数据处理
	  		作为一种机制来处理密集型作为负责，或者作为聚合，避免主节点
	  			性能是使用 把它作为一个mongodb的主借节点，从不断的节点复制数据
	  				数据进行同步，只要更新操作

	  	工作原理

	  		只是复制二个节点或者服务点，一个是主节点负责处理客户端的请求
	  			从节点的定期咨询节点，执行了相同的操作	
	  	oplog
	  		主节点的操作记录 (operation log )
	  			local 在 oplog.$main 中使用

	  	--ts 
	  		操作时间戳，内部的类型用于时间 的构建

	  	--op
	  		操作类型只有1 个字节的代码
	  	-- o
	  		进一步开发执行的操作文档

	  同步
	  		从节点的第一次启动，对主节点下落的很远了
	  			如果从节点一种追赶主节点的oplog 操作
	  			  同步完成就可以滚一圈了
	  			  	这样就会发生迭机

     复制状态和本地数据库

     	从节点复制
     		db.sources.find()
     		{
     			"_id":objectld{"4b2365b06723456f35f94b60a13"}
     			"localhost":27017
     			"sources":"main":"syncedTo"
     			"localLogTs":{"t":0,"i":0}
     		}
     阻塞复制
     	开发者可以使用
     		getLastError "W" 来保持数据的同步性
     	会进行阻塞状态

     	db.runCommand({getLastError:1 ,w :N})

     	如果没有N or <2 这个命令就会返回节点的操作

     	指定W 选项可以使用 wtimeout 选项

     	架构数据仓库

    Applaction count sizen 

    	java index 

    		java 驱动是mongodb最早的驱动使用环境多年

      安装java驱动程序	
      		jar 文件下载 安装
      		  一般应用所用的java类在commongodb package
      		  	还有其他的修改驱动包结构或者是扩展功能会用到

      	 使用java驱动程序
      	 	import com.mongodb.Mongo;
      	 	import com.mongodb.Mongo.DB;
      	 	import com.mongodb.Mongo.BDCollection;

      	 	class CherSearch{

      	 		public static void main(String[] args) {
      	 			Mongo connection = new Mongo();

      	 			DB db = connection.getDB("search");
      	 			DBCollection chemicals = db.getCollection("chemicals");	
      	 		}
      	 	}

      	 	这样连接的是 localhost：27017 并得到命名空间

      	 	java 中文档必须 的DBObject 的实例,在java有多种创建的方式

      	 		可以直接操作com.mongodb.BasicDBObkect class 
      	 		{"x":1,"y":"foo"}

      	 		BasicDBObject doc = new BasicDBObject();
      	 		doc.put("x":1);
      	 		doc.put("y":"foo");

      	 		添加内嵌文档
      	 			"z":{"hello":"word"}

      	 		创建一个新的对象然后放入上一级
      	 			z.put("hello":"word");

      	 			doc.put("z":z);

    设计模式
    	每种化学物质有很多属性对所用属性做快速的搜索
    	{

    		"name":"silicon";
    		"mw":32.1173
    	}

    	mv 表示分子量

    	{

    		"name":"silicon nitride",
    		"mv"  : 42.0922,
    		"fh gas":{
				"value" : 372.38,
				"units" : "kj/mol"
    		},
    		"s gas" :{
    			"value" : 216.38,
				"units" : "j/mol"

    		}
    	}
    能放在容易数量结构化的化学物质
    	可以轻易的扩展
    		对所有的键索引
    	索引会将数组的每一个元素涵盖进去利用这个特点
    		可以将为索引添加一个数组

    	{

    		"name":"silicon nitride",
    		"mv"  : 42.0922,
    		"fh gas":{
				"value" : 372.38,
				"units" : "kj/mol"
    		},
    		"s gas" :{
    			"value" : 216.38,
				"units" : "j/mol"

    		}

    		"index" :[
    			{"name" : "mw","value" : 42.0922},
    			{"name" : "fh gas","value":372.38},
    			{"name" : "s gas","value":216.81},
    		]

    	}

    	对于si 数组只有一个元素就是分子量


    	使用java实现

      	 	class CherSearch{

      	 		public static void main(String[] args) {
      	 			Mongo connection = new Mongo();

      	 			DB db = connection.getDB("search");
      	 			DBCollection chemicals = db.getCollection("chemicals");	
      	 			BasicDBObject index = new BasicDBObject();
      	 			index.put("index.name",1);
      	 			index.put("index.value",1);
      	 			chemicals.ensureIndex(index);
      	 		}
      	 	}

      	 	public static DBObject createSiliconNitride(){

      	 		BasicDBObject sn = new BasicDBObject();
      	 		sn.put("name","silicone nitride");
      	 		sn.put("mw",42.0922);

      	 		BasicDBObject sgas = new BasicDBObject();
      	 		deltafHags.put("value",372.38);
      	 		deltafHags.put("units","j/mol");

      	 		sn.put("gas",sgas);

      	 		ArrayList<BasicDBObject> index = new ArrayList<BasicDBObject>();
      	 		index.add(BasicDBObjectBuilder.start()
      	 			.add("name","mv").add("value",42.092).get());
      	 		index.add(BasicDBObjectBuilder.start()
      	 			.add("name","mv").add("value",42.092).get());
      	 		index.add(BasicDBObjectBuilder.start()
      	 			.add("name","mv").add("value",42.092).get());

      	 		sn.put("index",index);

      	 		return sn;
      	 	}



分片

	为了建立管理或者调试了解切片工具的工作模式
		基本分区内发生的事情



	分割数据

		分配是集群分子数据自己的一台或多台服务器
			提供集群存储了 1000 000 文档 
			 一个相同的的数据自己副本在生产黄金
			 	一个废片常是一个副本集

		在分片均匀的分配数据，在不同的分配移动数据子集
			会根据不同的 片键来移动数据

		比如 我们用用户名来划分数据的集合，局域区间的方法来划分
			将数据分割成不同的块 来描述区间的集合



	分配数据

		一分片 一区间
			每一个分片负责一个区间的数据

		比如按照字母分片

			a,f  f,n b,t t,{

		在大型繁忙的数据库会带来很多不便

			因为用户的操作是不可预测的

		会造成数据的分片过载
			前面 二个 分片有500GB 后面二个是300GB

				考虑到所有的数据移动必须集中在集群中联下去移数据量很大

					一片一区 会导致联机效应 应该移动数据到下一台服务器上
						不能改善平衡属性}

		添加新的分区会肿么样

			这个集群继续工作，把每个分片上有了500GB数据
				我们移动数据 将是巨大的工程


		一分片多个区间

			分片一和二各有500GB的数据
				3 4 有300GB的数据

			如果获得新的分片
				可以把所用数据移动的新的分片上面


		当一块非常大的时候会自动分割成二个小块二个分片的比例失调
			会通过迁移数据来确保均衡




	如何创建块

		分配数据的时候为块区间选择一个键， 这个键叫做片键
			可以是任意字段的组合

		例
			{"username":"jack":"age": 24}
			{"username":"tom":"age":  17}
			{"username":"roles":"age":16}
			{"username":"analy":"age":50}
			{"username":"body":"age": 18}
			{"username":"boy":"age":  55}
			{"username":"gaga":"age": 73}
			{"username":"suint":"age":33}

		age 作为片键并获得一个区间会包含以下文本 [15,24]

			{"username":"jack":"age": 24}
			{"username":"tom":"age":  17}
			{"username":"roles":"age":16}
			{"username":"body":"age": 18}


	对集合的分片

		对一个集合分片 只会创建一块这个块是区间块

			集合的大小不能触发分割在插入个多的数据的时候
				只有一个块

			分割位置一般选字已有数据区间的中间点附近
				大约一半文档的字段小于这个字段

		块的求救可以包含一个值，但是各块的区间必须互相不能相同
			也有区间重叠的块每个块必须紧下一个区间的块
				每个文档必须属于一个块


		一个块分割成二个块
			 不会强制要求结构定义，作为片键的文档放在那儿
			 	mongodb 不允许插入无文档的片键
			 		但是 null作为片键的值是可以的


			null < count < String < object < Array < count 2 data < objectid
			   < boolean < date   < json 	


		块的默认大小是 200MB 移动数据的代价是非常大的花费很多时间
			占用系统资源 
			如果快过大 数据库根本不会移动它 200 刚好是移动性最开销的最佳


	平衡

		如果存在多个可用分片 只要块的梳理足够多就会把其他的数据
			移动到另一个分片上面 优点在于自动化
		无需担心数据在分片上均匀的分布 工作用平衡器解决的
			块放在分片上 可以手动移动到分片2上面


	平衡器的算法还不是很智能 每天分片的整体大小来移动块
		尽量避免数据的移动


		触发平衡的数据量比大多数想向的大

			for ( i =0;i<5000000;i++){


				db.foo.insert({"_id":i,"x":1,"y":2,"z":i,"date":new Date(),"foo":"bar"})
			}

			db.stats()
			
		
		大概等于40MB的数据还不够一个块东西
			要插入2CG的数据是2500万这样的文档

		使用数据分片看到数据的到处移动是人性的本能	
			生产系统并不希望看到数据到处移动

		使用技巧

			自定义块的大小
				-- chunksize 的定义参数

			递增块的大小
				前面几个块的大小 会自动降低块的大小200降
					到64MB

			改变块的大小
				-- chunkSize 改变

	mongos 
		是用户集群间的交互点	
			隐藏分片的内部复杂并向用户

		使用集群的时候连接一个mongos 并发送读写操作
			对照的数据块 并把文件发到相对的分片上


	配置服务器	
			mongos 进程不能持久的存储任何数据，集群配置保存在
				一组的配置服务器上.包括了集群最完整可靠的消息

			保证数据的迁移成功配置的服务器必须同时在线
				任何任意依然听见了，在当前执行的迁移会回退并	
				停止，知道配置服务器再一次运行

	集群的构造
		实际存储数据的分片
		负责请求数据的进程
		跟踪集群状态的配置服务器


建立集群
	
   选择片键
     选择一个好的片键在 访问量大的时候毁了一个应用程序
   	     访问量高只要添加服务器就好了

   	小基数片键
   		自动分配数据的方式，有几个分片用几个可能的值来作为
   			片键 是一个非常糟糕的方法

   		如果有一个存储在用户信息的应用程序，每个万达有一个continent字段
   			代表其区域 字段可以说 Africa 等只读
   				考虑在每个东方有一个数据中心，在当地的
   					数据中心Wie体用用户的数据按照字段进行切分

   		每个大州切分一个切片

   			不能再次分割这个块了
   				由于片键的值有限因为这些片键成为小基数片键
   					一堆无法移动还不能别分割的块

   		如果是手动分配数据 就不用使用他的哪吒分配机制
   			可以对搜东对象集合进行分片，编写自己的路由器


   	使用的键
   		然后取值个数有限的键，集合在一个键有N 个值
   			那个就会有N个数据块，能被分成N份

   		如果在集合有生命周期，可以选择正规生命周期作为片键

   		中心感知 ：支持的尝试有关看畅快相关问题的投票
   			扩展性不是很好

   			如何迁移数据
   				一个块增加到几个GB大小就无法移动了，由于片键无法
   					更新不能通过各项到所有文档来是使用一个独特的片键
   						值可以删除文档，对于大型数据库不是那么容易做到的

   			升序片键
   				RAM读取的比从磁盘读取的速度快，我们尽量乏味内存中的数据
   					使用片键保存到一起，对大部分程序而言，新的数据被乏味的次数
   					  比老的数据要多，使用时间错或者是objectid来作为片键
   						从一个数据块开始，全部插入会落到这个片键分裂成二个块
   							所有的出入会落到第二个块上
   								不会有插入的操作到第二个块上

   			适用的键
   				然后升序排列的键值不能是时间戳

   	随机片键
   		避免热点，选择一个随机的字段来分片采用这个分片
   			开始不错，数据变大会变得越来越大
   				会越来越慢,在分片的结婚存储缩略图包含了二进制数据
   					作为MD5 散列值
   		随着集合的增长会得到一组分布于各个分片的数据块
   			最终会获得一嘴均匀分布于各个分片的数据块，配置服务器
   				到分片比1多场了10块而不是抹平分片的差距
   					随机加载5个到内存中并给分片会引发
   						大量的磁盘IO

   	好片键

   		应用规模会访问25GB的数据所用的分割迁移数据在25GB的
   			数据块上，而不是随机的复制到内存中去

   		升序键叫索引键
   			大致时间上按照时间排序 但是也要均匀分布，能把数据保存
   				在读写数据保存在内存中，又可以均衡的分布在集群中

   		  我们可以通过实现{coarselyAscending:1,search:1}
   		  	这样的组合片键来实现目标，每个值对应到很多个数据块上
   		  		search键是应当引用程序依据进行查询的字段

   		  比如有几个分析程序，用户会定期通过访问过去一个月的数据
   		  	保持数据的使用，每个月会有一个更大的值，作为第二个字段
   		  	   查询特定用户的数据保存数据易于使用看在{month：1，user：1}
   		  	    上分片每个月会有一个更大的值user适合第二个字段

   		   从一个数据块开始组合区间是 当他被填满的时候会将分成二个块
   		   	 如果用户名大于susan 的用户放在第二个块上

   		   	 随着数据的增长会持续有效 4月创建的块会移动到不同的
   		   	 	分片上保证了读写剧情的负载均衡

   		   	 到五月份 方案会持续有效开始创建安静的换出内存之后就不会占用资源
   		   	 	因为后面不再占用资源（使用随机索引避免出现问题)	
	常见的问题

		为什么不将{ascendingket:1} 用作片键
			把一粗粒度 升序对键合在一起使用会创建巨大的无法分割的巨大快

		search字段也是升序片键带来的热点问题
			应该是什么：是应用程序可查询的东西，文件名和GUID 等
				具备升序，分布式技术具有的基数适当的特点

	一般情况	
		概括一个片键公式
			{coarseLocaliry:1,search:1}
			  控制数据的局部化 常用的索引字段
		并不是唯一片键 不会使用它， 如何选择片键是一个好的开始


	该使用哪种片键

		写入操作？要插入什么文档，有多大？
		系统，每个小时会写入多少数据？每天的高峰期是多少？
		那些字段是随机的，那些是增长的?
		该操作是什么样的，人们在访问数据
		系统每个小时会读取那些数据 每天 高峰
		数据做了索引？应该索引吗
		数据的总量是多少

* 会在数据发现其他的模式，利用起来再进行分片执行，需要继续的
	  	了解你的数据

	  新老集合的分片
	  	选好 片键 进行数据分片

	  快速起步

	  	使用 Github 上的mongosmippets 只要几分钟就能建立好一个
	  		对用户很用用的脚本是自动生成集群的

	  		$sudo easy_install pymongo 
	  			下载 mongo-smippers 执行下面命令

	  			$python sharding/simle-setup.py --path/to/yout/mongodb/binaries 

	  		 会有其他可用的选项，保证完整的路径

	  		 会自动mongos 进程地址：localhost：27017使用 shell

	  配置服务器

	  		采用3个配置服务器，在生产环境任何应当怎么做

	  			配置服务器注意到分配到不同故障区域里

	  		$ssh ny- 01
	  		ny -01$ mongod 
	  		$ssh sf - 01
	  		sf -01$ mongod 
	  		$ssh moon- 01
	  		moon -01$ mongod 

	  会发生一点小问题，本来面服务器不知道其他服务器存在配置
	  	服务器的角色

	  启动配置服务器的时候 运行mongod -help 输出 "General option"
	  	下面的可以随机使用 keyFile 和 aut 除外
	  	   还不支持认证在 1.91版本改变

	  	mongos	
	  		启动进程 至少需要一个mongos但是无上限
	  		   应该监视所有进程不会想启动很多个进程

	  	$ ssh ny -02
	  	ny -01$ mongods --configdb ny -01 ,sf -01,moon -01 

	  	启动第一个进程就好 根据这个配置其他服务器
	  	服务器能正常工作

	  		数据读写数据，让数据存储机制进来

* 分片
	* 集群上索引的管理工具是通过mongos 完成的 可以使用shell命令启动

	 	$mongo -ny-0:27017/admin  // 打开端口
	 	MongoDB shell version: 1.7.5
	 	connecting to: admin 

	 确让氮气使用的是admin 数据库 设置分片要在数据库执行命令
	 	一旦连接上 就可以添加分片了，取决分片单服务器的副本集合
	 		添加第一个分片
		
		db.runCommand({"addShard":"sf-02:27017"})	
		{"sharAdded" : "shard000":"ok":1}

		应用副本集 来做每个分片，能提供更好的可用性
			要传递一个字符串为他们的任意一个

	数据库集合

		Mongodb 来帮你分配数据，告诉它处理的数据集合
			包含的分片集合

		在写一个博客程序，所有结婚在blog数据可用使用分片启动
			db.adminCommand({"enbleSharding":"blog"})

		对集合进行分片
			db.adminCommand({"shardCollection":"blog.psots",
							key:{"date":1,"autor":1}})

			包含了blog.posts 飞posts
			对数据集合进行分片，数据片键上必须有索引才有片键
			 不能有null

	增减容量

		随着应用的持续增长,要添加更多的分片
			从老分片移向性的分片数据，会尽可能的慢的移动数据
				还是会加载负载

		移动块会迫使被移动换出RAM导致请求命名磁盘并拖动这个系统

* 如何添加分片？
 	* 使用addShard命令

	  	注意：再添加分片不必的空的，分片不能包含集群有的数据库
	  		但是如果有以后foo数据库从新添加分片包含bar数据库不会产生
	  			问题，会在集群信息
    	
       移除分片汲取中
       	  过早的进行分类或者选择错了片键命令可以从

       	  	removeShard 命令可以移除分片
       	  		db.runCommand({removeShard:"Gloden Geat shard"})
       	  		{

       	  			"msg":"drianding stated successfuy"
       	  			"state":"stated";
       	  			"shard":"Gloden Geate shard"

       	  		}
       	  消息命令 会立即放回返回
       	  		return completed 可以安全的关闭分片或者为分片的Mongodb服务器来说使用

       	修改分片的服务器

       		使用副本集合可以添加或者删除副本集，是独立的运行
       			连接服务器并修改该配置



* 使用集群

      			服务器的是一样的还是有些列外情况

      	CAP会应验证，使用查询从CAP通过验证

      		db.getMongo().setSlaveOK()


      	把整个集合看成一个 即使快照(shapshot in time)

      	1.17
      	counte	

      		在一个分片集合进行进行统计的时候，会得到一个比较多的数

      			在移动迁移数据块时候从一个分片copy 到另一个分片
      				才会各项配置服务器并删除分片的数据

      					在分片进行技术的时候实际被算计了二次

      	唯一索引

      		在 email字段上进行分片 加一个唯一索引
      			在集群是不能实现

      		要检查andrew 是否为唯一的 andrew要便利上面的
      			每一个文档
      		{
      			// 唯一id号
      			"_id":objectid("4b2af4c5a89d7")
      			// 遍历usernam 
      			"username":"andrew",
      			"email":"coll.xxxx.com"
      		}

      		每个分要检查是否有没有这个名字的用户，有没有文档被写入
      			唯一的方法是咋执行操作的时候锁定整个集群

      			在{username:1,emai:1}
      			上面创建一个唯一索引
      		如果在id上切片会创建唯一的索引但是在移动块的时候会带来麻烦


* 更新
	* 默认操作只能对单个进行纪录，唯一索引面临同样的麻烦
	* 在操作多个分片区间只能发生一次
	* 如果要更新这个分区
	* 只能在条件的时候使用片键

      		db.adminCommadn({shardCollection:"test.x",key:{"y",1}})

      		db.x.updat({y:1},{$set:{z:2}},true)

      		db.x.updat({x:2},{$set:{w:4}})

      		执行操作是否对集群是原子化 的这类操作是不被允许的

      	临时集合

      		除非申明了呕吐参数否则MapReduce会创建临时集合
      			在临时集合会一直存在创建 他们的连接关闭，在单台
      				服务器上自己会维护自己的连接池从来不会关闭分片连接
      					会一直存在数量会越来越多

      		var dropTemoCollection = function(dbName){

      			var target = db.getSisterDB(dbName);
      			var name   = target.getCollectinoNames();

      			for (let i=0;i<name.lenght;i++){

      				if(name[i].match(/tmp\.mr.\./))
      					target[names[i]].drop();
      			}
      		}

    管理数据库

    		使用命令行
    			大部分工作可以通过 mongo shell 来完成

    	db.rpintShardingStatus() 
    		给出一份执行条件，用来显示集群有关的信息的漂亮的显示出来

    		创建每个数据库的大本营 在列子test的随机分片是指额为shard000
    			并不意外任何的东西这个字段永远与你没有关系其他的主片会自动的移到另一个
    				集群的时候会移动另一个分片

    			集合很大的时候 db.printShardingStatus() 输出会特备的长
    	配置集合

    		在适合分发到分片上除非是查询config 正是找到config的内容
    	查看 config

    		use config 
    		// 查看集群的集合
    		show collections
    		// mognos 的进程
    		db.mongos.find()

    		cofing.shard 集群的所有分片
    		config.databases 集群的所用数据库
    		config.collections 分片的集合
    		config.chunks 集群的数据块
    		config.changelog 集群的操作日志文档
		
    	应该连接什么
    		执行读写操作或管理操作的答案永远是mongs任何的
    			可以是无状态的，但永远是mongs 不是分片和配置服务器

    	监控
    		对监控单个节点的建议使用多个界定，确保读过有关监控的文档
    			当机器数量过的时候网络就会越来越重要
    				要检查二台服务器的连接性
    		
	
	db.serverStatus()

	锁信息

		R 表示全局锁
		W  全局写锁
		r 数据读锁
		w 数据库写锁

	db.serverStatus().locks
	{
		{
			"timeLockedMiros":{
			"R":NumberLong(2532219), // 读锁的微妙数
			"W":NumberLong(2022505) // 写锁的微妙数

			}

		}

		"timecqyitingMicros":{
			"R" : NumberLong(1489378), //启动全局读的总微妙数
			"W" : NumberLong(361518), //启动全局写等待的微妙


		}
		"admin"{
			"timeLockedMiros":{
			"r":NumberLong(277350), // admin读锁的微妙数
			"w":NumberLong(0) // admin 等待时间

			}
		}

	}

	全局锁信息
		db.serverStatus().globalLock
		{

			"totalTime":NumberLogin("17205999990"),//启动持续
			"lockTime":NumberLong(2031058) // 全局锁的时间
			"currentQueue":{

				"total":0, // 等待锁的格式
				"readers":0, // 全局读锁等待的个数
				"writers":0//全局写锁等待的个数 

			}
		}

	内存锁信息

		db.serverStatus().mem
			{
				"bits": , //操作系统位数
				"resident":45792,
				"virtual":326338, // 虚拟内存消耗 
				"suooirted":true, // 支持额外信息
				"mapped":161399   // 映射内存
				"mappedWithJournal":   

			}

	额外信息
		db.servlerStatus().extra_info{

			"heap_usage_bytes" // 堆空间的字节数量 linux适用
		}

	索引统计信息
		db.serverStatus().indexCounters{
			"hist":25369213426
			"misses":0 // 发现存在的内存次数
			"rests":0, // 计算机重制
			"missRatio":0 // 丢失


		}
