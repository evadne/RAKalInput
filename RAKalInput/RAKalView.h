//
//  RAKalView.h
//  RAKalInput
//
//  Created by Evadne Wu on 10/5/12.
//  Copyright (c) 2012 Radius. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import "KalView.h"

@class KalGridView;
@interface RAKalView : KalView

@property (nonatomic, readonly, strong) KalGridView *gridView;

@end
