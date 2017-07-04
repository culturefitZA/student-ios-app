//
//  Classes.m
//
//  Created by Vision Mkhabela on 6/22/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "Classes.h"
#import "Monday.h"
#import "Friday.h"
#import "Thursday.h"
#import "Tuesday.h"
#import "Wednesday.h"


NSString *const kClassesMonday = @"monday";
NSString *const kClassesFriday = @"friday";
NSString *const kClassesThursday = @"thursday";
NSString *const kClassesTuesday = @"tuesday";
NSString *const kClassesWednesday = @"wednesday";


@interface Classes ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Classes

@synthesize monday = _monday;
@synthesize friday = _friday;
@synthesize thursday = _thursday;
@synthesize tuesday = _tuesday;
@synthesize wednesday = _wednesday;


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
    NSObject *receivedMonday = [dict objectForKey:kClassesMonday];
    NSMutableArray *parsedMonday = [NSMutableArray array];
    if ([receivedMonday isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMonday) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMonday addObject:[Monday modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMonday isKindOfClass:[NSDictionary class]]) {
       [parsedMonday addObject:[Monday modelObjectWithDictionary:(NSDictionary *)receivedMonday]];
    }

    self.monday = [NSArray arrayWithArray:parsedMonday];
    NSObject *receivedFriday = [dict objectForKey:kClassesFriday];
    NSMutableArray *parsedFriday = [NSMutableArray array];
    if ([receivedFriday isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedFriday) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedFriday addObject:[Friday modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedFriday isKindOfClass:[NSDictionary class]]) {
       [parsedFriday addObject:[Friday modelObjectWithDictionary:(NSDictionary *)receivedFriday]];
    }

    self.friday = [NSArray arrayWithArray:parsedFriday];
    NSObject *receivedThursday = [dict objectForKey:kClassesThursday];
    NSMutableArray *parsedThursday = [NSMutableArray array];
    if ([receivedThursday isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedThursday) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedThursday addObject:[Thursday modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedThursday isKindOfClass:[NSDictionary class]]) {
       [parsedThursday addObject:[Thursday modelObjectWithDictionary:(NSDictionary *)receivedThursday]];
    }

    self.thursday = [NSArray arrayWithArray:parsedThursday];
    NSObject *receivedTuesday = [dict objectForKey:kClassesTuesday];
    NSMutableArray *parsedTuesday = [NSMutableArray array];
    if ([receivedTuesday isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedTuesday) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedTuesday addObject:[Tuesday modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedTuesday isKindOfClass:[NSDictionary class]]) {
       [parsedTuesday addObject:[Tuesday modelObjectWithDictionary:(NSDictionary *)receivedTuesday]];
    }

    self.tuesday = [NSArray arrayWithArray:parsedTuesday];
    NSObject *receivedWednesday = [dict objectForKey:kClassesWednesday];
    NSMutableArray *parsedWednesday = [NSMutableArray array];
    if ([receivedWednesday isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedWednesday) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedWednesday addObject:[Wednesday modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedWednesday isKindOfClass:[NSDictionary class]]) {
       [parsedWednesday addObject:[Wednesday modelObjectWithDictionary:(NSDictionary *)receivedWednesday]];
    }

    self.wednesday = [NSArray arrayWithArray:parsedWednesday];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForMonday = [NSMutableArray array];
    for (NSObject *subArrayObject in self.monday) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForMonday addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForMonday addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForMonday] forKey:kClassesMonday];
    NSMutableArray *tempArrayForFriday = [NSMutableArray array];
    for (NSObject *subArrayObject in self.friday) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForFriday addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForFriday addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForFriday] forKey:kClassesFriday];
    NSMutableArray *tempArrayForThursday = [NSMutableArray array];
    for (NSObject *subArrayObject in self.thursday) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForThursday addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForThursday addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForThursday] forKey:kClassesThursday];
    NSMutableArray *tempArrayForTuesday = [NSMutableArray array];
    for (NSObject *subArrayObject in self.tuesday) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTuesday addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTuesday addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTuesday] forKey:kClassesTuesday];
    NSMutableArray *tempArrayForWednesday = [NSMutableArray array];
    for (NSObject *subArrayObject in self.wednesday) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForWednesday addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForWednesday addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForWednesday] forKey:kClassesWednesday];

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

    self.monday = [aDecoder decodeObjectForKey:kClassesMonday];
    self.friday = [aDecoder decodeObjectForKey:kClassesFriday];
    self.thursday = [aDecoder decodeObjectForKey:kClassesThursday];
    self.tuesday = [aDecoder decodeObjectForKey:kClassesTuesday];
    self.wednesday = [aDecoder decodeObjectForKey:kClassesWednesday];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_monday forKey:kClassesMonday];
    [aCoder encodeObject:_friday forKey:kClassesFriday];
    [aCoder encodeObject:_thursday forKey:kClassesThursday];
    [aCoder encodeObject:_tuesday forKey:kClassesTuesday];
    [aCoder encodeObject:_wednesday forKey:kClassesWednesday];
}

- (id)copyWithZone:(NSZone *)zone
{
    Classes *copy = [[Classes alloc] init];
    
    if (copy) {

        copy.monday = [self.monday copyWithZone:zone];
        copy.friday = [self.friday copyWithZone:zone];
        copy.thursday = [self.thursday copyWithZone:zone];
        copy.tuesday = [self.tuesday copyWithZone:zone];
        copy.wednesday = [self.wednesday copyWithZone:zone];
    }
    
    return copy;
}


@end
