:- include('database.pl').
haitian_revolution(Start,End) :- begin('haitian_revolution',_,_,Start), end('haitian_revolution',_,_,End), Start=<End.

globally_haitian_revolution_during_3_13(Start,End) :- haitian_revolution(Start1,End1), Start is (Start1-3), End is (End1-13), Start=<End.

finally_globally_haitian_revolution_during_3_13_during_3_14(Start,End) :- globally_haitian_revolution_during_3_13(Start1,End1), (Start1-14)=<(End1-3), Start is (Start1-14), End is (End1-3), Start=<End.

finally_globally_haitian_revolution_during_3_13_during_3_14_at_1776(Res) :- setof((Start,End),finally_globally_haitian_revolution_during_3_13_during_3_14(Start,End),AllINtervals), checkvalidity(1776,AllINtervals,Res).

check_query() :- write('Query = finally_globally_haitian_revolution_during_3_13_during_3_14_at_1776'), (finally_globally_haitian_revolution_during_3_13_during_3_14_at_1776(true) -> write('\nRes   = true');write('\nRes   = false')).

