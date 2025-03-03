:- include('database.pl').
slovak_national_uprising(Start,End) :- begin('slovak_national_uprising',_,_,Start), end('slovak_national_uprising',_,_,End), Start=<End.

finally_slovak_national_uprising_during_2_20(Start,End) :- slovak_national_uprising(Start1,End1), (Start1-20)=<(End1-2), Start is (Start1-20), End is (End1-2), Start=<End.

finally_slovak_national_uprising_during_2_20_at_1862(Res) :- setof((Start,End),finally_slovak_national_uprising_during_2_20(Start,End),AllINtervals), checkvalidity(1862,AllINtervals,Res).

check_query() :- write('Query = finally_slovak_national_uprising_during_2_20_at_1862'), (finally_slovak_national_uprising_during_2_20_at_1862(true) -> write('\nRes   = true');write('\nRes   = false')).

