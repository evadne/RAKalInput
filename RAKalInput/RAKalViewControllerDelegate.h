//
//  RAKalViewControllerDelegate.h
//  RAKalInput-Sample
//
//  Created by Evadne Wu on 10/5/12.
//  Copyright (c) 2012 Radius. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RAKalViewController;
@protocol RAKalViewControllerDelegate <UITableViewDelegate>

- (void) kalViewController:(RAKalViewController *)controller didSelectDate:(NSDate *)date;

@end
