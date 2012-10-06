//
//  RAKalInputViewController.h
//  RAKalInput
//
//  Created by Evadne Wu on 10/5/12.
//  Copyright (c) 2012 Radius. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import "RAKalInputViewControllerDelegate.h"

@interface RAKalInputViewController : UIViewController

@property (nonatomic, readwrite, weak) id<RAKalInputViewControllerDelegate> delegate;

@end
