:- include('database.pl').
constellation_program(Start,End) :- begin('constellation_program',_,_,Start), end('constellation_program',_,_,End), Start=<End.

community(Start,End) :- begin('community',_,_,Start), end('community',_,_,End), Start=<End.

constellation_program_last_till_1_9(Start,End) :- constellation_program(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

constellation_program_until_community_during_1_9_overlap(Start,End) :- constellation_program_last_till_1_9(Start1,End1), community(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

constellation_program_until_community_during_1_9(Start,End) :- constellation_program(W1,_), constellation_program_until_community_during_1_9_overlap(Start1,End1), Start is max((Start1-9),W1), End is (End1-1), Start=<End.

constellation_program_until_community_during_1_9_at_1998(Res) :- setof((Start,End),constellation_program_until_community_during_1_9(Start,End),AllINtervals), checkvalidity(1998,AllINtervals,Res).

check_query() :- write('Query = constellation_program_until_community_during_1_9_at_1998'), (constellation_program_until_community_during_1_9_at_1998(true) -> write('\nRes   = true');write('\nRes   = false')).

