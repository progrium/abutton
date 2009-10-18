//
//  AwesomeButtonViewController.m
//  AwesomeButton
//
//  Created by awixted on 5/24/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "AwesomeButtonViewController.h"

#define MAX_INTERVAL_MILLIS 10000
#define MIN_INTERVAL_SECONDS 2
#define ONE_SECOND_IN_MILLIS 1000
#define LIGHT_ON_SECONDS 1.0f

// private methods
@interface AwesomeButtonViewController ()
- (void)turnLightOff:(NSTimer*)lightOffTimer;
@end


@implementation AwesomeButtonViewController

@synthesize nextFireDate;


// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}




// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self turnLightOff:nil];
}






- (void)turnLightOn:(NSTimer*)theTimer
{
	
	// show the green light for its designated on time and set a timer to turn it off
	greenLight.hidden = NO;
	redLight.hidden = YES;
	
	
	[NSTimer scheduledTimerWithTimeInterval:LIGHT_ON_SECONDS target:self selector:@selector(turnLightOff:) userInfo:theTimer repeats:NO];
}








- (void)turnLightOff:(NSTimer*)lightOffTimer
{
	
	
	
	// turn the light back off
	greenLight.hidden = YES;
	redLight.hidden = NO;

	
	
	numGreenLights++;
	[numLightsLabel setText:[NSString stringWithFormat:@"light #%d", numGreenLights]];
	
	
	
	
	// get the other timer out of the userInfo obj because we put it there in the turnLightOn method
	NSTimer *theTimer = [lightOffTimer userInfo];
	if(theTimer == nil)
	{
		// if it's nil, that means this is the first time this method has been called (program just started)
		// so create it here
		theTimer = [NSTimer scheduledTimerWithTimeInterval:1000000 target:self selector:@selector(turnLightOn:) userInfo:nil repeats:YES];
	}
	
	// create the random next fire time as a value between 0 and 10 seconds
	NSDate *now = [NSDate date];
	u_int32_t tmp = arc4random();
	tmp %= MAX_INTERVAL_MILLIS;
	double numSeconds = ((double)tmp) / ONE_SECOND_IN_MILLIS;
	numSeconds += MIN_INTERVAL_SECONDS;
	
	
	NSLog(@"numSeconds til next fire: %f", numSeconds);
	NSDate *theNextFireDate = [now addTimeInterval:numSeconds];
	[theTimer setFireDate:theNextFireDate];
	
	
	// keep track of the next fire date so that we can tell the user how early they were
	self.nextFireDate = theNextFireDate;
	
	
}





-(IBAction) awesomeButtonPressed
{
	
	NSTimeInterval difference = [nextFireDate timeIntervalSinceNow];
	
	numTimesPressed++;
	totalEarliness += difference;
	
	float averageEarliness = totalEarliness / numTimesPressed;
	
	if(difference < 0)
	{
		[earlyLabel setText:@""];
	}
	else
	{
		
		[earlyLabel setText:[NSString stringWithFormat:@"you were %.2f seconds early!", difference]];
		
		[averageLabel setText:[NSString stringWithFormat:@"average earliness: %.2f seconds", averageEarliness]];
		
	}
}




- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}







- (void)dealloc {
	[nextFireDate release];
    [super dealloc];

}

@end
