

- [前言](#%e5%89%8d%e8%a8%80)
- [如何创建自动化测试](#%e5%a6%82%e4%bd%95%e5%88%9b%e5%bb%ba%e8%87%aa%e5%8a%a8%e5%8c%96%e6%b5%8b%e8%af%95)
- [创建好的自动化测试在哪里?](#%e5%88%9b%e5%bb%ba%e5%a5%bd%e7%9a%84%e8%87%aa%e5%8a%a8%e5%8c%96%e6%b5%8b%e8%af%95%e5%9c%a8%e5%93%aa%e9%87%8c)
- [如何使用自动化测试](#%e5%a6%82%e4%bd%95%e4%bd%bf%e7%94%a8%e8%87%aa%e5%8a%a8%e5%8c%96%e6%b5%8b%e8%af%95)
- [生命周期(运行流程)](#%e7%94%9f%e5%91%bd%e5%91%a8%e6%9c%9f%e8%bf%90%e8%a1%8c%e6%b5%81%e7%a8%8b)
- [具体使用介绍](#%e5%85%b7%e4%bd%93%e4%bd%bf%e7%94%a8%e4%bb%8b%e7%bb%8d)
  - [初始化 App](#%e5%88%9d%e5%a7%8b%e5%8c%96-app)
  - [获取元素](#%e8%8e%b7%e5%8f%96%e5%85%83%e7%b4%a0)
    - [根据类型取元素](#%e6%a0%b9%e6%8d%ae%e7%b1%bb%e5%9e%8b%e5%8f%96%e5%85%83%e7%b4%a0)
    - [根据 label 取元素](#%e6%a0%b9%e6%8d%ae-label-%e5%8f%96%e5%85%83%e7%b4%a0)
    - [根据下标取元素](#%e6%a0%b9%e6%8d%ae%e4%b8%8b%e6%a0%87%e5%8f%96%e5%85%83%e7%b4%a0)
    - [根据 identifier 取元素](#%e6%a0%b9%e6%8d%ae-identifier-%e5%8f%96%e5%85%83%e7%b4%a0)
  - [对元素的操作](#%e5%af%b9%e5%85%83%e7%b4%a0%e7%9a%84%e6%93%8d%e4%bd%9c)
    - [点击](#%e7%82%b9%e5%87%bb)
    - [双击](#%e5%8f%8c%e5%87%bb)
    - [长按](#%e9%95%bf%e6%8c%89)
    - [滑动](#%e6%bb%91%e5%8a%a8)
    - [捏合](#%e6%8d%8f%e5%90%88)
    - [旋转](#%e6%97%8b%e8%bd%ac)
- [项目地址](#%e9%a1%b9%e7%9b%ae%e5%9c%b0%e5%9d%80)

# 前言

最近正在学习 iOS 自动化测试(系统自带的 XCTest), 就总结一下自动化测试一些知识.  

# 如何创建自动化测试

就不介绍什么是自动化测试了，直接开搞

这里分两种情况

1. 刚新建项目

创建项目时, 勾上 Include UI Tests 即可

![图片](Images/00.png)


2. 已有了项目，却没有自动化测试

其实就是添加 target  
我们点击 '+' 号, 

![图片](Images/01.png)

选择 UI Testing Bundle

![图片](Images/02.png)



# 创建好的自动化测试在哪里?

创建好之后, 是在该目录下(看图), 默认名称是 项目名 + UITests  
看到这里, 写过 app extension 的老哥应该都明白了, 其实这个自动化测试就是一个 target 来的, 我们可以随意删除和创建, 甚至创建多个都是没问题的  

![图片](Images/03.png)


# 如何使用自动化测试

这里一般有两种使用法

1. 在 Show the Test Navigator (就是那个四边形) 中使用

我们点到这里之后, 放鼠标到, 放在函数上, 例如 testExample()  
这时我们就能看到右边有个播放的小箭头, 点击这个小箭头, 我们就开始运行这个 testExample() 函数了  
如果运行大写 T(XQUITestDemoUITests), 就是运行这个测试模块中所有函数的意思  
运行自动化测试, 和运行项目一样的, 可以先选择设备, 就是选择真机或者某个模拟器  

> 刚创建时, 只有 testLaunchPerformance() 和 testExample() 两个函数  
> 其他函数是我后面写的  

![图片](Images/04.png)


2. 在 UITest 模块的 .swift 文件里面选择运行

上面的 testExample() 这些函数, 其实就是关联这个文件里面的函数
我们点开 UITest 模块的 .swift 文件(如下图), 就一切明了了

![图片](Images/05.png)

代码行数那里的四边形, 点击效果和上面说的一样, 就是运行自动化测试  
点击 class 旁边的运行, 是运行整个类里面所有函数的(和上面说的运行整个测试模块一样)

> 注意! 能单独执行的函数一定是 test 开头(就是旁边有四边形的函数)
> 就比如 testA() 这个就是可以的.  methodA() 旁边就没有四边形.

# 生命周期(运行流程)

周期如下 

1. setUp()
2. 自定义执行的函数
3. tearDown()


这里有个点, 要注意一下, 比如你当前测试模块里面有 testA(), testB() 两个函数.  
然后你直接点击运行整个测试模块, 他执行的顺序是.  

1. setUp()
2. testA()
3. tearDown()

然后再执行

1. setUp()
2. testB()
3. tearDown()

就是你会看到APP启动和关闭了两次.  
如果你想要连续测试, 并且不想全部测试步骤都写在一个函数里面的话.   
可以考虑写一个函数, 这个函数作为调用其他函数.  
然后点测试的时候, 不要去运行整个测试模块, 而是直接运行这个函数就行.  



# 具体使用介绍


## 初始化 App 

```swift
// 初始化 XCUIApplication
let app = XCUIApplication()
// 启动app 
app.launch()

// 默认不填 bundleIdentifier, 就会初始化当前项目APP
// 如果是想搞其他APP, 可传入 bundleIdentifier 初始化, 就可获得其实例
let sefariApp = XCUIApplication.init(bundleIdentifier: "com.apple.mobilesafari")
```

注意, 以下文章出现 app 的代码, 都是指代 let app = XCUIApplication() 这个

## 获取元素

这里我就举例几种常用的就行, 其他的, 大家可自行研究

### 根据类型取元素

可直接查看系统 XCUIElementTypeQueryProvider

![图片](Images/06.png)

比如这样取

```swift
app.buttons
```

这样就能取得该 app 下面所有的 button  
但取到 XCUIElementQuery, 还不能直接用   
这个时候我们取到具体某个元素才行  

为了比较好明白, 这里我举一个例子, UI是这样  

![图片](Images/07.png)

以下就是 print(app.debugDescription) 输出的数据    
这里再啰嗦一下, debugDescription 属性对于获取元素层级来说挺舒服的, 我们要记得常用 debugDescription  

```
 →Application, 0x2819e7720, pid: 4843, label: 'XQUITestDemo'
    Window (Main), 0x2819e78e0, {{0.0, 0.0}, {375.0, 667.0}}
      Other, 0x2819e79c0, {{0.0, 0.0}, {375.0, 667.0}}
        Other, 0x2819e7aa0, {{0.0, 0.0}, {375.0, 667.0}}
          Other, 0x2819e7b80, {{0.0, 0.0}, {375.0, 667.0}}
            Other, 0x2819e7c60, {{0.0, 0.0}, {375.0, 667.0}}
              Other, 0x2819e7d40, {{0.0, 0.0}, {375.0, 667.0}}
                Other, 0x2819e7e20, {{0.0, 0.0}, {375.0, 667.0}}
                  NavigationBar, 0x2819e7f00, {{0.0, 20.0}, {375.0, 44.0}}, identifier: '我的'
                    StaticText, 0x2819e8000, {{170.0, 32.0}, {35.0, 20.5}}, label: '我的'
                  Other, 0x2819e80e0, {{0.0, 0.0}, {375.0, 667.0}}
                    Other, 0x2819e81c0, {{0.0, 0.0}, {375.0, 667.0}}
                      Other, 0x2819e82a0, {{0.0, 64.0}, {375.0, 603.0}}
                        Button, 0x280c8eae0, {{30.0, 214.0}, {60.0, 60.0}}, identifier: 'touchMe', label: '点我'
                          StaticText, 0x2819e8460, {{41.5, 233.0}, {37.0, 22.0}}, label: '点我'
            TabBar, 0x2819e8540, {{0.0, 618.0}, {375.0, 49.0}}
              Button, 0x2819e8620, {{2.0, 619.0}, {184.0, 48.0}}, label: '首页'
              Button, 0x2819e1b20, {{190.0, 619.0}, {183.0, 48.0}}, label: '我的', Selected
      Other, 0x2819e1a40, {{0.0, 0.0}, {375.0, 667.0}}, Disabled
        Other, 0x2819e0b60, {{0.0, 0.0}, {375.0, 667.0}}, identifier: 'SVProgressHUD'
    Window, 0x2819e1ce0, {{0.0, 0.0}, {375.0, 667.0}}
      Other, 0x2819e1f80, {{0.0, 0.0}, {375.0, 667.0}}
        Other, 0x2819e2060, {{0.0, 0.0}, {375.0, 667.0}}
```


> 注意, Other 对应的是 UIView

我们现在要点击 tabbar 首页这个按钮, 跳转到首页  
那么该怎么做呢? 很简单, 代码就两句  

```swift
// 取元素
let homePageBtn = app.tabBars.buttons["首页"]
// 点击元素
homePageBtn.tap()
```

这里我解析一下第一句取元素

app.tabBars 取到的是以下数据

```
TabBar, 0x2835c3800, {{0.0, 618.0}, {375.0, 49.0}}
    Button, 0x2835c38e0, {{2.0, 619.0}, {184.0, 48.0}}, label: '首页'
    Button, 0x2835c39c0, {{190.0, 619.0}, {183.0, 48.0}}, label: '我的', Selected
```

然后 app.tabBars.buttons 取到的是

```
Button, 0x2835c38e0, {{2.0, 619.0}, {184.0, 48.0}}, label: '首页'
Button, 0x2835c39c0, {{190.0, 619.0}, {183.0, 48.0}}, label: '我的', Selected
```

这个时候, 我们根据类型取元素, 就已经取到最后了  
想取首页按钮的话, 有几种方法, 请继续往下看  

### 根据 label 取元素

根据 label 来获取 button

```swift
app.tabBars.buttons["首页"]
```

当然, 按照当前这个UI, 最简单就是 app.buttons["首页"]   
但是为了能够更准确的取到某个元素, 最好不要吝啬一点代码

### 根据下标取元素

因为打印的数据, 里面的元素是有序的. 那么我们也可以通过下标来获取元素  

```swift
// 传入具体的下标, 取出按钮
app.tabBars.buttons.element(boundBy: 0)

// 当然, 也有类似数组一样取法, 取第一个
app.windows.tabBars.firstMatch
```


### 根据 identifier 取元素

```swift
// 这里取的不是 tabbar 的 首页按钮, 是那个黄色按钮
app.tabBars.element(matching: .button, identifier: "touchMe")
```

不过你要提前在项目的代码中设置好 identifier 才行

* 在代码中设置


accessibilityIdentifier 就是设置自动化测试时的 identifier

```swift
let btn = UIButton()
btn.frame = CGRect.init(x: 30, y: 150, width: 60, height: 60)
btn.setTitle("点我", for: .normal)
btn.backgroundColor = UIColor.orange
btn.accessibilityIdentifier = "touchMe"
```


* xib 或者 storyboard 中设置


![图片](Images/08.png)



## 对元素的操作

### 点击

### 双击

### 长按

### 滑动

### 捏合

### 旋转





# 项目地址

[github](https://github.com/SyKingW/XQUITestDemo)







