//
//  Tuesday.m
//
//  Created by Vision Mkhabela on 6/22/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "Tuesday.h"


NSString *const kTuesdayRoomId = @"roomId";
NSString *const kTuesdayLecturers = @"lecturers";
NSString *const kTuesdayUserId = @"userId";
NSString *const kTuesdayCourseId = @"courseId";
NSString *const kTuesdayStartDateTime = @"startDateTime";
NSString *const kTuesdayScheduleId = @"scheduleId";
NSString *const kTuesdayBuildingId = @"buildingId";
NSString *const kTuesdayDescription = @"description";
NSString *const kTuesdayEndDateTime = @"endDateTime";
NSString *const kTuesdayGroupId = @"groupId";
NSString *const kTuesdayLastModified = @"lastModified";


@interface Tuesday ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Tuesday

@synthesize roomId = _roomId;
@synthesize lecturers = _lecturers;
@synthesize userId = _userId;
@synthesize courseId = _courseId;
@synthesize startDateTime = _startDateTime;
@synthesize scheduleId = _scheduleId;
@synthesize buildingId = _buildingId;
@synthesize tuesdayDescription = _tuesdayDescription;
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
            self.roomId = [self objectOrNilForKey:kTuesdayRoomId fromDictionary:dict];
            self.lecturers = [self objectOrNilForKey:kTuesdayLecturers fromDictionary:dict];
            self.userId = [self objectOrNilForKey:kTuesdayUserId fromDictionary:dict];
            self.courseId = [self objectOrNilForKey:kTuesdayCourseId fromDictionary:dict];
            self.startDateTime = [self objectOrNilForKey:kTuesdayStartDateTime fromDictionary:dict];
            self.scheduleId = [self objectOrNilForKey:kTuesdayScheduleId fromDictionary:dict];
            self.buildingId = [self objectOrNilForKey:kTuesdayBuildingId fromDictionary:dict];
            self.tuesdayDescription = [self objectOrNilForKey:kTuesdayDescription fromDictionary:dict];
            self.endDateTime = [self objectOrNilForKey:kTuesdayEndDateTime fromDictionary:dict];
            self.groupId = [self objectOrNilForKey:kTuesdayGroupId fromDictionary:dict];
            self.lastModified = [self objectOrNilForKey:kTuesdayLastModified fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.roomId forKey:kTuesdayRoomId];
    [mutableDict setValue:self.lecturers forKey:kTuesdayLecturers];
    [mutableDict setValue:self.userId forKey:kTuesdayUserId];
    [mutableDict setValue:self.courseId forKey:kTuesdayCourseId];
    [mutableDict setValue:self.startDateTime forKey:kTuesdayStartDateTime];
    [mutableDict setValue:self.scheduleId forKey:kTuesdayScheduleId];
    [mutableDict setValue:self.buildingId forKey:kTuesdayBuildingId];
    [mutableDict setValue:self.tuesdayDescription forKey:kTuesdayDescription];
    [mutableDict setValue:self.endDateTime forKey:kTuesdayEndDateTime];
    [mutableDict setValue:self.groupId forKey:kTuesdayGroupId];
    [mutableDict setValue:self.lastModified forKey:kTuesdayLastModified];

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

    self.roomId = [aDecoder decodeObjectForKey:kTuesdayRoomId];
    self.lecturers = [aDecoder decodeObjectForKey:kTuesdayLecturers];
    self.userId = [aDecoder decodeObjectForKey:kTuesdayUserId];
    self.courseId = [aDecoder decodeObjectForKey:kTuesdayCourseId];
    self.startDateTime = [aDecoder decodeObjectForKey:kTuesdayStartDateTime];
    self.scheduleId = [aDecoder decodeObjectForKey:kTuesdayScheduleId];
    self.buildingId = [aDecoder decodeObjectForKey:kTuesdayBuildingId];
    self.tuesdayDescription = [aDecoder decodeObjectForKey:kTuesdayDescription];
    self.endDateTime = [aDecoder decodeObjectForKey:kTuesdayEndDateTime];
    self.groupId = [aDecoder decodeObjectForKey:kTuesdayGroupId];
    self.lastModified = [aDecoder decodeObjectForKey:kTuesdayLastModified];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_roomId forKey:kTuesdayRoomId];
    [aCoder encodeObject:_lecturers forKey:kTuesdayLecturers];
    [aCoder encodeObject:_userId forKey:kTuesdayUserId];
    [aCoder encodeObject:_courseId forKey:kTuesdayCourseId];
    [aCoder encodeObject:_startDateTime forKey:kTuesdayStartDateTime];
    [aCoder encodeObject:_scheduleId forKey:kTuesdayScheduleId];
    [aCoder encodeObject:_buildingId forKey:kTuesdayBuildingId];
    [aCoder encodeObject:_tuesdayDescription forKey:kTuesdayDescription];
    [aCoder encodeObject:_endDateTime forKey:kTuesdayEndDateTime];
    [aCoder encodeObject:_groupId forKey:kTuesdayGroupId];
    [aCoder encodeObject:_lastModified forKey:kTuesdayLastModified];
}

- (id)copyWithZone:(NSZone *)zone
{
    Tuesday *copy = [[Tuesday alloc] init];
    
    if (copy) {

        copy.roomId = [self.roomId copyWithZone:zone];
        copy.lecturers = [self.lecturers copyWithZone:zone];
        copy.userId = [self.userId copyWithZone:zone];
        copy.courseId = [self.courseId copyWithZone:zone];
        copy.startDateTime = [self.startDateTime copyWithZone:zone];
        copy.scheduleId = [self.scheduleId copyWithZone:zone];
        copy.buildingId = [self.buildingId copyWithZone:zone];
        copy.tuesdayDescription = [self.tuesdayDescription copyWithZone:zone];
        copy.endDateTime = [self.endDateTime copyWithZone:zone];
        copy.groupId = [self.groupId copyWithZone:zone];
        copy.lastModified = [self.lastModified copyWithZone:zone];
    }
    
    return copy;
}


@end
