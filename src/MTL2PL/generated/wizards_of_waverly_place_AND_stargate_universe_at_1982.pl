:- include('database.pl').
wizards_of_waverly_place(Start,End) :- begin('wizards_of_waverly_place',_,_,Start), end('wizards_of_waverly_place',_,_,End), Start=<End.

stargate_universe(Start,End) :- begin('stargate_universe',_,_,Start), end('stargate_universe',_,_,End), Start=<End.

generate_facts_wizards_of_waverly_place_AND_stargate_universe([]) :- assert(wizards_of_waverly_place_AND_stargate_universe(-1,-1)).

generate_facts_wizards_of_waverly_place_AND_stargate_universe([(Start,End) | Tail]) :- assert(wizards_of_waverly_place_AND_stargate_universe(Start,End)), generate_facts_wizards_of_waverly_place_AND_stargate_universe(Tail).

wizards_of_waverly_place_AND_stargate_universe_aux() :- findall((Start,End),wizards_of_waverly_place(Start,End),Interval1), findall((Start,End),stargate_universe(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_wizards_of_waverly_place_AND_stargate_universe(Interval).

wizards_of_waverly_place_AND_stargate_universe_at_1982(Res) :- setof((Start,End),wizards_of_waverly_place_AND_stargate_universe(Start,End),AllINtervals), checkvalidity(1982,AllINtervals,Res).

check_query() :- write('Query = wizards_of_waverly_place_AND_stargate_universe_at_1982'), (wizards_of_waverly_place_AND_stargate_universe_at_1982(true) -> write('\nRes   = true');write('\nRes   = false')).
?- wizards_of_waverly_place_AND_stargate_universe_aux().

