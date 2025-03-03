:- include('database.pl').
franco_dutch_war(Start,End) :- begin('franco_dutch_war',_,_,Start), end('franco_dutch_war',_,_,End), Start=<End.

globally_franco_dutch_war_during_2_5(Start,End) :- franco_dutch_war(Start1,End1), Start is (Start1-2), End is (End1-5), Start=<End.

globally_franco_dutch_war_during_2_5_at_1670(Res) :- setof((Start,End),globally_franco_dutch_war_during_2_5(Start,End),AllINtervals), checkvalidity(1670,AllINtervals,Res).

check_query() :- write('Query = globally_franco_dutch_war_during_2_5_at_1670'), (globally_franco_dutch_war_during_2_5_at_1670(true) -> write('\nRes   = true');write('\nRes   = false')).

