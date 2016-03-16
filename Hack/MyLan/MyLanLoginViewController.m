//
//  MyLanLoginViewController.m
//  MyLan
//
//  Created by IR Mac Mini on 16/03/16.
//  Copyright © 2016 CTS. All rights reserved.
//

#import "MyLanLoginViewController.h"
#import "MyLanSignUpViewController.h"
#import "MyLanAppDelegate.h"

@interface MyLanLoginViewController ()

@end

@implementation MyLanLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) loginPressed:(id)sender{
    NSLog(@"Login pressed");
   // if([_txtFieldUserName.text isEqualToString:@""] || [_txtFieldPassword.text isEqualToString:@""]){
        //return;
    //}else{
        MyLanAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        appDelegate.isloggedIn = true;
        [appDelegate setupTabbarControllerWithRootView:0];
    //}
}
-(IBAction) signUpPressed:(id)sender{
    NSLog(@"signup pressed");
    MyLanAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [appDelegate.tabBarControllerBeforeLogin setSelectedIndex:1];
}
-(IBAction) forgotPasswordressed:(id)sender{
    NSLog(@"Forgot password pressed");
}

-(void)navigateToHome{
    
}

@end
