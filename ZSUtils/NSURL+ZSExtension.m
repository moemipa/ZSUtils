//
//  NSURL+ZSExtension.m
//  ZSUtils
//
//  Created by 張帥 on 2018/09/19.
//  Copyright © 2018 張帥. All rights reserved.
//

#import "NSURL+ZSExtension.h"
#import "NSString+ZSExtension.h"

@implementation NSURL (ZSExtension)

/// 将url里面的参数转换成字典
- (NSDictionary *)queryParams {
    //query是？后面的参数，在这个demo中，指的是title=hello&content=helloworld&urlschemes=shixueqian
    NSString *query = self.query;
    
    if ([NSString isEmpty:query]) {
        return nil;
    }
    
    //进行字符串的拆分，通过&来拆分，把每个参数分开
    NSArray *subArray = [query componentsSeparatedByString:@"&"];
    //把subArray转换为字典
    //tempDic中存放一个URL中转换的键值对
    NSMutableDictionary *tempDic = [NSMutableDictionary dictionary];
    
    for (int i = 0 ; i < subArray.count ; i++) {
        //通过“=”拆分键和值
        NSArray *dicArray = [subArray[i] componentsSeparatedByString:@"="];
        //给字典加入元素,=前面为key，后面为value
        [tempDic setObject:dicArray[1] forKey:dicArray[0]];
    }
    //返回转换后的字典
    return tempDic ;
}

@end
