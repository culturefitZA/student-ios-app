//
//  Monday.m
//
//  Created by Vision Mkhabela on 6/22/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "Monday.h"


NSString *const kMondayRoomId = @"roomId";
NSString *const kMondayLecturers = @"lecturers";
NSString *const kMondayUserId = @"userId";
NSString *const kMondayCourseId = @"courseId";
NSString *const kMondayStartDateTime = @"startDateTime";
NSString *const kMondayScheduleId = @"scheduleId";
NSString *const kMondayBuildingId = @"buildingId";
NSString *const kMondayDescription = @"description";
NSString *const kMondayEndDateTime = @"endDateTime";
NSString *const kMondayGroupId = @"groupId";
NSString *const kMondayLastModified = @"lastModified";


@interface Monday ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Monday

@synthesize roomId = _roomId;
@synthesize lecturers = _lecturers;
@synthesize userId = _userId;
@synthesize courseId = _courseId;
@synthesize startDateTime = _startDateTime;
@synthesize scheduleId = _scheduleId;
@synthesize buildingId = _buildingId;
@synthesize mondayDescription = _mondayDescription;
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
            self.roomId = [self objectOrNilForKey:kMondayRoomId fromDictionary:dict];
            self.lecturers = [self objectOrNilForKey:kMondayLecturers fromDictionary:dict];
            self.userId = [self objectOrNilForKey:kMondayUserId fromDictionary:dict];
            self.courseId = [self objectOrNilForKey:kMondayCourseId fromDictionary:dict];
            self.startDateTime = [self objectOrNilForKey:kMondayStartDateTime fromDictionary:dict];
            self.scheduleId = [self objectOrNilForKey:kMondayScheduleId fromDictionary:dict];
            self.buildingId = [self objectOrNilForKey:kMondayBuildingId fromDictionary:dict];
            self.mondayDescription = [self objectOrNilForKey:kMondayDescription fromDictionary:dict];
            self.endDateTime = [self objectOrNilForKey:kMondayEndDateTime fromDictionary:dict];
            self.groupId = [self objectOrNilForKey:kMondayGroupId fromDictionary:dict];
            self.lastModified = [self objectOrNilForKey:kMondayLastModified fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.roomId forKey:kMondayRoomId];
    [mutableDict setValue:self.lecturers forKey:kMondayLecturers];
    [mutableDict setValue:self.userId forKey:kMondayUserId];
    [mutableDict setValue:self.courseId forKey:kMondayCourseId];
    [mutableDict setValue:self.startDateTime forKey:kMondayStartDateTime];
    [mutableDict setValue:self.scheduleId forKey:kMondayScheduleId];
    [mutableDict setValue:self.buildingId forKey:kMondayBuildingId];
    [mutableDict setValue:self.mondayDescription forKey:kMondayDescription];
    [mutableDict setValue:self.endDateTime forKey:kMondayEndDateTime];
    [mutableDict setValue:self.groupId forKey:kMondayGroupId];
    [mutableDict setValue:self.lastModified forKey:kMondayLastModified];

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

    self.roomId = [aDecoder decodeObjectForKey:kMondayRoomId];
    self.lecturers = [aDecoder decodeObjectForKey:kMondayLecturers];
    self.userId = [aDecoder decodeObjectForKey:kMondayUserId];
    self.courseId = [aDecoder decodeObjectForKey:kMondayCourseId];
    self.startDateTime = [aDecoder decodeObjectForKey:kMondayStartDateTime];
    self.scheduleId = [aDecoder decodeObjectForKey:kMondayScheduleId];
    self.buildingId = [aDecoder decodeObjectForKey:kMondayBuildingId];
    self.mondayDescription = [aDecoder decodeObjectForKey:kMondayDescription];
    self.endDateTime = [aDecoder decodeObjectForKey:kMondayEndDateTime];
    self.groupId = [aDecoder decodeObjectForKey:kMondayGroupId];
    self.lastModified = [aDecoder decodeObjectForKey:kMondayLastModified];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_roomId forKey:kMondayRoomId];
    [aCoder encodeObject:_lecturers forKey:kMondayLecturers];
    [aCoder encodeObject:_userId forKey:kMondayUserId];
    [aCoder encodeObject:_courseId forKey:kMondayCourseId];
    [aCoder encodeObject:_startDateTime forKey:kMondayStartDateTime];
    [aCoder encodeObject:_scheduleId forKey:kMondayScheduleId];
    [aCoder encodeObject:_buildingId forKey:kMondayBuildingId];
    [aCoder encodeObject:_mondayDescription forKey:kMondayDescription];
    [aCoder encodeObject:_endDateTime forKey:kMondayEndDateTime];
    [aCoder encodeObject:_groupId forKey:kMondayGroupId];
    [aCoder encodeObject:_lastModified forKey:kMondayLastModified];
}

- (id)copyWithZone:(NSZone *)zone
{
    Monday *copy = [[Monday alloc] init];
    
    if (copy) {

        copy.roomId = [self.roomId copyWithZone:zone];
        copy.lecturers = [self.lecturers copyWithZone:zone];
        copy.userId = [self.userId copyWithZone:zone];
        copy.courseId = [self.courseId copyWithZone:zone];
        copy.startDateTime = [self.startDateTime copyWithZone:zone];
        copy.scheduleId = [self.scheduleId copyWithZone:zone];
        copy.buildingId = [self.buildingId copyWithZone:zone];
        copy.mondayDescription = [self.mondayDescription copyWithZone:zone];
        copy.endDateTime = [self.endDateTime copyWithZone:zone];
        copy.groupId = [self.groupId copyWithZone:zone];
        copy.lastModified = [self.lastModified copyWithZone:zone];
    }
    
    return copy;
}


@end
