//
//  RAKalViewController.m
//  RAKalInput
//
//  Created by Evadne Wu on 10/5/12.
//  Copyright (c) 2012 Radius. All rights reserved.
//

#import "KalDate.h"
#import "KalGridView.h"
#import "KalTileView.h"
#import "RAKalViewController.h"
#import "RAKalView.h"

@interface KalGridView (RAKalViewController_KnownPrivate)
@property (nonatomic, retain) KalTileView *selectedTile;
@property (nonatomic, retain) KalTileView *highlightedTile;
@end

@implementation RAKalViewController
@dynamic delegate, view;

+ (Class) kalViewClass {

	return [RAKalView class];

}

- (void) viewDidLoad {

	[super viewDidLoad];
	
	self.view.autoresizingMask = UIViewAutoresizingNone;

}

- (void) didSelectDate:(KalDate *)date {

	if (![self isViewLoaded])
		return;
	
	if (!self.view.window)
		return;
	
	[self.view sizeToFit];

	NSLog(@"%s: %@, selected %@, highlighted %@", __PRETTY_FUNCTION__, date, self.view.gridView.selectedTile, self.view.gridView.highlightedTile);

	[self.delegate kalViewController:self didSelectDate:[date NSDate]];		

}

@end
