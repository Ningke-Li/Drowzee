:- include('database.pl').
alias(Start,End) :- begin('alias',_,_,Start), end('alias',_,_,End), Start=<End.

samurai_jack(Start,End) :- begin('samurai_jack',_,_,Start), end('samurai_jack',_,_,End), Start=<End.

alias_last_till_2_12(Start,End) :- alias(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

alias_until_samurai_jack_during_2_12_overlap(Start,End) :- alias_last_till_2_12(Start1,End1), samurai_jack(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

alias_until_samurai_jack_during_2_12(Start,End) :- alias(W1,_), alias_until_samurai_jack_during_2_12_overlap(Start1,End1), Start is max((Start1-12),W1), End is (End1-2), Start=<End.

alias_until_samurai_jack_during_2_12_at_1877(Res) :- setof((Start,End),alias_until_samurai_jack_during_2_12(Start,End),AllINtervals), checkvalidity(1877,AllINtervals,Res).

check_query() :- write('Query = alias_until_samurai_jack_during_2_12_at_1877'), (alias_until_samurai_jack_during_2_12_at_1877(true) -> write('\nRes   = true');write('\nRes   = false')).

