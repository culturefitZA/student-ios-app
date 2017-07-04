//
//  Classes.h
//
//  Created by Vision Mkhabela on 6/22/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Classes : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *monday;
@property (nonatomic, strong) NSArray *friday;
@property (nonatomic, strong) NSArray *thursday;
@property (nonatomic, strong) NSArray *tuesday;
@property (nonatomic, strong) NSArray *wednesday;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
