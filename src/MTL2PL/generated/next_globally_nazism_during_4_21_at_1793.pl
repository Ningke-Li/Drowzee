:- include('database.pl').
nazism(Start,End) :- begin('nazism',_,_,Start), end('nazism',_,_,End), Start=<End.

globally_nazism_during_4_21(Start,End) :- nazism(Start1,End1), Start is (Start1-4), End is (End1-21), Start=<End.

next_globally_nazism_during_4_21(Start,End) :- globally_nazism_during_4_21(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_nazism_during_4_21_at_1793(Res) :- setof((Start,End),next_globally_nazism_during_4_21(Start,End),AllINtervals), checkvalidity(1793,AllINtervals,Res).

check_query() :- write('Query = next_globally_nazism_during_4_21_at_1793'), (next_globally_nazism_during_4_21_at_1793(true) -> write('\nRes   = true');write('\nRes   = false')).

