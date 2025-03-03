:- include('database.pl').
austrian_schilling(Start,End) :- begin('austrian_schilling',_,_,Start), end('austrian_schilling',_,_,End), Start=<End.

globally_austrian_schilling_during_10_36(Start,End) :- austrian_schilling(Start1,End1), Start is (Start1-10), End is (End1-36), Start=<End.

next_globally_austrian_schilling_during_10_36(Start,End) :- globally_austrian_schilling_during_10_36(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_austrian_schilling_during_10_36_at_1961(Res) :- setof((Start,End),next_globally_austrian_schilling_during_10_36(Start,End),AllINtervals), checkvalidity(1961,AllINtervals,Res).

check_query() :- write('Query = next_globally_austrian_schilling_during_10_36_at_1961'), (next_globally_austrian_schilling_during_10_36_at_1961(true) -> write('\nRes   = true');write('\nRes   = false')).

