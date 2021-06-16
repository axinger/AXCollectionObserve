# AXCollectionObserve

由于Object-C中 利用 `NSMutableArray`等可变集合不能kvo,所以使用`ReactiveObjC`实现观察`NSMutableArray` 等可变集合内容变化,得到KVO效果,用来触发数据源.

## Example

`NSMutableArray`
```objective-c
@weakify(self)
[RACObserve(self, array) ax_subscribeNext:^(id  _Nonnull x) {
    @strongify(self)
    doSoming;
}];
```
```objective-c
NSMutableArray *array = NSMutableArray.array;
[array ax_valueChangeObserve:^(NSMutableArray * _Nonnull array) {
  NSLog(@"array = %@",array);
}];
/// 添加元素
NSString *str = [NSString stringWithFormat:@"array-%ld",array.count];
[array addObject:str];

NSString *str = [NSString stringWithFormat:@"array-%ld",array.count];
[array insertObject:str atIndex:0];

if (array.count>0) {
  [array removeLastObject];
}

```



`NSMutableDictionary`

```objective-c
NSMutableDictionary *dict = NSMutableDictionary.dictionary;
[dict ax_valueChangeObserve:^(NSMutableDictionary * _Nonnull dict) {
	NSLog(@"dict = %@",dict);
}];

NSString *key = [NSString stringWithFormat:@"key-%ld",dict.count];
dict[key] = key;
```



## Requirements

## Installation

AXCollectionObserve is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AXCollectionObserve'
```

或者

```ruby
pod 'AXCollectionObserve',:git => 'https://gitee.com/axinger/AXCollectionObserve.git'
```



## Author

axinger, liu_weixing@qq.com

## License

AXCollectionObserve is available under the MIT license. See the LICENSE file for more info.
