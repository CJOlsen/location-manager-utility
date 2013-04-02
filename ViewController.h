//
//  ViewController.h
//  LocationManagerUtility
//
//  Created by Christopher on 3/9/12.
//  Copyright (c) 2012,2013 Christopher Olsen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController<CLLocationManagerDelegate>

@property (nonatomic, retain) CLLocationManager* locationManager;

@property (weak, nonatomic) IBOutlet UILabel *LatitudeDisplay;
@property (weak, nonatomic) IBOutlet UILabel *LongitudeDisplay;
@property (weak, nonatomic) IBOutlet UILabel *AccuracyDisplay;
@property (weak, nonatomic) IBOutlet UILabel *LMDesiredAccuracyDisplay;
@property (weak, nonatomic) IBOutlet UILabel *TimeStampDisplay;
@property (weak, nonatomic) IBOutlet UILabel *TimeBetweenDisplay;
@property (weak, nonatomic) IBOutlet UILabel *ModeDisplay;


- (IBAction)StartLocationManagerButton:(id)sender;
- (IBAction)IncreaseDesiredAccuracyButton:(id)sender;
- (IBAction)DecreaseDesiredAccuracyButton:(id)sender;
- (IBAction)stopLocationManagerButton:(id)sender;

//-(void)displayDesiredAccuracy;

@end
