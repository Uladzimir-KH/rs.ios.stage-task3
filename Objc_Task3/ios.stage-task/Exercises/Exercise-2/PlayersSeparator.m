#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    NSInteger teamsCount;
    int moreCounter = 0;
    int lessCounter = 0;
    
    if (ratingArray.count < 3) {
        return 0;
    } else {
        for (int i = 0; i < ratingArray.count - 2; i++) {
            for (int j = i+1; j < ratingArray.count - 1; j++) {
                if (ratingArray[j].intValue > ratingArray[i].intValue) {
                    for (int k = j+1; k < ratingArray.count; k++) {
                        if (ratingArray[k].intValue > ratingArray[j].intValue) {
                            moreCounter = moreCounter + 1;
                        }
                    }
                }
            }
        }
        for (int i = 0; i < ratingArray.count - 2; i++) {
            for (int j = i+1; j < ratingArray.count - 1; j++) {
                if (ratingArray[j].intValue < ratingArray[i].intValue) {
                    for (int k = j+1; k < ratingArray.count; k++) {
                        if (ratingArray[k].intValue < ratingArray[j].intValue) {
                            lessCounter = lessCounter + 1;
                        }
                    }
                }
            }
        }
    }
    
    teamsCount = moreCounter + lessCounter;
    
    return teamsCount;
}

@end
