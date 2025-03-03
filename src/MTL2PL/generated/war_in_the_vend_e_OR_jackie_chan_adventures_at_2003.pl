:- include('database.pl').
war_in_the_vend_e(Start,End) :- begin('war_in_the_vend_e',_,_,Start), end('war_in_the_vend_e',_,_,End), Start=<End.

jackie_chan_adventures(Start,End) :- begin('jackie_chan_adventures',_,_,Start), end('jackie_chan_adventures',_,_,End), Start=<End.

generate_facts_war_in_the_vend_e_OR_jackie_chan_adventures([]) :- assert(war_in_the_vend_e_OR_jackie_chan_adventures(-1,-1)).

generate_facts_war_in_the_vend_e_OR_jackie_chan_adventures([(Start,End) | Tail]) :- assert(war_in_the_vend_e_OR_jackie_chan_adventures(Start,End)), generate_facts_war_in_the_vend_e_OR_jackie_chan_adventures(Tail).

war_in_the_vend_e_OR_jackie_chan_adventures_aux() :- findall((Start,End),war_in_the_vend_e(Start,End),Interval1), findall((Start,End),jackie_chan_adventures(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_war_in_the_vend_e_OR_jackie_chan_adventures(Interval).

war_in_the_vend_e_OR_jackie_chan_adventures_at_2003(Res) :- setof((Start,End),war_in_the_vend_e_OR_jackie_chan_adventures(Start,End),AllINtervals), checkvalidity(2003,AllINtervals,Res).

check_query() :- write('Query = war_in_the_vend_e_OR_jackie_chan_adventures_at_2003'), (war_in_the_vend_e_OR_jackie_chan_adventures_at_2003(true) -> write('\nRes   = true');write('\nRes   = false')).
?- war_in_the_vend_e_OR_jackie_chan_adventures_aux().

