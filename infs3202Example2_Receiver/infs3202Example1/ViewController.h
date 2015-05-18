//
//  ViewController.h
//  infs3202Example1
//
//  Created by Ben Liu on 17/05/2015.
//  Copyright (c) 2015 Ben Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>



@interface ViewController : UIViewController <CLLocationManagerDelegate>

@property (strong, nonatomic) IBOutlet UIWebView *myWebView;
@property (strong, nonatomic) IBOutlet UILabel *labelStatus;


@end

