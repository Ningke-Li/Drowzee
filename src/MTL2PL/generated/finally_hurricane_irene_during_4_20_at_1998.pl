:- include('database.pl').
hurricane_irene(Start,End) :- begin('hurricane_irene',_,_,Start), end('hurricane_irene',_,_,End), Start=<End.

finally_hurricane_irene_during_4_20(Start,End) :- hurricane_irene(Start1,End1), (Start1-20)=<(End1-4), Start is (Start1-20), End is (End1-4), Start=<End.

finally_hurricane_irene_during_4_20_at_1998(Res) :- setof((Start,End),finally_hurricane_irene_during_4_20(Start,End),AllINtervals), checkvalidity(1998,AllINtervals,Res).

check_query() :- write('Query = finally_hurricane_irene_during_4_20_at_1998'), (finally_hurricane_irene_during_4_20_at_1998(true) -> write('\nRes   = true');write('\nRes   = false')).

