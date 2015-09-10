//
//  ViewController.h
//  AnimationBtnDemo
//
//  Created by Seven on 7/29/15.
//  Copyright (c) 2015 Seven. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *btn;

- (IBAction)reversal:(UIButton *)sender;

@end

