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

extern NSString* const LanguageManagerLanguageChangedNotify;

enum {
    LanguageTypeUnknown = 0,
    LanguageTypeEnglish,
    LanguageTypeSimpleChinese,
    LanguageTypeTraditionalChinese,
};
typedef NSInteger LanguageType;


@interface LanguageManager : NSObject {
    LanguageType _type;
}
@property (nonatomic, assign)LanguageType type;



+ (LanguageManager *)sharedInstance;

- (NSString* )localizedStringForKey:(NSString* )key;

@end