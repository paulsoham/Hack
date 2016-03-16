//
//  MyLanMyCommunityViewController.m
//  MyLan
//
//  Created by TSI on 15/03/16.
//  Copyright © 2016 CTS. All rights reserved.
//

#import "MyLanMyCommunityViewController.h"

@interface MyLanMyCommunityViewController ()
@property (nonatomic, strong) NSMutableArray *messages;
@end



@implementation MyLanMyCommunityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"My Community";
    
    
    self.messages = [[NSMutableArray alloc] initWithObjects:
                     [MyLanBubbleMessage messageWithString:@"How is that bubble component of yours coming along?" image:[UIImage imageNamed:@"face1.jpeg"]authorName:@"Steve"],
                     
                     
                    [MyLanBubbleMessage messageWithString:@"Great, I just finished avatar support." image:[UIImage imageNamed:@"face2.jpeg"]authorName:@"Kath"],
    
    
                     [MyLanBubbleMessage messageWithString:@"That is awesome! I hope people will like that addition." image:[UIImage imageNamed:@"face3.jpeg"]authorName:@"Krish"],
                     
    
                     [MyLanBubbleMessage messageWithString:@"Now you see me.." image:[UIImage imageNamed:@"face4.jpeg"] authorName:@"Lee"],
                     
                     [MyLanBubbleMessage messageWithString:@"And now you don't. :)" image:[UIImage imageNamed:@"face5.jpeg"] authorName:@"Jon"],
                     nil ];
    
    
    self.communityTable.backgroundColor = [UIColor colorWithRed:219.0f/255.0f green:226.0f/255.0f blue:237.0f/255.0f alpha:1.0f];
    self.communityTable.separatorStyle = UITableViewCellSeparatorStyleNone;

}

#pragma mark - UITableViewDatasource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.messages count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Bubble Cell";
    
    MyLanBubbleTableViewCell *cell = (MyLanBubbleTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[MyLanBubbleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.backgroundColor = self.communityTable.backgroundColor;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
       // cell.dataSource = self;
       // cell.delegate = self;
    }
    
    MyLanBubbleMessage *message = [self.messages objectAtIndex:indexPath.row];
    
    cell.textLabel.font = [UIFont systemFontOfSize:14.0f];
   // cell.textLabel.text = message.message;
    cell.textLabel.text = [NSString stringWithFormat:@"%@\n%@",message.authorName,message.message];
    [cell.textLabel boldSubstring:message.authorName];
    cell.imageView.image = message.avatar;
   // cell.authorName.text = message.authorName;
    
    // Put your own logic here to determine the author
    if(indexPath.row % 2 != 0 || indexPath.row == 4)
    {
        cell.authorType = STBubbleTableViewCellAuthorTypeSelf;
        cell.bubbleColor = STBubbleTableViewCellBubbleColorGreen;
    }
    else
    {
        cell.authorType = STBubbleTableViewCellAuthorTypeOther;
        cell.bubbleColor = STBubbleTableViewCellBubbleColorGray;
    }
    
    return cell;
}


#pragma mark - UITableViewDelegate methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyLanBubbleMessage *message = [self.messages objectAtIndex:indexPath.row];
    
    CGSize size;
    
    if(message.avatar)
    {
        size = [message.message boundingRectWithSize:CGSizeMake(self.communityTable.frame.size.width - [self minInsetForCell:nil atIndexPath:indexPath] - STBubbleImageSize - 8.0f - STBubbleWidthOffset, CGFLOAT_MAX)
                                             options:NSStringDrawingUsesLineFragmentOrigin
                                          attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0f]}
                                             context:nil].size;
    }
    else
    {
        size = [message.message boundingRectWithSize:CGSizeMake(self.communityTable.frame.size.width - [self minInsetForCell:nil atIndexPath:indexPath] - STBubbleWidthOffset, CGFLOAT_MAX)
                                             options:NSStringDrawingUsesLineFragmentOrigin
                                          attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0f]}
                                             context:nil].size;
    }
    
    // This makes sure the cell is big enough to hold the avatar
    if(size.height + 15.0f < STBubbleImageSize + 4.0f && message.avatar)
    {
        return STBubbleImageSize + 4.0f;
    }
    
    return size.height + 15.0f;
}

#pragma mark - STBubbleTableViewCellDataSource methods

- (CGFloat)minInsetForCell:(MyLanBubbleTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    if(UIInterfaceOrientationIsLandscape(self.interfaceOrientation))
    {
        return 100.0f;
    }
    
    return 50.0f;
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
