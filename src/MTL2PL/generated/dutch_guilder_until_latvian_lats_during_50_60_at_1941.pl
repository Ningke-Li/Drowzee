:- include('database.pl').
dutch_guilder(Start,End) :- begin('dutch_guilder',_,_,Start), end('dutch_guilder',_,_,End), Start=<End.

latvian_lats(Start,End) :- begin('latvian_lats',_,_,Start), end('latvian_lats',_,_,End), Start=<End.

dutch_guilder_last_till_50_60(Start,End) :- dutch_guilder(Start1,End1), (End1-Start1)>=50, Start is (Start1+50), End is (End1+1).

dutch_guilder_until_latvian_lats_during_50_60_overlap(Start,End) :- dutch_guilder_last_till_50_60(Start1,End1), latvian_lats(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

dutch_guilder_until_latvian_lats_during_50_60(Start,End) :- dutch_guilder(W1,_), dutch_guilder_until_latvian_lats_during_50_60_overlap(Start1,End1), Start is max((Start1-60),W1), End is (End1-50), Start=<End.

dutch_guilder_until_latvian_lats_during_50_60_at_1941(Res) :- setof((Start,End),dutch_guilder_until_latvian_lats_during_50_60(Start,End),AllINtervals), checkvalidity(1941,AllINtervals,Res).

check_query() :- write('Query = dutch_guilder_until_latvian_lats_during_50_60_at_1941'), (dutch_guilder_until_latvian_lats_during_50_60_at_1941(true) -> write('\nRes   = true');write('\nRes   = false')).

