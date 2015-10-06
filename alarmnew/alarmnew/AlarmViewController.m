//
//  AlarmViewController.m
//  alarmnew
//
//  Created by Vivek Srinivasan on 24/02/13.
//  Copyright (c) 2013 Vivek Srinivasan. All rights reserved.
//

#import "AlarmViewController.h"

@interface AlarmViewController ()

@end

@implementation AlarmViewController

@synthesize hourLabel;
@synthesize minLabel;
@synthesize hourTrack;
@synthesize minTrack;
@synthesize hourUp;
@synthesize hourDown;
@synthesize minUp;
@synthesize minDown;
@synthesize swipe;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    swipe = 0;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    CGPoint touchPoint = [[touches anyObject] locationInView:self.view];
    if (touchPoint.x > hourTrack.frame.origin.x &&
        touchPoint.x < hourTrack.frame.origin.x + hourTrack.frame.size.width &&
        touchPoint.y > hourTrack.frame.origin.y &&
        touchPoint.y < hourTrack.frame.origin.y + hourTrack.frame.size.height){
        
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    swipe++;
    if(swipe%3==0){
        CGPoint touchPoint = [[touches anyObject] locationInView:self.view];
        CGPoint prevtouchPoint = [[touches anyObject] previousLocationInView:self.view];
        if(swipe%9==0){
            if (touchPoint.x > hourTrack.frame.origin.x &&
                touchPoint.x < hourTrack.frame.origin.x + hourTrack.frame.size.width &&
                touchPoint.y > hourTrack.frame.origin.y &&
                touchPoint.y < hourTrack.frame.origin.y + hourTrack.frame.size.height){
                int hr = ([self.hourLabel.text intValue]%12);
                if(prevtouchPoint.y < touchPoint.y){
                    self.hourLabel.text = [[NSString alloc]initWithFormat:@"%02d",++hr];
                }
                else if(prevtouchPoint.y > touchPoint.y){
                    hr--;
                    if(hr<=0){
                        hr+=12;
                    }
                    self.hourLabel.text = [[NSString alloc]initWithFormat:@"%02d",hr];
                }
            }
        }
        if (touchPoint.x > minTrack.frame.origin.x &&
            touchPoint.x < minTrack.frame.origin.x + minTrack.frame.size.width &&
            touchPoint.y > minTrack.frame.origin.y &&
            touchPoint.y < minTrack.frame.origin.y + minTrack.frame.size.height){
            int min = ([self.minLabel.text intValue]%60);
            if(prevtouchPoint.y < touchPoint.y){
                min=(++min)%60;
                self.minLabel.text = [[NSString alloc]initWithFormat:@"%02d",min];
                if(min==0){
                }
            }
            else if(prevtouchPoint.y > touchPoint.y){
                min--;
                if(min<=0){
                    min+=60;
                }
                min%=60;
                self.minLabel.text = [[NSString alloc]initWithFormat:@"%02d",min];
            }
        }
    }
}

    - (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
        NSLog(@"Ended");
    }


- (UIImage *)radialGradientImage:(CGSize)size start:(float)start end:(float)end centre:(CGPoint)centre radius:(float)radius {
    // Render a radial background
    
    // Initialise
    UIGraphicsBeginImageContextWithOptions(size, YES, 1);
    
    // Create the gradient's colours
    size_t num_locations = 2;
    CGFloat locations[2] = { 0.0, 1.0 };
    CGFloat components[8] = { 1.0,1.0,1.0, 1.0,  // Start color
        1.0,1.0,1.0, 0.9 }; // End color
    
    CGColorSpaceRef myColorspace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef myGradient = CGGradientCreateWithColorComponents (myColorspace, components, locations, num_locations);
    
    // Normalise the 0-1 ranged inputs to the width of the image
    CGPoint myCentrePoint = CGPointMake(centre.x * size.width, centre.y * size.height);
    float myRadius = MIN(size.width, size.height) * radius;
    
    // Draw it!
    CGContextDrawRadialGradient (UIGraphicsGetCurrentContext(), myGradient, myCentrePoint,
                                 0, myCentrePoint, myRadius,
                                 kCGGradientDrawsAfterEndLocation);
    
    // Grab it as an autoreleased image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // Clean up
    CGColorSpaceRelease(myColorspace); // Necessary?
    CGGradientRelease(myGradient); // Necessary?
    UIGraphicsEndImageContext(); // Clean up
    return image;
}
    
    @end
