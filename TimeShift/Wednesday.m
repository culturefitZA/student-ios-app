//
//  Wednesday.m
//
//  Created by Vision Mkhabela on 6/22/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "Wednesday.h"


NSString *const kWednesdayRoomId = @"roomId";
NSString *const kWednesdayLecturers = @"lecturers";
NSString *const kWednesdayUserId = @"userId";
NSString *const kWednesdayCourseId = @"courseId";
NSString *const kWednesdayStartDateTime = @"startDateTime";
NSString *const kWednesdayScheduleId = @"scheduleId";
NSString *const kWednesdayBuildingId = @"buildingId";
NSString *const kWednesdayDescription = @"description";
NSString *const kWednesdayEndDateTime = @"endDateTime";
NSString *const kWednesdayGroupId = @"groupId";
NSString *const kWednesdayLastModified = @"lastModified";


@interface Wednesday ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Wednesday

@synthesize roomId = _roomId;
@synthesize lecturers = _lecturers;
@synthesize userId = _userId;
@synthesize courseId = _courseId;
@synthesize startDateTime = _startDateTime;
@synthesize scheduleId = _scheduleId;
@synthesize buildingId = _buildingId;
@synthesize wednesdayDescription = _wednesdayDescription;
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
            self.roomId = [self objectOrNilForKey:kWednesdayRoomId fromDictionary:dict];
            self.lecturers = [self objectOrNilForKey:kWednesdayLecturers fromDictionary:dict];
            self.userId = [self objectOrNilForKey:kWednesdayUserId fromDictionary:dict];
            self.courseId = [self objectOrNilForKey:kWednesdayCourseId fromDictionary:dict];
            self.startDateTime = [self objectOrNilForKey:kWednesdayStartDateTime fromDictionary:dict];
            self.scheduleId = [self objectOrNilForKey:kWednesdayScheduleId fromDictionary:dict];
            self.buildingId = [self objectOrNilForKey:kWednesdayBuildingId fromDictionary:dict];
            self.wednesdayDescription = [self objectOrNilForKey:kWednesdayDescription fromDictionary:dict];
            self.endDateTime = [self objectOrNilForKey:kWednesdayEndDateTime fromDictionary:dict];
            self.groupId = [self objectOrNilForKey:kWednesdayGroupId fromDictionary:dict];
            self.lastModified = [self objectOrNilForKey:kWednesdayLastModified fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.roomId forKey:kWednesdayRoomId];
    [mutableDict setValue:self.lecturers forKey:kWednesdayLecturers];
    [mutableDict setValue:self.userId forKey:kWednesdayUserId];
    [mutableDict setValue:self.courseId forKey:kWednesdayCourseId];
    [mutableDict setValue:self.startDateTime forKey:kWednesdayStartDateTime];
    [mutableDict setValue:self.scheduleId forKey:kWednesdayScheduleId];
    [mutableDict setValue:self.buildingId forKey:kWednesdayBuildingId];
    [mutableDict setValue:self.wednesdayDescription forKey:kWednesdayDescription];
    [mutableDict setValue:self.endDateTime forKey:kWednesdayEndDateTime];
    [mutableDict setValue:self.groupId forKey:kWednesdayGroupId];
    [mutableDict setValue:self.lastModified forKey:kWednesdayLastModified];

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

    self.roomId = [aDecoder decodeObjectForKey:kWednesdayRoomId];
    self.lecturers = [aDecoder decodeObjectForKey:kWednesdayLecturers];
    self.userId = [aDecoder decodeObjectForKey:kWednesdayUserId];
    self.courseId = [aDecoder decodeObjectForKey:kWednesdayCourseId];
    self.startDateTime = [aDecoder decodeObjectForKey:kWednesdayStartDateTime];
    self.scheduleId = [aDecoder decodeObjectForKey:kWednesdayScheduleId];
    self.buildingId = [aDecoder decodeObjectForKey:kWednesdayBuildingId];
    self.wednesdayDescription = [aDecoder decodeObjectForKey:kWednesdayDescription];
    self.endDateTime = [aDecoder decodeObjectForKey:kWednesdayEndDateTime];
    self.groupId = [aDecoder decodeObjectForKey:kWednesdayGroupId];
    self.lastModified = [aDecoder decodeObjectForKey:kWednesdayLastModified];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_roomId forKey:kWednesdayRoomId];
    [aCoder encodeObject:_lecturers forKey:kWednesdayLecturers];
    [aCoder encodeObject:_userId forKey:kWednesdayUserId];
    [aCoder encodeObject:_courseId forKey:kWednesdayCourseId];
    [aCoder encodeObject:_startDateTime forKey:kWednesdayStartDateTime];
    [aCoder encodeObject:_scheduleId forKey:kWednesdayScheduleId];
    [aCoder encodeObject:_buildingId forKey:kWednesdayBuildingId];
    [aCoder encodeObject:_wednesdayDescription forKey:kWednesdayDescription];
    [aCoder encodeObject:_endDateTime forKey:kWednesdayEndDateTime];
    [aCoder encodeObject:_groupId forKey:kWednesdayGroupId];
    [aCoder encodeObject:_lastModified forKey:kWednesdayLastModified];
}

- (id)copyWithZone:(NSZone *)zone
{
    Wednesday *copy = [[Wednesday alloc] init];
    
    if (copy) {

        copy.roomId = [self.roomId copyWithZone:zone];
        copy.lecturers = [self.lecturers copyWithZone:zone];
        copy.userId = [self.userId copyWithZone:zone];
        copy.courseId = [self.courseId copyWithZone:zone];
        copy.startDateTime = [self.startDateTime copyWithZone:zone];
        copy.scheduleId = [self.scheduleId copyWithZone:zone];
        copy.buildingId = [self.buildingId copyWithZone:zone];
        copy.wednesdayDescription = [self.wednesdayDescription copyWithZone:zone];
        copy.endDateTime = [self.endDateTime copyWithZone:zone];
        copy.groupId = [self.groupId copyWithZone:zone];
        copy.lastModified = [self.lastModified copyWithZone:zone];
    }
    
    return copy;
}


@end
