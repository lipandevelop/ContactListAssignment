//
//  ContactBuilder.m
//  TribalScaleInterviewAssignment
//
//  Created by Leon Chen on 2016-03-22.
//  Copyright © 2016 Li Pan. All rights reserved.
//

#import "ContactBuilder.h"

/*
 {
 "results":[
 {
 "user":{
 "gender":"male",
 "name":{
 "title":"mr",
 "first":"isaiah",
 "last":"martin"
 },
 "location":{
 "street":"7158 tara street",
 "city":"naas",
 "state":"iowa",
 "zip":37864
 },
 "email":"isaiah.martin@example.com",
 "username":"heavymeercat875",
 "password":"enrico",
 "salt":"onrRYqfs",
 "md5":"74e8c8ec439ec0683d1aa2f34f430a29",
 "sha1":"6c952d4d19249fd0f00592420583d719ad8e796e",
 "sha256":"69299b63aec21f2e07ebd347f7d4204af809ec7a0e951c08db649ad0fc4e2d54",
 "registered":1062973837,
 "dob":314321263,
 "phone":"071-318-0444",
 "cell":"081-140-5281",
 "PPS":"1993609T",
 "picture":{
 "large":"https://randomuser.me/api/portraits/men/92.jpg",
 "medium":"https://randomuser.me/api/portraits/med/men/92.jpg",
 "thumbnail":"https://randomuser.me/api/portraits/thumb/men/92.jpg"
 }
 }
 }
 ],
 "nationality":"IE",
 "seed":"0c59ab282aa515ee09",
 "version":"0.8"
 }
 */

@interface ContactBuilder ()
@property (nonatomic, strong) Contact *contact;
@end

@implementation ContactBuilder

NSString *const kKeyResults = @"results";
NSString *const kKeyUser = @"user";
NSString *const kKeyGender = @"gender";
NSString *const kKeyName = @"name";
NSString *const kKeyTitle = @"title";
NSString *const kKeyFirst = @"first";
NSString *const kKeyLast = @"last";
NSString *const kKeyEmail = @"email";
NSString *const kKeyLocation = @"location";
NSString *const kKeyStreet = @"street";
NSString *const kKeyCity = @"city";
NSString *const kKeyState = @"state";
NSString *const kKeyZip = @"zip";
NSString *const kKeyDob = @"dob";
NSString *const kKeyPhone = @"phone";
NSString *const kKeyCell = @"cell";
NSString *const kKeyNationality = @"nationality";
NSString *const kKeyPicture = @"picture";
NSString *const kKeyLarge = @"large";
NSString *const kKeyMedium = @"medium";
NSString *const kKeyThumbnail = @"thumbnail";



-(Contact *)buildContactsFrom:(NSDictionary *)jsonDictionary; {
    if (![jsonDictionary isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
        NSArray *resultArray = jsonDictionary[kKeyResults];
        
        for (NSDictionary *userDictionary in resultArray) {
            NSDictionary *userInfoDictionary = userDictionary[kKeyUser];
            
            self.contact = [[Contact alloc] init];
            
            NSDictionary *namesDictionary = userInfoDictionary[kKeyName];
            self.contact.title = namesDictionary[kKeyTitle];
            self.contact.firstName = namesDictionary[kKeyFirst];
            self.contact.lastName = namesDictionary[kKeyLast];
            
            NSDictionary *locationsDictionary = userInfoDictionary[kKeyLocation];
            self.contact.street = locationsDictionary[kKeyStreet];
            self.contact.city = locationsDictionary[kKeyCity];
            self.contact.state = locationsDictionary[kKeyState];
            self.contact.zip = locationsDictionary[kKeyZip];
            
            self.contact.gender = userInfoDictionary[kKeyGender];
            self.contact.email = userInfoDictionary[kKeyEmail];
            
            NSNumber *dobInMiliseconds = userInfoDictionary[kKeyDob];
            NSDate *dobDate = [[NSDate alloc] initWithTimeIntervalSince1970:dobInMiliseconds.longLongValue];
            self.contact.dob = dobDate;
            
            self.contact.phone = userInfoDictionary[kKeyPhone];
            self.contact.cell = userInfoDictionary[kKeyCell];
            self.contact.nationality = jsonDictionary[kKeyNationality];
            
            NSDictionary *picturesDictionary = userInfoDictionary[kKeyPicture];
            self.contact.largePictureURL = picturesDictionary[kKeyLarge];
            self.contact.mediumPictureURL = picturesDictionary[kKeyMedium];
            self.contact.thumbnailPictureURL = picturesDictionary[kKeyThumbnail];
            
        }
    return self.contact;
}

@end
