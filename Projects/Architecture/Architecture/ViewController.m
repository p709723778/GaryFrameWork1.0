//
//  ViewController.m
//  Architecture
//
//  Created by 蒲晓涛 on 8/3/13.
//  Copyright (c) 2013 Gary. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UILabel *lb1;
    UIButton *button;
}
@end

@implementation ViewController

- (NSString *)tabImageName
{
	return @"image-1";
}

- (NSString *)tabTitle
{
    self.title = @"Profile";
	return self.title;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIView *bgview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    bgview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgview];
    lb1 = [[UILabel alloc] init];
    button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    lb1.text = NSLocalizedString(@"demo", @"lb1 name");
    lb1.frame = CGRectMake(20, 20, 200, 30);
    [button setTitle:NSLocalizedString(@"enter", @"button name") forState:UIControlStateNormal];
    button.frame = CGRectMake(20, 60, 100, 30);
    [bgview addSubview:lb1];
    [bgview addSubview:button];
    
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
