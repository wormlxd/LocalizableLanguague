# LocalizableLanguague
本地化语言-app支持多语言实现
#本地化语言(多语言)支持
-----


###<h2 id="1">1、简介</h2>
----
本地化语言可以让程序中的string统一化管理，使代码更简洁。避免出现风格差异太大string代码。</br>
本地化语言也提供多语言支持，使app国际化更简单。</br>

###<h2 id="2">2、如何使用</h2>
----
__首先__，在资源目录下en.lproj代表英文目录
如果，我们要添加中文，首先新建一目录名为"zn-Hans.lproj"</br>
__然后__，在en.lproj和zh-Hans.lproj下分别新建Strings File
在列表中选择Strings File名为Localizable.strings</br>
__接着__，在项目中点右键，选择Add->New File在工程中同时将2个同名的Localizable.strings添加入工程</br>
__最后__，在程序中加入LanguaueManager.h和LanguaueManager.m文件。
调用宏定义LOCALIZE(__key)就可以实现本地化语言</br>
调用宏定义LANGUAGE_SET(type)就可以设置哪国语言

----
