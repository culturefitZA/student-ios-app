//
//  PeriodBase.h
//
//  Created by Vision Mkhabela on 6/22/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface PeriodBase : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *classes;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
