:- include('database.pl').
dutch_guilder(Start,End) :- begin('dutch_guilder',_,_,Start), end('dutch_guilder',_,_,End), Start=<End.

seven_years__war(Start,End) :- begin('seven_years__war',_,_,Start), end('seven_years__war',_,_,End), Start=<End.

dutch_guilder_last_till_11_19(Start,End) :- dutch_guilder(Start1,End1), (End1-Start1)>=11, Start is (Start1+11), End is (End1+1).

dutch_guilder_until_seven_years__war_during_11_19_overlap(Start,End) :- dutch_guilder_last_till_11_19(Start1,End1), seven_years__war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

dutch_guilder_until_seven_years__war_during_11_19(Start,End) :- dutch_guilder(W1,_), dutch_guilder_until_seven_years__war_during_11_19_overlap(Start1,End1), Start is max((Start1-19),W1), End is (End1-11), Start=<End.

dutch_guilder_until_seven_years__war_during_11_19_at_1661(Res) :- setof((Start,End),dutch_guilder_until_seven_years__war_during_11_19(Start,End),AllINtervals), checkvalidity(1661,AllINtervals,Res).

check_query() :- write('Query = dutch_guilder_until_seven_years__war_during_11_19_at_1661'), (dutch_guilder_until_seven_years__war_during_11_19_at_1661(true) -> write('\nRes   = true');write('\nRes   = false')).

