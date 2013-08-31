//
//  AppHelper.m
//  Architecture
//
//  Created by 蒲晓涛 on 8/4/13.
//  Copyright (c) 2013 Gary. All rights reserved.
//

#import "AppDelegateHelper.h"

#import "AKTabBarController.h"
#import "ViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"

@implementation AppDelegateHelper

DEF_SINGLETON(AppDelegateHelper);

- (id)init
{
    if (self = [super init]) {
        _isFirst = [self isFirstLaunch];
    }

    return self;
}

/**
 *	@brief	判断App是否第一次启动
 *  该方法仅供本类用
 *	@return	YES Or NO
 */
- (BOOL)isFirstLaunch
{
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"everLaunched"]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"everLaunched"];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
    } else {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"firstLaunch"];
    }

    return [[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"];
}

+ (void)appLaunchingWithAnimation:(UIWindow *)mainMindow
{
    CGFloat     animateHeight = 310;
    UIImageView *splashView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];

    if ([UIDevice isPhoneRetina4]) {
        [splashView setImage:[UIImage imageNamed:@"Default-568h"]];
        animateHeight = 400;
    } else {
        [splashView setImage:[UIImage imageNamed:@"Default"]];
        animateHeight = 380;
    }

    [mainMindow addSubview:splashView];
    [mainMindow bringSubviewToFront:splashView];

    UIImageView *lightpoint = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icare_iphone_lightpoint"]];
    //    lightpoint.layer.shadowColor = [UIColor whiteColor].CGColor;

    UIImageView *lightline = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icare_iphone_lightline"]];

    [lightline setCenter:CGPointMake(160, animateHeight)];
    [lightline setFrame:CGRectMake(lightline.frame.origin.x, lightline.frame.origin.y, 0, 1)];

    [lightpoint setCenter:CGPointMake(180, animateHeight)];
    lightpoint.hidden = YES;
    [splashView addSubview:lightpoint];

    [splashView addSubview:lightline];
    [UIView animateWithDuration:0.6
            delay       :0.0
            options     :UIViewAnimationOptionAllowAnimatedContent
            animations  :^{
        //                         [lightpoint setCenter:CGPointMake(233, 310)];
        [lightline setFrame:CGRectMake(lightline.frame.origin.x, lightline.frame.origin.y, 188, 1)];
    }

            completion  :^(BOOL finished) {
        lightpoint.hidden = NO;
        [UIView animateWithDuration:0.6
                delay       :0.0
                options     :UIViewAnimationOptionAllowAnimatedContent
                animations  :^{
            [lightpoint setCenter:CGPointMake(233, animateHeight)];
        }

                completion  :^(BOOL finished) {
            [splashView removeFromSuperview];
        }

        ];
    }

    ];
}

+ (AKTabBarController *)loadTabBarController
{
    // If the device is an iPad, we make it taller.
    AKTabBarController *akTabBarController = [[AKTabBarController alloc] initWithTabBarHeight:(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? 70:50];

    // Comment out the line above and uncomment the line below to show the tab bar at the top of the UI.

    /*
     *   _tabBarController = [[AKTabBarController alloc] initWithTabBarHeight:(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? 70 : 50 position:AKTabBarPositionBottom];
     */

    [akTabBarController setMinimumHeightToDisplayTitle:40.0];

    // If needed, disable the resizing when switching display orientations.

    /*
     *   [_tabBarController setTabBarHasFixedHeight:YES];
     */

    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[[[ViewController alloc] init] autorelease]];
    navigationController.navigationBar.tintColor = [UIColor darkGrayColor];

    [akTabBarController setViewControllers:[NSMutableArray arrayWithObjects:
    navigationController,
    [[[SecondViewController alloc] init] autorelease],
    [[[ThirdViewController alloc] init] autorelease],
    [[[FourthViewController alloc] init] autorelease], nil]];

    [navigationController release];
    // Below you will find an example of the possible customizations, just uncomment the lines below

    // Tab background Image
    [akTabBarController setBackgroundImageName:@"noise-dark-gray.png"];
    [akTabBarController setSelectedBackgroundImageName:@"noise-dark-blue.png"];

    /*
     *   // If needed, set cap insets for the background image
     *   [_tabBarController setBackgroundImageCapInsets:UIEdgeInsetsMake(4, 4, 4, 4)];
     *
     *   // Tabs top embos Color
     *   [_tabBarController setTabEdgeColor:[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.8]];
     *
     *   // Tabs Colors settings
     *   [_tabBarController setTabColors:@[[UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.0],
     *   [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1.0]]]; // MAX 2 Colors
     *
     *   [_tabBarController setSelectedTabColors:@[[UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1.0],
     *   [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.0]]]; // MAX 2 Colors
     *
     *   // Tab Stroke Color
     *   [_tabBarController setTabStrokeColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0]];
     *
     *   // Icons Color settings
     *   [_tabBarController setIconColors:@[[UIColor colorWithRed:174.0/255.0 green:174.0/255.0 blue:174.0/255.0 alpha:1],
     *   [UIColor colorWithRed:228.0/255.0 green:228.0/255.0 blue:228.0/255.0 alpha:1]]]; // MAX 2 Colors
     *
     *   // Icon Shadow
     *   [_tabBarController setIconShadowColor:[UIColor blackColor]];
     *   [_tabBarController setIconShadowOffset:CGSizeMake(0, 1)];
     *
     *   [_tabBarController setSelectedIconColors:@[[UIColor colorWithRed:174.0/255.0 green:174.0/255.0 blue:174.0/255.0 alpha:1],
     *   [UIColor colorWithRed:228.0/255.0 green:228.0/255.0 blue:228.0/255.0 alpha:1]]]; // MAX 2 Colors
     *
     *   [_tabBarController setSelectedIconOuterGlowColor:[UIColor darkGrayColor]];
     *
     *   // Text Color
     *   [_tabBarController setTextColor:[UIColor colorWithRed:157.0/255.0 green:157.0/255.0 blue:157.0/255.0 alpha:1.0]];
     *   [_tabBarController setSelectedTextColor:[UIColor colorWithRed:228.0/255.0 green:228.0/255.0 blue:228.0/255.0 alpha:1.0]];
     *
     *   // Text font
     *   [_tabBarController setTextFont:[UIFont fontWithName:@"Chalkduster" size:14]];
     *
     *   // Hide / Show glossy on tab icons
     *   [_tabBarController setIconGlossyIsHidden:YES];
     *
     *   // Enable / Disable pre-rendered image mode
     *   [_tabBarController setTabIconPreRendered:NO];
     */

    // Uncomment the following lines to completely remove the border from all elements.

    /*
     *   [_tabBarController setTabEdgeColor:[UIColor clearColor]];
     *   [_tabBarController setTabInnerStrokeColor:[UIColor clearColor]];
     *   [_tabBarController setTabStrokeColor:[UIColor clearColor]];
     *   [_tabBarController setTopEdgeColor:[UIColor clearColor]];
     */

    // Uncomment the following to display centered image in the center of the tabbar, similar to Instagram.

    /*
     *   UIImage *img = [UIImage imageNamed:@"sample-center-image"];
     *   UIImageView *bottomCenterView = [[UIImageView alloc] initWithImage:img];
     *   CGRect rect = _tabBarController.view.frame;
     *   bottomCenterView.frame = CGRectMake(rect.size.width/2 - img.size.width/2, rect.size.height - img.size.height,
     *   img.size.width, img.size.height);
     *   [_tabBarController.view addSubview:bottomCenterView];
     */

    return [akTabBarController autorelease];
}

@end