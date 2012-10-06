//
//  RAKalViewController.h
//  RAKalInput
//
//  Created by Evadne Wu on 10/5/12.
//  Copyright (c) 2012 Radius. All rights reserved.
//

#import "KalViewController.h"
#import "RAKalViewControllerDelegate.h"

@class RAKalView;
@interface RAKalViewController : KalViewController

@property (nonatomic, readwrite, weak) id<RAKalViewControllerDelegate> delegate;
@property (nonatomic, readwrite, strong) RAKalView *view;

@end
