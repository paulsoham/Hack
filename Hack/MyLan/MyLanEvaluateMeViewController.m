//
//  MyLanEvaluateMeViewController.m
//  MyLan
//
//  Created by TSI on 15/03/16.
//  Copyright © 2016 CTS. All rights reserved.
//

#import "MyLanEvaluateMeViewController.h"
#import "MyLanAppDelegate.h"
#import "Question.h"
#import "QuestionOption.h"
#import "MyLanUtility.h"


@interface MyLanEvaluateMeViewController ()

@end

@implementation MyLanEvaluateMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Evaluate ME";
//    [self.questionAnsOptionList registerClass:[MyLanEvaluateTableViewCell class] forCellReuseIdentifier:@"CellId"];
    self.questionAnsOptionList.delegate = self;
    self.questionAnsOptionList.dataSource = self;
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
    
    [self renderJSON];
   // NSLog(@"self.questionDictionary-->>%@",self.questionDictionary);

    [self fetchRecord];
}
-(void)renderJSON{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"evaluateme" ofType:@"json"];
    NSString *myJSON = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    NSError *error =  nil;
    NSDictionary *jsonDataArray = [NSJSONSerialization JSONObjectWithData:[myJSON dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
    self.questionDictionary = jsonDataArray;
    
   
    if (self.questionDictionary) {
        NSMutableArray * questionsArray = [self.questionDictionary objectForKey:@"quiz_questions"];
        if ([questionsArray count] > 0) {
            MyLanAppDelegate *app = (MyLanAppDelegate*)[[UIApplication sharedApplication] delegate];
            NSManagedObjectContext* context = app.managedObjectContext;
            
            for (NSDictionary *quesDict in questionsArray) {
                Question *ques = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([Question class]) inManagedObjectContext:context];
                [ques setQuestion_id:quesDict[@"question_id"]];
                [ques setQuestion_description:quesDict[@"question_description"]];
                [ques setQuestion_image:quesDict[@"question_image"]];
                [ques setAnswer_id:quesDict[@"answer_id"]];
                [ques setQuestion_title:quesDict[@"question_title"]];
                NSMutableSet *tmpSet = [NSMutableSet new];
                for (NSDictionary *ops in quesDict[@"options"]) {
                    QuestionOption *quesOps = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([QuestionOption class]) inManagedObjectContext:context];
                    [quesOps setOption_id:ops[@"option_id"]];
                    [quesOps setOption_detail:ops[@"option_detail"]];
                    [quesOps setOrder:ops[@"order"]];
                    [tmpSet addObject:quesOps];
                }
                [ques setQuesOptions:tmpSet];

            }
            NSError *errors;
            if (![context save:&errors]) {
                NSLog(@"Failed to save - error: %@", [errors localizedDescription]);
            }
        }else{
            return;
        }
    }else{
        return;
    }
    
    

    
    
    
}

-(void)fetchRecord{
    
    MyLanAppDelegate *app = (MyLanAppDelegate*)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext* context = app.managedObjectContext;
    
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Question" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    NSError *error = nil;
    NSArray *result = [context executeFetchRequest:fetchRequest error:&error];
    
    if (error) {
        NSLog(@"Unable to execute fetch request.");
        NSLog(@"%@, %@", error, error.localizedDescription);
        
    } else {
       // NSLog(@"%@", result);
    }
    
    if (result.count > 0) {
        Question *question = (Question *)[result objectAtIndex:1];
       // NSLog(@"-->> %@", question.question_description);

        self.questionViewLbl.text = question.question_description;

    }
    [self.questionAnsOptionList reloadData];
    

    
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
    
    NSString *CellIdentifier = @"CellId";
    
    MyLanEvaluateTableViewCell *cell = (MyLanEvaluateTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
   // cell.backgroundColor = [UIColor greenColor];
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
