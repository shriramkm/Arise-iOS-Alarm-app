//
//  AlarmAppDelegate.h
//  alarmnew
//
//  Created by Vivek Srinivasan on 24/02/13.
//  Copyright (c) 2013 Vivek Srinivasan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AlarmViewController;

@interface AlarmAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) AlarmViewController *viewController;

@end
