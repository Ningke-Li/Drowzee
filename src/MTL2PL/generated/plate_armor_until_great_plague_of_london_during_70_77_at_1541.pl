:- include('database.pl').
plate_armor(Start,End) :- begin('plate_armor',_,_,Start), end('plate_armor',_,_,End), Start=<End.

great_plague_of_london(Start,End) :- begin('great_plague_of_london',_,_,Start), end('great_plague_of_london',_,_,End), Start=<End.

plate_armor_last_till_70_77(Start,End) :- plate_armor(Start1,End1), (End1-Start1)>=70, Start is (Start1+70), End is (End1+1).

plate_armor_until_great_plague_of_london_during_70_77_overlap(Start,End) :- plate_armor_last_till_70_77(Start1,End1), great_plague_of_london(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

plate_armor_until_great_plague_of_london_during_70_77(Start,End) :- plate_armor(W1,_), plate_armor_until_great_plague_of_london_during_70_77_overlap(Start1,End1), Start is max((Start1-77),W1), End is (End1-70), Start=<End.

plate_armor_until_great_plague_of_london_during_70_77_at_1541(Res) :- setof((Start,End),plate_armor_until_great_plague_of_london_during_70_77(Start,End),AllINtervals), checkvalidity(1541,AllINtervals,Res).

check_query() :- write('Query = plate_armor_until_great_plague_of_london_during_70_77_at_1541'), (plate_armor_until_great_plague_of_london_during_70_77_at_1541(true) -> write('\nRes   = true');write('\nRes   = false')).

