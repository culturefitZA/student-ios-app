//
//  Thursday.m
//
//  Created by Vision Mkhabela on 6/22/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "Thursday.h"


NSString *const kThursdayRoomId = @"roomId";
NSString *const kThursdayLecturers = @"lecturers";
NSString *const kThursdayUserId = @"userId";
NSString *const kThursdayCourseId = @"courseId";
NSString *const kThursdayStartDateTime = @"startDateTime";
NSString *const kThursdayScheduleId = @"scheduleId";
NSString *const kThursdayBuildingId = @"buildingId";
NSString *const kThursdayDescription = @"description";
NSString *const kThursdayEndDateTime = @"endDateTime";
NSString *const kThursdayGroupId = @"groupId";
NSString *const kThursdayLastModified = @"lastModified";


@interface Thursday ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Thursday

@synthesize roomId = _roomId;
@synthesize lecturers = _lecturers;
@synthesize userId = _userId;
@synthesize courseId = _courseId;
@synthesize startDateTime = _startDateTime;
@synthesize scheduleId = _scheduleId;
@synthesize buildingId = _buildingId;
@synthesize thursdayDescription = _thursdayDescription;
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
            self.roomId = [self objectOrNilForKey:kThursdayRoomId fromDictionary:dict];
            self.lecturers = [self objectOrNilForKey:kThursdayLecturers fromDictionary:dict];
            self.userId = [self objectOrNilForKey:kThursdayUserId fromDictionary:dict];
            self.courseId = [self objectOrNilForKey:kThursdayCourseId fromDictionary:dict];
            self.startDateTime = [self objectOrNilForKey:kThursdayStartDateTime fromDictionary:dict];
            self.scheduleId = [self objectOrNilForKey:kThursdayScheduleId fromDictionary:dict];
            self.buildingId = [self objectOrNilForKey:kThursdayBuildingId fromDictionary:dict];
            self.thursdayDescription = [self objectOrNilForKey:kThursdayDescription fromDictionary:dict];
            self.endDateTime = [self objectOrNilForKey:kThursdayEndDateTime fromDictionary:dict];
            self.groupId = [self objectOrNilForKey:kThursdayGroupId fromDictionary:dict];
            self.lastModified = [self objectOrNilForKey:kThursdayLastModified fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.roomId forKey:kThursdayRoomId];
    [mutableDict setValue:self.lecturers forKey:kThursdayLecturers];
    [mutableDict setValue:self.userId forKey:kThursdayUserId];
    [mutableDict setValue:self.courseId forKey:kThursdayCourseId];
    [mutableDict setValue:self.startDateTime forKey:kThursdayStartDateTime];
    [mutableDict setValue:self.scheduleId forKey:kThursdayScheduleId];
    [mutableDict setValue:self.buildingId forKey:kThursdayBuildingId];
    [mutableDict setValue:self.thursdayDescription forKey:kThursdayDescription];
    [mutableDict setValue:self.endDateTime forKey:kThursdayEndDateTime];
    [mutableDict setValue:self.groupId forKey:kThursdayGroupId];
    [mutableDict setValue:self.lastModified forKey:kThursdayLastModified];

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

    self.roomId = [aDecoder decodeObjectForKey:kThursdayRoomId];
    self.lecturers = [aDecoder decodeObjectForKey:kThursdayLecturers];
    self.userId = [aDecoder decodeObjectForKey:kThursdayUserId];
    self.courseId = [aDecoder decodeObjectForKey:kThursdayCourseId];
    self.startDateTime = [aDecoder decodeObjectForKey:kThursdayStartDateTime];
    self.scheduleId = [aDecoder decodeObjectForKey:kThursdayScheduleId];
    self.buildingId = [aDecoder decodeObjectForKey:kThursdayBuildingId];
    self.thursdayDescription = [aDecoder decodeObjectForKey:kThursdayDescription];
    self.endDateTime = [aDecoder decodeObjectForKey:kThursdayEndDateTime];
    self.groupId = [aDecoder decodeObjectForKey:kThursdayGroupId];
    self.lastModified = [aDecoder decodeObjectForKey:kThursdayLastModified];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_roomId forKey:kThursdayRoomId];
    [aCoder encodeObject:_lecturers forKey:kThursdayLecturers];
    [aCoder encodeObject:_userId forKey:kThursdayUserId];
    [aCoder encodeObject:_courseId forKey:kThursdayCourseId];
    [aCoder encodeObject:_startDateTime forKey:kThursdayStartDateTime];
    [aCoder encodeObject:_scheduleId forKey:kThursdayScheduleId];
    [aCoder encodeObject:_buildingId forKey:kThursdayBuildingId];
    [aCoder encodeObject:_thursdayDescription forKey:kThursdayDescription];
    [aCoder encodeObject:_endDateTime forKey:kThursdayEndDateTime];
    [aCoder encodeObject:_groupId forKey:kThursdayGroupId];
    [aCoder encodeObject:_lastModified forKey:kThursdayLastModified];
}

- (id)copyWithZone:(NSZone *)zone
{
    Thursday *copy = [[Thursday alloc] init];
    
    if (copy) {

        copy.roomId = [self.roomId copyWithZone:zone];
        copy.lecturers = [self.lecturers copyWithZone:zone];
        copy.userId = [self.userId copyWithZone:zone];
        copy.courseId = [self.courseId copyWithZone:zone];
        copy.startDateTime = [self.startDateTime copyWithZone:zone];
        copy.scheduleId = [self.scheduleId copyWithZone:zone];
        copy.buildingId = [self.buildingId copyWithZone:zone];
        copy.thursdayDescription = [self.thursdayDescription copyWithZone:zone];
        copy.endDateTime = [self.endDateTime copyWithZone:zone];
        copy.groupId = [self.groupId copyWithZone:zone];
        copy.lastModified = [self.lastModified copyWithZone:zone];
    }
    
    return copy;
}


@end
