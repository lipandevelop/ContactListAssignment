//
//  Parser.h
//  TribalScaleInterviewAssignment
//
//  Created by Li Pan on 2016-03-21.
//  Copyright © 2016 Li Pan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactFetcher : NSObject

typedef void (^PopulateContactListSuccessBlock) (NSDictionary *jsonDictionary);
typedef void (^PopulateContactListFailBlock) (NSError *reason);

- (void)fetchContactData: (PopulateContactListSuccessBlock)success failure: (PopulateContactListFailBlock)failure;

@end
