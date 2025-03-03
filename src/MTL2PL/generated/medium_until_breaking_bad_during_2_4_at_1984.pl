:- include('database.pl').
medium(Start,End) :- begin('medium',_,_,Start), end('medium',_,_,End), Start=<End.

breaking_bad(Start,End) :- begin('breaking_bad',_,_,Start), end('breaking_bad',_,_,End), Start=<End.

medium_last_till_2_4(Start,End) :- medium(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

medium_until_breaking_bad_during_2_4_overlap(Start,End) :- medium_last_till_2_4(Start1,End1), breaking_bad(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

medium_until_breaking_bad_during_2_4(Start,End) :- medium(W1,_), medium_until_breaking_bad_during_2_4_overlap(Start1,End1), Start is max((Start1-4),W1), End is (End1-2), Start=<End.

medium_until_breaking_bad_during_2_4_at_1984(Res) :- setof((Start,End),medium_until_breaking_bad_during_2_4(Start,End),AllINtervals), checkvalidity(1984,AllINtervals,Res).

check_query() :- write('Query = medium_until_breaking_bad_during_2_4_at_1984'), (medium_until_breaking_bad_during_2_4_at_1984(true) -> write('\nRes   = true');write('\nRes   = false')).

