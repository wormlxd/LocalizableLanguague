//
//  LanguaueManager.m
//  LocalizableLanguaue
//
//  Created by linxiaodong on 14-8-3.
//  Copyright (c) 2014年 linxiaodong. All rights reserved.
//

#import "LanguaueManager.h"

NSString* const LanguageManagerLanguageChangedNotify = @"LanguageManagerLanguageChangedNotify";
NSString* const LanguageManagerLanguageKey = @"LanguageManagerLanguageKey";

/**
 *@name:        languageTable
 *@Abstract:    语言表，列表所有支持的语言对应的名称，该名称必须与InfoPlist.strings对应；
 */

static struct LanguageItem {
    LanguageType    type;
    char*           name;   /* 需要与Apple一致 */
} const languageTable[] = {
    
    {LanguageTypeEnglish, "en"},
    {LanguageTypeSimpleChinese, "zh-Hans"},
    {LanguageTypeTraditionalChinese, "zh-Hant"},
    //其他语言添加的位置
    
    {LanguageTypeUnknown, NULL},
};

static LanguageType languageType(NSString* name)
{
    int i = 0;
    LanguageType type = LanguageTypeUnknown;
    const char* cname = [name UTF8String];
    
    if (!cname) return LanguageTypeUnknown;
    
    while (languageTable[i].type != LanguageTypeUnknown) {
        if (!strcmp(languageTable[i].name, cname)) {
            type = languageTable[i].type;
            break;
        }
        i++;
    }
    return type;
}

static NSString* languageName(LanguageType type)
{
    int i = 0;
    NSString *name = NULL;
    
    while (languageTable[i].type != LanguageTypeUnknown) {
        if (type == languageTable[i].type) {
            name = [NSString stringWithFormat:@"%s", languageTable[i].name];
        }
        i++;
    }
    return name;
}

@interface LanguageManager () {
    NSBundle* _bundle;
}
@end


@implementation LanguageManager

@synthesize type = _type;

+ (LanguageManager *)sharedInstance \
{ \
    static dispatch_once_t once; \
    static LanguageManager * __singleton__; \
    dispatch_once( &once, ^{ __singleton__ = [[LanguageManager alloc] init]; } ); \
    return __singleton__; \
}

- (id)init {
    self  = [super init];
    if (self) {
        NSString* currentName = [[NSUserDefaults standardUserDefaults] objectForKey:LanguageManagerLanguageKey];
        if (!currentName) {//第一次使用系统语言
            currentName = [[[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"] objectAtIndex:0];
            if (languageType(currentName) == LanguageTypeUnknown) {
                currentName = @"en";
            }
            [[NSUserDefaults standardUserDefaults] setObject:currentName forKey:LanguageManagerLanguageKey];
        }
        [self setBundleForName:currentName];
        
    }
    return self;
}

- (void)setBundleForName:(NSString* )name
{
    NSString* path = [[NSBundle mainBundle] pathForResource:name ofType:@"lproj"];
    _bundle = [NSBundle bundleWithPath:path];
}

- (void)setType:(LanguageType)type {
    if (_type != type) {
        _type = type;
        [self setBundleForName:languageName(type)];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:LanguageManagerLanguageChangedNotify object:nil userInfo:nil];
    }
}

- (NSString* )localizedStringForKey:(NSString* )key
{
    return [_bundle localizedStringForKey:key value:nil table:nil];
}

@end
