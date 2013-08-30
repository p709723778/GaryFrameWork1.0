//
//  ViewController.m
//  Architecture
//
//  Created by 蒲晓涛 on 8/3/13.
//  Copyright (c) 2013 Gary. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+AKTabBarController.h"

@interface ViewController ()
{
    UILabel *lb1;
    UIButton *button;
}
@end

@implementation ViewController


- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"购彩大厅";
    }
    return self;
}

- (NSString *)tabTitle
{
	return self.title;
}

- (NSString *)tabImageName
{
	return @"image-1";
}

- (NSString *)activeTabImageName
{
	return @"image-1-active";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //rightBarButtonItem定义
    UIButton *rigthBtn = [[UIButton alloc] initWithFrame:CGRectMake(0.0, 100.0, 62.0, 29.0)];
    [rigthBtn setTitle:@" 资讯" forState:UIControlStateNormal];
    [rigthBtn setImage:LoadImage(@"zixunBar@2x.png") forState:UIControlStateNormal];
    [rigthBtn setBackgroundImage:ImageNamed(@"NavButton.png") forState:UIControlStateNormal];
    [rigthBtn setBackgroundImage:ImageNamed(@"NavButtonPressed.png") forState:UIControlStateHighlighted];
    [rigthBtn addTarget:self action:nil forControlEvents:UIControlEventTouchUpInside];
    rigthBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    rigthBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    UIBarButtonItem *rigthBarItem = [[UIBarButtonItem alloc] initWithCustomView:rigthBtn];
    self.navigationItem.rightBarButtonItem = rigthBarItem;
    [rigthBarItem release];
    [rigthBtn release];
    
    
    //改变nav背景图片,此处if为兼容4.3而写
    
    UIImage *backgroundImage = ImageNamed(@"NavBar.png");  //获取图片
    float systemVersion = [[UIDevice SystemVersion] floatValue];
    
    if(systemVersion >= 5.0)
    {
        [self.navigationController.navigationBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];  //设置背景
    }
    else
    {
        [self.navigationController.navigationBar insertSubview:[[[UIImageView alloc] initWithImage:backgroundImage] autorelease] atIndex:1];
    }
    
    //navLogo 定义
    UIImageView *imageView = [[UIImageView alloc] initWithImage:LoadImage(@"NavLogo@2x.png")];
    imageView.frame = CGRectMake(5, 0, 18, 44);
    [self.navigationController.view addSubview:imageView];
    [imageView release];
    
    UIView *bgview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    bgview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgview];
    [bgview release];
    
    lb1 = [[UILabel alloc] init];
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    lb1.text = NSLocalizedString(@"demo", @"lb1 name");
    lb1.frame = CGRectMake(20, 20, 200, 30);
    [button setTitle:NSLocalizedString(@"enter", @"button name") forState:UIControlStateNormal];
    button.frame = CGRectMake(20, 60, 100, 30);
    [bgview addSubview:lb1];
    [bgview addSubview:button];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(30, 130, 200, 60)];
    label.font = Digital_7(30.0f);
    label.backgroundColor = [UIColor clearColor];
    label.text = @"123:786";
    [self.view addSubview:label];
    [label release];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reachabilityChanged:)
                                                 name:kReachabilityChangedNotification
                                               object:nil];
    
    Reachability * reach = [Reachability reachabilityWithHostname:@"www.google.com"];
    
    reach.reachableBlock = ^(Reachability * reachability)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"Block Says Reachable");
        });
    };
    
    reach.unreachableBlock = ^(Reachability * reachability)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"Block Says Unreachable");
        });
    };
    
    [reach startNotifier];
}

-(void)reachabilityChanged:(NSNotification*)note
{
    Reachability * reach = [note object];
    
    if([reach isReachable])
    {
        NSLog(@"Notification Says Unreachable");
    }
    else
    {
        NSLog(@"Notification Says Unreachable");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
