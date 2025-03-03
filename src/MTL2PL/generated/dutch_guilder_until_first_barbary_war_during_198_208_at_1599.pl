:- include('database.pl').
dutch_guilder(Start,End) :- begin('dutch_guilder',_,_,Start), end('dutch_guilder',_,_,End), Start=<End.

first_barbary_war(Start,End) :- begin('first_barbary_war',_,_,Start), end('first_barbary_war',_,_,End), Start=<End.

dutch_guilder_last_till_198_208(Start,End) :- dutch_guilder(Start1,End1), (End1-Start1)>=198, Start is (Start1+198), End is (End1+1).

dutch_guilder_until_first_barbary_war_during_198_208_overlap(Start,End) :- dutch_guilder_last_till_198_208(Start1,End1), first_barbary_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

dutch_guilder_until_first_barbary_war_during_198_208(Start,End) :- dutch_guilder(W1,_), dutch_guilder_until_first_barbary_war_during_198_208_overlap(Start1,End1), Start is max((Start1-208),W1), End is (End1-198), Start=<End.

dutch_guilder_until_first_barbary_war_during_198_208_at_1599(Res) :- setof((Start,End),dutch_guilder_until_first_barbary_war_during_198_208(Start,End),AllINtervals), checkvalidity(1599,AllINtervals,Res).

check_query() :- write('Query = dutch_guilder_until_first_barbary_war_during_198_208_at_1599'), (dutch_guilder_until_first_barbary_war_during_198_208_at_1599(true) -> write('\nRes   = true');write('\nRes   = false')).

