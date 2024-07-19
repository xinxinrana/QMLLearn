import QtQuick 2.12
import "./Components"

// JS学习
Item {
    id: root

    function test(inItem) {
        copyItemToItme2(inItem)
    }

    function testNothing() {

        // js 自动类型转换
        // let i1 = "1.1" + "1.1"
        // let i2 = (+"1.1") + (+"1.1")
        // let i3 = "1.1" - "1.1"
        // console.log(i1,i2,i3)

        // try catch throw
        // try{
        //     var n = 100/0
        //     if(n === Infinity){
        //         throw "除法错误"
        //     }

        // }catch(e) {
        //     console.log(e)
        // }finally {
        //     console.log(`无论什么情况都执行的 funally 块`)
        // }

        // console.log(`n 的值为：${n}`)

        // 遍历
        // let arr = [3, 5, 7];
        // arr.foo = "hello";

        //  (let i in arr) {
        //   console.log(i); // 输出 "0", "1", "2", "foo"
        // }

        //  (let item of arr) {
        //   console.log(item); // 输出 "3", "5", "7"
        // }

        // js 基本对象
        // btn2.text = Math.abs((-100)**3)

        // console.log((-100)**3)
        // let myNumber = "500"; // oops, this is still a string
        // console.log(typeof myNumber)
        // myNumber = 500; // much better — now this is a number
        // console.log(typeof myNumber)

        // == 与 ===
        // let v1 = "100",v2 = 100;
        // 在 == 时会自动类型转换
        // btn2.text = v1 == v2;   // true
        // btn2.text = v1 === v2;   // false

        // 模板字符串
        // let v1 = 200
        // let str = `这里嵌入了一个数字：${v1}`
        // btn2.text = str

        // 字符串操作
        // let str2 = "teSt"
        // str2 = str2.toLocaleUpperCase()
        // btn2.text = str2[1]
        // str2 = str2.replace("es", "xx");
        // slice : 获得子字符串
        // str2 = str2.slice(0,1).toUpperCase() + str2.slice(1).toLowerCase()

        // btn2.text = str2

        // btn2.text = str2.indexOf("s")   //2
        // btn2.text = str2.indexOf("n")   //-1
        // btn2.text = str2.slice(2)       //st

        // 函数
        // js 函数是值传递,但是传递的是对象时 时通过引用传递
        // function foo(v1) {
        //     v1.t = "sss"
        // }

        // let str = {}
        // foo(str)
        // btn2.text = str.t

        // 闭包
        // 函数在生命周期内的中，在函数体内部作用域下的变量

        // const obj = {
        //     sum = 0,
        //     add = function(v2,item = this){
        //         item.sum += v2
        //         return item.sum
        //     }
        // }

        // const __add = obj.add

        // // 使用闭包
        // __add(10)
        // __add(20)
        // btn2.text = __add(30)

        // 数组的访问
        // const arr = ["one", "two", "three"]

        // 可以相互访问
        // // btn2.text =  arr[2]; // three
        // btn2.text = arr.length // 3

        // set 对象
        // let arr = [[1, 2, 3, 4],]
        // // let arr =
        // var mySet2 = new Set()
        // mySet2.add(arr)
        // // btn2.text = mySet2.has(arr)
        // btn2.text = mySet2.has(1)

        // 一种构造函数
        // function Car(make, model, year) {
        //     this.make = make
        //     this.model = model
        //     this.year = year
        //     this.foo = function(){return "hello world"}
        // }

        // var d = new Car("us", 111, 1919)
        // d.hello = "world"

        // console.log(JSON.stringify(d) )
        // console.log(d.foo())

        // 直接创建一个对象
        // var o = {
        //     "a": 7,
        //     "g": function () {
        //         return this.a + 1
        //     },
        //     "setA": function (x) {
        //         this.a = x / 2
        //     }
        // }
        // btn2.text = o.g()
        var itemBase = {
            "i": 200,
            "func": function () {
                return this.i + 100
            }
        }


        // 原型链
        var item = {
            "i": 100,
            __proto__: {
                func: function () {
                    return 300
                }
            },
            "foo": function () {
                return this.i + 100
            }
        }

        btn2.text = item.func()
    }

    // 函数解构赋值i
    function copyItemToItme2(inItem) {
        var test = inItem.test
        console.log(inItem)
        console.log(test)
    }

    // 输出对象所有属性
    function printItemKeys(InItem) {
        console.log(">>>>>>>>>>>>>>>>", InItem, "list >>")
        console.log(Object.keys(InItem))
        for (var key in Object.keys(InItem)) {
            console.log(key, InItem[key])
        }
        console.log(">>>>>>>>>>>>>>>>")
    }

    Column {
        spacing: 10

        Button {
            id: btn1
            text: "Js 测试"
            onClicked: {
                var aItem = {
                    "test": "test___",
                    "id": "id___"
                }

                // test(aItem)
                testNothing()
            }
        }
        Button {
            id: btn2
            text: "第二个按钮"
        }
    }
}
