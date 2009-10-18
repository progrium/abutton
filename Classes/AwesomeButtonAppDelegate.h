//
//  AwesomeButtonAppDelegate.h
//  AwesomeButton
//
//  Created by awixted on 5/24/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AwesomeButtonViewController;

@interface AwesomeButtonAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    AwesomeButtonViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet AwesomeButtonViewController *viewController;

@end

