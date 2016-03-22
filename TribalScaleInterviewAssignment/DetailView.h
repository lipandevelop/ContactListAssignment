//
//  DetailView.h
//  TribalScaleInterviewAssignment
//
//  Created by Li Pan on 2016-03-22.
//  Copyright © 2016 Li Pan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"

@interface DetailView : UIView
@property (nonatomic, strong) Contact *detailedContactInfo;
@property (nonatomic, strong) UIImageView *mediumPictureView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *addressLabel;
@property (nonatomic, strong) UILabel *personalInfolabel;
@property (nonatomic, strong) UILabel *contactInfoLabel;
@property (nonatomic, strong) UIButton *backButton;
- (void)setupContents;

@end
