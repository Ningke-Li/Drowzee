:- include('database.pl').
east_german_mark(Start,End) :- begin('east_german_mark',_,_,Start), end('east_german_mark',_,_,End), Start=<End.

globally_east_german_mark_during_19_29(Start,End) :- east_german_mark(Start1,End1), Start is (Start1-19), End is (End1-29), Start=<End.

finally_globally_east_german_mark_during_19_29_during_9_19(Start,End) :- globally_east_german_mark_during_19_29(Start1,End1), (Start1-19)=<(End1-9), Start is (Start1-19), End is (End1-9), Start=<End.

finally_globally_east_german_mark_during_19_29_during_9_19_at_1952(Res) :- setof((Start,End),finally_globally_east_german_mark_during_19_29_during_9_19(Start,End),AllINtervals), checkvalidity(1952,AllINtervals,Res).

check_query() :- write('Query = finally_globally_east_german_mark_during_19_29_during_9_19_at_1952'), (finally_globally_east_german_mark_during_19_29_during_9_19_at_1952(true) -> write('\nRes   = true');write('\nRes   = false')).

