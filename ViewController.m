//
//  ViewController.m
//  LocationManagerUtility
//
//  Created by Christopher on 3/9/12.
//  Copyright (c) 2012,2013 Christopher Olsen. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize locationManager;
@synthesize LatitudeDisplay;
@synthesize LongitudeDisplay;
@synthesize AccuracyDisplay;
@synthesize TimeStampDisplay;
@synthesize LMDesiredAccuracyDisplay;
@synthesize TimeBetweenDisplay;
@synthesize ModeDisplay;



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setLatitudeDisplay:nil];
    [self setLongitudeDisplay:nil];
    [self setAccuracyDisplay:nil];
    [self setTimeStampDisplay:nil];
    [self setTimeBetweenDisplay:nil];
    [self setModeDisplay:nil];
    [self setLMDesiredAccuracyDisplay:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Location Manager

- (IBAction)StartLocationManagerButton:(id)sender 
{
    NSLog(@"StartLocationMangerButton, locationManager = %@", locationManager);
    if (!locationManager)
    {
        locationManager = [[CLLocationManager alloc] init];
        locationManager.delegate = self;
    }
    else
    {
        [locationManager stopUpdatingLocation];
    }
    NSLog(@"locationManager = %@", locationManager);
    [locationManager startUpdatingLocation];
    ModeDisplay.text = @"Best";
}

- (IBAction)IncreaseDesiredAccuracyButton:(id)sender 
{
    int desiredAccuracy = [[NSNumber numberWithDouble:self.locationManager.desiredAccuracy] intValue];
    NSLog(@"increaseLocationManagerAccuracy bfore switch statement desiredAccuracy = %i",desiredAccuracy);
    switch (desiredAccuracy) 
    {
        case (3000):
            self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
            ModeDisplay.text = @"Kilometer";
            break;
        case (1000):
            self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
            ModeDisplay.text = @"Hundred Meters";
            break;
        case (100):
            self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
            ModeDisplay.text = @"Nearest Ten Meters";
            break;
        case (10):
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
            ModeDisplay.text = @"Best";
            break;
        case (-1):
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
            ModeDisplay.text = @"BestForNavigation";
            break;
        case (-2):
            break;
        default:
            NSLog(@"increaseLocationManagerAccuracy switch statement default");
            break;
    }
}

- (IBAction)DecreaseDesiredAccuracyButton:(id)sender 
{
    int desiredAccuracy = [[NSNumber numberWithDouble:self.locationManager.desiredAccuracy] intValue];
    NSLog(@"increaseLocationManagerAccuracy bfore switch statement desiredAccuracy = %i",desiredAccuracy);
    switch (desiredAccuracy) 
    {
        case (3000):
            //this could go to significant location changes
            break;
        case (1000):
            NSLog(@"decreasing Location Manager desired accuracy to One Hundred Meters");
            self.locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers;
            ModeDisplay.text = @"Three Kilometers";
            break;
        case (100):
            self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
            ModeDisplay.text = @"Kilometer";
            break;
        case (10):
            self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
            ModeDisplay.text = @"Hundred Meters";
            break;
        case (-1):
            self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
            ModeDisplay.text = @"Nearest Ten Meters";
            break;
        case (-2):
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
            ModeDisplay.text = @"Best";
            break;
        default:
            NSLog(@"increaseLocationManagerAccuracy switch statement default");
            break;
    }
}

- (IBAction)stopLocationManagerButton:(id)sender 
{
    [locationManager stopUpdatingLocation];
    LatitudeDisplay.text  = nil;
    LongitudeDisplay.text = nil;
    AccuracyDisplay.text  = nil;
    TimeStampDisplay.text = nil;
}

#pragma mark - Display Methods

-(void)updateDisplays
{
    //if needed
}

/*-(void)displayDesiredAccuracy
{
    int desiredAccuracy = [[NSNumber numberWithDouble:self.locationManager.desiredAccuracy] intValue];
    NSLog(@"increaseLocationManagerAccuracy bfore switch statement desiredAccuracy = %i",desiredAccuracy);
    NSString*desiredAccuracyString;
    switch (desiredAccuracy) 
    {
        case (3000):
            desiredAccuracyString = @"Three Kilometers";
            break;
        case (1000):
            desiredAccuracyString = @"Kilometer";
            break;
        case (100):
            desiredAccuracyString = @"One Hundred Meters";
            break;
        case (10):
            desiredAccuracyString = @"Nearest Ten Meters";
            break;
        case (-1):
            desiredAccuracyString = @"Best";
            break;
        case (-2):
            desiredAccuracyString = @"Best For Navigation";
            break;
        default:
            NSLog(@"there's something happening here");
            break;
    }
    LMDesiredAccuracyDisplay.text = desiredAccuracyString;
}*/

#pragma mark -CLLocationManger Delegate

- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"new location = %@", newLocation);
    LatitudeDisplay.text  = [NSString stringWithFormat:@"%f", newLocation.coordinate.latitude];
    LongitudeDisplay.text = [NSString stringWithFormat:@"%f", newLocation.coordinate.longitude];
    AccuracyDisplay.text  = [NSString stringWithFormat:@"%f", newLocation.horizontalAccuracy];
    LMDesiredAccuracyDisplay.text = [NSString stringWithFormat:@"%0.0f",locationManager.desiredAccuracy];
    
    
    
    NSDateFormatter*dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateStyle:NSDateFormatterNoStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    NSString*newUpdateTimeStamp = [dateFormatter stringFromDate:newLocation.timestamp];
    TimeStampDisplay.text = newUpdateTimeStamp;
    
    //time interval between updates
    NSTimeInterval timeBetween = [newLocation.timestamp timeIntervalSinceDate:oldLocation.timestamp];
    TimeBetweenDisplay.text = [NSString stringWithFormat:@"%f seconds", timeBetween];
}


@end
