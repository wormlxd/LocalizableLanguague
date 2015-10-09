//
//  MainViewController.m
//  LocalizableLanguaue
//
//  Created by linxiaodong on 14-8-3.
//  Copyright (c) 2014年 linxiaodong. All rights reserved.
//

#import "MainViewController.h"
#import "LanguaueManager.h"
@interface MainViewController ()<UIAlertViewDelegate>

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)addObserver{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(languaueChange) name:LanguageManagerLanguageChangedNotify object:nil];
}
- (void)removeObserver{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:LanguageManagerLanguageChangedNotify object:nil];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addObserver];
    self.currentLanguague.text = LOCALIZE(@"current_languaue");
    [self.startButton setTitle:LOCALIZE(@"start") forState:UIControlStateNormal];
    // Do any additional setup after loading the view.
}
- (void)dealloc
{
    [self removeObserver];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onStartButtonPressed:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:LOCALIZE(@"hello") message:nil delegate:self cancelButtonTitle:LOCALIZE(@"cancel") otherButtonTitles:LOCALIZE(@"english"),LOCALIZE(@"chinese"),LOCALIZE(@"chinese_tradational"),nil];
    [alert show];
    
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    LanguageType type = LanguageTypeUnknown;
    switch (buttonIndex) {
        case 1:
            type = LanguageTypeEnglish;
            break;
        case 2:
            type = LanguageTypeSimpleChinese;
            break;
        case 3:
            type = LanguageTypeTraditionalChinese;
            break;
        default:
            break;
    }
    LANGUAGE_SET(type);
    
}

- (void)languaueChange
{
    self.currentLanguague.text = LOCALIZE(@"current_languaue");
    [self.startButton setTitle:LOCALIZE(@"start") forState:UIControlStateNormal];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
