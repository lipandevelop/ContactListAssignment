//
//  Contacts.h
//  TribalScaleInterviewAssignment
//
//  Created by Li Pan on 2016-03-21.
//  Copyright © 2016 Li Pan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *street;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSString *zip;
@property (nonatomic, strong) NSString *gender;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSDate *dob;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *cell;
@property (nonatomic, strong) NSString *nationality;
@property (nonatomic, strong) NSString *largePictureURL;
@property (nonatomic, strong) NSString *mediumPictureURL;
@property (nonatomic, strong) NSString *thumbnailPictureURL;


@end
