//
//  AwesomeButtonViewController.h
//  AwesomeButton
//
//  Created by awixted on 5/24/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AwesomeButtonViewController : UIViewController {
	IBOutlet UIButton *awesomeButton;
	IBOutlet UIImageView *redLight;
	IBOutlet UIImageView *greenLight;
	IBOutlet UILabel *earlyLabel;
	IBOutlet UILabel *averageLabel;
	IBOutlet UILabel *numLightsLabel;
	
	NSDate *nextFireDate;
	
	float totalEarliness;
	NSInteger numTimesPressed;
	NSInteger numGreenLights;
}

@property (nonatomic, retain) NSDate *nextFireDate;

-(IBAction) awesomeButtonPressed;

@end

