//
//  MyLanAppDelegate.h
//  MyLan
//
//  Created by TSI on 15/03/16.
//  Copyright © 2016 CTS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface MyLanAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong, nonatomic)  UITabBarController * tabBarController;
@property (strong, nonatomic)  UITabBarController * tabBarControllerBeforeLogin;
@property (assign, nonatomic)  BOOL * isloggedIn;
-(void)setupTabbarControllerWithRootView:(int)viewControllerIndex;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
