//
//  ViewController.h
//  infs3202Example2_iBeaonStation
//
//  Created by Ben Liu on 17/05/2015.
//  Copyright (c) 2015 Ben Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface ViewController : UIViewController <CBPeripheralManagerDelegate>


@property (strong, nonatomic) IBOutlet UIWebView *myWebView;
@property (strong, nonatomic) IBOutlet UISwitch *swt;
@property (strong, nonatomic) IBOutlet UILabel *labelStatus;

@end

