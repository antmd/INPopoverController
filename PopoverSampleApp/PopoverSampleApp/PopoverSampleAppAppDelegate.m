//
//  PopoverSampleAppAppDelegate.m
//  Copyright 2011-2014 Indragie Karunaratne. All rights reserved.
//

#import "PopoverSampleAppAppDelegate.h"
#import "ContentViewController.h"
#import <INPopoverController/INPopoverController.h>

@implementation PopoverSampleAppAppDelegate {
        NSUInteger _resizeMask;
}
@synthesize window, popoverController;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
        _resizeMask = NSViewMinXMargin | NSViewMaxXMargin | NSViewMinYMargin | NSViewMaxYMargin | NSViewWidthSizable | NSViewHeightSizable;
        self.popoverController.resizingMask = _resizeMask;
    ContentViewController *viewController = [[ContentViewController alloc] initWithNibName:@"ContentViewController" bundle:nil];
    self.popoverController = [[INPopoverController alloc] initWithContentViewController:viewController];
        self.popoverController.resizingMask = _resizeMask;
}

- (IBAction)togglePopover:(id)sender
{
    if (self.popoverController.popoverIsVisible) {
        [self.popoverController closePopover:nil];
    } else {
        [self.popoverController presentPopoverFromRect:[sender bounds] inView:sender preferredArrowDirection:INPopoverArrowDirectionLeft anchorsToPositionView:YES];
    }
}

- (IBAction)changeResizeMask:(id)sender {
        _resizeMask = _resizeMask ^ [sender tag];
        self.popoverController.resizingMask = _resizeMask;
}

@end
