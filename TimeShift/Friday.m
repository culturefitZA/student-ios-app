//
//  Friday.m
//
//  Created by Vision Mkhabela on 6/22/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "Friday.h"


NSString *const kFridayRoomId = @"roomId";
NSString *const kFridayLecturers = @"lecturers";
NSString *const kFridayUserId = @"userId";
NSString *const kFridayCourseId = @"courseId";
NSString *const kFridayStartDateTime = @"startDateTime";
NSString *const kFridayScheduleId = @"scheduleId";
NSString *const kFridayBuildingId = @"buildingId";
NSString *const kFridayDescription = @"description";
NSString *const kFridayEndDateTime = @"endDateTime";
NSString *const kFridayGroupId = @"groupId";
NSString *const kFridayLastModified = @"lastModified";


@interface Friday ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Friday

@synthesize roomId = _roomId;
@synthesize lecturers = _lecturers;
@synthesize userId = _userId;
@synthesize courseId = _courseId;
@synthesize startDateTime = _startDateTime;
@synthesize scheduleId = _scheduleId;
@synthesize buildingId = _buildingId;
@synthesize fridayDescription = _fridayDescription;
@synthesize endDateTime = _endDateTime;
@synthesize groupId = _groupId;
@synthesize lastModified = _lastModified;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.roomId = [self objectOrNilForKey:kFridayRoomId fromDictionary:dict];
            self.lecturers = [self objectOrNilForKey:kFridayLecturers fromDictionary:dict];
            self.userId = [self objectOrNilForKey:kFridayUserId fromDictionary:dict];
            self.courseId = [self objectOrNilForKey:kFridayCourseId fromDictionary:dict];
            self.startDateTime = [self objectOrNilForKey:kFridayStartDateTime fromDictionary:dict];
            self.scheduleId = [self objectOrNilForKey:kFridayScheduleId fromDictionary:dict];
            self.buildingId = [self objectOrNilForKey:kFridayBuildingId fromDictionary:dict];
            self.fridayDescription = [self objectOrNilForKey:kFridayDescription fromDictionary:dict];
            self.endDateTime = [self objectOrNilForKey:kFridayEndDateTime fromDictionary:dict];
            self.groupId = [self objectOrNilForKey:kFridayGroupId fromDictionary:dict];
            self.lastModified = [self objectOrNilForKey:kFridayLastModified fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.roomId forKey:kFridayRoomId];
    [mutableDict setValue:self.lecturers forKey:kFridayLecturers];
    [mutableDict setValue:self.userId forKey:kFridayUserId];
    [mutableDict setValue:self.courseId forKey:kFridayCourseId];
    [mutableDict setValue:self.startDateTime forKey:kFridayStartDateTime];
    [mutableDict setValue:self.scheduleId forKey:kFridayScheduleId];
    [mutableDict setValue:self.buildingId forKey:kFridayBuildingId];
    [mutableDict setValue:self.fridayDescription forKey:kFridayDescription];
    [mutableDict setValue:self.endDateTime forKey:kFridayEndDateTime];
    [mutableDict setValue:self.groupId forKey:kFridayGroupId];
    [mutableDict setValue:self.lastModified forKey:kFridayLastModified];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.roomId = [aDecoder decodeObjectForKey:kFridayRoomId];
    self.lecturers = [aDecoder decodeObjectForKey:kFridayLecturers];
    self.userId = [aDecoder decodeObjectForKey:kFridayUserId];
    self.courseId = [aDecoder decodeObjectForKey:kFridayCourseId];
    self.startDateTime = [aDecoder decodeObjectForKey:kFridayStartDateTime];
    self.scheduleId = [aDecoder decodeObjectForKey:kFridayScheduleId];
    self.buildingId = [aDecoder decodeObjectForKey:kFridayBuildingId];
    self.fridayDescription = [aDecoder decodeObjectForKey:kFridayDescription];
    self.endDateTime = [aDecoder decodeObjectForKey:kFridayEndDateTime];
    self.groupId = [aDecoder decodeObjectForKey:kFridayGroupId];
    self.lastModified = [aDecoder decodeObjectForKey:kFridayLastModified];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_roomId forKey:kFridayRoomId];
    [aCoder encodeObject:_lecturers forKey:kFridayLecturers];
    [aCoder encodeObject:_userId forKey:kFridayUserId];
    [aCoder encodeObject:_courseId forKey:kFridayCourseId];
    [aCoder encodeObject:_startDateTime forKey:kFridayStartDateTime];
    [aCoder encodeObject:_scheduleId forKey:kFridayScheduleId];
    [aCoder encodeObject:_buildingId forKey:kFridayBuildingId];
    [aCoder encodeObject:_fridayDescription forKey:kFridayDescription];
    [aCoder encodeObject:_endDateTime forKey:kFridayEndDateTime];
    [aCoder encodeObject:_groupId forKey:kFridayGroupId];
    [aCoder encodeObject:_lastModified forKey:kFridayLastModified];
}

- (id)copyWithZone:(NSZone *)zone
{
    Friday *copy = [[Friday alloc] init];
    
    if (copy) {

        copy.roomId = [self.roomId copyWithZone:zone];
        copy.lecturers = [self.lecturers copyWithZone:zone];
        copy.userId = [self.userId copyWithZone:zone];
        copy.courseId = [self.courseId copyWithZone:zone];
        copy.startDateTime = [self.startDateTime copyWithZone:zone];
        copy.scheduleId = [self.scheduleId copyWithZone:zone];
        copy.buildingId = [self.buildingId copyWithZone:zone];
        copy.fridayDescription = [self.fridayDescription copyWithZone:zone];
        copy.endDateTime = [self.endDateTime copyWithZone:zone];
        copy.groupId = [self.groupId copyWithZone:zone];
        copy.lastModified = [self.lastModified copyWithZone:zone];
    }
    
    return copy;
}


@end
