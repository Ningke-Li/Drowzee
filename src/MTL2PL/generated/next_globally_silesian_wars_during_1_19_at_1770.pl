:- include('database.pl').
silesian_wars(Start,End) :- begin('silesian_wars',_,_,Start), end('silesian_wars',_,_,End), Start=<End.

globally_silesian_wars_during_1_19(Start,End) :- silesian_wars(Start1,End1), Start is (Start1-1), End is (End1-19), Start=<End.

next_globally_silesian_wars_during_1_19(Start,End) :- globally_silesian_wars_during_1_19(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_silesian_wars_during_1_19_at_1770(Res) :- setof((Start,End),next_globally_silesian_wars_during_1_19(Start,End),AllINtervals), checkvalidity(1770,AllINtervals,Res).

check_query() :- write('Query = next_globally_silesian_wars_during_1_19_at_1770'), (next_globally_silesian_wars_during_1_19_at_1770(true) -> write('\nRes   = true');write('\nRes   = false')).

