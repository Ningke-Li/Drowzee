:- include('database.pl').
east_german_mark(Start,End) :- begin('east_german_mark',_,_,Start), end('east_german_mark',_,_,End), Start=<End.

globally_east_german_mark_during_2_35(Start,End) :- east_german_mark(Start1,End1), Start is (Start1-2), End is (End1-35), Start=<End.

finally_globally_east_german_mark_during_2_35_during_8_13(Start,End) :- globally_east_german_mark_during_2_35(Start1,End1), (Start1-13)=<(End1-8), Start is (Start1-13), End is (End1-8), Start=<End.

finally_globally_east_german_mark_during_2_35_during_8_13_at_1821(Res) :- setof((Start,End),finally_globally_east_german_mark_during_2_35_during_8_13(Start,End),AllINtervals), checkvalidity(1821,AllINtervals,Res).

check_query() :- write('Query = finally_globally_east_german_mark_during_2_35_during_8_13_at_1821'), (finally_globally_east_german_mark_during_2_35_during_8_13_at_1821(true) -> write('\nRes   = true');write('\nRes   = false')).

