//
//  ViewControllerB.m
//  NavigationBarStyleKeeper
//
//  Created by 王嘉宁 on 2019/7/18.
//  Copyright © 2019 Johnny. All rights reserved.
//

#import "ViewControllerB.h"
#import "ViewControllerA.h"
#import "ViewControllerC.h"
#import "UIViewController+CustomStyle.h"

@interface ViewControllerB ()

@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *goToAVCButton;
@property (weak, nonatomic) IBOutlet UIButton *goToCVCButton;

@end

@implementation ViewControllerB

- (void)viewDidLoad {
    [super viewDidLoad];
    [self pr_renderAction];
    [self showPrimerStyle];
    NSLog(@"%@ view did load", NSStringFromClass(self.class));
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"%@ view will appear", NSStringFromClass(self.class));
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"%@ view did appear", NSStringFromClass(self.class));
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"%@ view will disappear", NSStringFromClass(self.class));
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"%@ view did disappear", NSStringFromClass(self.class));
}

- (void)pr_renderAction
{
    [self.backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.goToAVCButton addTarget:self action:@selector(goToAAction) forControlEvents:UIControlEventTouchUpInside];
    [self.goToCVCButton addTarget:self action:@selector(goToCAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)backAction
{
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)goToAAction
{
    ViewControllerA *aVC = [[ViewControllerA alloc] init];
    if (self.navigationController) {
        [self.navigationController pushViewController:aVC animated:YES];
    }
}

- (void)goToCAction
{
    ViewControllerC *cVC = [[ViewControllerC alloc] init];
    if (self.navigationController) {
        [self.navigationController pushViewController:cVC animated:YES];
    }
}

@end
