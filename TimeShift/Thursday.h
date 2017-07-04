//
//  Thursday.h
//
//  Created by Vision Mkhabela on 6/22/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Thursday : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *roomId;
@property (nonatomic, strong) NSString *lecturers;
@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *courseId;
@property (nonatomic, strong) NSString *startDateTime;
@property (nonatomic, strong) NSString *scheduleId;
@property (nonatomic, strong) NSString *buildingId;
@property (nonatomic, strong) NSString *thursdayDescription;
@property (nonatomic, strong) NSString *endDateTime;
@property (nonatomic, strong) NSString *groupId;
@property (nonatomic, strong) NSString *lastModified;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
