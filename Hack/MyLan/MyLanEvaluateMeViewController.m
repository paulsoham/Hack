//
//  MyLanEvaluateMeViewController.m
//  MyLan
//
//  Created by TSI on 15/03/16.
//  Copyright © 2016 CTS. All rights reserved.
//

#import "MyLanEvaluateMeViewController.h"

@interface MyLanEvaluateMeViewController ()

@end

@implementation MyLanEvaluateMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Evaluate ME";
    
    _circularProgressView.percent = 60;
    _questionNumber.text = [NSString stringWithFormat:@"2/10 \nQuestions"];
    _questionNumber.layer.cornerRadius = 25;
    _questionNumber.layer.borderWidth = 2;
    _questionNumber.textAlignment = NSTextAlignmentCenter;
    
    _points.text = [NSString stringWithFormat:@"25 \nPoints"];
    _points.layer.cornerRadius = 25;
    _points.layer.borderWidth = 2;
    _points.textAlignment = NSTextAlignmentCenter;

    
    _questionView.layer.borderWidth = 2;
    _questionAnsOptionList.layer.borderWidth = 2;
//new
    
}
- (void)viewDidAppear:(BOOL)animated
{
    // Kick off a timer to count it down
    m_timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(decrementSpin) userInfo:nil repeats:YES];
}

- (void)decrementSpin
{
    // If we can decrement our percentage, do so, and redraw the view
    if (_circularProgressView.percent > 0) {
        _circularProgressView.percent = _circularProgressView.percent - 1;
        [_circularProgressView setNeedsDisplay];
    }
    else {
        [m_timer invalidate];
        m_timer = nil;
    }
}
#pragma mark - UITableViewDatasource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"CellId";
    
    MyLanEvaluateTableViewCell *cell = (MyLanEvaluateTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[MyLanEvaluateTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.backgroundColor = self.questionAnsOptionList.backgroundColor;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    cell.backgroundColor = [UIColor greenColor];
    cell.questionLabel.text = @"Hola";
    return cell;
}

#pragma mark - UITableViewDelegate methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 30.0f;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
