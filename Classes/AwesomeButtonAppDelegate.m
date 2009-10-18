//
//  AwesomeButtonAppDelegate.m
//  AwesomeButton
//
//  Created by awixted on 5/24/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "AwesomeButtonAppDelegate.h"
#import "AwesomeButtonViewController.h"

@implementation AwesomeButtonAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
