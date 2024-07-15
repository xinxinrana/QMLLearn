import QtQuick 2.12
import "./Components"

// JS学习

Item {
    id:root

    function test(inItem){
        copyItemToItme2(inItem)
    }

    function testNothing(){
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
        let arr = [3, 5, 7];
        arr.foo = "hello";

        for (let i in arr) {
          console.log(i); // 输出 "0", "1", "2", "foo"
        }

        for (let item of arr) {
          console.log(item); // 输出 "3", "5", "7"
        }
    }

    // 函数解构赋值
    function copyItemToItme2(inItem) {
        var {test} = inItem
        console.log(inItem)
        console.log(test)
    }

    // 输出对象所有属性
    function printItemKeys(InItem){
        console.log(">>>>>>>>>>>>>>>>",InItem,"list >>")
        console.log(Object.keys(InItem))
        for(var key in Object.keys(InItem)){
            console.log(key,InItem[key])
        }
        console.log(">>>>>>>>>>>>>>>>")

    }

    Column{
    spacing: 10

        Button {
            text:"Js 测试"
            onClicked: {
                var aItem = {
                    test:"test___",
                    id:"id___"
                };

                // test(aItem)
                testNothing()
            }
        }
        Button {
            text:"第二个按钮"
        }
    }
}


