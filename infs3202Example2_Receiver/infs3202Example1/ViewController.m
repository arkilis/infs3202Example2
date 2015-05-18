//
//  ViewController.m
//  infs3202Example1
//
//  Created by Ben Liu on 17/05/2015.
//  Copyright (c) 2015 Ben Liu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSString *szUUID;
    NSString *szURL;
    CLLocationManager   *locationManager;
    CLBeaconRegion      *myBeaconRegion;
    BOOL     bLoaded;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // UUID
    szUUID=     @"B558CBDA-4472-4211-A350-FF1196FFE8C8";
    NSUUID      *uuid= [[NSUUID alloc] initWithUUIDString:szUUID];
    
    // set up a iBeacon region with UUID
    myBeaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:uuid
                                                        identifier:@"infs3202_7202_example2"];
    
    bLoaded= NO;
    // Tell location manager to start monitoring for the beacon region
    locationManager= [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    [locationManager startMonitoringForRegion:myBeaconRegion];
    [locationManager startRangingBeaconsInRegion:myBeaconRegion];
    [locationManager requestWhenInUseAuthorization];
    [locationManager requestAlwaysAuthorization];

}

// When found region
-(void)locationManager:(CLLocationManager*)manager
       didRangeBeacons:(NSArray*)beacons
              inRegion:(CLBeaconRegion*)region {
    
    for (CLBeacon *beacon in beacons) {
        if([[beacon.proximityUUID UUIDString] isEqualToString:szUUID] &&
           [beacon.major isEqual:@7] &&
           [beacon.minor isEqual:@4] &&
           bLoaded==NO){
            
            self.labelStatus.text= @"Found iBeacon Station";
            NSURL *url = [NSURL URLWithString:@"https://docs.google.com/forms/d/1YBzQ3I86FR5VNtg4eNSG_4alIb3PPVjXTzbO9FF_tqs/viewform"];
            NSURLRequest *request = [NSURLRequest requestWithURL:url];
            [self.myWebView loadRequest:request];
            bLoaded= YES;
        }
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
