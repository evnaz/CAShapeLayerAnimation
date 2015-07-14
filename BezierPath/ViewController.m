//
//  ViewController.m
//  BezierPath
//
//  Created by Evgeny on 13.07.15.
//  Copyright (c) 2015 Evgeny Nazarov. All rights reserved.
//

#import "ViewController.h"
#import "CheckMark.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CheckMark *view = [[CheckMark alloc] initWithFrame:CGRectMake(0, 0, 150.f, 150.f)];
    view.center = self.view.center;
    [self.view addSubview:view];
    [view performSelector:@selector(show) withObject:nil afterDelay:0.4];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
