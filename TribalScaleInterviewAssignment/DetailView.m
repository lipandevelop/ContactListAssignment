//
//  DetailView.m
//  TribalScaleInterviewAssignment
//
//  Created by Li Pan on 2016-03-22.
//  Copyright © 2016 Li Pan. All rights reserved.
//

#import "DetailView.h"

@implementation DetailView

- (void)setupContents {
    self.mediumPictureView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height/2)];
    self.mediumPictureView.layer.shadowOffset = CGSizeMake(-1.0f, 5.0f);
    self.mediumPictureView.layer.shadowOpacity = 0.95f;
    
    self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.mediumPictureView.frame.size.height, self.frame.size.width, 50)];
    self.nameLabel.textColor = [UIColor whiteColor];
    self.nameLabel.numberOfLines = 0;
    
    self.personalInfolabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.mediumPictureView.frame.size.height + self.nameLabel.frame.size.height, self.frame.size.width, 50.0f)];
    self.personalInfolabel.textColor = [UIColor whiteColor];
    self.personalInfolabel.numberOfLines = 0;
    self.personalInfolabel.alpha = 0.8f;
    
    self.contactInfoLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.mediumPictureView.frame.size.height + self.nameLabel.frame.size.height + self.personalInfolabel.frame.size.height, self.frame.size.width, 150.0f)];
    self.contactInfoLabel.textColor = [UIColor whiteColor];
    self.contactInfoLabel.numberOfLines = 0;
    self.contactInfoLabel.alpha = 0.6f;
    
    self.backButton = [[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width - 50.0f, self.frame.size.height - 50.0f, 45.0f, 45.0f)];
    self.backButton.layer.cornerRadius = self.backButton.frame.size.height/2;
    [self.backButton setTitle:@"back" forState:UIControlStateNormal];
    self.backButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14.0f];
    self.backButton.layer.borderWidth = 3.0f;
    self.backButton.layer.borderColor = [UIColor whiteColor].CGColor;
    
    [self addSubview:self.mediumPictureView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.personalInfolabel];
    [self addSubview:self.contactInfoLabel];
    [self addSubview:self.backButton];
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
