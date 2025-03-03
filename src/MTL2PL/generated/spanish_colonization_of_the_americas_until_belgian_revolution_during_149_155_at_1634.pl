:- include('database.pl').
spanish_colonization_of_the_americas(Start,End) :- begin('spanish_colonization_of_the_americas',_,_,Start), end('spanish_colonization_of_the_americas',_,_,End), Start=<End.

belgian_revolution(Start,End) :- begin('belgian_revolution',_,_,Start), end('belgian_revolution',_,_,End), Start=<End.

spanish_colonization_of_the_americas_last_till_149_155(Start,End) :- spanish_colonization_of_the_americas(Start1,End1), (End1-Start1)>=149, Start is (Start1+149), End is (End1+1).

spanish_colonization_of_the_americas_until_belgian_revolution_during_149_155_overlap(Start,End) :- spanish_colonization_of_the_americas_last_till_149_155(Start1,End1), belgian_revolution(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

spanish_colonization_of_the_americas_until_belgian_revolution_during_149_155(Start,End) :- spanish_colonization_of_the_americas(W1,_), spanish_colonization_of_the_americas_until_belgian_revolution_during_149_155_overlap(Start1,End1), Start is max((Start1-155),W1), End is (End1-149), Start=<End.

spanish_colonization_of_the_americas_until_belgian_revolution_during_149_155_at_1634(Res) :- setof((Start,End),spanish_colonization_of_the_americas_until_belgian_revolution_during_149_155(Start,End),AllINtervals), checkvalidity(1634,AllINtervals,Res).

check_query() :- write('Query = spanish_colonization_of_the_americas_until_belgian_revolution_during_149_155_at_1634'), (spanish_colonization_of_the_americas_until_belgian_revolution_during_149_155_at_1634(true) -> write('\nRes   = true');write('\nRes   = false')).

