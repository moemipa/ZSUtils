//
//  NSObject+ZSExtension.m
//  ZSUtils
//
//  Created by 張帥 on 2015/5/22.
//  Copyright (c) 2015年 張帥. All rights reserved.
//

#import "NSObject+ZSExtension.h"
#import <UIKit/UIKit.h>
#import "ZSUtils.h"

int GetBuildDateTime(char *szDateTime) {
    const int  MONTH_PER_YEAR=12;
    const char szEnglishMonth[MONTH_PER_YEAR][4]={ "Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
    char szTmpDate[40]={0};
    char szTmpTime[20]={0};
    char szMonth[4]={0};
    int iYear,iMonth,iDay,iHour,iMin,iSec;
    
    //获取编译日期、时间
    sprintf(szTmpDate,"%s",__DATE__); //"Sep 18 2010"
    sprintf(szTmpTime,"%s",__TIME__); //"10:59:19"
    
    sscanf(szTmpDate,"%s %d %d",szMonth,&iDay,&iYear);
    sscanf(szTmpTime,"%d:%d:%d",&iHour,&iMin,&iSec);
    
    for(int i=0;MONTH_PER_YEAR;i++) {
        if(strncmp(szMonth,szEnglishMonth[i],3)==0) {
            iMonth=i+1;
            break;
        }
    }
    
    //printf("%d,%d,%d,%d,%d,%d\n",iYear,iMonth,iDay,iHour,iMin,iSec);
    sprintf(szDateTime,"%04d%02d%02d%02d%02d%02d",iYear,iMonth,iDay,iHour,iMin,iSec);
    return 0;
}

@implementation NSObject (ZSExtension)

- (NSString *)JSONString {
    return [[NSString alloc] initWithData:[self JSONData]  encoding:NSUTF8StringEncoding];
}

- (NSData *)JSONData {
    if (![NSJSONSerialization isValidJSONObject:self]) {
        return nil;
    }
    return [NSJSONSerialization dataWithJSONObject:self options:kNilOptions error:nil];
}

- (id)objectFromJSON {
    NSData *data = nil;
    if ( [self isKindOfClass:NSString.class] ) {
        data = [(NSString *)self dataUsingEncoding:NSUTF8StringEncoding];
    } else if ( [self isKindOfClass:NSData.class] ) {
        data = (NSData *)self;
    }
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

+ (NSDate *)buildDate {
    char szDateTime[15]={0};
    GetBuildDateTime(szDateTime);
    NSString *date = [NSString stringWithUTF8String:szDateTime];
    return [NSDate dateWithString:date format:@"yyyyMMddHHmmss"];
}

+ (BOOL)checkTestTime:(NSTimeInterval)time timeoutTitle:(NSString *)timeoutTitle timeoutMessage:(NSString *)timeoutMessage {
    NSTimeInterval t = [NSDate.date timeIntervalSinceDate:[self.class buildDate]];
    if (ABS(t) > time && time != 0) {
        if (timeoutTitle.length || timeoutMessage.length) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [[UIApplication sharedApplication] keyWindow].userInteractionEnabled = NO;
                [[UIApplication sharedApplication] keyWindow].alpha = 0;
                [[[UIAlertView alloc] initWithTitle:timeoutTitle
                                            message:timeoutMessage
                                           delegate:nil
                                  cancelButtonTitle:nil
                                  otherButtonTitles:nil, nil] show];
            });
        }
        return YES;
    }
    return NO;
}

@end
