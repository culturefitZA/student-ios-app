//
//  CredentialsBase.h
//
//  Created by Vision Mkhabela on 6/10/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CredentialsBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *learnerCredentials;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
