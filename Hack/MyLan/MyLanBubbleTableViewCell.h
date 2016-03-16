//
//  MyLanBubbleTableViewCell.h
//  MyLan
//
//  Created by TSI on 15/03/16.
//  Copyright © 2016 CTS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@protocol BubbleTableViewCellDataSource, BubbleTableViewCellDelegate;

extern const CGFloat STBubbleWidthOffset; 
extern const CGFloat STBubbleImageSize;

typedef NS_ENUM(NSUInteger, AuthorType) {
    STBubbleTableViewCellAuthorTypeSelf = 0,
    STBubbleTableViewCellAuthorTypeOther
};

typedef NS_ENUM(NSUInteger, BubbleColor) {
    STBubbleTableViewCellBubbleColorGreen = 0,
    STBubbleTableViewCellBubbleColorGray = 1,
    STBubbleTableViewCellBubbleColorAqua = 2,
    STBubbleTableViewCellBubbleColorBrown = 3,
    STBubbleTableViewCellBubbleColorGraphite = 4,
    STBubbleTableViewCellBubbleColorOrange = 5,
    STBubbleTableViewCellBubbleColorPink = 6,
    STBubbleTableViewCellBubbleColorPurple = 7,
    STBubbleTableViewCellBubbleColorRed = 8,
    STBubbleTableViewCellBubbleColorYellow = 9
};


@interface MyLanBubbleTableViewCell : UITableViewCell
@property (nonatomic, strong, readonly) UIImageView *bubbleView;
@property (nonatomic, strong) UILabel *authorName;

@property (nonatomic, assign) AuthorType authorType;
@property (nonatomic, assign) BubbleColor bubbleColor;
@property (nonatomic, assign) BubbleColor selectedBubbleColor;
@property (nonatomic, weak) id <BubbleTableViewCellDataSource> dataSource;
@property (nonatomic, weak) id <BubbleTableViewCellDelegate> delegate;
@end


@protocol BubbleTableViewCellDataSource <NSObject>
@optional
- (CGFloat)minInsetForCell:(MyLanBubbleTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
@end

@protocol BubbleTableViewCellDelegate <NSObject>
@optional
- (void)tappedImageOfCell:(MyLanBubbleTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;
@end

