:- include('database.pl').
spanish_colonization_of_the_americas(Start,End) :- begin('spanish_colonization_of_the_americas',_,_,Start), end('spanish_colonization_of_the_americas',_,_,End), Start=<End.

literary_realism(Start,End) :- begin('literary_realism',_,_,Start), end('literary_realism',_,_,End), Start=<End.

spanish_colonization_of_the_americas_last_till_215_223(Start,End) :- spanish_colonization_of_the_americas(Start1,End1), (End1-Start1)>=215, Start is (Start1+215), End is (End1+1).

spanish_colonization_of_the_americas_until_literary_realism_during_215_223_overlap(Start,End) :- spanish_colonization_of_the_americas_last_till_215_223(Start1,End1), literary_realism(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

spanish_colonization_of_the_americas_until_literary_realism_during_215_223(Start,End) :- spanish_colonization_of_the_americas(W1,_), spanish_colonization_of_the_americas_until_literary_realism_during_215_223_overlap(Start1,End1), Start is max((Start1-223),W1), End is (End1-215), Start=<End.

spanish_colonization_of_the_americas_until_literary_realism_during_215_223_at_1641(Res) :- setof((Start,End),spanish_colonization_of_the_americas_until_literary_realism_during_215_223(Start,End),AllINtervals), checkvalidity(1641,AllINtervals,Res).

check_query() :- write('Query = spanish_colonization_of_the_americas_until_literary_realism_during_215_223_at_1641'), (spanish_colonization_of_the_americas_until_literary_realism_during_215_223_at_1641(true) -> write('\nRes   = true');write('\nRes   = false')).

