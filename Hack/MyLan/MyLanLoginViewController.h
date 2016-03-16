//
//  MyLanLoginViewController.h
//  MyLan
//
//  Created by IR Mac Mini on 16/03/16.
//  Copyright © 2016 CTS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyLanLoginViewController : UIViewController

@property (nonatomic,weak) IBOutlet UITextField *txtFieldUserName;
@property (nonatomic,weak) IBOutlet UITextField *txtFieldPassword;

-(IBAction) loginPressed:(id)sender;
-(IBAction) signUpPressed:(id)sender;
-(IBAction) forgotPasswordressed:(id)sender;

@end
