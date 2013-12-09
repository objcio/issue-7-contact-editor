//
//  Contact.m
//  Contact Editor
//
//  Created by Daniel Eggert on 01/12/2013.
//  Copyright (c) 2013 objc.io. All rights reserved.
//

#import "Contact.h"



@implementation Contact

+ (instancetype)contactWithRancomName;
{
    static NSArray *allFirstNames;
    static NSArray *allLastNames;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // <http://www.census.gov/genealogy/www/data/1990surnames/dist.female.first>
        allFirstNames = @[@"Mary", @"Patricia", @"Linda", @"Barbara", @"Elizabeth", @"Jennifer", @"Maria", @"Susan", @"Margaret", @"Dorothy", @"Lisa", @"Nancy", @"Karen", @"Betty", @"Helen", @"Sandra", @"Donna", @"Carol", @"Ruth", @"Sharon", @"Michelle", @"Laura", @"Sarah", @"Kimberly", @"Deborah", @"Jessica", @"Shirley", @"Cynthia", @"Angela", @"Melissa", @"Brenda", @"Amy", @"Anna", @"Rebecca", @"Virginia", @"Kathleen", @"Pamela", @"Martha", @"Debra", @"Amanda", @"Stephanie", @"Carolyn", @"Christine", @"Marie", @"Janet", @"Catherine", @"Frances", @"Ann", @"Joyce", @"Diane", @"Alice", @"Julie", @"Heather", @"Teresa", @"Doris", @"Gloria", @"Evelyn", @"Jean", @"Cheryl", @"Mildred", @"Katherine", @"Joan", @"Ashley", @"Judith", @"Rose", @"Janice", @"Kelly", @"Nicole", @"Judy", @"Christina", @"Kathy", @"Theresa", @"Beverly", @"Denise", @"Tammy", @"Irene", @"Jane", @"Lori", @"Rachel", @"Marilyn", @"Andrea", @"Kathryn", @"Louise", @"Sara", @"Anne", @"Jacqueline", @"Wanda", @"Bonnie", @"Julia", @"Ruby", @"Lois", @"Tina", @"Phyllis", @"Norma", @"Paula", @"Diana", @"Annie", @"Lillian", @"Emily", @"Robin", @"Peggy", @"Crystal", @"Gladys", @"Rita", @"Dawn", @"Connie", @"Florence", @"Tracy", @"Edna", @"Tiffany", @"Carmen", @"Rosa", @"Cindy", @"Grace", @"Wendy", @"Victoria", @"Edith", @"Kim", @"Sherry", @"Sylvia", @"Josephine", @"Thelma", @"Shannon", @"Sheila", @"Ethel", @"Ellen", @"Elaine", @"Marjorie", @"Carrie", @"Charlotte", @"Monica", @"Esther", @"Pauline", @"Emma", @"Juanita", @"Anita", @"Rhonda", @"Hazel", @"Amber", @"Eva", @"Debbie", @"April", @"Leslie", @"Clara", @"Lucille", @"Jamie", @"Joanne", @"Eleanor", @"Valerie", @"Danielle", @"Megan", @"Alicia", @"Suzanne", @"Michele", @"Gail", @"Bertha", @"Darlene", @"Veronica", @"Jill", @"Erin", @"Geraldine", @"Lauren", @"Cathy", @"Joann", @"Lorraine", @"Lynn", @"Sally", @"Regina", @"Erica", @"Beatrice", @"Dolores", @"Bernice", @"Audrey", @"Yvonne", @"Annette", @"June", @"Samantha", @"Marion", @"Dana", @"Stacy", @"Ana", @"Renee", @"Ida", @"Vivian", @"Roberta", @"Holly", @"Brittany", @"Melanie", @"Loretta", @"Yolanda", @"Jeanette", @"Laurie", @"Katie", @"Kristen", @"Vanessa", @"Alma", @"Sue", @"Elsie", @"Beth", @"Jeanne", @"Vicki", @"Carla", @"Tara", @"Rosemary", @"Eileen", @"Terri", @"Gertrude", @"Lucy", @"Tonya", @"Ella", @"Stacey", @"Wilma", @"Gina", @"Kristin", @"Jessie", @"Natalie", @"Agnes", @"Vera", @"Willie", @"Charlene", @"Bessie", @"Delores", @"Melinda", @"Pearl", @"Arlene", @"Maureen", @"Colleen", @"Allison", @"Tamara", @"Joy", @"Georgia", @"Constance", @"Lillie", @"Claudia", @"Jackie", @"Marcia", @"Tanya", @"Nellie", @"Minnie", @"Marlene", @"Heidi", @"Glenda", @"Lydia", @"Viola", @"Courtney", @"Marian", @"Stella", @"Caroline", @"Dora", @"Jo", @"Vickie", @"Mattie", @"Terry", @"Maxine", @"Irma", @"Mabel", @"Marsha", @"Myrtle", @"Lena", @"Christy", @"Deanna", @"Patsy", @"Hilda", @"Gwendolyn", @"Jennie", @"Nora", @"Margie", @"Nina", @"Cassandra", @"Leah", @"Penny", @"Kay", @"Priscilla", @"Naomi", @"Carole", @"Brandy", @"Olga", @"Billie", @"Dianne", @"Tracey", @"Leona", @"Jenny", @"Felicia", @"Sonia", @"Miriam", @"Velma", @"Becky", @"Bobbie", @"Violet", @"Kristina", @"Toni", @"Misty", @"Mae", @"Shelly", @"Daisy", @"Ramona", @"Sherri", @"Erika", @"Katrina", @"Claire", @"Lindsey", @"Lindsay", @"Geneva", @"Guadalupe", @"Belinda", @"Margarita", @"Sheryl", @"Cora", @"Faye", @"Ada", @"Natasha", @"Sabrina", @"Isabel", @"Marguerite", @"Hattie", @"Harriet", @"Molly", @"Cecilia", @"Kristi", @"Brandi", @"Blanche", @"Sandy", @"Rosie", @"Joanna", @"Iris", @"Eunice", @"Angie", @"Inez", @"Lynda", @"Madeline", @"Amelia", @"Alberta", @"Genevieve", @"Monique"];
        // <http://www.census.gov/genealogy/www/data/1990surnames/dist.all.last>
        allLastNames = @[@"Smith", @"Johnson", @"Williams", @"Jones", @"Brown", @"Davis", @"Miller", @"Wilson", @"Moore", @"Taylor", @"Anderson", @"Thomas", @"Jackson", @"White", @"Harris", @"Martin", @"Thompson", @"Garcia", @"Martinez", @"Robinson", @"Clark", @"Rodriguez", @"Lewis", @"Lee", @"Walker", @"Hall", @"Allen", @"Young", @"Hernandez", @"King", @"Wright", @"Lopez", @"Hill", @"Scott", @"Green", @"Adams", @"Baker", @"Gonzalez", @"Nelson", @"Carter", @"Mitchell", @"Perez", @"Roberts", @"Turner", @"Phillips", @"Campbell", @"Parker", @"Evans", @"Edwards", @"Collins", @"Stewart", @"Sanchez", @"Morris", @"Rogers", @"Reed", @"Cook", @"Morgan", @"Bell", @"Murphy", @"Bailey", @"Rivera", @"Cooper", @"Richardson", @"Cox", @"Howard", @"Ward", @"Torres", @"Peterson", @"Gray", @"Ramirez", @"James", @"Watson", @"Brooks", @"Kelly", @"Sanders", @"Price", @"Bennett", @"Wood", @"Barnes", @"Ross", @"Henderson", @"Coleman", @"Jenkins", @"Perry", @"Powell", @"Long", @"Patterson", @"Hughes", @"Flores", @"Washington", @"Butler", @"Simmons", @"Foster", @"Gonzales", @"Bryant", @"Alexander", @"Russell", @"Griffin", @"Diaz", @"Hayes", @"Myers", @"Ford", @"Hamilton", @"Graham", @"Sullivan", @"Wallace", @"Woods", @"Cole", @"West", @"Jordan", @"Owens", @"Reynolds", @"Fisher", @"Ellis", @"Harrison", @"Gibson", @"Mcdonald", @"Cruz", @"Marshall", @"Ortiz", @"Gomez", @"Murray", @"Freeman", @"Wells", @"Webb", @"Simpson", @"Stevens", @"Tucker", @"Porter", @"Hunter", @"Hicks", @"Crawford", @"Henry", @"Boyd", @"Mason", @"Morales", @"Kennedy", @"Warren", @"Dixon", @"Ramos", @"Reyes", @"Burns", @"Gordon", @"Shaw", @"Holmes", @"Rice", @"Robertson", @"Hunt", @"Black", @"Daniels", @"Palmer", @"Mills", @"Nichols", @"Grant", @"Knight", @"Ferguson", @"Rose", @"Stone", @"Hawkins", @"Dunn", @"Perkins", @"Hudson", @"Spencer", @"Gardner", @"Stephens", @"Payne", @"Pierce", @"Berry", @"Matthews", @"Arnold", @"Wagner", @"Willis", @"Ray", @"Watkins", @"Olson", @"Carroll", @"Duncan", @"Snyder", @"Hart", @"Cunningham", @"Bradley", @"Lane", @"Andrews", @"Ruiz", @"Harper", @"Fox", @"Riley", @"Armstrong", @"Carpenter", @"Weaver", @"Greene", @"Lawrence", @"Elliott", @"Chavez", @"Sims", @"Austin", @"Peters", @"Kelley", @"Franklin", @"Lawson", @"Fields", @"Gutierrez", @"Ryan", @"Schmidt", @"Carr", @"Vasquez", @"Castillo", @"Wheeler", @"Chapman", @"Oliver", @"Montgomery", @"Richards", @"Williamson", @"Johnston", @"Banks", @"Meyer", @"Bishop", @"Mccoy", @"Howell", @"Alvarez", @"Morrison", @"Hansen", @"Fernandez", @"Garza", @"Harvey", @"Little", @"Burton", @"Stanley", @"Nguyen", @"George", @"Jacobs", @"Reid", @"Kim", @"Fuller", @"Lynch", @"Dean", @"Gilbert", @"Garrett", @"Romero", @"Welch", @"Larson", @"Frazier", @"Burke", @"Hanson", @"Day", @"Mendoza", @"Moreno", @"Bowman", @"Medina", @"Fowler", @"Brewer", @"Hoffman", @"Carlson", @"Silva", @"Pearson", @"Holland", @"Douglas", @"Fleming", @"Jensen", @"Vargas", @"Byrd", @"Davidson", @"Hopkins", @"May", @"Terry", @"Herrera", @"Wade", @"Soto", @"Walters", @"Curtis", @"Neal", @"Caldwell", @"Lowe", @"Jennings", @"Barnett", @"Graves", @"Jimenez", @"Horton", @"Shelton", @"Barrett", @"Obrien", @"Castro", @"Sutton", @"Gregory", @"Mckinney", @"Lucas", @"Miles", @"Craig", @"Rodriquez", @"Chambers", @"Holt", @"Lambert", @"Fletcher", @"Watts", @"Bates", @"Hale", @"Rhodes", @"Pena", @"Beck", @"Newman", @"Haynes", @"Mcdaniel", @"Mendez", @"Bush", @"Vaughn", @"Parks", @"Dawson", @"Santiago", @"Norris", @"Hardy", @"Love", @"Steele", @"Curry", @"Powers", @"Schultz", @"Barker", @"Guzman", @"Page", @"Munoz", @"Ball", @"Keller", @"Chandler", @"Weber", @"Leonard", @"Walsh"];
    });
    Contact *result = [[self alloc] init];
    result.name = [NSString stringWithFormat:@"%@ %@",
                   allFirstNames[arc4random_uniform([allFirstNames count])],
                   allLastNames[arc4random_uniform([allLastNames count])]];
    return result;
}

- (BOOL)validateName:(NSString **)nameP error:(NSError * __autoreleasing *)error
{
    if (*nameP == nil) {
        *nameP = @"";
        return YES;
    } else {
        NSArray *components = [*nameP componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        components = [components filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(NSString *component, NSDictionary *bindings) {
            return (0 < [component length]);
        }]];
        *nameP = [components componentsJoinedByString:@" "];
        return YES;
    }
}

- (BOOL)validateEmail:(NSString **)emailP error:(NSError * __autoreleasing *)error
{
    if (*emailP == nil) {
        *emailP = @"";
        return YES;
    } else {
        NSArray *components = [*emailP componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        *emailP = [[components componentsJoinedByString:@""] lowercaseString];
        return YES;
    }
}

@end
