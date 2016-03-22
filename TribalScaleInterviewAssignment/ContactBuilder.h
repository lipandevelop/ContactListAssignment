//
//  ContactBuilder.h
//  TribalScaleInterviewAssignment
//
//  Created by Leon Chen on 2016-03-22.
//  Copyright © 2016 Li Pan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

@interface ContactBuilder : NSObject

-(Contact *)buildContactsFrom:(NSDictionary *)jsonDictionary;

@end
