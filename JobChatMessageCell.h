//
//  JobChatMessageCell.h
//  Career Map 3
//
//  Created by Adel  Shehadeh on 4/15/15.
//  Copyright (c) 2015 Adel  Shehadeh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JobChatMessageCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *messageAuthorLable;
@property (weak, nonatomic) IBOutlet UILabel *messagePostDateLabel;
@property (weak, nonatomic) IBOutlet UITextView *messageContentTextView;
@property (weak, nonatomic) IBOutlet UIImageView *messageAuthorImage;

@end
