//
//  MyLanCircularProgressView.m
//  MyLan
//
//  Created by TSI on 15/03/16.
//  Copyright © 2016 CTS. All rights reserved.
//

#import "MyLanCircularProgressView.h"


@interface MyLanCircularProgressView () {
    CGFloat startAngle;
    CGFloat endAngle;
}

@end



@implementation MyLanCircularProgressView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        
        // Determine our start and stop angles for the arc (in radians)
        startAngle = M_PI * 1.5;
        endAngle = startAngle + (M_PI * 2);
        
    }
    return self;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
   NSString* textContent = [NSString stringWithFormat:@"%d", self.percent];
    
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    
    // Create our arc, with the correct angles
    [bezierPath addArcWithCenter:CGPointMake(rect.size.width / 2, rect.size.height / 2)
                          radius:35
                      startAngle:startAngle
                        endAngle:(endAngle - startAngle) * (_percent / 100.0) + startAngle
                       clockwise:YES];
    
    // Set the display for the path, and stroke it
    bezierPath.lineWidth = 5;
    [[UIColor redColor] setStroke];
    [bezierPath stroke];
    
    // Text Drawing
    CGRect textRect = CGRectMake((rect.size.width / 2.0) - 71/2.0, (rect.size.height / 2.0) - 45/2.0, 71, 45);
    [[UIColor blackColor] setFill];
    [textContent drawInRect: textRect withFont: [UIFont fontWithName: @"Helvetica-Bold" size: 35] lineBreakMode: NSLineBreakByWordWrapping alignment: NSTextAlignmentCenter];

}
-(void)awakeFromNib{
    [super awakeFromNib];
    self.backgroundColor = [UIColor whiteColor];
    
    // Determine our start and stop angles for the arc (in radians)
    startAngle = M_PI * 1.5;
    endAngle = startAngle + (M_PI * 2);

}

@end
