//
//  RAKalView.m
//  RAKalInput
//
//  Created by Evadne Wu on 10/5/12.
//  Copyright (c) 2012 Radius. All rights reserved.
//

#import "RAKalView.h"
#import "KalGridView.h"
#import "KalLogic.h"

@implementation RAKalView

- (id) initWithFrame:(CGRect)frame delegate:(id<KalViewDelegate>)theDelegate logic:(KalLogic *)theLogic {

	self = [super initWithFrame:frame delegate:theDelegate logic:theLogic];
	
	if (!self)
		return nil;
	
	[tableView removeFromSuperview];
	[shadowView removeFromSuperview];
	
	return self;

}

- (KalGridView *) gridView {

	return gridView;

}

@end
