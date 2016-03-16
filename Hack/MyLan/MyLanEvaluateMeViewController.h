//
//  MyLanEvaluateMeViewController.h
//  MyLan
//
//  Created by TSI on 15/03/16.
//  Copyright © 2016 CTS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyLanCircularProgressView.h"
#import <QuartzCore/QuartzCore.h>
#import "MyLanEvaluateTableViewCell.h"

@interface MyLanEvaluateMeViewController : UIViewController{
   
    NSTimer* m_timer;
}
@property (nonatomic,strong)IBOutlet UILabel * questionNumber;
@property (nonatomic,strong)IBOutlet UILabel * points;
@property (nonatomic,strong)IBOutlet MyLanCircularProgressView* circularProgressView;
@property (nonatomic,strong)IBOutlet UIImageView * questionView;
@property (nonatomic,strong)IBOutlet UITableView * questionAnsOptionList;

@end
