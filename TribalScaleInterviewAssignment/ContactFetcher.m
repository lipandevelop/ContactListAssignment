//
//  Parser.m
//  TribalScaleInterviewAssignment
//
//  Created by Li Pan on 2016-03-21.
//  Copyright © 2016 Li Pan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactFetcher.h"
#import "Contact.h"

#define RANDOM_CONTACT_URL @"https://randomuser.me/api/"

@implementation ContactFetcher

- (void)fetchContactData: (PopulateContactListSuccessBlock)success failure: (PopulateContactListFailBlock)failure {
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL: [NSURL URLWithString:RANDOM_CONTACT_URL]];
        NSURLResponse *response = nil;
        NSError *error = nil;
        NSData *jsonData = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData: jsonData options: NSJSONReadingMutableLeaves error: nil];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error == nil) {
                if (success) {
                    success(jsonDictionary);
                }
            }
            else {
                if (failure) {
                    failure(error);
                }
            }
        });
    });
}

@end
