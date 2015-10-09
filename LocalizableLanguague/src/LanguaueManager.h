//
//  LanguaueManager.h
//  LocalizableLanguaue
//
//  Created by linxiaodong on 14-8-3.
//  Copyright (c) 2014年 linxiaodong. All rights reserved.
//

#import <Foundation/Foundation.h>


#define LOCALIZE(__key) [[LanguageManager sharedInstance] localizedStringForKey:__key]
#define LANGUAGE_SET(__type) [[LanguageManager sharedInstance] setType:__type]

/* 本地语言类型改变接受的通知 */
extern NSString* const LanguageManagerLanguageChangedNotify;

enum {
    LanguageTypeUnknown = 0,
    LanguageTypeEnglish,
    LanguageTypeSimpleChinese,
    LanguageTypeTraditionalChinese,
    /* 在这里添加其他语言类型 */
};
typedef NSInteger LanguageType;


@interface LanguageManager : NSObject {
    LanguageType _type;
}
/*设置语言类型*/
@property (nonatomic, assign)LanguageType type;



+ (LanguageManager *)sharedInstance;

- (NSString* )localizedStringForKey:(NSString* )key;

@end