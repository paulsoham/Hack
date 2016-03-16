//
//  LanguageSelectionViewController.m
//  MyLan
//
//  Created by IR Mac Mini on 16/03/16.
//  Copyright © 2016 CTS. All rights reserved.
//

#import "MyLanLanguageSelectionViewController.h"

@interface MyLanLanguageSelectionViewController ()

@end

@implementation MyLanLanguageSelectionViewController
{
    NSArray *languageArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    languageArray = [NSArray arrayWithObjects:@"English",@"French",@"German", @"Spanish"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)showLanguageList{
    [_languageListView setHidden:NO];
}

#pragma mark UITableview method
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [languageArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"LanguageCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if (cell == Nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    return cell;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
#pragma mark end

@end
