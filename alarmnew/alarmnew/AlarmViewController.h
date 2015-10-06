//
//  AlarmViewController.h
//  alarmnew
//
//  Created by Vivek Srinivasan on 24/02/13.
//  Copyright (c) 2013 Vivek Srinivasan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlarmViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *hourLabel;
@property (strong, nonatomic) IBOutlet UILabel *minLabel;

@property (strong, nonatomic) IBOutlet UILabel *hourTrack;
@property (strong, nonatomic) IBOutlet UILabel *minTrack;

@property (strong, nonatomic) UISwipeGestureRecognizer *hourUp;
@property (strong, nonatomic) UISwipeGestureRecognizer *hourDown;
@property (strong, nonatomic) UISwipeGestureRecognizer *minUp;
@property (strong, nonatomic) UISwipeGestureRecognizer *minDown;

@property int swipe;

-(void)initFunc;
//-(void)handleSwipes:(UISwipeGestureRecognizer *)sender;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (UIImage *)radialGradientImage:(CGSize)size start:(float)start end:(float)end centre:(CGPoint)centre radius:(float)radius;

@end
