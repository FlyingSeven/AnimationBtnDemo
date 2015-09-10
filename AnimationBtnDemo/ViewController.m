//
//  ViewController.m
//  AnimationBtnDemo
//
//  Created by Seven on 7/29/15.
//  Copyright (c) 2015 Seven. All rights reserved.
//

#import "ViewController.h"
#import "UIView+ReversalAnimation.h"
#import "UIButton+ReversalAnimation.h"

@interface ViewController ()
{
    UIView *_ss;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _ss = [[UIView alloc] init];
    _ss.frame = CGRectMake( 100, 100, 100, 100);
    _ss.backgroundColor = [UIColor blackColor];
    _ss.layer.cornerRadius = 50.0;
    _ss.layer.borderWidth = 1.0;
    _ss.layer.borderColor = [UIColor whiteColor].CGColor;
    _ss.layer.masksToBounds = YES;
    [self.view addSubview:_ss];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)reversal:(UIButton *)sender {
    [_ss reversalsBtnWithDuration:1.f];
    
    [sender reversalBtnWithDuration:0.5f];
    [sender changeTheImgWithBlock:^{
        sender.backgroundColor = [UIColor magentaColor];
    }];
    

}

@end
