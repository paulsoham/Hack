//
//  LanguageSelectionViewController.h
//  MyLan
//
//  Created by IR Mac Mini on 16/03/16.
//  Copyright © 2016 CTS. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MyLanLanguageSelectionViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,weak) IBOutlet UITableView *languageListView;
-(IBAction)showLanguageList;
@end
