:- include('database.pl').
ev_2014_hong_kong_protests(Start,End) :- begin('ev_2014_hong_kong_protests',_,_,Start), end('ev_2014_hong_kong_protests',_,_,End), Start=<End.

jackie_chan_adventures(Start,End) :- begin('jackie_chan_adventures',_,_,Start), end('jackie_chan_adventures',_,_,End), Start=<End.

generate_facts_ev_2014_hong_kong_protests_OR_jackie_chan_adventures([]) :- assert(ev_2014_hong_kong_protests_OR_jackie_chan_adventures(-1,-1)).

generate_facts_ev_2014_hong_kong_protests_OR_jackie_chan_adventures([(Start,End) | Tail]) :- assert(ev_2014_hong_kong_protests_OR_jackie_chan_adventures(Start,End)), generate_facts_ev_2014_hong_kong_protests_OR_jackie_chan_adventures(Tail).

ev_2014_hong_kong_protests_OR_jackie_chan_adventures_aux() :- findall((Start,End),ev_2014_hong_kong_protests(Start,End),Interval1), findall((Start,End),jackie_chan_adventures(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2014_hong_kong_protests_OR_jackie_chan_adventures(Interval).

ev_2014_hong_kong_protests_OR_jackie_chan_adventures_at_2014(Res) :- setof((Start,End),ev_2014_hong_kong_protests_OR_jackie_chan_adventures(Start,End),AllINtervals), checkvalidity(2014,AllINtervals,Res).

check_query() :- write('Query = ev_2014_hong_kong_protests_OR_jackie_chan_adventures_at_2014'), (ev_2014_hong_kong_protests_OR_jackie_chan_adventures_at_2014(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2014_hong_kong_protests_OR_jackie_chan_adventures_aux().

