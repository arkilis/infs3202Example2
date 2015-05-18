//
//  ViewController.m
//  infs3202Example2_iBeaonStation
//
//  Created by Ben Liu on 17/05/2015.
//  Copyright (c) 2015 Ben Liu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSDictionary        *beaconData;
    CBPeripheralManager *peripheralManager;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    // UUID
    NSString    *szUUID= @"B558CBDA-4472-4211-A350-FF1196FFE8C8";
    NSUUID      *uuid= [[NSUUID alloc] initWithUUIDString:szUUID];
    
    // Major and Minor value
    CLBeaconRegion *beaconRegion= [[CLBeaconRegion alloc] initWithProximityUUID:uuid
                                                                          major:7
                                                                          minor:4
                                                                     identifier:@"infs3202_7202_example2"];
    
    beaconData= [beaconRegion peripheralDataWithMeasuredPower:nil];
    peripheralManager = [[CBPeripheralManager alloc] initWithDelegate:self
                                                                queue:nil
                                                              options:nil];
    
}



// override method required by CBPeripheralManagerDelegate
-(void)peripheralManagerDidUpdateState:(CBPeripheralManager*)peripheral {
    // if the bluetooth is on
    if (peripheral.state == CBPeripheralManagerStatePoweredOn){
        [peripheralManager startAdvertising:beaconData];
    }
    // if the bluetooth is off
    else if (peripheral.state == CBPeripheralManagerStatePoweredOff){
        [peripheralManager stopAdvertising];
    }
    // not supported
    else if(peripheral.state == CBPeripheralManagerStateUnsupported) {
        self.labelStatus.text= @"Not supported"; 
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnFresh:(id)sender {
    // load url
    NSURL *url = [NSURL URLWithString:@"https://docs.google.com/spreadsheets/d/1ljYItOgjnQv0H3afrcDDypGmVBTepCZ6Mw4Bb88zPlU"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.myWebView loadRequest:request];
}


@end
