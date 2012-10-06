//
//  RAKalInputViewController.m
//  RAKalInput
//
//  Created by Evadne Wu on 10/5/12.
//  Copyright (c) 2012 Radius. All rights reserved.
//

#import "RAKalInputViewController.h"
#import "RAKalView.h"
#import "RAKalViewController.h"

@interface RAKalInputViewController () <RAKalViewControllerDelegate>
@property (nonatomic, readonly, strong) RAKalViewController *kalViewController;
@end

@implementation RAKalInputViewController
@synthesize kalViewController = _kalViewController;
@synthesize delegate = _delegate;

- (void) viewDidLoad {

	[super viewDidLoad];
	
	RAKalViewController *kalVC = self.kalViewController;
		
	[self addChildViewController:kalVC];
	[self.view addSubview:kalVC.view];
	[kalVC.view sizeToFit];
	
	self.view.autoresizingMask = UIViewAutoresizingNone;
	self.view.frame = kalVC.view.bounds;
	self.view.clipsToBounds = YES;
	
	kalVC.view.frame = self.view.bounds;

}

- (void) viewWillAppear:(BOOL)animated {

	[self addObserver:self forKeyPath:@"kalViewController.view.frame" options:NSKeyValueObservingOptionInitial|NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:(void *)self];

}

- (void) viewWillDisappear:(BOOL)animated {

	[self removeObserver:self forKeyPath:@"kalViewController.view.frame" context:(void *)self];

}

- (RAKalViewController *) kalViewController {

	if (!_kalViewController) {
	
		_kalViewController = [[RAKalViewController alloc] initWithSelectedDate:[NSDate date]];
		
		_kalViewController.delegate = self;
		
	}
	
	return _kalViewController;

}

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {

	if (object == self) {
		
		if ([keyPath isEqualToString:@"kalViewController.view.frame"]) {
		
			NSValue *fromValue = [change objectForKey:NSKeyValueChangeOldKey];
			NSValue *toValue = [change objectForKey:NSKeyValueChangeNewKey];
			CGRect fromRect = [fromValue CGRectValue];
			CGRect toRect = [toValue CGRectValue];
			
			if (fromValue && toValue)
				if (CGSizeEqualToSize(fromRect.size, toRect.size))
					return;
			
			BOOL isInitial = (!fromValue && toValue);
			
			CGRect fromFrame = self.view.frame;
			CGRect toFrame = self.kalViewController.view.frame;
			
			NSTimeInterval duration = isInitial ? 0.0f : 0.5f;
			NSTimeInterval delay = 0.0f;
			UIViewAnimationOptions options = UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionBeginFromCurrentState|UIViewAnimationOptionCurveLinear;
			
			CGFloat heightDelta = CGRectGetHeight(toFrame) - CGRectGetHeight(fromFrame);
			
			CGRect toContainerFrame = self.view.superview.frame;
			toContainerFrame.origin.y -= heightDelta;
			toContainerFrame.size.height += heightDelta;
			
			[UIView animateWithDuration:duration delay:delay options:options animations:^{
				
				self.view.frame = toFrame;
				[self.view.superview layoutSubviews];
				
				self.view.frame = CGRectOffset(
					toFrame,
					0,
					CGRectGetHeight(self.view.superview.bounds) - CGRectGetHeight(toFrame)
				);
				
			} completion:^(BOOL finished) {
				
			}];
		
		}
	
	}

}

- (void) kalViewController:(RAKalViewController *)controller didSelectDate:(NSDate *)date {

	[self.delegate kalInputViewController:self didSelectDate:date];

}

@end
