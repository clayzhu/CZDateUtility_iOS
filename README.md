# CZDateUtility_iOS
封装了对 NSDate 的一些操作，可以计算时间差、日期和时间戳互相转换、NSDate 和 NSString 互相转换等。

## 介绍

出于对时间格式的透明，后台往往采用时间戳的形式存储具体的时间，而客户端则显示具体的格式；另外，对 `NSDate` 和 `NSString` 互相转换也需要考虑不同的时间格式。

因此，`NSDateFormatter` 是经常会使用的类。但使用 `NSDateFormatter` 需要重复地编写初始化，给 `dateFormat` 属性设置具体的时间格式等。

`CZDateUtility_iOS` 将这些步骤封装起来，只需传入时间、格式等具体的参数，自动完成转换。

