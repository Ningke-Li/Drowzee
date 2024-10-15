same_head_of_government(Entity_A, Entity_B) :-
	head_of_government(Entity_A, Entity_C),
	head_of_government(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_transport_network(Entity_A, Entity_B) :-
	transport_network(Entity_A, Entity_C),
	transport_network(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_country(Entity_A, Entity_B) :-
	country(Entity_A, Entity_C),
	country(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_place_of_birth(Entity_A, Entity_B) :-
	place_of_birth(Entity_A, Entity_C),
	place_of_birth(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_place_of_death(Entity_A, Entity_B) :-
	place_of_death(Entity_A, Entity_C),
	place_of_death(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_sex_or_gender(Entity_A, Entity_B) :-
	sex_or_gender(Entity_A, Entity_C),
	sex_or_gender(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_father(Entity_A, Entity_B) :-
	father(Entity_A, Entity_C),
	father(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_mother(Entity_A, Entity_B) :-
	mother(Entity_A, Entity_C),
	mother(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_spouse(Entity_A, Entity_B) :-
	spouse(Entity_A, Entity_C),
	spouse(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_country_of_citizenship(Entity_A, Entity_B) :-
	country_of_citizenship(Entity_A, Entity_C),
	country_of_citizenship(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_continent(Entity_A, Entity_B) :-
	continent(Entity_A, Entity_C),
	continent(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_instance_of(Entity_A, Entity_B) :-
	instance_of(Entity_A, Entity_C),
	instance_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_head_of_state(Entity_A, Entity_B) :-
	head_of_state(Entity_A, Entity_C),
	head_of_state(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_capital(Entity_A, Entity_B) :-
	capital(Entity_A, Entity_C),
	capital(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_official_language(Entity_A, Entity_B) :-
	official_language(Entity_A, Entity_C),
	official_language(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_currency(Entity_A, Entity_B) :-
	currency(Entity_A, Entity_C),
	currency(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_position_held(Entity_A, Entity_B) :-
	position_held(Entity_A, Entity_C),
	position_held(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_child(Entity_A, Entity_B) :-
	child(Entity_A, Entity_C),
	child(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_shares_border_with(Entity_A, Entity_B) :-
	shares_border_with(Entity_A, Entity_C),
	shares_border_with(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_author(Entity_A, Entity_B) :-
	author(Entity_A, Entity_C),
	author(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_family(Entity_A, Entity_B) :-
	family(Entity_A, Entity_C),
	family(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_member_of_sports_team(Entity_A, Entity_B) :-
	member_of_sports_team(Entity_A, Entity_C),
	member_of_sports_team(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_director(Entity_A, Entity_B) :-
	director(Entity_A, Entity_C),
	director(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_screenwriter(Entity_A, Entity_B) :-
	screenwriter(Entity_A, Entity_C),
	screenwriter(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_constellation(Entity_A, Entity_B) :-
	constellation(Entity_A, Entity_C),
	constellation(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_discoverer_or_inventor(Entity_A, Entity_B) :-
	discoverer_or_inventor(Entity_A, Entity_C),
	discoverer_or_inventor(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_site_of_astronomical_discovery(Entity_A, Entity_B) :-
	site_of_astronomical_discovery(Entity_A, Entity_C),
	site_of_astronomical_discovery(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_ancestral_home(Entity_A, Entity_B) :-
	ancestral_home(Entity_A, Entity_C),
	ancestral_home(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_educated_at(Entity_A, Entity_B) :-
	educated_at(Entity_A, Entity_C),
	educated_at(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_top_level_internet_domain(Entity_A, Entity_B) :-
	top_level_internet_domain(Entity_A, Entity_C),
	top_level_internet_domain(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_connecting_line(Entity_A, Entity_B) :-
	connecting_line(Entity_A, Entity_C),
	connecting_line(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_architect(Entity_A, Entity_B) :-
	architect(Entity_A, Entity_C),
	architect(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_anthem(Entity_A, Entity_B) :-
	anthem(Entity_A, Entity_C),
	anthem(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_composer(Entity_A, Entity_B) :-
	composer(Entity_A, Entity_C),
	composer(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_librettist(Entity_A, Entity_B) :-
	librettist(Entity_A, Entity_C),
	librettist(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_commissioned_by(Entity_A, Entity_B) :-
	commissioned_by(Entity_A, Entity_C),
	commissioned_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_sexual_orientation(Entity_A, Entity_B) :-
	sexual_orientation(Entity_A, Entity_C),
	sexual_orientation(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_main_regulatory_text(Entity_A, Entity_B) :-
	main_regulatory_text(Entity_A, Entity_C),
	main_regulatory_text(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_noble_title(Entity_A, Entity_B) :-
	noble_title(Entity_A, Entity_C),
	noble_title(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_editor(Entity_A, Entity_B) :-
	editor(Entity_A, Entity_C),
	editor(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_field_of_work(Entity_A, Entity_B) :-
	field_of_work(Entity_A, Entity_C),
	field_of_work(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_member_of_political_party(Entity_A, Entity_B) :-
	member_of_political_party(Entity_A, Entity_C),
	member_of_political_party(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_native_language(Entity_A, Entity_B) :-
	native_language(Entity_A, Entity_C),
	native_language(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_taxon_rank(Entity_A, Entity_B) :-
	taxon_rank(Entity_A, Entity_C),
	taxon_rank(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_occupation(Entity_A, Entity_B) :-
	occupation(Entity_A, Entity_C),
	occupation(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_employer(Entity_A, Entity_B) :-
	employer(Entity_A, Entity_C),
	employer(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_illustrator(Entity_A, Entity_B) :-
	illustrator(Entity_A, Entity_C),
	illustrator(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_measured_physical_quantity(Entity_A, Entity_B) :-
	measured_physical_quantity(Entity_A, Entity_C),
	measured_physical_quantity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_founded_by(Entity_A, Entity_B) :-
	founded_by(Entity_A, Entity_C),
	founded_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_airline_hub(Entity_A, Entity_B) :-
	airline_hub(Entity_A, Entity_C),
	airline_hub(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_airline_alliance(Entity_A, Entity_B) :-
	airline_alliance(Entity_A, Entity_C),
	airline_alliance(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_home_venue(Entity_A, Entity_B) :-
	home_venue(Entity_A, Entity_C),
	home_venue(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_league(Entity_A, Entity_B) :-
	league(Entity_A, Entity_C),
	league(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_place_of_burial(Entity_A, Entity_B) :-
	place_of_burial(Entity_A, Entity_C),
	place_of_burial(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_item_operated(Entity_A, Entity_B) :-
	item_operated(Entity_A, Entity_C),
	item_operated(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_basic_form_of_government(Entity_A, Entity_B) :-
	basic_form_of_government(Entity_A, Entity_C),
	basic_form_of_government(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_publisher(Entity_A, Entity_B) :-
	publisher(Entity_A, Entity_C),
	publisher(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_maintained_by(Entity_A, Entity_B) :-
	maintained_by(Entity_A, Entity_C),
	maintained_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_owned_by(Entity_A, Entity_B) :-
	owned_by(Entity_A, Entity_C),
	owned_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_regulates_molecular_biology_(Entity_A, Entity_B) :-
	regulates_molecular_biology_(Entity_A, Entity_C),
	regulates_molecular_biology_(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_physically_interacts_with(Entity_A, Entity_B) :-
	physically_interacts_with(Entity_A, Entity_C),
	physically_interacts_with(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_located_in_the_administrative_territorial_entity(Entity_A, Entity_B) :-
	located_in_the_administrative_territorial_entity(Entity_A, Entity_C),
	located_in_the_administrative_territorial_entity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_movement(Entity_A, Entity_B) :-
	movement(Entity_A, Entity_C),
	movement(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_genre(Entity_A, Entity_B) :-
	genre(Entity_A, Entity_C),
	genre(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_operator(Entity_A, Entity_B) :-
	operator(Entity_A, Entity_C),
	operator(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_named_after(Entity_A, Entity_B) :-
	named_after(Entity_A, Entity_C),
	named_after(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_religion_or_worldview(Entity_A, Entity_B) :-
	religion_or_worldview(Entity_A, Entity_C),
	religion_or_worldview(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_iucn_conservation_status(Entity_A, Entity_B) :-
	iucn_conservation_status(Entity_A, Entity_C),
	iucn_conservation_status(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_based_on(Entity_A, Entity_B) :-
	based_on(Entity_A, Entity_C),
	based_on(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_architectural_style(Entity_A, Entity_B) :-
	architectural_style(Entity_A, Entity_C),
	architectural_style(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_contains_the_administrative_territorial_entity(Entity_A, Entity_B) :-
	contains_the_administrative_territorial_entity(Entity_A, Entity_C),
	contains_the_administrative_territorial_entity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_follows(Entity_A, Entity_B) :-
	follows(Entity_A, Entity_C),
	follows(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_followed_by(Entity_A, Entity_B) :-
	followed_by(Entity_A, Entity_C),
	followed_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_killed_by(Entity_A, Entity_B) :-
	killed_by(Entity_A, Entity_C),
	killed_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_headquarters_location(Entity_A, Entity_B) :-
	headquarters_location(Entity_A, Entity_C),
	headquarters_location(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_cast_member(Entity_A, Entity_B) :-
	cast_member(Entity_A, Entity_C),
	cast_member(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_producer(Entity_A, Entity_B) :-
	producer(Entity_A, Entity_C),
	producer(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_flag(Entity_A, Entity_B) :-
	flag(Entity_A, Entity_C),
	flag(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_award_received(Entity_A, Entity_B) :-
	award_received(Entity_A, Entity_C),
	award_received(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_structure_replaced_by(Entity_A, Entity_B) :-
	structure_replaced_by(Entity_A, Entity_C),
	structure_replaced_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_chief_executive_officer(Entity_A, Entity_B) :-
	chief_executive_officer(Entity_A, Entity_C),
	chief_executive_officer(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_creator(Entity_A, Entity_B) :-
	creator(Entity_A, Entity_C),
	creator(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_parent_taxon(Entity_A, Entity_B) :-
	parent_taxon(Entity_A, Entity_C),
	parent_taxon(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_ethnic_group(Entity_A, Entity_B) :-
	ethnic_group(Entity_A, Entity_C),
	ethnic_group(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_performer(Entity_A, Entity_B) :-
	performer(Entity_A, Entity_C),
	performer(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_manufacturer(Entity_A, Entity_B) :-
	manufacturer(Entity_A, Entity_C),
	manufacturer(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_crosses(Entity_A, Entity_B) :-
	crosses(Entity_A, Entity_C),
	crosses(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_developer(Entity_A, Entity_B) :-
	developer(Entity_A, Entity_C),
	developer(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_part_of_the_series(Entity_A, Entity_B) :-
	part_of_the_series(Entity_A, Entity_C),
	part_of_the_series(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_depicts(Entity_A, Entity_B) :-
	depicts(Entity_A, Entity_C),
	depicts(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_endemic_to(Entity_A, Entity_B) :-
	endemic_to(Entity_A, Entity_C),
	endemic_to(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_doctoral_advisor(Entity_A, Entity_B) :-
	doctoral_advisor(Entity_A, Entity_C),
	doctoral_advisor(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_doctoral_student(Entity_A, Entity_B) :-
	doctoral_student(Entity_A, Entity_C),
	doctoral_student(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_made_from_material(Entity_A, Entity_B) :-
	made_from_material(Entity_A, Entity_C),
	made_from_material(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_location_of_discovery(Entity_A, Entity_B) :-
	location_of_discovery(Entity_A, Entity_C),
	location_of_discovery(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_twinned_administrative_body(Entity_A, Entity_B) :-
	twinned_administrative_body(Entity_A, Entity_C),
	twinned_administrative_body(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_main_building_contractor(Entity_A, Entity_B) :-
	main_building_contractor(Entity_A, Entity_C),
	main_building_contractor(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_legislative_body(Entity_A, Entity_B) :-
	legislative_body(Entity_A, Entity_C),
	legislative_body(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_collection(Entity_A, Entity_B) :-
	collection(Entity_A, Entity_C),
	collection(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_minor_planet_group(Entity_A, Entity_B) :-
	minor_planet_group(Entity_A, Entity_C),
	minor_planet_group(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_adjacent_station(Entity_A, Entity_B) :-
	adjacent_station(Entity_A, Entity_C),
	adjacent_station(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_business_division(Entity_A, Entity_B) :-
	business_division(Entity_A, Entity_C),
	business_division(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_inflows(Entity_A, Entity_B) :-
	inflows(Entity_A, Entity_C),
	inflows(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_outflows(Entity_A, Entity_B) :-
	outflows(Entity_A, Entity_C),
	outflows(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_basin_country(Entity_A, Entity_B) :-
	basin_country(Entity_A, Entity_C),
	basin_country(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_located_in_or_next_to_body_of_water(Entity_A, Entity_B) :-
	located_in_or_next_to_body_of_water(Entity_A, Entity_C),
	located_in_or_next_to_body_of_water(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_executive_body(Entity_A, Entity_B) :-
	executive_body(Entity_A, Entity_C),
	executive_body(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_highest_judicial_authority(Entity_A, Entity_B) :-
	highest_judicial_authority(Entity_A, Entity_C),
	highest_judicial_authority(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_party_chief_representative(Entity_A, Entity_B) :-
	party_chief_representative(Entity_A, Entity_C),
	party_chief_representative(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_coat_of_arms(Entity_A, Entity_B) :-
	coat_of_arms(Entity_A, Entity_C),
	coat_of_arms(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_military_branch(Entity_A, Entity_B) :-
	military_branch(Entity_A, Entity_C),
	military_branch(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_stated_in(Entity_A, Entity_B) :-
	stated_in(Entity_A, Entity_C),
	stated_in(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_official_residence(Entity_A, Entity_B) :-
	official_residence(Entity_A, Entity_C),
	official_residence(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_record_label(Entity_A, Entity_B) :-
	record_label(Entity_A, Entity_C),
	record_label(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_production_company(Entity_A, Entity_B) :-
	production_company(Entity_A, Entity_C),
	production_company(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_copyright_license(Entity_A, Entity_B) :-
	copyright_license(Entity_A, Entity_C),
	copyright_license(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_location(Entity_A, Entity_B) :-
	location(Entity_A, Entity_C),
	location(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_programmed_in(Entity_A, Entity_B) :-
	programmed_in(Entity_A, Entity_C),
	programmed_in(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_subclass_of(Entity_A, Entity_B) :-
	subclass_of(Entity_A, Entity_C),
	subclass_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_writing_system(Entity_A, Entity_B) :-
	writing_system(Entity_A, Entity_C),
	writing_system(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_head_coach(Entity_A, Entity_B) :-
	head_coach(Entity_A, Entity_C),
	head_coach(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_designed_by(Entity_A, Entity_B) :-
	designed_by(Entity_A, Entity_C),
	designed_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_vessel_class(Entity_A, Entity_B) :-
	vessel_class(Entity_A, Entity_C),
	vessel_class(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_place_of_publication(Entity_A, Entity_B) :-
	place_of_publication(Entity_A, Entity_C),
	place_of_publication(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_category_s_main_topic(Entity_A, Entity_B) :-
	category_s_main_topic(Entity_A, Entity_C),
	category_s_main_topic(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_operating_system(Entity_A, Entity_B) :-
	operating_system(Entity_A, Entity_C),
	operating_system(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_director_of_photography(Entity_A, Entity_B) :-
	director_of_photography(Entity_A, Entity_C),
	director_of_photography(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_subsidiary(Entity_A, Entity_B) :-
	has_subsidiary(Entity_A, Entity_C),
	has_subsidiary(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_discography(Entity_A, Entity_B) :-
	discography(Entity_A, Entity_C),
	discography(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_is_a_list_of(Entity_A, Entity_B) :-
	is_a_list_of(Entity_A, Entity_C),
	is_a_list_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_part_of(Entity_A, Entity_B) :-
	part_of(Entity_A, Entity_C),
	part_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_original_language_of_film_or_tv_show(Entity_A, Entity_B) :-
	original_language_of_film_or_tv_show(Entity_A, Entity_C),
	original_language_of_film_or_tv_show(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_use(Entity_A, Entity_B) :-
	has_use(Entity_A, Entity_C),
	has_use(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_sandbox_item(Entity_A, Entity_B) :-
	sandbox_item(Entity_A, Entity_C),
	sandbox_item(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_presenter(Entity_A, Entity_B) :-
	presenter(Entity_A, Entity_C),
	presenter(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_space_launch_vehicle(Entity_A, Entity_B) :-
	space_launch_vehicle(Entity_A, Entity_C),
	space_launch_vehicle(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_located_on_astronomical_body(Entity_A, Entity_B) :-
	located_on_astronomical_body(Entity_A, Entity_C),
	located_on_astronomical_body(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_parent_astronomical_body(Entity_A, Entity_B) :-
	parent_astronomical_body(Entity_A, Entity_C),
	parent_astronomical_body(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_child_astronomical_body(Entity_A, Entity_B) :-
	child_astronomical_body(Entity_A, Entity_C),
	child_astronomical_body(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_companion_of(Entity_A, Entity_B) :-
	companion_of(Entity_A, Entity_C),
	companion_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_platform(Entity_A, Entity_B) :-
	platform(Entity_A, Entity_C),
	platform(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_mouth_of_the_watercourse(Entity_A, Entity_B) :-
	mouth_of_the_watercourse(Entity_A, Entity_C),
	mouth_of_the_watercourse(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_game_mode(Entity_A, Entity_B) :-
	game_mode(Entity_A, Entity_C),
	game_mode(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_taxon_author(Entity_A, Entity_B) :-
	taxon_author(Entity_A, Entity_C),
	taxon_author(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_soundtrack_release(Entity_A, Entity_B) :-
	soundtrack_release(Entity_A, Entity_C),
	soundtrack_release(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_language_of_work_or_name(Entity_A, Entity_B) :-
	language_of_work_or_name(Entity_A, Entity_C),
	language_of_work_or_name(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_software_engine(Entity_A, Entity_B) :-
	software_engine(Entity_A, Entity_C),
	software_engine(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_military_rank(Entity_A, Entity_B) :-
	military_rank(Entity_A, Entity_C),
	military_rank(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_canonization_status(Entity_A, Entity_B) :-
	canonization_status(Entity_A, Entity_C),
	canonization_status(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_voice_type(Entity_A, Entity_B) :-
	voice_type(Entity_A, Entity_C),
	voice_type(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_position_played_on_team_speciality(Entity_A, Entity_B) :-
	position_played_on_team_speciality(Entity_A, Entity_C),
	position_played_on_team_speciality(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_stock_exchange(Entity_A, Entity_B) :-
	stock_exchange(Entity_A, Entity_C),
	stock_exchange(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_radio_format(Entity_A, Entity_B) :-
	radio_format(Entity_A, Entity_C),
	radio_format(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_patron_saint(Entity_A, Entity_B) :-
	patron_saint(Entity_A, Entity_C),
	patron_saint(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_seal_badge_or_sigil(Entity_A, Entity_B) :-
	has_seal_badge_or_sigil(Entity_A, Entity_C),
	has_seal_badge_or_sigil(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_located_in_time_zone(Entity_A, Entity_B) :-
	located_in_time_zone(Entity_A, Entity_C),
	located_in_time_zone(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_shooting_handedness(Entity_A, Entity_B) :-
	shooting_handedness(Entity_A, Entity_C),
	shooting_handedness(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_field_of_this_occupation(Entity_A, Entity_B) :-
	field_of_this_occupation(Entity_A, Entity_C),
	field_of_this_occupation(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_taxonomic_type(Entity_A, Entity_B) :-
	taxonomic_type(Entity_A, Entity_C),
	taxonomic_type(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_distribution_format(Entity_A, Entity_B) :-
	distribution_format(Entity_A, Entity_C),
	distribution_format(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_review_score_by(Entity_A, Entity_B) :-
	review_score_by(Entity_A, Entity_C),
	review_score_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_original_broadcaster(Entity_A, Entity_B) :-
	original_broadcaster(Entity_A, Entity_C),
	original_broadcaster(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_astronaut_mission(Entity_A, Entity_B) :-
	astronaut_mission(Entity_A, Entity_C),
	astronaut_mission(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_unmarried_partner(Entity_A, Entity_B) :-
	unmarried_partner(Entity_A, Entity_C),
	unmarried_partner(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_industry(Entity_A, Entity_B) :-
	industry(Entity_A, Entity_C),
	industry(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_character_role(Entity_A, Entity_B) :-
	character_role(Entity_A, Entity_C),
	character_role(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_foundational_text(Entity_A, Entity_B) :-
	foundational_text(Entity_A, Entity_C),
	foundational_text(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_determination_method(Entity_A, Entity_B) :-
	determination_method(Entity_A, Entity_C),
	determination_method(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_said_to_be_the_same_as(Entity_A, Entity_B) :-
	said_to_be_the_same_as(Entity_A, Entity_C),
	said_to_be_the_same_as(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_opposite_of(Entity_A, Entity_B) :-
	opposite_of(Entity_A, Entity_C),
	opposite_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_color(Entity_A, Entity_B) :-
	color(Entity_A, Entity_C),
	color(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_member_of(Entity_A, Entity_B) :-
	member_of(Entity_A, Entity_C),
	member_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_occupant(Entity_A, Entity_B) :-
	occupant(Entity_A, Entity_C),
	occupant(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_legislated_by(Entity_A, Entity_B) :-
	legislated_by(Entity_A, Entity_C),
	legislated_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_dan_kyu_rank(Entity_A, Entity_B) :-
	dan_kyu_rank(Entity_A, Entity_C),
	dan_kyu_rank(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_lake_on_watercourse(Entity_A, Entity_B) :-
	lake_on_watercourse(Entity_A, Entity_C),
	lake_on_watercourse(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_eight_banner_register(Entity_A, Entity_B) :-
	eight_banner_register(Entity_A, Entity_C),
	eight_banner_register(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_input_device(Entity_A, Entity_B) :-
	input_device(Entity_A, Entity_C),
	input_device(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_recorded_at_studio_or_venue(Entity_A, Entity_B) :-
	recorded_at_studio_or_venue(Entity_A, Entity_C),
	recorded_at_studio_or_venue(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_archives_at(Entity_A, Entity_B) :-
	archives_at(Entity_A, Entity_C),
	archives_at(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_chairperson(Entity_A, Entity_B) :-
	chairperson(Entity_A, Entity_C),
	chairperson(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_currency_symbol_description(Entity_A, Entity_B) :-
	currency_symbol_description(Entity_A, Entity_C),
	currency_symbol_description(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_country_of_origin(Entity_A, Entity_B) :-
	country_of_origin(Entity_A, Entity_C),
	country_of_origin(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_exclave_of(Entity_A, Entity_B) :-
	exclave_of(Entity_A, Entity_C),
	exclave_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_enclave_within(Entity_A, Entity_B) :-
	enclave_within(Entity_A, Entity_C),
	enclave_within(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_shipping_port(Entity_A, Entity_B) :-
	shipping_port(Entity_A, Entity_C),
	shipping_port(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_general_manager(Entity_A, Entity_B) :-
	general_manager(Entity_A, Entity_C),
	general_manager(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_cause_of_death(Entity_A, Entity_B) :-
	cause_of_death(Entity_A, Entity_C),
	cause_of_death(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_honorific_prefix(Entity_A, Entity_B) :-
	honorific_prefix(Entity_A, Entity_C),
	honorific_prefix(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_academic_degree(Entity_A, Entity_B) :-
	academic_degree(Entity_A, Entity_C),
	academic_degree(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_interleaves_with(Entity_A, Entity_B) :-
	interleaves_with(Entity_A, Entity_C),
	interleaves_with(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_phase_of_matter(Entity_A, Entity_B) :-
	phase_of_matter(Entity_A, Entity_C),
	phase_of_matter(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_powered_by(Entity_A, Entity_B) :-
	powered_by(Entity_A, Entity_C),
	powered_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_interaction(Entity_A, Entity_B) :-
	interaction(Entity_A, Entity_C),
	interaction(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_applies_to_part(Entity_A, Entity_B) :-
	applies_to_part(Entity_A, Entity_C),
	applies_to_part(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_armament(Entity_A, Entity_B) :-
	armament(Entity_A, Entity_C),
	armament(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_scheduled_service_destination(Entity_A, Entity_B) :-
	scheduled_service_destination(Entity_A, Entity_C),
	scheduled_service_destination(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_type_of_orbit(Entity_A, Entity_B) :-
	type_of_orbit(Entity_A, Entity_C),
	type_of_orbit(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_temporal_range_start(Entity_A, Entity_B) :-
	temporal_range_start(Entity_A, Entity_C),
	temporal_range_start(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_temporal_range_end(Entity_A, Entity_B) :-
	temporal_range_end(Entity_A, Entity_C),
	temporal_range_end(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_part_s_(Entity_A, Entity_B) :-
	has_part_s_(Entity_A, Entity_C),
	has_part_s_(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_diplomatic_relation(Entity_A, Entity_B) :-
	diplomatic_relation(Entity_A, Entity_C),
	diplomatic_relation(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_diplomatic_mission_sent(Entity_A, Entity_B) :-
	diplomatic_mission_sent(Entity_A, Entity_C),
	diplomatic_mission_sent(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_port_of_registry(Entity_A, Entity_B) :-
	port_of_registry(Entity_A, Entity_C),
	port_of_registry(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_target(Entity_A, Entity_B) :-
	target(Entity_A, Entity_C),
	target(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_streak_color(Entity_A, Entity_B) :-
	streak_color(Entity_A, Entity_C),
	streak_color(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_twinning(Entity_A, Entity_B) :-
	twinning(Entity_A, Entity_C),
	twinning(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_mineral_fracture(Entity_A, Entity_B) :-
	mineral_fracture(Entity_A, Entity_C),
	mineral_fracture(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_office_contested(Entity_A, Entity_B) :-
	office_contested(Entity_A, Entity_C),
	office_contested(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_officially_opened_by(Entity_A, Entity_B) :-
	officially_opened_by(Entity_A, Entity_C),
	officially_opened_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_oath_made_by(Entity_A, Entity_B) :-
	oath_made_by(Entity_A, Entity_C),
	oath_made_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_torch_lit_by(Entity_A, Entity_B) :-
	torch_lit_by(Entity_A, Entity_C),
	torch_lit_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_docking_port(Entity_A, Entity_B) :-
	docking_port(Entity_A, Entity_C),
	docking_port(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_commemorates(Entity_A, Entity_B) :-
	commemorates(Entity_A, Entity_C),
	commemorates(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_version_type(Entity_A, Entity_B) :-
	version_type(Entity_A, Entity_C),
	version_type(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_chivalric_order(Entity_A, Entity_B) :-
	chivalric_order(Entity_A, Entity_C),
	chivalric_order(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_residence(Entity_A, Entity_B) :-
	residence(Entity_A, Entity_C),
	residence(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_handedness(Entity_A, Entity_B) :-
	handedness(Entity_A, Entity_C),
	handedness(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_website_account_on(Entity_A, Entity_B) :-
	website_account_on(Entity_A, Entity_C),
	website_account_on(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_crystal_system(Entity_A, Entity_B) :-
	crystal_system(Entity_A, Entity_C),
	crystal_system(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_terminus(Entity_A, Entity_B) :-
	terminus(Entity_A, Entity_C),
	terminus(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_direction(Entity_A, Entity_B) :-
	direction(Entity_A, Entity_C),
	direction(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_central_bank_issuer(Entity_A, Entity_B) :-
	central_bank_issuer(Entity_A, Entity_C),
	central_bank_issuer(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_crystal_habit(Entity_A, Entity_B) :-
	crystal_habit(Entity_A, Entity_C),
	crystal_habit(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_basionym(Entity_A, Entity_B) :-
	basionym(Entity_A, Entity_C),
	basionym(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_underlies(Entity_A, Entity_B) :-
	underlies(Entity_A, Entity_C),
	underlies(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_overlies(Entity_A, Entity_B) :-
	overlies(Entity_A, Entity_C),
	overlies(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_ima_status_and_or_rank(Entity_A, Entity_B) :-
	ima_status_and_or_rank(Entity_A, Entity_C),
	ima_status_and_or_rank(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_coolant(Entity_A, Entity_B) :-
	coolant(Entity_A, Entity_C),
	coolant(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_point_group(Entity_A, Entity_B) :-
	point_group(Entity_A, Entity_C),
	point_group(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_commander_of_deprecated_(Entity_A, Entity_B) :-
	commander_of_deprecated_(Entity_A, Entity_C),
	commander_of_deprecated_(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_conflict(Entity_A, Entity_B) :-
	conflict(Entity_A, Entity_C),
	conflict(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_exhibition_history(Entity_A, Entity_B) :-
	exhibition_history(Entity_A, Entity_C),
	exhibition_history(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_terminus_location(Entity_A, Entity_B) :-
	terminus_location(Entity_A, Entity_C),
	terminus_location(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_highest_point(Entity_A, Entity_B) :-
	highest_point(Entity_A, Entity_C),
	highest_point(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_religious_order(Entity_A, Entity_B) :-
	religious_order(Entity_A, Entity_C),
	religious_order(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_mother_house(Entity_A, Entity_B) :-
	mother_house(Entity_A, Entity_C),
	mother_house(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_source_of_energy(Entity_A, Entity_B) :-
	source_of_energy(Entity_A, Entity_C),
	source_of_energy(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_guidance_system(Entity_A, Entity_B) :-
	guidance_system(Entity_A, Entity_C),
	guidance_system(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_edition_or_translation_of(Entity_A, Entity_B) :-
	edition_or_translation_of(Entity_A, Entity_C),
	edition_or_translation_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_structural_engineer(Entity_A, Entity_B) :-
	structural_engineer(Entity_A, Entity_C),
	structural_engineer(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_team_captain(Entity_A, Entity_B) :-
	team_captain(Entity_A, Entity_C),
	team_captain(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_route_of_administration(Entity_A, Entity_B) :-
	route_of_administration(Entity_A, Entity_C),
	route_of_administration(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_sport(Entity_A, Entity_B) :-
	sport(Entity_A, Entity_C),
	sport(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_of(Entity_A, Entity_B) :-
	of(Entity_A, Entity_C),
	of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_drafted_by(Entity_A, Entity_B) :-
	drafted_by(Entity_A, Entity_C),
	drafted_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_direction_relative_to_location(Entity_A, Entity_B) :-
	direction_relative_to_location(Entity_A, Entity_C),
	direction_relative_to_location(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_translator(Entity_A, Entity_B) :-
	translator(Entity_A, Entity_C),
	translator(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_tracklist(Entity_A, Entity_B) :-
	tracklist(Entity_A, Entity_C),
	tracklist(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_genomic_assembly(Entity_A, Entity_B) :-
	genomic_assembly(Entity_A, Entity_C),
	genomic_assembly(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_ec_enzyme_classification(Entity_A, Entity_B) :-
	ec_enzyme_classification(Entity_A, Entity_C),
	ec_enzyme_classification(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_organizer(Entity_A, Entity_B) :-
	organizer(Entity_A, Entity_C),
	organizer(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_located_on_street(Entity_A, Entity_B) :-
	located_on_street(Entity_A, Entity_C),
	located_on_street(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_characters(Entity_A, Entity_B) :-
	characters(Entity_A, Entity_C),
	characters(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_lyrics_by(Entity_A, Entity_B) :-
	lyrics_by(Entity_A, Entity_C),
	lyrics_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_incertae_sedis(Entity_A, Entity_B) :-
	incertae_sedis(Entity_A, Entity_C),
	incertae_sedis(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_molecular_function(Entity_A, Entity_B) :-
	molecular_function(Entity_A, Entity_C),
	molecular_function(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_cell_component(Entity_A, Entity_B) :-
	cell_component(Entity_A, Entity_C),
	cell_component(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_biological_process(Entity_A, Entity_B) :-
	biological_process(Entity_A, Entity_C),
	biological_process(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_ortholog(Entity_A, Entity_B) :-
	ortholog(Entity_A, Entity_C),
	ortholog(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_encodes(Entity_A, Entity_B) :-
	encodes(Entity_A, Entity_C),
	encodes(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_afflicts(Entity_A, Entity_B) :-
	afflicts(Entity_A, Entity_C),
	afflicts(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_space_group(Entity_A, Entity_B) :-
	space_group(Entity_A, Entity_C),
	space_group(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_cleavage(Entity_A, Entity_B) :-
	cleavage(Entity_A, Entity_C),
	cleavage(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_replaced_synonym_for_nom_nov_(Entity_A, Entity_B) :-
	replaced_synonym_for_nom_nov_(Entity_A, Entity_C),
	replaced_synonym_for_nom_nov_(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_ex_taxon_author(Entity_A, Entity_B) :-
	ex_taxon_author(Entity_A, Entity_C),
	ex_taxon_author(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_encoded_by(Entity_A, Entity_B) :-
	encoded_by(Entity_A, Entity_C),
	encoded_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_found_in_taxon(Entity_A, Entity_B) :-
	found_in_taxon(Entity_A, Entity_C),
	found_in_taxon(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_located_in_on_physical_feature(Entity_A, Entity_B) :-
	located_in_on_physical_feature(Entity_A, Entity_C),
	located_in_on_physical_feature(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_spacecraft_bus(Entity_A, Entity_B) :-
	spacecraft_bus(Entity_A, Entity_C),
	spacecraft_bus(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_diocese(Entity_A, Entity_B) :-
	diocese(Entity_A, Entity_C),
	diocese(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_participant(Entity_A, Entity_B) :-
	participant(Entity_A, Entity_C),
	participant(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_asteroid_spectral_type(Entity_A, Entity_B) :-
	asteroid_spectral_type(Entity_A, Entity_C),
	asteroid_spectral_type(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_voice_actor(Entity_A, Entity_B) :-
	voice_actor(Entity_A, Entity_C),
	voice_actor(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_candidate(Entity_A, Entity_B) :-
	candidate(Entity_A, Entity_C),
	candidate(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_family_name(Entity_A, Entity_B) :-
	family_name(Entity_A, Entity_C),
	family_name(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_given_name(Entity_A, Entity_B) :-
	given_name(Entity_A, Entity_C),
	given_name(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_cover_art_by(Entity_A, Entity_B) :-
	cover_art_by(Entity_A, Entity_C),
	cover_art_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_influenced_by(Entity_A, Entity_B) :-
	influenced_by(Entity_A, Entity_C),
	influenced_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_ammunition(Entity_A, Entity_B) :-
	ammunition(Entity_A, Entity_C),
	ammunition(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_location_of_formation(Entity_A, Entity_B) :-
	location_of_formation(Entity_A, Entity_C),
	location_of_formation(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_playing_hand(Entity_A, Entity_B) :-
	playing_hand(Entity_A, Entity_C),
	playing_hand(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_asteroid_family(Entity_A, Entity_B) :-
	asteroid_family(Entity_A, Entity_C),
	asteroid_family(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_edition_or_translation(Entity_A, Entity_B) :-
	has_edition_or_translation(Entity_A, Entity_C),
	has_edition_or_translation(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_appointed_by(Entity_A, Entity_B) :-
	appointed_by(Entity_A, Entity_C),
	appointed_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_parent_organization(Entity_A, Entity_B) :-
	parent_organization(Entity_A, Entity_C),
	parent_organization(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_distributed_by(Entity_A, Entity_B) :-
	distributed_by(Entity_A, Entity_C),
	distributed_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_introduced_feature(Entity_A, Entity_B) :-
	introduced_feature(Entity_A, Entity_C),
	introduced_feature(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_removed_feature(Entity_A, Entity_B) :-
	removed_feature(Entity_A, Entity_C),
	removed_feature(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_surface_played_on(Entity_A, Entity_B) :-
	surface_played_on(Entity_A, Entity_C),
	surface_played_on(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_contributor_to_the_creative_work_or_subject(Entity_A, Entity_B) :-
	contributor_to_the_creative_work_or_subject(Entity_A, Entity_C),
	contributor_to_the_creative_work_or_subject(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_electoral_district(Entity_A, Entity_B) :-
	electoral_district(Entity_A, Entity_C),
	electoral_district(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_significant_drug_interaction(Entity_A, Entity_B) :-
	significant_drug_interaction(Entity_A, Entity_C),
	significant_drug_interaction(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_cause_of_destruction(Entity_A, Entity_B) :-
	cause_of_destruction(Entity_A, Entity_C),
	cause_of_destruction(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_symptoms_and_signs(Entity_A, Entity_B) :-
	symptoms_and_signs(Entity_A, Entity_C),
	symptoms_and_signs(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_hymenium_type(Entity_A, Entity_B) :-
	hymenium_type(Entity_A, Entity_C),
	hymenium_type(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_mushroom_cap_shape(Entity_A, Entity_B) :-
	mushroom_cap_shape(Entity_A, Entity_C),
	mushroom_cap_shape(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_hymenium_attachment(Entity_A, Entity_B) :-
	hymenium_attachment(Entity_A, Entity_C),
	hymenium_attachment(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_stipe_character(Entity_A, Entity_B) :-
	stipe_character(Entity_A, Entity_C),
	stipe_character(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_spore_print_color(Entity_A, Entity_B) :-
	spore_print_color(Entity_A, Entity_C),
	spore_print_color(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_mushroom_ecological_type(Entity_A, Entity_B) :-
	mushroom_ecological_type(Entity_A, Entity_C),
	mushroom_ecological_type(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_edibility(Entity_A, Entity_B) :-
	edibility(Entity_A, Entity_C),
	edibility(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_approved_by(Entity_A, Entity_B) :-
	approved_by(Entity_A, Entity_C),
	approved_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_significant_event(Entity_A, Entity_B) :-
	significant_event(Entity_A, Entity_C),
	significant_event(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_located_on_linear_feature(Entity_A, Entity_B) :-
	located_on_linear_feature(Entity_A, Entity_C),
	located_on_linear_feature(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_authority(Entity_A, Entity_B) :-
	authority(Entity_A, Entity_C),
	authority(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_notable_work(Entity_A, Entity_B) :-
	notable_work(Entity_A, Entity_C),
	notable_work(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_student(Entity_A, Entity_B) :-
	student(Entity_A, Entity_C),
	student(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_professorship(Entity_A, Entity_B) :-
	professorship(Entity_A, Entity_C),
	professorship(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_statement_is_subject_of(Entity_A, Entity_B) :-
	statement_is_subject_of(Entity_A, Entity_C),
	statement_is_subject_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_separated_from(Entity_A, Entity_B) :-
	separated_from(Entity_A, Entity_C),
	separated_from(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_academic_minor(Entity_A, Entity_B) :-
	academic_minor(Entity_A, Entity_C),
	academic_minor(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_academic_major(Entity_A, Entity_B) :-
	academic_major(Entity_A, Entity_C),
	academic_major(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_iucn_protected_areas_category(Entity_A, Entity_B) :-
	iucn_protected_areas_category(Entity_A, Entity_C),
	iucn_protected_areas_category(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_decays_to(Entity_A, Entity_B) :-
	decays_to(Entity_A, Entity_C),
	decays_to(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_decay_mode(Entity_A, Entity_B) :-
	decay_mode(Entity_A, Entity_C),
	decay_mode(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_mascot(Entity_A, Entity_B) :-
	mascot(Entity_A, Entity_C),
	mascot(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_speaker(Entity_A, Entity_B) :-
	speaker(Entity_A, Entity_C),
	speaker(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_dedicated_to(Entity_A, Entity_B) :-
	dedicated_to(Entity_A, Entity_C),
	dedicated_to(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_tonality(Entity_A, Entity_B) :-
	tonality(Entity_A, Entity_C),
	tonality(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_cause(Entity_A, Entity_B) :-
	has_cause(Entity_A, Entity_C),
	has_cause(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_parent_club(Entity_A, Entity_B) :-
	parent_club(Entity_A, Entity_C),
	parent_club(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_public_holiday(Entity_A, Entity_B) :-
	public_holiday(Entity_A, Entity_C),
	public_holiday(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_interchange_station(Entity_A, Entity_B) :-
	interchange_station(Entity_A, Entity_C),
	interchange_station(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_train_depot(Entity_A, Entity_B) :-
	train_depot(Entity_A, Entity_C),
	train_depot(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_day_in_year_for_periodic_occurrence(Entity_A, Entity_B) :-
	day_in_year_for_periodic_occurrence(Entity_A, Entity_C),
	day_in_year_for_periodic_occurrence(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_narrative_location(Entity_A, Entity_B) :-
	narrative_location(Entity_A, Entity_C),
	narrative_location(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_feast_day(Entity_A, Entity_B) :-
	feast_day(Entity_A, Entity_C),
	feast_day(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_esrb_rating(Entity_A, Entity_B) :-
	esrb_rating(Entity_A, Entity_C),
	esrb_rating(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_cero_rating(Entity_A, Entity_B) :-
	cero_rating(Entity_A, Entity_C),
	cero_rating(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_sponsor(Entity_A, Entity_B) :-
	sponsor(Entity_A, Entity_C),
	sponsor(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_foods_traditionally_associated(Entity_A, Entity_B) :-
	foods_traditionally_associated(Entity_A, Entity_C),
	foods_traditionally_associated(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_instrumentation(Entity_A, Entity_B) :-
	instrumentation(Entity_A, Entity_C),
	instrumentation(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_printed_by(Entity_A, Entity_B) :-
	printed_by(Entity_A, Entity_C),
	printed_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_phase_point(Entity_A, Entity_B) :-
	phase_point(Entity_A, Entity_C),
	phase_point(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_avionics(Entity_A, Entity_B) :-
	avionics(Entity_A, Entity_C),
	avionics(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_cpu(Entity_A, Entity_B) :-
	cpu(Entity_A, Entity_C),
	cpu(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_type_of_variable_star(Entity_A, Entity_B) :-
	type_of_variable_star(Entity_A, Entity_C),
	type_of_variable_star(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_origin_of_the_watercourse(Entity_A, Entity_B) :-
	origin_of_the_watercourse(Entity_A, Entity_C),
	origin_of_the_watercourse(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_based_on_heuristic(Entity_A, Entity_B) :-
	based_on_heuristic(Entity_A, Entity_C),
	based_on_heuristic(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_pegi_rating(Entity_A, Entity_B) :-
	pegi_rating(Entity_A, Entity_C),
	pegi_rating(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_topic_s_main_category(Entity_A, Entity_B) :-
	topic_s_main_category(Entity_A, Entity_C),
	topic_s_main_category(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_facility(Entity_A, Entity_B) :-
	has_facility(Entity_A, Entity_C),
	has_facility(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_notation(Entity_A, Entity_B) :-
	notation(Entity_A, Entity_C),
	notation(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_usk_rating(Entity_A, Entity_B) :-
	usk_rating(Entity_A, Entity_C),
	usk_rating(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_filming_location(Entity_A, Entity_B) :-
	filming_location(Entity_A, Entity_C),
	filming_location(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_gsrr_rating(Entity_A, Entity_B) :-
	gsrr_rating(Entity_A, Entity_C),
	gsrr_rating(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_main_subject(Entity_A, Entity_B) :-
	main_subject(Entity_A, Entity_C),
	main_subject(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_magnetic_ordering(Entity_A, Entity_B) :-
	magnetic_ordering(Entity_A, Entity_C),
	magnetic_ordering(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_medical_examination(Entity_A, Entity_B) :-
	medical_examination(Entity_A, Entity_C),
	medical_examination(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_possible_treatment(Entity_A, Entity_B) :-
	possible_treatment(Entity_A, Entity_C),
	possible_treatment(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_presynaptic_connection(Entity_A, Entity_B) :-
	presynaptic_connection(Entity_A, Entity_C),
	presynaptic_connection(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_postsynaptic_connection(Entity_A, Entity_B) :-
	postsynaptic_connection(Entity_A, Entity_C),
	postsynaptic_connection(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_anatomical_location(Entity_A, Entity_B) :-
	anatomical_location(Entity_A, Entity_C),
	anatomical_location(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_activating_neurotransmitter(Entity_A, Entity_B) :-
	activating_neurotransmitter(Entity_A, Entity_C),
	activating_neurotransmitter(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_color_space(Entity_A, Entity_B) :-
	color_space(Entity_A, Entity_C),
	color_space(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_type_of_electrification(Entity_A, Entity_B) :-
	type_of_electrification(Entity_A, Entity_C),
	type_of_electrification(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_place_served_by_transport_hub(Entity_A, Entity_B) :-
	place_served_by_transport_hub(Entity_A, Entity_C),
	place_served_by_transport_hub(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_work_location(Entity_A, Entity_B) :-
	work_location(Entity_A, Entity_C),
	work_location(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_inspired_by(Entity_A, Entity_B) :-
	inspired_by(Entity_A, Entity_C),
	inspired_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_theme_music(Entity_A, Entity_B) :-
	theme_music(Entity_A, Entity_C),
	theme_music(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_programmer(Entity_A, Entity_B) :-
	programmer(Entity_A, Entity_C),
	programmer(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_code_of_nomenclature(Entity_A, Entity_B) :-
	code_of_nomenclature(Entity_A, Entity_C),
	code_of_nomenclature(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_allegiance(Entity_A, Entity_B) :-
	allegiance(Entity_A, Entity_C),
	allegiance(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_guest_of_honor(Entity_A, Entity_B) :-
	guest_of_honor(Entity_A, Entity_C),
	guest_of_honor(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_neurological_function(Entity_A, Entity_B) :-
	neurological_function(Entity_A, Entity_C),
	neurological_function(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_category_combines_topics(Entity_A, Entity_B) :-
	category_combines_topics(Entity_A, Entity_C),
	category_combines_topics(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_catalog(Entity_A, Entity_B) :-
	catalog(Entity_A, Entity_C),
	catalog(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_tributary(Entity_A, Entity_B) :-
	tributary(Entity_A, Entity_C),
	tributary(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_successful_candidate(Entity_A, Entity_B) :-
	successful_candidate(Entity_A, Entity_C),
	successful_candidate(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_record_held(Entity_A, Entity_B) :-
	record_held(Entity_A, Entity_C),
	record_held(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_applies_to_jurisdiction(Entity_A, Entity_B) :-
	applies_to_jurisdiction(Entity_A, Entity_C),
	applies_to_jurisdiction(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_engine_configuration(Entity_A, Entity_B) :-
	engine_configuration(Entity_A, Entity_C),
	engine_configuration(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_excluding(Entity_A, Entity_B) :-
	excluding(Entity_A, Entity_C),
	excluding(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_including(Entity_A, Entity_B) :-
	including(Entity_A, Entity_C),
	including(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_criterion_used(Entity_A, Entity_B) :-
	criterion_used(Entity_A, Entity_C),
	criterion_used(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_asteroid_taxonomy(Entity_A, Entity_B) :-
	asteroid_taxonomy(Entity_A, Entity_C),
	asteroid_taxonomy(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_language_regulatory_body(Entity_A, Entity_B) :-
	language_regulatory_body(Entity_A, Entity_C),
	language_regulatory_body(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_academic_thesis(Entity_A, Entity_B) :-
	academic_thesis(Entity_A, Entity_C),
	academic_thesis(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_conferred_by(Entity_A, Entity_B) :-
	conferred_by(Entity_A, Entity_C),
	conferred_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_donated_by(Entity_A, Entity_B) :-
	donated_by(Entity_A, Entity_C),
	donated_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_crew_member_s_(Entity_A, Entity_B) :-
	crew_member_s_(Entity_A, Entity_C),
	crew_member_s_(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_digital_rights_management_drm_system(Entity_A, Entity_B) :-
	digital_rights_management_drm_system(Entity_A, Entity_C),
	digital_rights_management_drm_system(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_ghs_signal_word(Entity_A, Entity_B) :-
	ghs_signal_word(Entity_A, Entity_C),
	ghs_signal_word(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_main_food_source(Entity_A, Entity_B) :-
	main_food_source(Entity_A, Entity_C),
	main_food_source(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_honorific_suffix(Entity_A, Entity_B) :-
	honorific_suffix(Entity_A, Entity_C),
	honorific_suffix(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_director_manager(Entity_A, Entity_B) :-
	director_manager(Entity_A, Entity_C),
	director_manager(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_relative(Entity_A, Entity_B) :-
	relative(Entity_A, Entity_C),
	relative(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_kinship_to_subject(Entity_A, Entity_B) :-
	kinship_to_subject(Entity_A, Entity_C),
	kinship_to_subject(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_film_editor(Entity_A, Entity_B) :-
	film_editor(Entity_A, Entity_C),
	film_editor(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_socket_supported(Entity_A, Entity_B) :-
	socket_supported(Entity_A, Entity_C),
	socket_supported(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_discovery_method(Entity_A, Entity_B) :-
	discovery_method(Entity_A, Entity_C),
	discovery_method(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_worshipped_by(Entity_A, Entity_B) :-
	worshipped_by(Entity_A, Entity_C),
	worshipped_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_medical_condition(Entity_A, Entity_B) :-
	medical_condition(Entity_A, Entity_C),
	medical_condition(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_product_or_material_produced_or_service_provided(Entity_A, Entity_B) :-
	product_or_material_produced_or_service_provided(Entity_A, Entity_C),
	product_or_material_produced_or_service_provided(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_chromosome(Entity_A, Entity_B) :-
	chromosome(Entity_A, Entity_C),
	chromosome(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_disease_transmission_process(Entity_A, Entity_B) :-
	disease_transmission_process(Entity_A, Entity_C),
	disease_transmission_process(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_track_gauge(Entity_A, Entity_B) :-
	track_gauge(Entity_A, Entity_C),
	track_gauge(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_student_of(Entity_A, Entity_B) :-
	student_of(Entity_A, Entity_C),
	student_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_instruction_set(Entity_A, Entity_B) :-
	instruction_set(Entity_A, Entity_C),
	instruction_set(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_location_of_creation(Entity_A, Entity_B) :-
	location_of_creation(Entity_A, Entity_C),
	location_of_creation(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_readable_file_format(Entity_A, Entity_B) :-
	readable_file_format(Entity_A, Entity_C),
	readable_file_format(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_writable_file_format(Entity_A, Entity_B) :-
	writable_file_format(Entity_A, Entity_C),
	writable_file_format(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_fictional_or_mythical_analog_of(Entity_A, Entity_B) :-
	fictional_or_mythical_analog_of(Entity_A, Entity_C),
	fictional_or_mythical_analog_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_rector(Entity_A, Entity_B) :-
	rector(Entity_A, Entity_C),
	rector(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_valvetrain_configuration(Entity_A, Entity_B) :-
	valvetrain_configuration(Entity_A, Entity_C),
	valvetrain_configuration(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_launch_contractor(Entity_A, Entity_B) :-
	launch_contractor(Entity_A, Entity_C),
	launch_contractor(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_from_narrative_universe(Entity_A, Entity_B) :-
	from_narrative_universe(Entity_A, Entity_C),
	from_narrative_universe(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_human_development_index(Entity_A, Entity_B) :-
	human_development_index(Entity_A, Entity_C),
	human_development_index(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_population(Entity_A, Entity_B) :-
	population(Entity_A, Entity_C),
	population(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_maximum_capacity(Entity_A, Entity_B) :-
	maximum_capacity(Entity_A, Entity_C),
	maximum_capacity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_atomic_number(Entity_A, Entity_B) :-
	atomic_number(Entity_A, Entity_C),
	atomic_number(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_elo_rating(Entity_A, Entity_B) :-
	elo_rating(Entity_A, Entity_C),
	elo_rating(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_mohs_hardness(Entity_A, Entity_B) :-
	mohs_hardness(Entity_A, Entity_C),
	mohs_hardness(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_redshift(Entity_A, Entity_B) :-
	redshift(Entity_A, Entity_C),
	redshift(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_total_produced(Entity_A, Entity_B) :-
	total_produced(Entity_A, Entity_C),
	total_produced(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_gross_tonnage(Entity_A, Entity_B) :-
	gross_tonnage(Entity_A, Entity_C),
	gross_tonnage(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_orbital_eccentricity(Entity_A, Entity_B) :-
	orbital_eccentricity(Entity_A, Entity_C),
	orbital_eccentricity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_g_factor(Entity_A, Entity_B) :-
	g_factor(Entity_A, Entity_C),
	g_factor(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_speakers_writers_or_signers(Entity_A, Entity_B) :-
	number_of_speakers_writers_or_signers(Entity_A, Entity_C),
	number_of_speakers_writers_or_signers(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_masts(Entity_A, Entity_B) :-
	number_of_masts(Entity_A, Entity_C),
	number_of_masts(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_cylinders(Entity_A, Entity_B) :-
	number_of_cylinders(Entity_A, Entity_C),
	number_of_cylinders(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_floors_above_ground(Entity_A, Entity_B) :-
	floors_above_ground(Entity_A, Entity_C),
	floors_above_ground(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_flattening(Entity_A, Entity_B) :-
	flattening(Entity_A, Entity_C),
	flattening(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_platform_tracks(Entity_A, Entity_B) :-
	number_of_platform_tracks(Entity_A, Entity_C),
	number_of_platform_tracks(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_pages(Entity_A, Entity_B) :-
	number_of_pages(Entity_A, Entity_C),
	number_of_pages(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_sandbox_quantity(Entity_A, Entity_B) :-
	sandbox_quantity(Entity_A, Entity_C),
	sandbox_quantity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_proportion(Entity_A, Entity_B) :-
	proportion(Entity_A, Entity_C),
	proportion(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_electronegativity(Entity_A, Entity_B) :-
	electronegativity(Entity_A, Entity_C),
	electronegativity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_refractive_index(Entity_A, Entity_B) :-
	refractive_index(Entity_A, Entity_C),
	refractive_index(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_attendance(Entity_A, Entity_B) :-
	attendance(Entity_A, Entity_C),
	attendance(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_votes_received(Entity_A, Entity_B) :-
	votes_received(Entity_A, Entity_C),
	votes_received(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_episodes(Entity_A, Entity_B) :-
	number_of_episodes(Entity_A, Entity_C),
	number_of_episodes(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_quantity(Entity_A, Entity_B) :-
	quantity(Entity_A, Entity_C),
	quantity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_pka(Entity_A, Entity_B) :-
	pka(Entity_A, Entity_C),
	pka(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_deaths(Entity_A, Entity_B) :-
	number_of_deaths(Entity_A, Entity_C),
	number_of_deaths(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_oxidation_state(Entity_A, Entity_B) :-
	oxidation_state(Entity_A, Entity_C),
	oxidation_state(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_spin_quantum_number(Entity_A, Entity_B) :-
	spin_quantum_number(Entity_A, Entity_C),
	spin_quantum_number(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_parity_quantum_number(Entity_A, Entity_B) :-
	parity_quantum_number(Entity_A, Entity_C),
	parity_quantum_number(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_gini_coefficient(Entity_A, Entity_B) :-
	gini_coefficient(Entity_A, Entity_C),
	gini_coefficient(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_isospin_quantum_number(Entity_A, Entity_B) :-
	isospin_quantum_number(Entity_A, Entity_C),
	isospin_quantum_number(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_isospin_z_component(Entity_A, Entity_B) :-
	isospin_z_component(Entity_A, Entity_C),
	isospin_z_component(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_employees(Entity_A, Entity_B) :-
	employees(Entity_A, Entity_C),
	employees(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_national_team_appearances(Entity_A, Entity_B) :-
	national_team_appearances(Entity_A, Entity_C),
	national_team_appearances(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_participants(Entity_A, Entity_B) :-
	number_of_participants(Entity_A, Entity_C),
	number_of_participants(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_nomenclatural_status(Entity_A, Entity_B) :-
	nomenclatural_status(Entity_A, Entity_C),
	nomenclatural_status(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_solved_by(Entity_A, Entity_B) :-
	solved_by(Entity_A, Entity_C),
	solved_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_fossil_found_in_this_unit(Entity_A, Entity_B) :-
	fossil_found_in_this_unit(Entity_A, Entity_C),
	fossil_found_in_this_unit(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_floors_below_ground(Entity_A, Entity_B) :-
	floors_below_ground(Entity_A, Entity_C),
	floors_below_ground(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_processor_cores(Entity_A, Entity_B) :-
	number_of_processor_cores(Entity_A, Entity_C),
	number_of_processor_cores(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_political_ideology(Entity_A, Entity_B) :-
	political_ideology(Entity_A, Entity_C),
	political_ideology(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_lagrangian_point(Entity_A, Entity_B) :-
	lagrangian_point(Entity_A, Entity_C),
	lagrangian_point(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_neutron_number(Entity_A, Entity_B) :-
	neutron_number(Entity_A, Entity_C),
	neutron_number(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_location_of_landing(Entity_A, Entity_B) :-
	location_of_landing(Entity_A, Entity_C),
	location_of_landing(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_group_cardinality(Entity_A, Entity_B) :-
	group_cardinality(Entity_A, Entity_C),
	group_cardinality(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_home_world(Entity_A, Entity_B) :-
	home_world(Entity_A, Entity_C),
	home_world(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_transmitted_signal_type(Entity_A, Entity_B) :-
	transmitted_signal_type(Entity_A, Entity_C),
	transmitted_signal_type(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_approximation_algorithm(Entity_A, Entity_B) :-
	approximation_algorithm(Entity_A, Entity_C),
	approximation_algorithm(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_visitors_per_year(Entity_A, Entity_B) :-
	visitors_per_year(Entity_A, Entity_C),
	visitors_per_year(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_numeric_value(Entity_A, Entity_B) :-
	numeric_value(Entity_A, Entity_C),
	numeric_value(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_connecting_service(Entity_A, Entity_B) :-
	connecting_service(Entity_A, Entity_C),
	connecting_service(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_prevalence(Entity_A, Entity_B) :-
	prevalence(Entity_A, Entity_C),
	prevalence(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_received_signal_type(Entity_A, Entity_B) :-
	received_signal_type(Entity_A, Entity_C),
	received_signal_type(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_manner_of_death(Entity_A, Entity_B) :-
	manner_of_death(Entity_A, Entity_C),
	manner_of_death(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_unemployment_rate(Entity_A, Entity_B) :-
	unemployment_rate(Entity_A, Entity_C),
	unemployment_rate(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_mode_of_inheritance(Entity_A, Entity_B) :-
	mode_of_inheritance(Entity_A, Entity_C),
	mode_of_inheritance(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_category_for_the_water_basin(Entity_A, Entity_B) :-
	category_for_the_water_basin(Entity_A, Entity_C),
	category_for_the_water_basin(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_space_tug(Entity_A, Entity_B) :-
	space_tug(Entity_A, Entity_C),
	space_tug(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_carries_scientific_instrument(Entity_A, Entity_B) :-
	carries_scientific_instrument(Entity_A, Entity_C),
	carries_scientific_instrument(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_supercharger(Entity_A, Entity_B) :-
	supercharger(Entity_A, Entity_C),
	supercharger(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_fuel_system(Entity_A, Entity_B) :-
	fuel_system(Entity_A, Entity_C),
	fuel_system(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_apparent_magnitude(Entity_A, Entity_B) :-
	apparent_magnitude(Entity_A, Entity_C),
	apparent_magnitude(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_compressor_type(Entity_A, Entity_B) :-
	compressor_type(Entity_A, Entity_C),
	compressor_type(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_astronomical_filter(Entity_A, Entity_B) :-
	astronomical_filter(Entity_A, Entity_C),
	astronomical_filter(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_compression_ratio(Entity_A, Entity_B) :-
	compression_ratio(Entity_A, Entity_C),
	compression_ratio(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_valid_in_period(Entity_A, Entity_B) :-
	valid_in_period(Entity_A, Entity_C),
	valid_in_period(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_represents(Entity_A, Entity_B) :-
	represents(Entity_A, Entity_C),
	represents(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_facet_of(Entity_A, Entity_B) :-
	facet_of(Entity_A, Entity_C),
	facet_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_inflation_rate(Entity_A, Entity_B) :-
	inflation_rate(Entity_A, Entity_C),
	inflation_rate(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_filmography(Entity_A, Entity_B) :-
	filmography(Entity_A, Entity_C),
	filmography(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_godparent(Entity_A, Entity_B) :-
	godparent(Entity_A, Entity_C),
	godparent(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_emissivity(Entity_A, Entity_B) :-
	emissivity(Entity_A, Entity_C),
	emissivity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_depicted_by(Entity_A, Entity_B) :-
	depicted_by(Entity_A, Entity_C),
	depicted_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_elevators(Entity_A, Entity_B) :-
	number_of_elevators(Entity_A, Entity_C),
	number_of_elevators(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_primary_destinations(Entity_A, Entity_B) :-
	primary_destinations(Entity_A, Entity_C),
	primary_destinations(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_instrument(Entity_A, Entity_B) :-
	instrument(Entity_A, Entity_C),
	instrument(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_central_bank(Entity_A, Entity_B) :-
	central_bank(Entity_A, Entity_C),
	central_bank(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_officeholder(Entity_A, Entity_B) :-
	officeholder(Entity_A, Entity_C),
	officeholder(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_statement_disputed_by(Entity_A, Entity_B) :-
	statement_disputed_by(Entity_A, Entity_C),
	statement_disputed_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_facet_polytope(Entity_A, Entity_B) :-
	has_facet_polytope(Entity_A, Entity_C),
	has_facet_polytope(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_office_held_by_head_of_government(Entity_A, Entity_B) :-
	office_held_by_head_of_government(Entity_A, Entity_C),
	office_held_by_head_of_government(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_spans(Entity_A, Entity_B) :-
	number_of_spans(Entity_A, Entity_C),
	number_of_spans(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_proved_by(Entity_A, Entity_B) :-
	proved_by(Entity_A, Entity_C),
	proved_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_place_of_origin_switzerland_(Entity_A, Entity_B) :-
	place_of_origin_switzerland_(Entity_A, Entity_C),
	place_of_origin_switzerland_(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_dual_to(Entity_A, Entity_B) :-
	dual_to(Entity_A, Entity_C),
	dual_to(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_partner_in_business_or_sport(Entity_A, Entity_B) :-
	partner_in_business_or_sport(Entity_A, Entity_C),
	partner_in_business_or_sport(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_territory_claimed_by(Entity_A, Entity_B) :-
	territory_claimed_by(Entity_A, Entity_C),
	territory_claimed_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_injured(Entity_A, Entity_B) :-
	number_of_injured(Entity_A, Entity_C),
	number_of_injured(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_eye_color(Entity_A, Entity_B) :-
	eye_color(Entity_A, Entity_C),
	eye_color(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_seats(Entity_A, Entity_B) :-
	number_of_seats(Entity_A, Entity_C),
	number_of_seats(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_described_by_source(Entity_A, Entity_B) :-
	described_by_source(Entity_A, Entity_C),
	described_by_source(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_participant_in(Entity_A, Entity_B) :-
	participant_in(Entity_A, Entity_C),
	participant_in(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_victims_of_killer(Entity_A, Entity_B) :-
	number_of_victims_of_killer(Entity_A, Entity_C),
	number_of_victims_of_killer(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_winner(Entity_A, Entity_B) :-
	winner(Entity_A, Entity_C),
	winner(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_military_casualty_classification(Entity_A, Entity_B) :-
	military_casualty_classification(Entity_A, Entity_C),
	military_casualty_classification(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_ploidy(Entity_A, Entity_B) :-
	ploidy(Entity_A, Entity_C),
	ploidy(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_matches_played_races_starts(Entity_A, Entity_B) :-
	number_of_matches_played_races_starts(Entity_A, Entity_C),
	number_of_matches_played_races_starts(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_points_goals_set_scored(Entity_A, Entity_B) :-
	number_of_points_goals_set_scored(Entity_A, Entity_C),
	number_of_points_goals_set_scored(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_ranking(Entity_A, Entity_B) :-
	ranking(Entity_A, Entity_C),
	ranking(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_shown_with_features(Entity_A, Entity_B) :-
	shown_with_features(Entity_A, Entity_C),
	shown_with_features(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_wins(Entity_A, Entity_B) :-
	number_of_wins(Entity_A, Entity_C),
	number_of_wins(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_losses(Entity_A, Entity_B) :-
	number_of_losses(Entity_A, Entity_C),
	number_of_losses(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_draws_ties(Entity_A, Entity_B) :-
	number_of_draws_ties(Entity_A, Entity_C),
	number_of_draws_ties(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_points_for(Entity_A, Entity_B) :-
	points_for(Entity_A, Entity_C),
	points_for(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_points_goals_conceded(Entity_A, Entity_B) :-
	number_of_points_goals_conceded(Entity_A, Entity_C),
	number_of_points_goals_conceded(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_points_goal_scored_by(Entity_A, Entity_B) :-
	points_goal_scored_by(Entity_A, Entity_C),
	points_goal_scored_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_replaces(Entity_A, Entity_B) :-
	replaces(Entity_A, Entity_C),
	replaces(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_replaced_by(Entity_A, Entity_B) :-
	replaced_by(Entity_A, Entity_C),
	replaced_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_binding_of_software_library(Entity_A, Entity_B) :-
	binding_of_software_library(Entity_A, Entity_C),
	binding_of_software_library(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_daily_patronage(Entity_A, Entity_B) :-
	daily_patronage(Entity_A, Entity_C),
	daily_patronage(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_capital_of(Entity_A, Entity_B) :-
	capital_of(Entity_A, Entity_C),
	capital_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_partially_coincident_with(Entity_A, Entity_B) :-
	partially_coincident_with(Entity_A, Entity_C),
	partially_coincident_with(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_contains_settlement(Entity_A, Entity_B) :-
	contains_settlement(Entity_A, Entity_C),
	contains_settlement(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_political_alignment(Entity_A, Entity_B) :-
	political_alignment(Entity_A, Entity_C),
	political_alignment(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_product_certification(Entity_A, Entity_B) :-
	product_certification(Entity_A, Entity_C),
	product_certification(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_match_time_of_event(Entity_A, Entity_B) :-
	match_time_of_event(Entity_A, Entity_C),
	match_time_of_event(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_proxy(Entity_A, Entity_B) :-
	proxy(Entity_A, Entity_C),
	proxy(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_structure_replaces(Entity_A, Entity_B) :-
	structure_replaces(Entity_A, Entity_C),
	structure_replaces(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_convicted_of(Entity_A, Entity_B) :-
	convicted_of(Entity_A, Entity_C),
	convicted_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_original_combination(Entity_A, Entity_B) :-
	original_combination(Entity_A, Entity_C),
	original_combination(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_script_directionality(Entity_A, Entity_B) :-
	script_directionality(Entity_A, Entity_C),
	script_directionality(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_licensed_to_broadcast_to(Entity_A, Entity_B) :-
	licensed_to_broadcast_to(Entity_A, Entity_C),
	licensed_to_broadcast_to(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_seats_in_assembly(Entity_A, Entity_B) :-
	number_of_seats_in_assembly(Entity_A, Entity_C),
	number_of_seats_in_assembly(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_nominated_for(Entity_A, Entity_B) :-
	nominated_for(Entity_A, Entity_C),
	nominated_for(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_languages_spoken_written_or_signed(Entity_A, Entity_B) :-
	languages_spoken_written_or_signed(Entity_A, Entity_C),
	languages_spoken_written_or_signed(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_gui_toolkit_or_framework(Entity_A, Entity_B) :-
	gui_toolkit_or_framework(Entity_A, Entity_C),
	gui_toolkit_or_framework(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_affiliation(Entity_A, Entity_B) :-
	affiliation(Entity_A, Entity_C),
	affiliation(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_orbits_completed(Entity_A, Entity_B) :-
	orbits_completed(Entity_A, Entity_C),
	orbits_completed(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_shape(Entity_A, Entity_B) :-
	shape(Entity_A, Entity_C),
	shape(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_taxon_synonym(Entity_A, Entity_B) :-
	taxon_synonym(Entity_A, Entity_C),
	taxon_synonym(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_template_has_topic(Entity_A, Entity_B) :-
	template_has_topic(Entity_A, Entity_C),
	template_has_topic(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_topic_s_main_template(Entity_A, Entity_B) :-
	topic_s_main_template(Entity_A, Entity_C),
	topic_s_main_template(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_ecoregion_wwf_(Entity_A, Entity_B) :-
	ecoregion_wwf_(Entity_A, Entity_C),
	ecoregion_wwf_(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_start_point(Entity_A, Entity_B) :-
	start_point(Entity_A, Entity_C),
	start_point(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_pet(Entity_A, Entity_B) :-
	has_pet(Entity_A, Entity_C),
	has_pet(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_executive_producer(Entity_A, Entity_B) :-
	executive_producer(Entity_A, Entity_C),
	executive_producer(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_published_in(Entity_A, Entity_B) :-
	published_in(Entity_A, Entity_C),
	published_in(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_takes_place_in_fictional_universe(Entity_A, Entity_B) :-
	takes_place_in_fictional_universe(Entity_A, Entity_C),
	takes_place_in_fictional_universe(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_heritage_designation(Entity_A, Entity_B) :-
	heritage_designation(Entity_A, Entity_C),
	heritage_designation(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_collection_or_exhibition_size(Entity_A, Entity_B) :-
	collection_or_exhibition_size(Entity_A, Entity_C),
	collection_or_exhibition_size(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_plea(Entity_A, Entity_B) :-
	plea(Entity_A, Entity_C),
	plea(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_present_in_work(Entity_A, Entity_B) :-
	present_in_work(Entity_A, Entity_C),
	present_in_work(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_score_method(Entity_A, Entity_B) :-
	score_method(Entity_A, Entity_C),
	score_method(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_destination_point(Entity_A, Entity_B) :-
	destination_point(Entity_A, Entity_C),
	destination_point(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_fictional_universe_described_in(Entity_A, Entity_B) :-
	fictional_universe_described_in(Entity_A, Entity_C),
	fictional_universe_described_in(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_missing(Entity_A, Entity_B) :-
	number_of_missing(Entity_A, Entity_C),
	number_of_missing(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_legal_form(Entity_A, Entity_B) :-
	legal_form(Entity_A, Entity_C),
	legal_form(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_list_of_works(Entity_A, Entity_B) :-
	list_of_works(Entity_A, Entity_C),
	list_of_works(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_list_of_monuments(Entity_A, Entity_B) :-
	list_of_monuments(Entity_A, Entity_C),
	list_of_monuments(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_absolute_magnitude(Entity_A, Entity_B) :-
	absolute_magnitude(Entity_A, Entity_C),
	absolute_magnitude(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_color_index(Entity_A, Entity_B) :-
	color_index(Entity_A, Entity_C),
	color_index(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_standards_body(Entity_A, Entity_B) :-
	standards_body(Entity_A, Entity_C),
	standards_body(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_category_for_people_born_here(Entity_A, Entity_B) :-
	category_for_people_born_here(Entity_A, Entity_C),
	category_for_people_born_here(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_category_for_people_who_died_here(Entity_A, Entity_B) :-
	category_for_people_who_died_here(Entity_A, Entity_C),
	category_for_people_who_died_here(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_maximum_glide_ratio(Entity_A, Entity_B) :-
	maximum_glide_ratio(Entity_A, Entity_C),
	maximum_glide_ratio(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_immediate_cause(Entity_A, Entity_B) :-
	has_immediate_cause(Entity_A, Entity_C),
	has_immediate_cause(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_contributing_factor(Entity_A, Entity_B) :-
	has_contributing_factor(Entity_A, Entity_C),
	has_contributing_factor(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_sourcing_circumstances(Entity_A, Entity_B) :-
	sourcing_circumstances(Entity_A, Entity_C),
	sourcing_circumstances(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_hybrid_of(Entity_A, Entity_B) :-
	hybrid_of(Entity_A, Entity_C),
	hybrid_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_country_for_sport(Entity_A, Entity_B) :-
	country_for_sport(Entity_A, Entity_C),
	country_for_sport(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_family_name_identical_to_this_given_name(Entity_A, Entity_B) :-
	family_name_identical_to_this_given_name(Entity_A, Entity_C),
	family_name_identical_to_this_given_name(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_end_cause(Entity_A, Entity_B) :-
	end_cause(Entity_A, Entity_C),
	end_cause(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_used_by(Entity_A, Entity_B) :-
	used_by(Entity_A, Entity_C),
	used_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_immediate_cause_of(Entity_A, Entity_B) :-
	immediate_cause_of(Entity_A, Entity_C),
	immediate_cause_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_contributing_factor_of(Entity_A, Entity_B) :-
	contributing_factor_of(Entity_A, Entity_C),
	contributing_factor_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_households(Entity_A, Entity_B) :-
	number_of_households(Entity_A, Entity_C),
	number_of_households(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_female_population(Entity_A, Entity_B) :-
	female_population(Entity_A, Entity_C),
	female_population(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_male_population(Entity_A, Entity_B) :-
	male_population(Entity_A, Entity_C),
	male_population(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_effect(Entity_A, Entity_B) :-
	has_effect(Entity_A, Entity_C),
	has_effect(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_motto(Entity_A, Entity_B) :-
	motto(Entity_A, Entity_C),
	motto(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_depends_on_software(Entity_A, Entity_B) :-
	depends_on_software(Entity_A, Entity_C),
	depends_on_software(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_maximum_strahler_number(Entity_A, Entity_B) :-
	maximum_strahler_number(Entity_A, Entity_C),
	maximum_strahler_number(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_characteristic(Entity_A, Entity_B) :-
	has_characteristic(Entity_A, Entity_C),
	has_characteristic(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_manifestation_of(Entity_A, Entity_B) :-
	manifestation_of(Entity_A, Entity_C),
	manifestation_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_tempo_marking(Entity_A, Entity_B) :-
	tempo_marking(Entity_A, Entity_C),
	tempo_marking(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_given_name_version_for_other_gender(Entity_A, Entity_B) :-
	given_name_version_for_other_gender(Entity_A, Entity_C),
	given_name_version_for_other_gender(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_survivors(Entity_A, Entity_B) :-
	number_of_survivors(Entity_A, Entity_C),
	number_of_survivors(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_definition_domain(Entity_A, Entity_B) :-
	definition_domain(Entity_A, Entity_C),
	definition_domain(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_codomain(Entity_A, Entity_B) :-
	codomain(Entity_A, Entity_C),
	codomain(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_exemplar_of(Entity_A, Entity_B) :-
	exemplar_of(Entity_A, Entity_C),
	exemplar_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_lifestyle(Entity_A, Entity_B) :-
	lifestyle(Entity_A, Entity_C),
	lifestyle(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_natural_product_of_taxon(Entity_A, Entity_B) :-
	natural_product_of_taxon(Entity_A, Entity_C),
	natural_product_of_taxon(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_lowest_point(Entity_A, Entity_B) :-
	lowest_point(Entity_A, Entity_C),
	lowest_point(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_casualties(Entity_A, Entity_B) :-
	number_of_casualties(Entity_A, Entity_C),
	number_of_casualties(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_defendant(Entity_A, Entity_B) :-
	defendant(Entity_A, Entity_C),
	defendant(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_prosecutor(Entity_A, Entity_B) :-
	prosecutor(Entity_A, Entity_C),
	prosecutor(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_defender(Entity_A, Entity_B) :-
	defender(Entity_A, Entity_C),
	defender(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_judge(Entity_A, Entity_B) :-
	judge(Entity_A, Entity_C),
	judge(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_charge(Entity_A, Entity_B) :-
	charge(Entity_A, Entity_C),
	charge(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_penalty(Entity_A, Entity_B) :-
	penalty(Entity_A, Entity_C),
	penalty(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_consecrator(Entity_A, Entity_B) :-
	consecrator(Entity_A, Entity_C),
	consecrator(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_cases(Entity_A, Entity_B) :-
	number_of_cases(Entity_A, Entity_C),
	number_of_cases(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_biosafety_level(Entity_A, Entity_B) :-
	biosafety_level(Entity_A, Entity_C),
	biosafety_level(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_natural_reservoir(Entity_A, Entity_B) :-
	has_natural_reservoir(Entity_A, Entity_C),
	has_natural_reservoir(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_natural_reservoir_of(Entity_A, Entity_B) :-
	natural_reservoir_of(Entity_A, Entity_C),
	natural_reservoir_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_nato_code_for_grade(Entity_A, Entity_B) :-
	nato_code_for_grade(Entity_A, Entity_C),
	nato_code_for_grade(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_plaintiff(Entity_A, Entity_B) :-
	plaintiff(Entity_A, Entity_C),
	plaintiff(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_driving_side(Entity_A, Entity_B) :-
	driving_side(Entity_A, Entity_C),
	driving_side(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_melody(Entity_A, Entity_B) :-
	has_melody(Entity_A, Entity_C),
	has_melody(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_undercarriage(Entity_A, Entity_B) :-
	undercarriage(Entity_A, Entity_C),
	undercarriage(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_pendant_of(Entity_A, Entity_B) :-
	pendant_of(Entity_A, Entity_C),
	pendant_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_curator(Entity_A, Entity_B) :-
	curator(Entity_A, Entity_C),
	curator(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_port(Entity_A, Entity_B) :-
	port(Entity_A, Entity_C),
	port(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_acquisition_transaction(Entity_A, Entity_B) :-
	acquisition_transaction(Entity_A, Entity_C),
	acquisition_transaction(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_departure_transaction(Entity_A, Entity_B) :-
	departure_transaction(Entity_A, Entity_C),
	departure_transaction(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_referee(Entity_A, Entity_B) :-
	referee(Entity_A, Entity_C),
	referee(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_wing_configuration(Entity_A, Entity_B) :-
	wing_configuration(Entity_A, Entity_C),
	wing_configuration(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_unveiled_by(Entity_A, Entity_B) :-
	unveiled_by(Entity_A, Entity_C),
	unveiled_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_mpa_film_rating(Entity_A, Entity_B) :-
	mpa_film_rating(Entity_A, Entity_C),
	mpa_film_rating(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_index_case(Entity_A, Entity_B) :-
	has_index_case(Entity_A, Entity_C),
	has_index_case(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_alexa_rank(Entity_A, Entity_B) :-
	alexa_rank(Entity_A, Entity_C),
	alexa_rank(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_this_taxon_is_source_of(Entity_A, Entity_B) :-
	this_taxon_is_source_of(Entity_A, Entity_C),
	this_taxon_is_source_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_confirmed(Entity_A, Entity_B) :-
	number_confirmed(Entity_A, Entity_C),
	number_confirmed(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_probable(Entity_A, Entity_B) :-
	number_probable(Entity_A, Entity_C),
	number_probable(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_suspected(Entity_A, Entity_B) :-
	number_suspected(Entity_A, Entity_C),
	number_suspected(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_index_case_of(Entity_A, Entity_B) :-
	index_case_of(Entity_A, Entity_C),
	index_case_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_vertex_figure(Entity_A, Entity_B) :-
	has_vertex_figure(Entity_A, Entity_C),
	has_vertex_figure(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_for_work(Entity_A, Entity_B) :-
	for_work(Entity_A, Entity_C),
	for_work(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_central_government_debt_as_a_percent_of_gdp(Entity_A, Entity_B) :-
	central_government_debt_as_a_percent_of_gdp(Entity_A, Entity_C),
	central_government_debt_as_a_percent_of_gdp(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_total_valid_votes(Entity_A, Entity_B) :-
	total_valid_votes(Entity_A, Entity_C),
	total_valid_votes(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_is_pollinated_by(Entity_A, Entity_B) :-
	is_pollinated_by(Entity_A, Entity_C),
	is_pollinated_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_is_pollinator_of(Entity_A, Entity_B) :-
	is_pollinator_of(Entity_A, Entity_C),
	is_pollinator_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_together_with(Entity_A, Entity_B) :-
	together_with(Entity_A, Entity_C),
	together_with(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_brand(Entity_A, Entity_B) :-
	brand(Entity_A, Entity_C),
	brand(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_beats_per_minute(Entity_A, Entity_B) :-
	beats_per_minute(Entity_A, Entity_C),
	beats_per_minute(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_fach_vocal_classification(Entity_A, Entity_B) :-
	fach_vocal_classification(Entity_A, Entity_C),
	fach_vocal_classification(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_category_for_films_shot_at_this_location(Entity_A, Entity_B) :-
	category_for_films_shot_at_this_location(Entity_A, Entity_C),
	category_for_films_shot_at_this_location(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_name_day(Entity_A, Entity_B) :-
	name_day(Entity_A, Entity_C),
	name_day(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_scale(Entity_A, Entity_B) :-
	scale(Entity_A, Entity_C),
	scale(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_list_related_to_category(Entity_A, Entity_B) :-
	list_related_to_category(Entity_A, Entity_C),
	list_related_to_category(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_category_related_to_list(Entity_A, Entity_B) :-
	category_related_to_list(Entity_A, Entity_C),
	category_related_to_list(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_workshop_of(Entity_A, Entity_B) :-
	workshop_of(Entity_A, Entity_C),
	workshop_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_follower_of(Entity_A, Entity_B) :-
	follower_of(Entity_A, Entity_C),
	follower_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_circle_of(Entity_A, Entity_B) :-
	circle_of(Entity_A, Entity_C),
	circle_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_manner_of(Entity_A, Entity_B) :-
	manner_of(Entity_A, Entity_C),
	manner_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_forgery_after(Entity_A, Entity_B) :-
	forgery_after(Entity_A, Entity_C),
	forgery_after(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_possible_creator(Entity_A, Entity_B) :-
	possible_creator(Entity_A, Entity_C),
	possible_creator(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_school_of(Entity_A, Entity_B) :-
	school_of(Entity_A, Entity_C),
	school_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_chief_operating_officer(Entity_A, Entity_B) :-
	chief_operating_officer(Entity_A, Entity_C),
	chief_operating_officer(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_category_of_people_buried_here(Entity_A, Entity_B) :-
	category_of_people_buried_here(Entity_A, Entity_C),
	category_of_people_buried_here(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_category_of_associated_people(Entity_A, Entity_B) :-
	category_of_associated_people(Entity_A, Entity_C),
	category_of_associated_people(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_choreographer(Entity_A, Entity_B) :-
	choreographer(Entity_A, Entity_C),
	choreographer(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_list_of_episodes(Entity_A, Entity_B) :-
	list_of_episodes(Entity_A, Entity_C),
	list_of_episodes(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_addressee(Entity_A, Entity_B) :-
	addressee(Entity_A, Entity_C),
	addressee(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_owner_of(Entity_A, Entity_B) :-
	owner_of(Entity_A, Entity_C),
	owner_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_electorate(Entity_A, Entity_B) :-
	electorate(Entity_A, Entity_C),
	electorate(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_registered_users_contributors(Entity_A, Entity_B) :-
	number_of_registered_users_contributors(Entity_A, Entity_C),
	number_of_registered_users_contributors(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_investigated_by(Entity_A, Entity_B) :-
	investigated_by(Entity_A, Entity_C),
	investigated_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_input_set(Entity_A, Entity_B) :-
	input_set(Entity_A, Entity_C),
	input_set(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_blood_type(Entity_A, Entity_B) :-
	blood_type(Entity_A, Entity_C),
	blood_type(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_eligible_voters(Entity_A, Entity_B) :-
	eligible_voters(Entity_A, Entity_C),
	eligible_voters(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_ballots_cast(Entity_A, Entity_B) :-
	ballots_cast(Entity_A, Entity_C),
	ballots_cast(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_minimum_number_of_players(Entity_A, Entity_B) :-
	minimum_number_of_players(Entity_A, Entity_C),
	minimum_number_of_players(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_maximum_number_of_players(Entity_A, Entity_B) :-
	maximum_number_of_players(Entity_A, Entity_C),
	maximum_number_of_players(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_represented_by(Entity_A, Entity_B) :-
	represented_by(Entity_A, Entity_C),
	represented_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_vessel(Entity_A, Entity_B) :-
	vessel(Entity_A, Entity_C),
	vessel(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_after_a_work_by(Entity_A, Entity_B) :-
	after_a_work_by(Entity_A, Entity_C),
	after_a_work_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_vox_atypi_classification(Entity_A, Entity_B) :-
	vox_atypi_classification(Entity_A, Entity_C),
	vox_atypi_classification(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_income_classification_philippines_(Entity_A, Entity_B) :-
	income_classification_philippines_(Entity_A, Entity_C),
	income_classification_philippines_(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_measurement_scale(Entity_A, Entity_B) :-
	measurement_scale(Entity_A, Entity_C),
	measurement_scale(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_list_of_characters(Entity_A, Entity_B) :-
	list_of_characters(Entity_A, Entity_C),
	list_of_characters(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_hair_color(Entity_A, Entity_B) :-
	hair_color(Entity_A, Entity_C),
	hair_color(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_cathedral(Entity_A, Entity_B) :-
	cathedral(Entity_A, Entity_C),
	cathedral(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_vice_county(Entity_A, Entity_B) :-
	vice_county(Entity_A, Entity_C),
	vice_county(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_different_from(Entity_A, Entity_B) :-
	different_from(Entity_A, Entity_C),
	different_from(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_signatory(Entity_A, Entity_B) :-
	signatory(Entity_A, Entity_C),
	signatory(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_highest_note(Entity_A, Entity_B) :-
	highest_note(Entity_A, Entity_C),
	highest_note(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_lowest_note(Entity_A, Entity_B) :-
	lowest_note(Entity_A, Entity_C),
	lowest_note(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_volcanic_explosivity_index(Entity_A, Entity_B) :-
	volcanic_explosivity_index(Entity_A, Entity_C),
	volcanic_explosivity_index(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_office_held_by_head_of_state(Entity_A, Entity_B) :-
	office_held_by_head_of_state(Entity_A, Entity_C),
	office_held_by_head_of_state(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_side_effect(Entity_A, Entity_B) :-
	side_effect(Entity_A, Entity_C),
	side_effect(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_decreased_expression_in(Entity_A, Entity_B) :-
	decreased_expression_in(Entity_A, Entity_C),
	decreased_expression_in(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_increased_expression_in(Entity_A, Entity_B) :-
	increased_expression_in(Entity_A, Entity_C),
	increased_expression_in(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_gene_deletion_association_with(Entity_A, Entity_B) :-
	gene_deletion_association_with(Entity_A, Entity_C),
	gene_deletion_association_with(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_gene_duplication_association_with(Entity_A, Entity_B) :-
	gene_duplication_association_with(Entity_A, Entity_C),
	gene_duplication_association_with(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_gene_insertion_association_with(Entity_A, Entity_B) :-
	gene_insertion_association_with(Entity_A, Entity_C),
	gene_insertion_association_with(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_gene_inversion_association_with(Entity_A, Entity_B) :-
	gene_inversion_association_with(Entity_A, Entity_C),
	gene_inversion_association_with(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_gene_substitution_association_with(Entity_A, Entity_B) :-
	gene_substitution_association_with(Entity_A, Entity_C),
	gene_substitution_association_with(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_posttranslational_modification_association_with(Entity_A, Entity_B) :-
	posttranslational_modification_association_with(Entity_A, Entity_C),
	posttranslational_modification_association_with(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_altered_regulation_leads_to(Entity_A, Entity_B) :-
	altered_regulation_leads_to(Entity_A, Entity_C),
	altered_regulation_leads_to(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_participating_team(Entity_A, Entity_B) :-
	participating_team(Entity_A, Entity_C),
	participating_team(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_vaccine_for(Entity_A, Entity_B) :-
	vaccine_for(Entity_A, Entity_C),
	vaccine_for(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_second_family_name_in_spanish_name(Entity_A, Entity_B) :-
	second_family_name_in_spanish_name(Entity_A, Entity_C),
	second_family_name_in_spanish_name(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_investor(Entity_A, Entity_B) :-
	investor(Entity_A, Entity_C),
	investor(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_takeoff_and_landing_capability(Entity_A, Entity_B) :-
	takeoff_and_landing_capability(Entity_A, Entity_C),
	takeoff_and_landing_capability(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_children(Entity_A, Entity_B) :-
	number_of_children(Entity_A, Entity_C),
	number_of_children(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_fsk_film_rating(Entity_A, Entity_B) :-
	fsk_film_rating(Entity_A, Entity_C),
	fsk_film_rating(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_species_kept(Entity_A, Entity_B) :-
	species_kept(Entity_A, Entity_C),
	species_kept(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_health_specialty(Entity_A, Entity_B) :-
	health_specialty(Entity_A, Entity_C),
	health_specialty(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_unesco_language_status(Entity_A, Entity_B) :-
	unesco_language_status(Entity_A, Entity_C),
	unesco_language_status(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_cuisine(Entity_A, Entity_B) :-
	cuisine(Entity_A, Entity_C),
	cuisine(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_erdős_number(Entity_A, Entity_B) :-
	erdős_number(Entity_A, Entity_C),
	erdős_number(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_category_for_pictures_taken_with_equipment(Entity_A, Entity_B) :-
	category_for_pictures_taken_with_equipment(Entity_A, Entity_C),
	category_for_pictures_taken_with_equipment(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_length(Entity_A, Entity_B) :-
	length(Entity_A, Entity_C),
	length(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_elevation_above_sea_level(Entity_A, Entity_B) :-
	elevation_above_sea_level(Entity_A, Entity_C),
	elevation_above_sea_level(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_orbital_inclination(Entity_A, Entity_B) :-
	orbital_inclination(Entity_A, Entity_C),
	orbital_inclination(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_area(Entity_A, Entity_B) :-
	area(Entity_A, Entity_C),
	area(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_duration(Entity_A, Entity_B) :-
	duration(Entity_A, Entity_C),
	duration(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_height(Entity_A, Entity_B) :-
	height(Entity_A, Entity_C),
	height(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_width(Entity_A, Entity_B) :-
	width(Entity_A, Entity_C),
	width(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_wingspan(Entity_A, Entity_B) :-
	wingspan(Entity_A, Entity_C),
	wingspan(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_m_sin_i(Entity_A, Entity_B) :-
	m_sin_i(Entity_A, Entity_C),
	m_sin_i(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_speed(Entity_A, Entity_B) :-
	speed(Entity_A, Entity_C),
	speed(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_watershed_area(Entity_A, Entity_B) :-
	watershed_area(Entity_A, Entity_C),
	watershed_area(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_density(Entity_A, Entity_B) :-
	density(Entity_A, Entity_C),
	density(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_electrical_conductivity(Entity_A, Entity_B) :-
	electrical_conductivity(Entity_A, Entity_C),
	electrical_conductivity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_specific_heat_capacity(Entity_A, Entity_B) :-
	specific_heat_capacity(Entity_A, Entity_C),
	specific_heat_capacity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_depositary(Entity_A, Entity_B) :-
	depositary(Entity_A, Entity_C),
	depositary(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_luminosity(Entity_A, Entity_B) :-
	luminosity(Entity_A, Entity_C),
	luminosity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_aspect_ratio_w_h_(Entity_A, Entity_B) :-
	aspect_ratio_w_h_(Entity_A, Entity_C),
	aspect_ratio_w_h_(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_molar_fusion_enthalpy(Entity_A, Entity_B) :-
	molar_fusion_enthalpy(Entity_A, Entity_C),
	molar_fusion_enthalpy(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_mass(Entity_A, Entity_B) :-
	mass(Entity_A, Entity_C),
	mass(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_thermal_conductivity(Entity_A, Entity_B) :-
	thermal_conductivity(Entity_A, Entity_C),
	thermal_conductivity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_magnetic_moment(Entity_A, Entity_B) :-
	magnetic_moment(Entity_A, Entity_C),
	magnetic_moment(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_vehicle_range(Entity_A, Entity_B) :-
	vehicle_range(Entity_A, Entity_C),
	vehicle_range(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_speed_of_sound(Entity_A, Entity_B) :-
	speed_of_sound(Entity_A, Entity_C),
	speed_of_sound(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_temperature(Entity_A, Entity_B) :-
	temperature(Entity_A, Entity_C),
	temperature(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_under_pressure(Entity_A, Entity_B) :-
	under_pressure(Entity_A, Entity_C),
	under_pressure(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_fabrication_method(Entity_A, Entity_B) :-
	fabrication_method(Entity_A, Entity_C),
	fabrication_method(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_competition_class(Entity_A, Entity_B) :-
	competition_class(Entity_A, Entity_C),
	competition_class(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_co_driver(Entity_A, Entity_B) :-
	co_driver(Entity_A, Entity_C),
	co_driver(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_term_length_of_office(Entity_A, Entity_B) :-
	term_length_of_office(Entity_A, Entity_C),
	term_length_of_office(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_substitute_deputy_replacement_of_office_officeholder(Entity_A, Entity_B) :-
	substitute_deputy_replacement_of_office_officeholder(Entity_A, Entity_C),
	substitute_deputy_replacement_of_office_officeholder(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_melting_point(Entity_A, Entity_B) :-
	melting_point(Entity_A, Entity_C),
	melting_point(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_boiling_point(Entity_A, Entity_B) :-
	boiling_point(Entity_A, Entity_C),
	boiling_point(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_size_of_team_at_start(Entity_A, Entity_B) :-
	size_of_team_at_start(Entity_A, Entity_C),
	size_of_team_at_start(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_size_of_team_at_finish(Entity_A, Entity_B) :-
	size_of_team_at_finish(Entity_A, Entity_C),
	size_of_team_at_finish(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_decomposition_point(Entity_A, Entity_B) :-
	decomposition_point(Entity_A, Entity_C),
	decomposition_point(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_nominal_power_capacity(Entity_A, Entity_B) :-
	nominal_power_capacity(Entity_A, Entity_C),
	nominal_power_capacity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_wing_area(Entity_A, Entity_B) :-
	wing_area(Entity_A, Entity_C),
	wing_area(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_sublimation_temperature(Entity_A, Entity_B) :-
	sublimation_temperature(Entity_A, Entity_C),
	sublimation_temperature(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_half_life(Entity_A, Entity_B) :-
	half_life(Entity_A, Entity_C),
	half_life(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_molar_enthalpy_of_vaporization(Entity_A, Entity_B) :-
	molar_enthalpy_of_vaporization(Entity_A, Entity_C),
	molar_enthalpy_of_vaporization(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_combustion_enthalpy(Entity_A, Entity_B) :-
	combustion_enthalpy(Entity_A, Entity_C),
	combustion_enthalpy(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_kinematic_viscosity(Entity_A, Entity_B) :-
	kinematic_viscosity(Entity_A, Entity_C),
	kinematic_viscosity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_vapor_pressure(Entity_A, Entity_B) :-
	vapor_pressure(Entity_A, Entity_C),
	vapor_pressure(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_radius(Entity_A, Entity_B) :-
	radius(Entity_A, Entity_C),
	radius(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_prize_money(Entity_A, Entity_B) :-
	prize_money(Entity_A, Entity_C),
	prize_money(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_member_count(Entity_A, Entity_B) :-
	member_count(Entity_A, Entity_C),
	member_count(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_international_nuclear_event_scale(Entity_A, Entity_B) :-
	international_nuclear_event_scale(Entity_A, Entity_C),
	international_nuclear_event_scale(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_flash_point(Entity_A, Entity_B) :-
	flash_point(Entity_A, Entity_C),
	flash_point(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_immediately_dangerous_to_life_or_health(Entity_A, Entity_B) :-
	immediately_dangerous_to_life_or_health(Entity_A, Entity_C),
	immediately_dangerous_to_life_or_health(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_cost(Entity_A, Entity_B) :-
	cost(Entity_A, Entity_C),
	cost(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_nominal_gdp(Entity_A, Entity_B) :-
	nominal_gdp(Entity_A, Entity_C),
	nominal_gdp(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_nominal_gdp_per_capita(Entity_A, Entity_B) :-
	nominal_gdp_per_capita(Entity_A, Entity_C),
	nominal_gdp_per_capita(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_total_debt(Entity_A, Entity_B) :-
	total_debt(Entity_A, Entity_C),
	total_debt(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_total_reserves(Entity_A, Entity_B) :-
	total_reserves(Entity_A, Entity_C),
	total_reserves(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_total_exports(Entity_A, Entity_B) :-
	total_exports(Entity_A, Entity_C),
	total_exports(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_total_imports(Entity_A, Entity_B) :-
	total_imports(Entity_A, Entity_C),
	total_imports(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_total_equity(Entity_A, Entity_B) :-
	total_equity(Entity_A, Entity_C),
	total_equity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_total_liabilities(Entity_A, Entity_B) :-
	total_liabilities(Entity_A, Entity_C),
	total_liabilities(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_total_revenue(Entity_A, Entity_B) :-
	total_revenue(Entity_A, Entity_C),
	total_revenue(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_foreign_direct_investment_net_outflow(Entity_A, Entity_B) :-
	foreign_direct_investment_net_outflow(Entity_A, Entity_C),
	foreign_direct_investment_net_outflow(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_foreign_direct_investment_net_inflow(Entity_A, Entity_B) :-
	foreign_direct_investment_net_inflow(Entity_A, Entity_C),
	foreign_direct_investment_net_inflow(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_box_office(Entity_A, Entity_B) :-
	box_office(Entity_A, Entity_C),
	box_office(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_genome_size(Entity_A, Entity_B) :-
	genome_size(Entity_A, Entity_C),
	genome_size(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_frequency(Entity_A, Entity_B) :-
	frequency(Entity_A, Entity_C),
	frequency(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_explosive_energy_equivalent(Entity_A, Entity_B) :-
	explosive_energy_equivalent(Entity_A, Entity_C),
	explosive_energy_equivalent(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_orbital_period(Entity_A, Entity_B) :-
	orbital_period(Entity_A, Entity_C),
	orbital_period(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_rotation_period(Entity_A, Entity_B) :-
	rotation_period(Entity_A, Entity_C),
	rotation_period(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_distance_from_river_mouth(Entity_A, Entity_B) :-
	distance_from_river_mouth(Entity_A, Entity_C),
	distance_from_river_mouth(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_clock_frequency(Entity_A, Entity_B) :-
	clock_frequency(Entity_A, Entity_C),
	clock_frequency(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_fsb_speed(Entity_A, Entity_B) :-
	fsb_speed(Entity_A, Entity_C),
	fsb_speed(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_focal_length(Entity_A, Entity_B) :-
	focal_length(Entity_A, Entity_C),
	focal_length(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_antiparticle(Entity_A, Entity_B) :-
	antiparticle(Entity_A, Entity_C),
	antiparticle(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_binding_energy(Entity_A, Entity_B) :-
	binding_energy(Entity_A, Entity_C),
	binding_energy(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_solid_solution_series_with(Entity_A, Entity_B) :-
	solid_solution_series_with(Entity_A, Entity_C),
	solid_solution_series_with(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_pseudo_crystal_habit(Entity_A, Entity_B) :-
	pseudo_crystal_habit(Entity_A, Entity_C),
	pseudo_crystal_habit(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_computes_solution_to(Entity_A, Entity_B) :-
	computes_solution_to(Entity_A, Entity_C),
	computes_solution_to(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_mass_excess(Entity_A, Entity_B) :-
	mass_excess(Entity_A, Entity_C),
	mass_excess(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_medical_condition_treated(Entity_A, Entity_B) :-
	medical_condition_treated(Entity_A, Entity_C),
	medical_condition_treated(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_drug_or_therapy_used_for_treatment(Entity_A, Entity_B) :-
	drug_or_therapy_used_for_treatment(Entity_A, Entity_C),
	drug_or_therapy_used_for_treatment(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_solubility(Entity_A, Entity_B) :-
	solubility(Entity_A, Entity_C),
	solubility(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_solvent(Entity_A, Entity_B) :-
	solvent(Entity_A, Entity_C),
	solvent(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_history_of_topic(Entity_A, Entity_B) :-
	history_of_topic(Entity_A, Entity_C),
	history_of_topic(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_students_count(Entity_A, Entity_B) :-
	students_count(Entity_A, Entity_C),
	students_count(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_production_rate(Entity_A, Entity_B) :-
	production_rate(Entity_A, Entity_C),
	production_rate(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_average_gradient(Entity_A, Entity_B) :-
	average_gradient(Entity_A, Entity_C),
	average_gradient(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_autoignition_temperature(Entity_A, Entity_B) :-
	autoignition_temperature(Entity_A, Entity_C),
	autoignition_temperature(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_electric_charge(Entity_A, Entity_B) :-
	electric_charge(Entity_A, Entity_C),
	electric_charge(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_electric_dipole_moment(Entity_A, Entity_B) :-
	electric_dipole_moment(Entity_A, Entity_C),
	electric_dipole_moment(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_lower_flammable_limit(Entity_A, Entity_B) :-
	lower_flammable_limit(Entity_A, Entity_C),
	lower_flammable_limit(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_upper_flammable_limit(Entity_A, Entity_B) :-
	upper_flammable_limit(Entity_A, Entity_C),
	upper_flammable_limit(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_minimum_explosive_concentration(Entity_A, Entity_B) :-
	minimum_explosive_concentration(Entity_A, Entity_C),
	minimum_explosive_concentration(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_average_shot_length(Entity_A, Entity_B) :-
	average_shot_length(Entity_A, Entity_C),
	average_shot_length(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_relative_to(Entity_A, Entity_B) :-
	relative_to(Entity_A, Entity_C),
	relative_to(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_position_angle(Entity_A, Entity_B) :-
	position_angle(Entity_A, Entity_C),
	position_angle(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_angular_distance(Entity_A, Entity_B) :-
	angular_distance(Entity_A, Entity_C),
	angular_distance(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_longitude_of_ascending_node(Entity_A, Entity_B) :-
	longitude_of_ascending_node(Entity_A, Entity_C),
	longitude_of_ascending_node(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_parallax(Entity_A, Entity_B) :-
	parallax(Entity_A, Entity_C),
	parallax(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_radial_velocity(Entity_A, Entity_B) :-
	radial_velocity(Entity_A, Entity_C),
	radial_velocity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_cruise_speed(Entity_A, Entity_B) :-
	cruise_speed(Entity_A, Entity_C),
	cruise_speed(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_net_worth(Entity_A, Entity_B) :-
	net_worth(Entity_A, Entity_C),
	net_worth(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_real_gdp_growth_rate(Entity_A, Entity_B) :-
	real_gdp_growth_rate(Entity_A, Entity_C),
	real_gdp_growth_rate(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_household_wealth(Entity_A, Entity_B) :-
	household_wealth(Entity_A, Entity_C),
	household_wealth(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_flux(Entity_A, Entity_B) :-
	flux(Entity_A, Entity_C),
	flux(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_gyromagnetic_ratio(Entity_A, Entity_B) :-
	gyromagnetic_ratio(Entity_A, Entity_C),
	gyromagnetic_ratio(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_decay_width(Entity_A, Entity_B) :-
	decay_width(Entity_A, Entity_C),
	decay_width(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_discharge(Entity_A, Entity_B) :-
	discharge(Entity_A, Entity_C),
	discharge(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_market_capitalization(Entity_A, Entity_B) :-
	market_capitalization(Entity_A, Entity_C),
	market_capitalization(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_metallicity(Entity_A, Entity_B) :-
	metallicity(Entity_A, Entity_C),
	metallicity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_maximum_thrust(Entity_A, Entity_B) :-
	maximum_thrust(Entity_A, Entity_C),
	maximum_thrust(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_thermal_design_power(Entity_A, Entity_B) :-
	thermal_design_power(Entity_A, Entity_C),
	thermal_design_power(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_torque(Entity_A, Entity_B) :-
	torque(Entity_A, Entity_C),
	torque(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_explosive_velocity(Entity_A, Entity_B) :-
	explosive_velocity(Entity_A, Entity_C),
	explosive_velocity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_cash(Entity_A, Entity_B) :-
	cash(Entity_A, Entity_C),
	cash(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_semi_major_axis_of_an_orbit(Entity_A, Entity_B) :-
	semi_major_axis_of_an_orbit(Entity_A, Entity_C),
	semi_major_axis_of_an_orbit(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_volume_as_quantity(Entity_A, Entity_B) :-
	volume_as_quantity(Entity_A, Entity_C),
	volume_as_quantity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_official_symbol(Entity_A, Entity_B) :-
	official_symbol(Entity_A, Entity_C),
	official_symbol(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_first_aid_measures(Entity_A, Entity_B) :-
	first_aid_measures(Entity_A, Entity_C),
	first_aid_measures(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_median_lethal_dose_ld50_(Entity_A, Entity_B) :-
	median_lethal_dose_ld50_(Entity_A, Entity_C),
	median_lethal_dose_ld50_(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_reason_for_deprecated_rank(Entity_A, Entity_B) :-
	reason_for_deprecated_rank(Entity_A, Entity_C),
	reason_for_deprecated_rank(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_apoapsis(Entity_A, Entity_B) :-
	apoapsis(Entity_A, Entity_C),
	apoapsis(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_periapsis(Entity_A, Entity_B) :-
	periapsis(Entity_A, Entity_C),
	periapsis(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_argument_of_periapsis(Entity_A, Entity_B) :-
	argument_of_periapsis(Entity_A, Entity_C),
	argument_of_periapsis(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_life_expectancy(Entity_A, Entity_B) :-
	life_expectancy(Entity_A, Entity_C),
	life_expectancy(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_maximum_operating_altitude(Entity_A, Entity_B) :-
	maximum_operating_altitude(Entity_A, Entity_C),
	maximum_operating_altitude(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_event_interval(Entity_A, Entity_B) :-
	event_interval(Entity_A, Entity_C),
	event_interval(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_ionization_energy(Entity_A, Entity_B) :-
	ionization_energy(Entity_A, Entity_C),
	ionization_energy(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_beam(Entity_A, Entity_B) :-
	beam(Entity_A, Entity_C),
	beam(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_draft(Entity_A, Entity_B) :-
	draft(Entity_A, Entity_C),
	draft(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_ambitus(Entity_A, Entity_B) :-
	ambitus(Entity_A, Entity_C),
	ambitus(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_uses(Entity_A, Entity_B) :-
	uses(Entity_A, Entity_C),
	uses(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_price(Entity_A, Entity_B) :-
	price(Entity_A, Entity_C),
	price(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_arterial_supply(Entity_A, Entity_B) :-
	arterial_supply(Entity_A, Entity_C),
	arterial_supply(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_lymphatic_drainage(Entity_A, Entity_B) :-
	lymphatic_drainage(Entity_A, Entity_C),
	lymphatic_drainage(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_venous_drainage(Entity_A, Entity_B) :-
	venous_drainage(Entity_A, Entity_C),
	venous_drainage(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_charted_in(Entity_A, Entity_B) :-
	charted_in(Entity_A, Entity_C),
	charted_in(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_consumption_rate(Entity_A, Entity_B) :-
	consumption_rate(Entity_A, Entity_C),
	consumption_rate(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_genetic_association(Entity_A, Entity_B) :-
	genetic_association(Entity_A, Entity_C),
	genetic_association(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_balance_of_trade(Entity_A, Entity_B) :-
	balance_of_trade(Entity_A, Entity_C),
	balance_of_trade(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_net_profit(Entity_A, Entity_B) :-
	net_profit(Entity_A, Entity_C),
	net_profit(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_money_supply(Entity_A, Entity_B) :-
	money_supply(Entity_A, Entity_C),
	money_supply(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_employment_by_economic_sector(Entity_A, Entity_B) :-
	employment_by_economic_sector(Entity_A, Entity_C),
	employment_by_economic_sector(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_ppp_gdp_per_capita(Entity_A, Entity_B) :-
	ppp_gdp_per_capita(Entity_A, Entity_C),
	ppp_gdp_per_capita(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_minimal_lethal_dose(Entity_A, Entity_B) :-
	minimal_lethal_dose(Entity_A, Entity_C),
	minimal_lethal_dose(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_property_constraint(Entity_A, Entity_B) :-
	property_constraint(Entity_A, Entity_C),
	property_constraint(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_exception_to_constraint(Entity_A, Entity_B) :-
	exception_to_constraint(Entity_A, Entity_C),
	exception_to_constraint(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_item_of_property_constraint(Entity_A, Entity_B) :-
	item_of_property_constraint(Entity_A, Entity_C),
	item_of_property_constraint(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_class(Entity_A, Entity_B) :-
	class(Entity_A, Entity_C),
	class(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_relation(Entity_A, Entity_B) :-
	relation(Entity_A, Entity_C),
	relation(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_maximum_value(Entity_A, Entity_B) :-
	maximum_value(Entity_A, Entity_C),
	maximum_value(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_minimum_value(Entity_A, Entity_B) :-
	minimum_value(Entity_A, Entity_C),
	minimum_value(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_constraint_status(Entity_A, Entity_B) :-
	constraint_status(Entity_A, Entity_C),
	constraint_status(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_debut_participant(Entity_A, Entity_B) :-
	debut_participant(Entity_A, Entity_C),
	debut_participant(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_elector(Entity_A, Entity_B) :-
	elector(Entity_A, Entity_C),
	elector(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_aftershocks(Entity_A, Entity_B) :-
	aftershocks(Entity_A, Entity_C),
	aftershocks(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_general_classification_of_race_participants(Entity_A, Entity_B) :-
	general_classification_of_race_participants(Entity_A, Entity_C),
	general_classification_of_race_participants(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_quantity_buried(Entity_A, Entity_B) :-
	quantity_buried(Entity_A, Entity_C),
	quantity_buried(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_mean_anomaly(Entity_A, Entity_B) :-
	mean_anomaly(Entity_A, Entity_C),
	mean_anomaly(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_antagonist_muscle(Entity_A, Entity_B) :-
	antagonist_muscle(Entity_A, Entity_C),
	antagonist_muscle(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_indigenous_to(Entity_A, Entity_B) :-
	indigenous_to(Entity_A, Entity_C),
	indigenous_to(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_time_period(Entity_A, Entity_B) :-
	time_period(Entity_A, Entity_C),
	time_period(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_graves(Entity_A, Entity_B) :-
	number_of_graves(Entity_A, Entity_C),
	number_of_graves(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_applies_to_taxon(Entity_A, Entity_B) :-
	applies_to_taxon(Entity_A, Entity_C),
	applies_to_taxon(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_statistical_unit(Entity_A, Entity_B) :-
	statistical_unit(Entity_A, Entity_C),
	statistical_unit(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_list(Entity_A, Entity_B) :-
	has_list(Entity_A, Entity_C),
	has_list(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_roman_praenomen(Entity_A, Entity_B) :-
	roman_praenomen(Entity_A, Entity_C),
	roman_praenomen(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_roman_nomen_gentilicium(Entity_A, Entity_B) :-
	roman_nomen_gentilicium(Entity_A, Entity_C),
	roman_nomen_gentilicium(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_intended_public(Entity_A, Entity_B) :-
	intended_public(Entity_A, Entity_C),
	intended_public(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_online_service(Entity_A, Entity_B) :-
	online_service(Entity_A, Entity_C),
	online_service(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_time_to_altitude(Entity_A, Entity_B) :-
	time_to_altitude(Entity_A, Entity_C),
	time_to_altitude(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_nmhh_film_rating(Entity_A, Entity_B) :-
	nmhh_film_rating(Entity_A, Entity_C),
	nmhh_film_rating(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_roman_cognomen(Entity_A, Entity_B) :-
	roman_cognomen(Entity_A, Entity_C),
	roman_cognomen(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_roman_agnomen(Entity_A, Entity_B) :-
	roman_agnomen(Entity_A, Entity_C),
	roman_agnomen(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_conversion_to_si_unit(Entity_A, Entity_B) :-
	conversion_to_si_unit(Entity_A, Entity_C),
	conversion_to_si_unit(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_fao_risk_status(Entity_A, Entity_B) :-
	fao_risk_status(Entity_A, Entity_C),
	fao_risk_status(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_natural_abundance(Entity_A, Entity_B) :-
	natural_abundance(Entity_A, Entity_C),
	natural_abundance(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_superpartner(Entity_A, Entity_B) :-
	has_superpartner(Entity_A, Entity_C),
	has_superpartner(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_superpartner_of(Entity_A, Entity_B) :-
	superpartner_of(Entity_A, Entity_C),
	superpartner_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_issued_by(Entity_A, Entity_B) :-
	issued_by(Entity_A, Entity_C),
	issued_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_deprecated_in_version(Entity_A, Entity_B) :-
	deprecated_in_version(Entity_A, Entity_C),
	deprecated_in_version(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_statement_describes(Entity_A, Entity_B) :-
	statement_describes(Entity_A, Entity_C),
	statement_describes(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_diameter(Entity_A, Entity_B) :-
	diameter(Entity_A, Entity_C),
	diameter(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_office_held_by_head_of_the_organization(Entity_A, Entity_B) :-
	office_held_by_head_of_the_organization(Entity_A, Entity_C),
	office_held_by_head_of_the_organization(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_organization_directed_by_the_office_or_position(Entity_A, Entity_B) :-
	organization_directed_by_the_office_or_position(Entity_A, Entity_C),
	organization_directed_by_the_office_or_position(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_teaching_method(Entity_A, Entity_B) :-
	teaching_method(Entity_A, Entity_C),
	teaching_method(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_image_of_function(Entity_A, Entity_B) :-
	image_of_function(Entity_A, Entity_C),
	image_of_function(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_total_expenditure(Entity_A, Entity_B) :-
	total_expenditure(Entity_A, Entity_C),
	total_expenditure(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_total_assets(Entity_A, Entity_B) :-
	total_assets(Entity_A, Entity_C),
	total_assets(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_time_weighted_average_exposure_limit(Entity_A, Entity_B) :-
	time_weighted_average_exposure_limit(Entity_A, Entity_C),
	time_weighted_average_exposure_limit(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_ceiling_exposure_limit(Entity_A, Entity_B) :-
	ceiling_exposure_limit(Entity_A, Entity_C),
	ceiling_exposure_limit(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_maximum_peak_exposure_limit(Entity_A, Entity_B) :-
	maximum_peak_exposure_limit(Entity_A, Entity_C),
	maximum_peak_exposure_limit(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_short_term_exposure_limit(Entity_A, Entity_B) :-
	short_term_exposure_limit(Entity_A, Entity_C),
	short_term_exposure_limit(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_set_in_period(Entity_A, Entity_B) :-
	set_in_period(Entity_A, Entity_C),
	set_in_period(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_substrate_of(Entity_A, Entity_B) :-
	substrate_of(Entity_A, Entity_C),
	substrate_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_personal_best(Entity_A, Entity_B) :-
	personal_best(Entity_A, Entity_C),
	personal_best(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_sports_discipline_competed_in(Entity_A, Entity_B) :-
	sports_discipline_competed_in(Entity_A, Entity_C),
	sports_discipline_competed_in(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_stage_classification(Entity_A, Entity_B) :-
	stage_classification(Entity_A, Entity_C),
	stage_classification(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_expected_completeness(Entity_A, Entity_B) :-
	expected_completeness(Entity_A, Entity_C),
	expected_completeness(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_takeoff_roll(Entity_A, Entity_B) :-
	takeoff_roll(Entity_A, Entity_C),
	takeoff_roll(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_gender_of_a_scientific_name_of_a_genus(Entity_A, Entity_B) :-
	gender_of_a_scientific_name_of_a_genus(Entity_A, Entity_C),
	gender_of_a_scientific_name_of_a_genus(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_voltage(Entity_A, Entity_B) :-
	voltage(Entity_A, Entity_C),
	voltage(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_seasons(Entity_A, Entity_B) :-
	number_of_seasons(Entity_A, Entity_C),
	number_of_seasons(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_narrator(Entity_A, Entity_B) :-
	narrator(Entity_A, Entity_C),
	narrator(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_conversion_to_standard_unit(Entity_A, Entity_B) :-
	conversion_to_standard_unit(Entity_A, Entity_C),
	conversion_to_standard_unit(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_stage_reached(Entity_A, Entity_B) :-
	stage_reached(Entity_A, Entity_C),
	stage_reached(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_homoglyph(Entity_A, Entity_B) :-
	homoglyph(Entity_A, Entity_C),
	homoglyph(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_metasubclass_of(Entity_A, Entity_B) :-
	metasubclass_of(Entity_A, Entity_C),
	metasubclass_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_nominee(Entity_A, Entity_B) :-
	nominee(Entity_A, Entity_C),
	nominee(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_member_of_the_deme(Entity_A, Entity_B) :-
	member_of_the_deme(Entity_A, Entity_C),
	member_of_the_deme(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_league_level_above(Entity_A, Entity_B) :-
	league_level_above(Entity_A, Entity_C),
	league_level_above(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_league_level_below(Entity_A, Entity_B) :-
	league_level_below(Entity_A, Entity_C),
	league_level_below(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_results(Entity_A, Entity_B) :-
	results(Entity_A, Entity_C),
	results(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_classification_of_race(Entity_A, Entity_B) :-
	classification_of_race(Entity_A, Entity_C),
	classification_of_race(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_carries(Entity_A, Entity_B) :-
	carries(Entity_A, Entity_C),
	carries(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_corrigendum_erratum(Entity_A, Entity_B) :-
	corrigendum_erratum(Entity_A, Entity_C),
	corrigendum_erratum(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_spin_off(Entity_A, Entity_B) :-
	has_spin_off(Entity_A, Entity_C),
	has_spin_off(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_costume_designer(Entity_A, Entity_B) :-
	costume_designer(Entity_A, Entity_C),
	costume_designer(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_category_for_recipients_of_this_award(Entity_A, Entity_B) :-
	category_for_recipients_of_this_award(Entity_A, Entity_C),
	category_for_recipients_of_this_award(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_victory(Entity_A, Entity_B) :-
	victory(Entity_A, Entity_C),
	victory(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_earthquake_magnitude_on_the_moment_magnitude_scale(Entity_A, Entity_B) :-
	earthquake_magnitude_on_the_moment_magnitude_scale(Entity_A, Entity_C),
	earthquake_magnitude_on_the_moment_magnitude_scale(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_earthquake_magnitude_on_the_richter_magnitude_scale(Entity_A, Entity_B) :-
	earthquake_magnitude_on_the_richter_magnitude_scale(Entity_A, Entity_C),
	earthquake_magnitude_on_the_richter_magnitude_scale(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_lowest_atmospheric_pressure(Entity_A, Entity_B) :-
	lowest_atmospheric_pressure(Entity_A, Entity_C),
	lowest_atmospheric_pressure(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_operating_area(Entity_A, Entity_B) :-
	operating_area(Entity_A, Entity_C),
	operating_area(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_acceptable_daily_intake(Entity_A, Entity_B) :-
	acceptable_daily_intake(Entity_A, Entity_C),
	acceptable_daily_intake(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_bowling_style(Entity_A, Entity_B) :-
	bowling_style(Entity_A, Entity_C),
	bowling_style(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_sidekick_of(Entity_A, Entity_B) :-
	sidekick_of(Entity_A, Entity_C),
	sidekick_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_perimeter(Entity_A, Entity_B) :-
	perimeter(Entity_A, Entity_C),
	perimeter(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_strand_orientation(Entity_A, Entity_B) :-
	strand_orientation(Entity_A, Entity_C),
	strand_orientation(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_recording_or_performance_of(Entity_A, Entity_B) :-
	recording_or_performance_of(Entity_A, Entity_C),
	recording_or_performance_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_used_metre(Entity_A, Entity_B) :-
	used_metre(Entity_A, Entity_C),
	used_metre(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_in_work(Entity_A, Entity_B) :-
	in_work(Entity_A, Entity_C),
	in_work(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_production_designer(Entity_A, Entity_B) :-
	production_designer(Entity_A, Entity_C),
	production_designer(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_fee(Entity_A, Entity_B) :-
	fee(Entity_A, Entity_C),
	fee(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_bore(Entity_A, Entity_B) :-
	bore(Entity_A, Entity_C),
	bore(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_stroke(Entity_A, Entity_B) :-
	stroke(Entity_A, Entity_C),
	stroke(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_gpu(Entity_A, Entity_B) :-
	gpu(Entity_A, Entity_C),
	gpu(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_superhuman_feature_or_ability(Entity_A, Entity_B) :-
	superhuman_feature_or_ability(Entity_A, Entity_C),
	superhuman_feature_or_ability(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_köppen_climate_classification(Entity_A, Entity_B) :-
	köppen_climate_classification(Entity_A, Entity_C),
	köppen_climate_classification(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_global_warming_potential(Entity_A, Entity_B) :-
	global_warming_potential(Entity_A, Entity_C),
	global_warming_potential(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_amended_by(Entity_A, Entity_B) :-
	amended_by(Entity_A, Entity_C),
	amended_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_repealed_by(Entity_A, Entity_B) :-
	repealed_by(Entity_A, Entity_C),
	repealed_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_uncertainty_corresponds_to(Entity_A, Entity_B) :-
	uncertainty_corresponds_to(Entity_A, Entity_C),
	uncertainty_corresponds_to(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_out_of_school_children(Entity_A, Entity_B) :-
	number_of_out_of_school_children(Entity_A, Entity_C),
	number_of_out_of_school_children(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_measures(Entity_A, Entity_B) :-
	measures(Entity_A, Entity_C),
	measures(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_admissible_rule_in(Entity_A, Entity_B) :-
	admissible_rule_in(Entity_A, Entity_C),
	admissible_rule_in(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_is_the_study_of(Entity_A, Entity_B) :-
	is_the_study_of(Entity_A, Entity_C),
	is_the_study_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_studied_in(Entity_A, Entity_B) :-
	studied_in(Entity_A, Entity_C),
	studied_in(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_distance_from_earth(Entity_A, Entity_B) :-
	distance_from_earth(Entity_A, Entity_C),
	distance_from_earth(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_phoneme(Entity_A, Entity_B) :-
	has_phoneme(Entity_A, Entity_C),
	has_phoneme(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_grammatical_option_indicates(Entity_A, Entity_B) :-
	grammatical_option_indicates(Entity_A, Entity_C),
	grammatical_option_indicates(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_maximum_gradient(Entity_A, Entity_B) :-
	maximum_gradient(Entity_A, Entity_C),
	maximum_gradient(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_culture(Entity_A, Entity_B) :-
	culture(Entity_A, Entity_C),
	culture(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_gram_staining(Entity_A, Entity_B) :-
	gram_staining(Entity_A, Entity_C),
	gram_staining(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_block_size(Entity_A, Entity_B) :-
	block_size(Entity_A, Entity_C),
	block_size(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_thickness(Entity_A, Entity_B) :-
	thickness(Entity_A, Entity_C),
	thickness(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_world_heritage_criteria(Entity_A, Entity_B) :-
	world_heritage_criteria(Entity_A, Entity_C),
	world_heritage_criteria(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_bbfc_rating(Entity_A, Entity_B) :-
	bbfc_rating(Entity_A, Entity_C),
	bbfc_rating(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_cost_of_damage(Entity_A, Entity_B) :-
	cost_of_damage(Entity_A, Entity_C),
	cost_of_damage(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_place_of_detention(Entity_A, Entity_B) :-
	place_of_detention(Entity_A, Entity_C),
	place_of_detention(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_geography_of_topic(Entity_A, Entity_B) :-
	geography_of_topic(Entity_A, Entity_C),
	geography_of_topic(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_model(Entity_A, Entity_B) :-
	model(Entity_A, Entity_C),
	model(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_parts_of_this_work(Entity_A, Entity_B) :-
	number_of_parts_of_this_work(Entity_A, Entity_C),
	number_of_parts_of_this_work(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_rars_rating(Entity_A, Entity_B) :-
	rars_rating(Entity_A, Entity_C),
	rars_rating(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_carnegie_classification_of_institutions_of_higher_education(Entity_A, Entity_B) :-
	carnegie_classification_of_institutions_of_higher_education(Entity_A, Entity_C),
	carnegie_classification_of_institutions_of_higher_education(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_mean_lifetime(Entity_A, Entity_B) :-
	mean_lifetime(Entity_A, Entity_C),
	mean_lifetime(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_source_of_material(Entity_A, Entity_B) :-
	source_of_material(Entity_A, Entity_C),
	source_of_material(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_interested_in(Entity_A, Entity_B) :-
	interested_in(Entity_A, Entity_C),
	interested_in(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_partnership_with(Entity_A, Entity_B) :-
	partnership_with(Entity_A, Entity_C),
	partnership_with(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_scoville_grade(Entity_A, Entity_B) :-
	scoville_grade(Entity_A, Entity_C),
	scoville_grade(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_topographic_isolation(Entity_A, Entity_B) :-
	topographic_isolation(Entity_A, Entity_C),
	topographic_isolation(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_topographic_prominence(Entity_A, Entity_B) :-
	topographic_prominence(Entity_A, Entity_C),
	topographic_prominence(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_target_interest_rate(Entity_A, Entity_B) :-
	target_interest_rate(Entity_A, Entity_C),
	target_interest_rate(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_consumption_rate_per_capita(Entity_A, Entity_B) :-
	consumption_rate_per_capita(Entity_A, Entity_C),
	consumption_rate_per_capita(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_common_equity_tier_1_capital_ratio_ceti_(Entity_A, Entity_B) :-
	common_equity_tier_1_capital_ratio_ceti_(Entity_A, Entity_C),
	common_equity_tier_1_capital_ratio_ceti_(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_units_sold(Entity_A, Entity_B) :-
	units_sold(Entity_A, Entity_C),
	units_sold(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_alcohol_by_volume(Entity_A, Entity_B) :-
	alcohol_by_volume(Entity_A, Entity_C),
	alcohol_by_volume(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_corresponding_template(Entity_A, Entity_B) :-
	corresponding_template(Entity_A, Entity_C),
	corresponding_template(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_stability_of_property_value(Entity_A, Entity_B) :-
	stability_of_property_value(Entity_A, Entity_C),
	stability_of_property_value(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_part_s_of_the_class(Entity_A, Entity_B) :-
	has_part_s_of_the_class(Entity_A, Entity_C),
	has_part_s_of_the_class(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_next_crossing_upstream(Entity_A, Entity_B) :-
	next_crossing_upstream(Entity_A, Entity_C),
	next_crossing_upstream(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_next_crossing_downstream(Entity_A, Entity_B) :-
	next_crossing_downstream(Entity_A, Entity_C),
	next_crossing_downstream(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_reply_to(Entity_A, Entity_B) :-
	reply_to(Entity_A, Entity_C),
	reply_to(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_author_of_foreword(Entity_A, Entity_B) :-
	author_of_foreword(Entity_A, Entity_C),
	author_of_foreword(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_author_of_afterword(Entity_A, Entity_B) :-
	author_of_afterword(Entity_A, Entity_C),
	author_of_afterword(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_is_recto_of(Entity_A, Entity_B) :-
	is_recto_of(Entity_A, Entity_C),
	is_recto_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_is_verso_of(Entity_A, Entity_B) :-
	is_verso_of(Entity_A, Entity_C),
	is_verso_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_kijkwijzer_rating(Entity_A, Entity_B) :-
	kijkwijzer_rating(Entity_A, Entity_C),
	kijkwijzer_rating(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_type_locality_geology_(Entity_A, Entity_B) :-
	type_locality_geology_(Entity_A, Entity_C),
	type_locality_geology_(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_protocol(Entity_A, Entity_B) :-
	protocol(Entity_A, Entity_C),
	protocol(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_file_format(Entity_A, Entity_B) :-
	file_format(Entity_A, Entity_C),
	file_format(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_dataset_distribution(Entity_A, Entity_B) :-
	dataset_distribution(Entity_A, Entity_C),
	dataset_distribution(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_minimal_lethal_concentration(Entity_A, Entity_B) :-
	minimal_lethal_concentration(Entity_A, Entity_C),
	minimal_lethal_concentration(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_median_lethal_concentration_lc50_(Entity_A, Entity_B) :-
	median_lethal_concentration_lc50_(Entity_A, Entity_C),
	median_lethal_concentration_lc50_(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_elected_in(Entity_A, Entity_B) :-
	elected_in(Entity_A, Entity_C),
	elected_in(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_no_observed_adverse_effect_level(Entity_A, Entity_B) :-
	no_observed_adverse_effect_level(Entity_A, Entity_C),
	no_observed_adverse_effect_level(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_lowest_observed_adverse_effect_level(Entity_A, Entity_B) :-
	lowest_observed_adverse_effect_level(Entity_A, Entity_C),
	lowest_observed_adverse_effect_level(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_union_of(Entity_A, Entity_B) :-
	union_of(Entity_A, Entity_C),
	union_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_disjoint_union_of(Entity_A, Entity_B) :-
	disjoint_union_of(Entity_A, Entity_C),
	disjoint_union_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_typeface_font_used(Entity_A, Entity_B) :-
	typeface_font_used(Entity_A, Entity_C),
	typeface_font_used(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_this_zoological_name_is_coordinate_with(Entity_A, Entity_B) :-
	this_zoological_name_is_coordinate_with(Entity_A, Entity_C),
	this_zoological_name_is_coordinate_with(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_production_statistics(Entity_A, Entity_B) :-
	production_statistics(Entity_A, Entity_C),
	production_statistics(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_filmiroda_rating(Entity_A, Entity_B) :-
	filmiroda_rating(Entity_A, Entity_C),
	filmiroda_rating(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_eirin_film_rating(Entity_A, Entity_B) :-
	eirin_film_rating(Entity_A, Entity_C),
	eirin_film_rating(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_cnc_film_rating_france_(Entity_A, Entity_B) :-
	cnc_film_rating_france_(Entity_A, Entity_C),
	cnc_film_rating_france_(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_budget(Entity_A, Entity_B) :-
	budget(Entity_A, Entity_C),
	budget(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_source_of_income(Entity_A, Entity_B) :-
	source_of_income(Entity_A, Entity_C),
	source_of_income(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_race_time(Entity_A, Entity_B) :-
	race_time(Entity_A, Entity_C),
	race_time(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_mercalli_intensity_scale(Entity_A, Entity_B) :-
	mercalli_intensity_scale(Entity_A, Entity_C),
	mercalli_intensity_scale(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_longest_span(Entity_A, Entity_B) :-
	longest_span(Entity_A, Entity_C),
	longest_span(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_connects_with(Entity_A, Entity_B) :-
	connects_with(Entity_A, Entity_C),
	connects_with(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_net_tonnage(Entity_A, Entity_B) :-
	net_tonnage(Entity_A, Entity_C),
	net_tonnage(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_power_consumed(Entity_A, Entity_B) :-
	power_consumed(Entity_A, Entity_C),
	power_consumed(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_clearance(Entity_A, Entity_B) :-
	clearance(Entity_A, Entity_C),
	clearance(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_sound_power_level(Entity_A, Entity_B) :-
	sound_power_level(Entity_A, Entity_C),
	sound_power_level(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_vibration(Entity_A, Entity_B) :-
	vibration(Entity_A, Entity_C),
	vibration(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_molar_volume(Entity_A, Entity_B) :-
	molar_volume(Entity_A, Entity_C),
	molar_volume(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_wavelength(Entity_A, Entity_B) :-
	wavelength(Entity_A, Entity_C),
	wavelength(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_house_publication(Entity_A, Entity_B) :-
	house_publication(Entity_A, Entity_C),
	house_publication(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_appears_in_the_heritage_monument_list(Entity_A, Entity_B) :-
	appears_in_the_heritage_monument_list(Entity_A, Entity_C),
	appears_in_the_heritage_monument_list(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_cardinality_of_this_set(Entity_A, Entity_B) :-
	cardinality_of_this_set(Entity_A, Entity_C),
	cardinality_of_this_set(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_by_product(Entity_A, Entity_B) :-
	by_product(Entity_A, Entity_C),
	by_product(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_by_product_of(Entity_A, Entity_B) :-
	by_product_of(Entity_A, Entity_C),
	by_product_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_via(Entity_A, Entity_B) :-
	via(Entity_A, Entity_C),
	via(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_flower_color(Entity_A, Entity_B) :-
	flower_color(Entity_A, Entity_C),
	flower_color(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_corporate_officer(Entity_A, Entity_B) :-
	corporate_officer(Entity_A, Entity_C),
	corporate_officer(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_totem(Entity_A, Entity_B) :-
	totem(Entity_A, Entity_C),
	totem(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_individual_tax_rate(Entity_A, Entity_B) :-
	individual_tax_rate(Entity_A, Entity_C),
	individual_tax_rate(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_lowest_income_threshold(Entity_A, Entity_B) :-
	lowest_income_threshold(Entity_A, Entity_C),
	lowest_income_threshold(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_highest_income_threshold(Entity_A, Entity_B) :-
	highest_income_threshold(Entity_A, Entity_C),
	highest_income_threshold(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_professional_name(Entity_A, Entity_B) :-
	professional_name(Entity_A, Entity_C),
	professional_name(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_gait(Entity_A, Entity_B) :-
	gait(Entity_A, Entity_C),
	gait(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_age_of_onset(Entity_A, Entity_B) :-
	age_of_onset(Entity_A, Entity_C),
	age_of_onset(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_place_of_marriage(Entity_A, Entity_B) :-
	place_of_marriage(Entity_A, Entity_C),
	place_of_marriage(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_incidence(Entity_A, Entity_B) :-
	incidence(Entity_A, Entity_C),
	incidence(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_disabled_accessibility(Entity_A, Entity_B) :-
	disabled_accessibility(Entity_A, Entity_C),
	disabled_accessibility(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_wi_fi_access(Entity_A, Entity_B) :-
	wi_fi_access(Entity_A, Entity_C),
	wi_fi_access(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_produced_by(Entity_A, Entity_B) :-
	produced_by(Entity_A, Entity_C),
	produced_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_payment_types_accepted(Entity_A, Entity_B) :-
	payment_types_accepted(Entity_A, Entity_C),
	payment_types_accepted(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_emergency_phone_number(Entity_A, Entity_B) :-
	emergency_phone_number(Entity_A, Entity_C),
	emergency_phone_number(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_electrical_plug_type(Entity_A, Entity_B) :-
	electrical_plug_type(Entity_A, Entity_C),
	electrical_plug_type(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_disease_burden(Entity_A, Entity_B) :-
	disease_burden(Entity_A, Entity_C),
	disease_burden(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_vat_rate(Entity_A, Entity_B) :-
	vat_rate(Entity_A, Entity_C),
	vat_rate(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_cites_work(Entity_A, Entity_B) :-
	cites_work(Entity_A, Entity_C),
	cites_work(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_subject_has_role(Entity_A, Entity_B) :-
	subject_has_role(Entity_A, Entity_C),
	subject_has_role(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_record_or_record_progression(Entity_A, Entity_B) :-
	record_or_record_progression(Entity_A, Entity_C),
	record_or_record_progression(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_visitor_center(Entity_A, Entity_B) :-
	visitor_center(Entity_A, Entity_C),
	visitor_center(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_time_in_space(Entity_A, Entity_B) :-
	time_in_space(Entity_A, Entity_C),
	time_in_space(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_property_usage_tracking_category(Entity_A, Entity_B) :-
	property_usage_tracking_category(Entity_A, Entity_C),
	property_usage_tracking_category(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_type_of_unit_for_this_property(Entity_A, Entity_B) :-
	type_of_unit_for_this_property(Entity_A, Entity_C),
	type_of_unit_for_this_property(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_promoted(Entity_A, Entity_B) :-
	promoted(Entity_A, Entity_C),
	promoted(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_relegated(Entity_A, Entity_B) :-
	relegated(Entity_A, Entity_C),
	relegated(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_mains_voltage(Entity_A, Entity_B) :-
	mains_voltage(Entity_A, Entity_C),
	mains_voltage(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_day_of_week(Entity_A, Entity_B) :-
	day_of_week(Entity_A, Entity_C),
	day_of_week(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_maximum_sustained_winds(Entity_A, Entity_B) :-
	maximum_sustained_winds(Entity_A, Entity_C),
	maximum_sustained_winds(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_publication_interval(Entity_A, Entity_B) :-
	publication_interval(Entity_A, Entity_C),
	publication_interval(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_minimum_age(Entity_A, Entity_B) :-
	minimum_age(Entity_A, Entity_C),
	minimum_age(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_utc_timezone_offset(Entity_A, Entity_B) :-
	utc_timezone_offset(Entity_A, Entity_C),
	utc_timezone_offset(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_time_gap(Entity_A, Entity_B) :-
	time_gap(Entity_A, Entity_C),
	time_gap(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_distinctive_jersey(Entity_A, Entity_B) :-
	distinctive_jersey(Entity_A, Entity_C),
	distinctive_jersey(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_month_of_the_year(Entity_A, Entity_B) :-
	month_of_the_year(Entity_A, Entity_C),
	month_of_the_year(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_focal_height(Entity_A, Entity_B) :-
	focal_height(Entity_A, Entity_C),
	focal_height(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_domain_of_saint_or_deity(Entity_A, Entity_B) :-
	domain_of_saint_or_deity(Entity_A, Entity_C),
	domain_of_saint_or_deity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_water_as_percent_of_area(Entity_A, Entity_B) :-
	water_as_percent_of_area(Entity_A, Entity_C),
	water_as_percent_of_area(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_memory_capacity(Entity_A, Entity_B) :-
	memory_capacity(Entity_A, Entity_C),
	memory_capacity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_lighthouse_range(Entity_A, Entity_B) :-
	lighthouse_range(Entity_A, Entity_C),
	lighthouse_range(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_connector(Entity_A, Entity_B) :-
	connector(Entity_A, Entity_C),
	connector(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_language_used(Entity_A, Entity_B) :-
	language_used(Entity_A, Entity_C),
	language_used(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_parliamentary_term(Entity_A, Entity_B) :-
	parliamentary_term(Entity_A, Entity_C),
	parliamentary_term(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_point_of_penalty(Entity_A, Entity_B) :-
	point_of_penalty(Entity_A, Entity_C),
	point_of_penalty(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_throughput(Entity_A, Entity_B) :-
	throughput(Entity_A, Entity_C),
	throughput(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_permanent_duplicated_item(Entity_A, Entity_B) :-
	permanent_duplicated_item(Entity_A, Entity_C),
	permanent_duplicated_item(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_title_of_chess_person(Entity_A, Entity_B) :-
	title_of_chess_person(Entity_A, Entity_C),
	title_of_chess_person(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_right_to_vote(Entity_A, Entity_B) :-
	right_to_vote(Entity_A, Entity_C),
	right_to_vote(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_habitat(Entity_A, Entity_B) :-
	habitat(Entity_A, Entity_C),
	habitat(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_host(Entity_A, Entity_B) :-
	host(Entity_A, Entity_C),
	host(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_patronym_or_matronym_for_this_name(Entity_A, Entity_B) :-
	patronym_or_matronym_for_this_name(Entity_A, Entity_C),
	patronym_or_matronym_for_this_name(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_wheel_arrangement(Entity_A, Entity_B) :-
	wheel_arrangement(Entity_A, Entity_C),
	wheel_arrangement(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_grammatical_case(Entity_A, Entity_B) :-
	has_grammatical_case(Entity_A, Entity_C),
	has_grammatical_case(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_software_quality_assurance(Entity_A, Entity_B) :-
	software_quality_assurance(Entity_A, Entity_C),
	software_quality_assurance(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_partition_coefficient_water_octanol(Entity_A, Entity_B) :-
	partition_coefficient_water_octanol(Entity_A, Entity_C),
	partition_coefficient_water_octanol(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_age_of_majority(Entity_A, Entity_B) :-
	age_of_majority(Entity_A, Entity_C),
	age_of_majority(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_age_of_candidacy(Entity_A, Entity_B) :-
	age_of_candidacy(Entity_A, Entity_C),
	age_of_candidacy(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_age_of_consent(Entity_A, Entity_B) :-
	age_of_consent(Entity_A, Entity_C),
	age_of_consent(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_marriageable_age(Entity_A, Entity_B) :-
	marriageable_age(Entity_A, Entity_C),
	marriageable_age(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_retirement_age(Entity_A, Entity_B) :-
	retirement_age(Entity_A, Entity_C),
	retirement_age(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_valid_in_place(Entity_A, Entity_B) :-
	valid_in_place(Entity_A, Entity_C),
	valid_in_place(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_surface_tension(Entity_A, Entity_B) :-
	surface_tension(Entity_A, Entity_C),
	surface_tension(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_laws_applied(Entity_A, Entity_B) :-
	laws_applied(Entity_A, Entity_C),
	laws_applied(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_backup_or_reserve_team_or_crew(Entity_A, Entity_B) :-
	backup_or_reserve_team_or_crew(Entity_A, Entity_C),
	backup_or_reserve_team_or_crew(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_located_in_protected_area(Entity_A, Entity_B) :-
	located_in_protected_area(Entity_A, Entity_C),
	located_in_protected_area(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_railway_signalling_system(Entity_A, Entity_B) :-
	railway_signalling_system(Entity_A, Entity_C),
	railway_signalling_system(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_residence_time_of_water(Entity_A, Entity_B) :-
	residence_time_of_water(Entity_A, Entity_C),
	residence_time_of_water(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_flag_bearer(Entity_A, Entity_B) :-
	flag_bearer(Entity_A, Entity_C),
	flag_bearer(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_open_days(Entity_A, Entity_B) :-
	open_days(Entity_A, Entity_C),
	open_days(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_closed_on(Entity_A, Entity_B) :-
	closed_on(Entity_A, Entity_C),
	closed_on(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_open_period_from(Entity_A, Entity_B) :-
	open_period_from(Entity_A, Entity_C),
	open_period_from(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_open_period_to(Entity_A, Entity_B) :-
	open_period_to(Entity_A, Entity_C),
	open_period_to(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_adjacent_building(Entity_A, Entity_B) :-
	adjacent_building(Entity_A, Entity_C),
	adjacent_building(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_package_management_system(Entity_A, Entity_B) :-
	package_management_system(Entity_A, Entity_C),
	package_management_system(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_precipitation_height(Entity_A, Entity_B) :-
	precipitation_height(Entity_A, Entity_C),
	precipitation_height(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_spatial_reference_system(Entity_A, Entity_B) :-
	spatial_reference_system(Entity_A, Entity_C),
	spatial_reference_system(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_wheelbase(Entity_A, Entity_B) :-
	wheelbase(Entity_A, Entity_C),
	wheelbase(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_luminous_intensity(Entity_A, Entity_B) :-
	luminous_intensity(Entity_A, Entity_C),
	luminous_intensity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_gestation_period(Entity_A, Entity_B) :-
	gestation_period(Entity_A, Entity_C),
	gestation_period(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_dynamic_viscosity(Entity_A, Entity_B) :-
	dynamic_viscosity(Entity_A, Entity_C),
	dynamic_viscosity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_standard_molar_entropy(Entity_A, Entity_B) :-
	standard_molar_entropy(Entity_A, Entity_C),
	standard_molar_entropy(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_official_religion(Entity_A, Entity_B) :-
	official_religion(Entity_A, Entity_C),
	official_religion(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_standard_enthalpy_of_formation(Entity_A, Entity_B) :-
	standard_enthalpy_of_formation(Entity_A, Entity_C),
	standard_enthalpy_of_formation(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_game_artist(Entity_A, Entity_B) :-
	game_artist(Entity_A, Entity_C),
	game_artist(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_damaged(Entity_A, Entity_B) :-
	damaged(Entity_A, Entity_C),
	damaged(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_destroyed(Entity_A, Entity_B) :-
	destroyed(Entity_A, Entity_C),
	destroyed(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_qualifies_for_event(Entity_A, Entity_B) :-
	qualifies_for_event(Entity_A, Entity_C),
	qualifies_for_event(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_speed_limit(Entity_A, Entity_B) :-
	speed_limit(Entity_A, Entity_C),
	speed_limit(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_fiscal_tax_revenue(Entity_A, Entity_B) :-
	fiscal_tax_revenue(Entity_A, Entity_C),
	fiscal_tax_revenue(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_mount(Entity_A, Entity_B) :-
	mount(Entity_A, Entity_C),
	mount(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_film_crew_member(Entity_A, Entity_B) :-
	film_crew_member(Entity_A, Entity_C),
	film_crew_member(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_recovered_by(Entity_A, Entity_B) :-
	recovered_by(Entity_A, Entity_C),
	recovered_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_develops_from(Entity_A, Entity_B) :-
	develops_from(Entity_A, Entity_C),
	develops_from(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_practiced_by(Entity_A, Entity_B) :-
	practiced_by(Entity_A, Entity_C),
	practiced_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_kml_file(Entity_A, Entity_B) :-
	kml_file(Entity_A, Entity_C),
	kml_file(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_tense(Entity_A, Entity_B) :-
	has_tense(Entity_A, Entity_C),
	has_tense(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_does_not_have_part(Entity_A, Entity_B) :-
	does_not_have_part(Entity_A, Entity_C),
	does_not_have_part(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_parent_peak(Entity_A, Entity_B) :-
	parent_peak(Entity_A, Entity_C),
	parent_peak(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_repeals(Entity_A, Entity_B) :-
	repeals(Entity_A, Entity_C),
	repeals(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_molecule_conformation(Entity_A, Entity_B) :-
	molecule_conformation(Entity_A, Entity_C),
	molecule_conformation(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_birthday(Entity_A, Entity_B) :-
	birthday(Entity_A, Entity_C),
	birthday(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_australian_classification(Entity_A, Entity_B) :-
	australian_classification(Entity_A, Entity_C),
	australian_classification(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_event_distance(Entity_A, Entity_B) :-
	event_distance(Entity_A, Entity_C),
	event_distance(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_enclosure(Entity_A, Entity_B) :-
	enclosure(Entity_A, Entity_C),
	enclosure(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_grammatical_mood(Entity_A, Entity_B) :-
	has_grammatical_mood(Entity_A, Entity_C),
	has_grammatical_mood(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_offers_view_on(Entity_A, Entity_B) :-
	offers_view_on(Entity_A, Entity_C),
	offers_view_on(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_art_director(Entity_A, Entity_B) :-
	art_director(Entity_A, Entity_C),
	art_director(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_territory_overlaps(Entity_A, Entity_B) :-
	territory_overlaps(Entity_A, Entity_C),
	territory_overlaps(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_innervated_by(Entity_A, Entity_B) :-
	innervated_by(Entity_A, Entity_C),
	innervated_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_innervates(Entity_A, Entity_B) :-
	innervates(Entity_A, Entity_C),
	innervates(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_league_points_system(Entity_A, Entity_B) :-
	league_points_system(Entity_A, Entity_C),
	league_points_system(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_patient_of(Entity_A, Entity_B) :-
	patient_of(Entity_A, Entity_C),
	patient_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_classind_rating(Entity_A, Entity_B) :-
	classind_rating(Entity_A, Entity_C),
	classind_rating(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_minimum_viable_temperature(Entity_A, Entity_B) :-
	minimum_viable_temperature(Entity_A, Entity_C),
	minimum_viable_temperature(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_maximum_viable_temperature(Entity_A, Entity_B) :-
	maximum_viable_temperature(Entity_A, Entity_C),
	maximum_viable_temperature(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_optimum_viable_temperature(Entity_A, Entity_B) :-
	optimum_viable_temperature(Entity_A, Entity_C),
	optimum_viable_temperature(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_intangible_cultural_heritage_status(Entity_A, Entity_B) :-
	intangible_cultural_heritage_status(Entity_A, Entity_C),
	intangible_cultural_heritage_status(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_points_awarded(Entity_A, Entity_B) :-
	points_awarded(Entity_A, Entity_C),
	points_awarded(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_anatomical_branch_of(Entity_A, Entity_B) :-
	anatomical_branch_of(Entity_A, Entity_C),
	anatomical_branch_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_anatomical_branch(Entity_A, Entity_B) :-
	has_anatomical_branch(Entity_A, Entity_C),
	has_anatomical_branch(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_base(Entity_A, Entity_B) :-
	base(Entity_A, Entity_C),
	base(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_radix(Entity_A, Entity_B) :-
	radix(Entity_A, Entity_C),
	radix(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_compulsory_education_minimum_age_(Entity_A, Entity_B) :-
	compulsory_education_minimum_age_(Entity_A, Entity_C),
	compulsory_education_minimum_age_(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_compulsory_education_maximum_age_(Entity_A, Entity_B) :-
	compulsory_education_maximum_age_(Entity_A, Entity_C),
	compulsory_education_maximum_age_(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_content_deliverer(Entity_A, Entity_B) :-
	content_deliverer(Entity_A, Entity_C),
	content_deliverer(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_storyboard_artist(Entity_A, Entity_B) :-
	storyboard_artist(Entity_A, Entity_C),
	storyboard_artist(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_statistical_leader(Entity_A, Entity_B) :-
	statistical_leader(Entity_A, Entity_C),
	statistical_leader(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_encoding(Entity_A, Entity_B) :-
	encoding(Entity_A, Entity_C),
	encoding(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_musical_conductor(Entity_A, Entity_B) :-
	musical_conductor(Entity_A, Entity_C),
	musical_conductor(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_broadcast_by(Entity_A, Entity_B) :-
	broadcast_by(Entity_A, Entity_C),
	broadcast_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_icaa_rating(Entity_A, Entity_B) :-
	icaa_rating(Entity_A, Entity_C),
	icaa_rating(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_muscle_action(Entity_A, Entity_B) :-
	muscle_action(Entity_A, Entity_C),
	muscle_action(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_board_member(Entity_A, Entity_B) :-
	board_member(Entity_A, Entity_C),
	board_member(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_opponent_during_disputation(Entity_A, Entity_B) :-
	opponent_during_disputation(Entity_A, Entity_C),
	opponent_during_disputation(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_associated_hazard(Entity_A, Entity_B) :-
	associated_hazard(Entity_A, Entity_C),
	associated_hazard(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_generation_time(Entity_A, Entity_B) :-
	generation_time(Entity_A, Entity_C),
	generation_time(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_significant_person(Entity_A, Entity_B) :-
	significant_person(Entity_A, Entity_C),
	significant_person(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_designed_to_carry(Entity_A, Entity_B) :-
	designed_to_carry(Entity_A, Entity_C),
	designed_to_carry(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_positive_therapeutic_predictor_for(Entity_A, Entity_B) :-
	positive_therapeutic_predictor_for(Entity_A, Entity_C),
	positive_therapeutic_predictor_for(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_negative_therapeutic_predictor_for(Entity_A, Entity_B) :-
	negative_therapeutic_predictor_for(Entity_A, Entity_C),
	negative_therapeutic_predictor_for(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_positive_diagnostic_predictor_for(Entity_A, Entity_B) :-
	positive_diagnostic_predictor_for(Entity_A, Entity_C),
	positive_diagnostic_predictor_for(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_negative_diagnostic_predictor_for(Entity_A, Entity_B) :-
	negative_diagnostic_predictor_for(Entity_A, Entity_C),
	negative_diagnostic_predictor_for(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_positive_prognostic_predictor_for(Entity_A, Entity_B) :-
	positive_prognostic_predictor_for(Entity_A, Entity_C),
	positive_prognostic_predictor_for(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_negative_prognostic_predictor_for(Entity_A, Entity_B) :-
	negative_prognostic_predictor_for(Entity_A, Entity_C),
	negative_prognostic_predictor_for(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_operating_income(Entity_A, Entity_B) :-
	operating_income(Entity_A, Entity_C),
	operating_income(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_stereoisomer_of(Entity_A, Entity_B) :-
	stereoisomer_of(Entity_A, Entity_C),
	stereoisomer_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_sibling(Entity_A, Entity_B) :-
	sibling(Entity_A, Entity_C),
	sibling(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_endianness(Entity_A, Entity_B) :-
	endianness(Entity_A, Entity_C),
	endianness(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_minimum_frequency_of_audible_sound(Entity_A, Entity_B) :-
	minimum_frequency_of_audible_sound(Entity_A, Entity_C),
	minimum_frequency_of_audible_sound(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_heart_rate(Entity_A, Entity_B) :-
	heart_rate(Entity_A, Entity_C),
	heart_rate(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_cnc_film_rating_romania_(Entity_A, Entity_B) :-
	cnc_film_rating_romania_(Entity_A, Entity_C),
	cnc_film_rating_romania_(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_coextensive_with(Entity_A, Entity_B) :-
	coextensive_with(Entity_A, Entity_C),
	coextensive_with(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_start_period(Entity_A, Entity_B) :-
	start_period(Entity_A, Entity_C),
	start_period(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_end_period(Entity_A, Entity_B) :-
	end_period(Entity_A, Entity_C),
	end_period(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_incaa_film_rating(Entity_A, Entity_B) :-
	incaa_film_rating(Entity_A, Entity_C),
	incaa_film_rating(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_parent_cell_line(Entity_A, Entity_B) :-
	parent_cell_line(Entity_A, Entity_C),
	parent_cell_line(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_biological_variant_of(Entity_A, Entity_B) :-
	biological_variant_of(Entity_A, Entity_C),
	biological_variant_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_type_of_passengers_cargo(Entity_A, Entity_B) :-
	type_of_passengers_cargo(Entity_A, Entity_C),
	type_of_passengers_cargo(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_vehicle_normally_used(Entity_A, Entity_B) :-
	vehicle_normally_used(Entity_A, Entity_C),
	vehicle_normally_used(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_angular_resolution(Entity_A, Entity_B) :-
	angular_resolution(Entity_A, Entity_C),
	angular_resolution(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_time_signature(Entity_A, Entity_B) :-
	time_signature(Entity_A, Entity_C),
	time_signature(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_mirrors_data_from(Entity_A, Entity_B) :-
	mirrors_data_from(Entity_A, Entity_C),
	mirrors_data_from(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_stepparent(Entity_A, Entity_B) :-
	stepparent(Entity_A, Entity_C),
	stepparent(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_sports_season_of_league_or_competition(Entity_A, Entity_B) :-
	sports_season_of_league_or_competition(Entity_A, Entity_C),
	sports_season_of_league_or_competition(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_inferred_from(Entity_A, Entity_B) :-
	inferred_from(Entity_A, Entity_C),
	inferred_from(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_case_fatality_rate(Entity_A, Entity_B) :-
	case_fatality_rate(Entity_A, Entity_C),
	case_fatality_rate(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_colonel_in_chief(Entity_A, Entity_B) :-
	colonel_in_chief(Entity_A, Entity_C),
	colonel_in_chief(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_designated_as_terrorist_by(Entity_A, Entity_B) :-
	designated_as_terrorist_by(Entity_A, Entity_C),
	designated_as_terrorist_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_medicine_marketing_authorization(Entity_A, Entity_B) :-
	medicine_marketing_authorization(Entity_A, Entity_C),
	medicine_marketing_authorization(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_maximum_frequency_of_audible_sound(Entity_A, Entity_B) :-
	maximum_frequency_of_audible_sound(Entity_A, Entity_C),
	maximum_frequency_of_audible_sound(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_bite_force_quotient(Entity_A, Entity_B) :-
	bite_force_quotient(Entity_A, Entity_C),
	bite_force_quotient(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_normal_respiratory_rate(Entity_A, Entity_B) :-
	normal_respiratory_rate(Entity_A, Entity_C),
	normal_respiratory_rate(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_maximal_incubation_period_in_humans(Entity_A, Entity_B) :-
	maximal_incubation_period_in_humans(Entity_A, Entity_C),
	maximal_incubation_period_in_humans(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_minimal_incubation_period_in_humans(Entity_A, Entity_B) :-
	minimal_incubation_period_in_humans(Entity_A, Entity_C),
	minimal_incubation_period_in_humans(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_pregnancy_category(Entity_A, Entity_B) :-
	pregnancy_category(Entity_A, Entity_C),
	pregnancy_category(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_muscle_origin(Entity_A, Entity_B) :-
	muscle_origin(Entity_A, Entity_C),
	muscle_origin(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_muscle_insertion(Entity_A, Entity_B) :-
	muscle_insertion(Entity_A, Entity_C),
	muscle_insertion(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_basic_reproduction_number(Entity_A, Entity_B) :-
	basic_reproduction_number(Entity_A, Entity_C),
	basic_reproduction_number(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_legal_status_medicine_(Entity_A, Entity_B) :-
	legal_status_medicine_(Entity_A, Entity_C),
	legal_status_medicine_(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_points_classification(Entity_A, Entity_B) :-
	points_classification(Entity_A, Entity_C),
	points_classification(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_teams_classification_by_points(Entity_A, Entity_B) :-
	teams_classification_by_points(Entity_A, Entity_C),
	teams_classification_by_points(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_teams_classification_by_time(Entity_A, Entity_B) :-
	teams_classification_by_time(Entity_A, Entity_C),
	teams_classification_by_time(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_christian_liturgical_rite(Entity_A, Entity_B) :-
	christian_liturgical_rite(Entity_A, Entity_C),
	christian_liturgical_rite(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_means_of_locomotion(Entity_A, Entity_B) :-
	means_of_locomotion(Entity_A, Entity_C),
	means_of_locomotion(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_median_income(Entity_A, Entity_B) :-
	median_income(Entity_A, Entity_C),
	median_income(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_par(Entity_A, Entity_B) :-
	par(Entity_A, Entity_C),
	par(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_maximum_size_or_capacity(Entity_A, Entity_B) :-
	maximum_size_or_capacity(Entity_A, Entity_C),
	maximum_size_or_capacity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_data_size(Entity_A, Entity_B) :-
	data_size(Entity_A, Entity_C),
	data_size(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_autologous_cell_line(Entity_A, Entity_B) :-
	autologous_cell_line(Entity_A, Entity_C),
	autologous_cell_line(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_saros_cycle_of_eclipse(Entity_A, Entity_B) :-
	saros_cycle_of_eclipse(Entity_A, Entity_C),
	saros_cycle_of_eclipse(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_candidacy_in_election(Entity_A, Entity_B) :-
	candidacy_in_election(Entity_A, Entity_C),
	candidacy_in_election(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_fare_zone(Entity_A, Entity_B) :-
	fare_zone(Entity_A, Entity_C),
	fare_zone(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_base_salary(Entity_A, Entity_B) :-
	base_salary(Entity_A, Entity_C),
	base_salary(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_age_of_subject_at_event(Entity_A, Entity_B) :-
	age_of_subject_at_event(Entity_A, Entity_C),
	age_of_subject_at_event(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_significant_environmental_impact(Entity_A, Entity_B) :-
	significant_environmental_impact(Entity_A, Entity_C),
	significant_environmental_impact(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_natureserve_conservation_status(Entity_A, Entity_B) :-
	natureserve_conservation_status(Entity_A, Entity_C),
	natureserve_conservation_status(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_jmk_film_rating(Entity_A, Entity_B) :-
	jmk_film_rating(Entity_A, Entity_C),
	jmk_film_rating(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_stock_market_index(Entity_A, Entity_B) :-
	stock_market_index(Entity_A, Entity_C),
	stock_market_index(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_statement_supported_by(Entity_A, Entity_B) :-
	statement_supported_by(Entity_A, Entity_C),
	statement_supported_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_incarnation_of(Entity_A, Entity_B) :-
	incarnation_of(Entity_A, Entity_C),
	incarnation_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_goal(Entity_A, Entity_B) :-
	has_goal(Entity_A, Entity_C),
	has_goal(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_social_classification(Entity_A, Entity_B) :-
	social_classification(Entity_A, Entity_C),
	social_classification(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_regulated_by(Entity_A, Entity_B) :-
	regulated_by(Entity_A, Entity_C),
	regulated_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_next_lower_rank(Entity_A, Entity_B) :-
	next_lower_rank(Entity_A, Entity_C),
	next_lower_rank(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_next_higher_rank(Entity_A, Entity_B) :-
	next_higher_rank(Entity_A, Entity_C),
	next_higher_rank(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_maximum_wavelength_of_sensitivity(Entity_A, Entity_B) :-
	maximum_wavelength_of_sensitivity(Entity_A, Entity_C),
	maximum_wavelength_of_sensitivity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_minimum_wavelength_of_sensitivity(Entity_A, Entity_B) :-
	minimum_wavelength_of_sensitivity(Entity_A, Entity_C),
	minimum_wavelength_of_sensitivity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_inflorescence(Entity_A, Entity_B) :-
	inflorescence(Entity_A, Entity_C),
	inflorescence(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_works(Entity_A, Entity_B) :-
	number_of_works(Entity_A, Entity_C),
	number_of_works(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_seed_dispersal(Entity_A, Entity_B) :-
	seed_dispersal(Entity_A, Entity_C),
	seed_dispersal(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_subscribers(Entity_A, Entity_B) :-
	number_of_subscribers(Entity_A, Entity_C),
	number_of_subscribers(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_pole_position(Entity_A, Entity_B) :-
	pole_position(Entity_A, Entity_C),
	pole_position(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_activator_of(Entity_A, Entity_B) :-
	activator_of(Entity_A, Entity_C),
	activator_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_agonist_of(Entity_A, Entity_B) :-
	agonist_of(Entity_A, Entity_C),
	agonist_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_antagonist_of(Entity_A, Entity_B) :-
	antagonist_of(Entity_A, Entity_C),
	antagonist_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_blocker_of(Entity_A, Entity_B) :-
	blocker_of(Entity_A, Entity_C),
	blocker_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_disrupting_agent_for(Entity_A, Entity_B) :-
	disrupting_agent_for(Entity_A, Entity_C),
	disrupting_agent_for(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_inhibitor_of(Entity_A, Entity_B) :-
	inhibitor_of(Entity_A, Entity_C),
	inhibitor_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_antisense_inhibitor_of(Entity_A, Entity_B) :-
	antisense_inhibitor_of(Entity_A, Entity_C),
	antisense_inhibitor_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_positive_allosteric_modulator_of(Entity_A, Entity_B) :-
	positive_allosteric_modulator_of(Entity_A, Entity_C),
	positive_allosteric_modulator_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_negative_allosteric_modulator_of(Entity_A, Entity_B) :-
	negative_allosteric_modulator_of(Entity_A, Entity_C),
	negative_allosteric_modulator_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_active_ingredient_in(Entity_A, Entity_B) :-
	active_ingredient_in(Entity_A, Entity_C),
	active_ingredient_in(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_active_ingredient(Entity_A, Entity_B) :-
	has_active_ingredient(Entity_A, Entity_C),
	has_active_ingredient(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_rate_of_fire(Entity_A, Entity_B) :-
	rate_of_fire(Entity_A, Entity_C),
	rate_of_fire(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_original_film_format(Entity_A, Entity_B) :-
	original_film_format(Entity_A, Entity_C),
	original_film_format(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_volcano_observatory(Entity_A, Entity_B) :-
	volcano_observatory(Entity_A, Entity_C),
	volcano_observatory(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_film_script(Entity_A, Entity_B) :-
	film_script(Entity_A, Entity_C),
	film_script(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_kmrb_film_rating(Entity_A, Entity_B) :-
	kmrb_film_rating(Entity_A, Entity_C),
	kmrb_film_rating(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_rules_for_classification(Entity_A, Entity_B) :-
	rules_for_classification(Entity_A, Entity_C),
	rules_for_classification(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_ethnologue_language_status(Entity_A, Entity_B) :-
	ethnologue_language_status(Entity_A, Entity_C),
	ethnologue_language_status(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_wears(Entity_A, Entity_B) :-
	wears(Entity_A, Entity_C),
	wears(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_object_has_role(Entity_A, Entity_B) :-
	object_has_role(Entity_A, Entity_C),
	object_has_role(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_diaspora(Entity_A, Entity_B) :-
	diaspora(Entity_A, Entity_C),
	diaspora(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_rtc_film_rating(Entity_A, Entity_B) :-
	rtc_film_rating(Entity_A, Entity_C),
	rtc_film_rating(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_slope_rating(Entity_A, Entity_B) :-
	slope_rating(Entity_A, Entity_C),
	slope_rating(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_located_in_the_present_day_administrative_territorial_entity(Entity_A, Entity_B) :-
	located_in_the_present_day_administrative_territorial_entity(Entity_A, Entity_C),
	located_in_the_present_day_administrative_territorial_entity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_suicide_rate(Entity_A, Entity_B) :-
	suicide_rate(Entity_A, Entity_C),
	suicide_rate(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_type_of_reference(Entity_A, Entity_B) :-
	type_of_reference(Entity_A, Entity_C),
	type_of_reference(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_tributary_orientation(Entity_A, Entity_B) :-
	tributary_orientation(Entity_A, Entity_C),
	tributary_orientation(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_patronage(Entity_A, Entity_B) :-
	patronage(Entity_A, Entity_C),
	patronage(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_category_for_alumni_of_educational_institution(Entity_A, Entity_B) :-
	category_for_alumni_of_educational_institution(Entity_A, Entity_C),
	category_for_alumni_of_educational_institution(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_perpetrators(Entity_A, Entity_B) :-
	number_of_perpetrators(Entity_A, Entity_C),
	number_of_perpetrators(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_observing_time_available(Entity_A, Entity_B) :-
	observing_time_available(Entity_A, Entity_C),
	observing_time_available(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_had_as_last_meal(Entity_A, Entity_B) :-
	had_as_last_meal(Entity_A, Entity_C),
	had_as_last_meal(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_newspaper_format(Entity_A, Entity_B) :-
	newspaper_format(Entity_A, Entity_C),
	newspaper_format(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_ipa_number_order_being_deleted_(Entity_A, Entity_B) :-
	ipa_number_order_being_deleted_(Entity_A, Entity_C),
	ipa_number_order_being_deleted_(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_contributed_to_creative_work(Entity_A, Entity_B) :-
	contributed_to_creative_work(Entity_A, Entity_C),
	contributed_to_creative_work(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_copyright_holder(Entity_A, Entity_B) :-
	copyright_holder(Entity_A, Entity_C),
	copyright_holder(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_face_value(Entity_A, Entity_B) :-
	face_value(Entity_A, Entity_C),
	face_value(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_named_by(Entity_A, Entity_B) :-
	named_by(Entity_A, Entity_C),
	named_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_programming_paradigm(Entity_A, Entity_B) :-
	programming_paradigm(Entity_A, Entity_C),
	programming_paradigm(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_final_event(Entity_A, Entity_B) :-
	final_event(Entity_A, Entity_C),
	final_event(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_signed_form(Entity_A, Entity_B) :-
	signed_form(Entity_A, Entity_C),
	signed_form(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_general_secretary(Entity_A, Entity_B) :-
	general_secretary(Entity_A, Entity_C),
	general_secretary(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_sports_league_level(Entity_A, Entity_B) :-
	sports_league_level(Entity_A, Entity_C),
	sports_league_level(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_supports_programming_language(Entity_A, Entity_B) :-
	supports_programming_language(Entity_A, Entity_C),
	supports_programming_language(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_members_have_occupation(Entity_A, Entity_B) :-
	members_have_occupation(Entity_A, Entity_C),
	members_have_occupation(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_fruit_type(Entity_A, Entity_B) :-
	has_fruit_type(Entity_A, Entity_C),
	has_fruit_type(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_wfd_ecological_status(Entity_A, Entity_B) :-
	wfd_ecological_status(Entity_A, Entity_C),
	wfd_ecological_status(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_overrules(Entity_A, Entity_B) :-
	overrules(Entity_A, Entity_C),
	overrules(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_gdp_ppp_(Entity_A, Entity_B) :-
	gdp_ppp_(Entity_A, Entity_C),
	gdp_ppp_(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_reviewed_by(Entity_A, Entity_B) :-
	reviewed_by(Entity_A, Entity_C),
	reviewed_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_field_of_view(Entity_A, Entity_B) :-
	field_of_view(Entity_A, Entity_C),
	field_of_view(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_emulates(Entity_A, Entity_B) :-
	emulates(Entity_A, Entity_C),
	emulates(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_therapeutic_area(Entity_A, Entity_B) :-
	therapeutic_area(Entity_A, Entity_C),
	therapeutic_area(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_identifier_shared_with(Entity_A, Entity_B) :-
	identifier_shared_with(Entity_A, Entity_C),
	identifier_shared_with(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_houses(Entity_A, Entity_B) :-
	number_of_houses(Entity_A, Entity_C),
	number_of_houses(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_captured_with(Entity_A, Entity_B) :-
	captured_with(Entity_A, Entity_C),
	captured_with(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_metrically_compatible_typeface(Entity_A, Entity_B) :-
	metrically_compatible_typeface(Entity_A, Entity_C),
	metrically_compatible_typeface(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_parliamentary_group(Entity_A, Entity_B) :-
	parliamentary_group(Entity_A, Entity_C),
	parliamentary_group(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_dissertation_submitted_to(Entity_A, Entity_B) :-
	dissertation_submitted_to(Entity_A, Entity_C),
	dissertation_submitted_to(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_assets_under_management(Entity_A, Entity_B) :-
	assets_under_management(Entity_A, Entity_C),
	assets_under_management(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_egf_rating(Entity_A, Entity_B) :-
	egf_rating(Entity_A, Entity_C),
	egf_rating(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_annual_energy_output(Entity_A, Entity_B) :-
	annual_energy_output(Entity_A, Entity_C),
	annual_energy_output(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_linguistic_typology(Entity_A, Entity_B) :-
	linguistic_typology(Entity_A, Entity_C),
	linguistic_typology(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_maximum_age(Entity_A, Entity_B) :-
	maximum_age(Entity_A, Entity_C),
	maximum_age(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_muzzle_velocity(Entity_A, Entity_B) :-
	muzzle_velocity(Entity_A, Entity_C),
	muzzle_velocity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_energy_storage_capacity(Entity_A, Entity_B) :-
	energy_storage_capacity(Entity_A, Entity_C),
	energy_storage_capacity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_conjugate_acid(Entity_A, Entity_B) :-
	conjugate_acid(Entity_A, Entity_C),
	conjugate_acid(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_conjugate_base(Entity_A, Entity_B) :-
	conjugate_base(Entity_A, Entity_C),
	conjugate_base(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_game_mechanics(Entity_A, Entity_B) :-
	game_mechanics(Entity_A, Entity_C),
	game_mechanics(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_offset(Entity_A, Entity_B) :-
	offset(Entity_A, Entity_C),
	offset(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_magnification(Entity_A, Entity_B) :-
	magnification(Entity_A, Entity_C),
	magnification(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_effective_firing_range(Entity_A, Entity_B) :-
	effective_firing_range(Entity_A, Entity_C),
	effective_firing_range(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_angle_from_vertical(Entity_A, Entity_B) :-
	angle_from_vertical(Entity_A, Entity_C),
	angle_from_vertical(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_slope(Entity_A, Entity_B) :-
	slope(Entity_A, Entity_C),
	slope(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_iconographic_symbol(Entity_A, Entity_B) :-
	iconographic_symbol(Entity_A, Entity_C),
	iconographic_symbol(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_category_for_employees_of_the_organization(Entity_A, Entity_B) :-
	category_for_employees_of_the_organization(Entity_A, Entity_C),
	category_for_employees_of_the_organization(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_wfd_chemical_status(Entity_A, Entity_B) :-
	wfd_chemical_status(Entity_A, Entity_C),
	wfd_chemical_status(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_longest_observed_lifespan(Entity_A, Entity_B) :-
	longest_observed_lifespan(Entity_A, Entity_C),
	longest_observed_lifespan(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_shelf_life(Entity_A, Entity_B) :-
	shelf_life(Entity_A, Entity_C),
	shelf_life(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_order_of_battle(Entity_A, Entity_B) :-
	order_of_battle(Entity_A, Entity_C),
	order_of_battle(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_category_contains(Entity_A, Entity_B) :-
	category_contains(Entity_A, Entity_C),
	category_contains(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_regular_expression_syntax(Entity_A, Entity_B) :-
	regular_expression_syntax(Entity_A, Entity_C),
	regular_expression_syntax(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_refine_date(Entity_A, Entity_B) :-
	refine_date(Entity_A, Entity_C),
	refine_date(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_maximal_rate_of_climb(Entity_A, Entity_B) :-
	maximal_rate_of_climb(Entity_A, Entity_C),
	maximal_rate_of_climb(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_defined_daily_dose(Entity_A, Entity_B) :-
	defined_daily_dose(Entity_A, Entity_C),
	defined_daily_dose(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_constituencies(Entity_A, Entity_B) :-
	number_of_constituencies(Entity_A, Entity_C),
	number_of_constituencies(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_half_maximal_inhibitory_concentration_ic50_(Entity_A, Entity_B) :-
	half_maximal_inhibitory_concentration_ic50_(Entity_A, Entity_C),
	half_maximal_inhibitory_concentration_ic50_(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_half_maximal_effective_concentration_ec50_(Entity_A, Entity_B) :-
	half_maximal_effective_concentration_ec50_(Entity_A, Entity_C),
	half_maximal_effective_concentration_ec50_(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_rating(Entity_A, Entity_B) :-
	rating(Entity_A, Entity_C),
	rating(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_official_app(Entity_A, Entity_B) :-
	official_app(Entity_A, Entity_C),
	official_app(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_possessed_by_spirit(Entity_A, Entity_B) :-
	possessed_by_spirit(Entity_A, Entity_C),
	possessed_by_spirit(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_readership(Entity_A, Entity_B) :-
	readership(Entity_A, Entity_C),
	readership(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_stellar_rotational_velocity(Entity_A, Entity_B) :-
	stellar_rotational_velocity(Entity_A, Entity_C),
	stellar_rotational_velocity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_camera_setup(Entity_A, Entity_B) :-
	camera_setup(Entity_A, Entity_C),
	camera_setup(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_mountains_classification(Entity_A, Entity_B) :-
	mountains_classification(Entity_A, Entity_C),
	mountains_classification(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_best_combative_classification(Entity_A, Entity_B) :-
	best_combative_classification(Entity_A, Entity_C),
	best_combative_classification(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_best_sprinter_classification(Entity_A, Entity_B) :-
	best_sprinter_classification(Entity_A, Entity_C),
	best_sprinter_classification(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_young_rider_classification(Entity_A, Entity_B) :-
	young_rider_classification(Entity_A, Entity_C),
	young_rider_classification(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_combination_classification(Entity_A, Entity_B) :-
	combination_classification(Entity_A, Entity_C),
	combination_classification(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_template_or_module_that_populates_category(Entity_A, Entity_B) :-
	template_or_module_that_populates_category(Entity_A, Entity_C),
	template_or_module_that_populates_category(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_contains(Entity_A, Entity_B) :-
	contains(Entity_A, Entity_C),
	contains(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_synodic_period(Entity_A, Entity_B) :-
	synodic_period(Entity_A, Entity_C),
	synodic_period(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_director_of_archaeological_fieldwork(Entity_A, Entity_B) :-
	director_of_archaeological_fieldwork(Entity_A, Entity_C),
	director_of_archaeological_fieldwork(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_salinity(Entity_A, Entity_B) :-
	salinity(Entity_A, Entity_C),
	salinity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_nominated_by(Entity_A, Entity_B) :-
	nominated_by(Entity_A, Entity_C),
	nominated_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_youth_wing(Entity_A, Entity_B) :-
	youth_wing(Entity_A, Entity_C),
	youth_wing(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_update_method(Entity_A, Entity_B) :-
	update_method(Entity_A, Entity_C),
	update_method(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_mapping_relation_type(Entity_A, Entity_B) :-
	mapping_relation_type(Entity_A, Entity_C),
	mapping_relation_type(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_caliber(Entity_A, Entity_B) :-
	caliber(Entity_A, Entity_C),
	caliber(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_mandates(Entity_A, Entity_B) :-
	mandates(Entity_A, Entity_C),
	mandates(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_mtdna_haplogroup(Entity_A, Entity_B) :-
	mtdna_haplogroup(Entity_A, Entity_C),
	mtdna_haplogroup(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_y_dna_haplogroup(Entity_A, Entity_B) :-
	y_dna_haplogroup(Entity_A, Entity_C),
	y_dna_haplogroup(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_implementation_of(Entity_A, Entity_B) :-
	implementation_of(Entity_A, Entity_C),
	implementation_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_fpb_rating(Entity_A, Entity_B) :-
	fpb_rating(Entity_A, Entity_C),
	fpb_rating(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_hydraulic_head(Entity_A, Entity_B) :-
	hydraulic_head(Entity_A, Entity_C),
	hydraulic_head(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_mean_age(Entity_A, Entity_B) :-
	mean_age(Entity_A, Entity_C),
	mean_age(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_card_network(Entity_A, Entity_B) :-
	card_network(Entity_A, Entity_C),
	card_network(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_reward(Entity_A, Entity_B) :-
	reward(Entity_A, Entity_C),
	reward(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_grace_period(Entity_A, Entity_B) :-
	grace_period(Entity_A, Entity_C),
	grace_period(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_reward_program(Entity_A, Entity_B) :-
	reward_program(Entity_A, Entity_C),
	reward_program(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_minimum_spend_bonus(Entity_A, Entity_B) :-
	minimum_spend_bonus(Entity_A, Entity_C),
	minimum_spend_bonus(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_cash_back(Entity_A, Entity_B) :-
	cash_back(Entity_A, Entity_C),
	cash_back(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_thibaudeau_classification(Entity_A, Entity_B) :-
	thibaudeau_classification(Entity_A, Entity_C),
	thibaudeau_classification(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_family_relationship_degree(Entity_A, Entity_B) :-
	family_relationship_degree(Entity_A, Entity_C),
	family_relationship_degree(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_albedo(Entity_A, Entity_B) :-
	albedo(Entity_A, Entity_C),
	albedo(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_describes_a_project_that_uses(Entity_A, Entity_B) :-
	describes_a_project_that_uses(Entity_A, Entity_C),
	describes_a_project_that_uses(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_vertical_depth(Entity_A, Entity_B) :-
	vertical_depth(Entity_A, Entity_C),
	vertical_depth(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_payload_mass(Entity_A, Entity_B) :-
	payload_mass(Entity_A, Entity_C),
	payload_mass(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_listed_ingredient(Entity_A, Entity_B) :-
	has_listed_ingredient(Entity_A, Entity_C),
	has_listed_ingredient(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_sexually_homologous_with(Entity_A, Entity_B) :-
	sexually_homologous_with(Entity_A, Entity_C),
	sexually_homologous_with(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_mountain_range(Entity_A, Entity_B) :-
	mountain_range(Entity_A, Entity_C),
	mountain_range(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_first_appearance(Entity_A, Entity_B) :-
	first_appearance(Entity_A, Entity_C),
	first_appearance(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_type_foundry(Entity_A, Entity_B) :-
	type_foundry(Entity_A, Entity_C),
	type_foundry(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_monomer_of(Entity_A, Entity_B) :-
	monomer_of(Entity_A, Entity_C),
	monomer_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_polymer_of(Entity_A, Entity_B) :-
	polymer_of(Entity_A, Entity_C),
	polymer_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_scenographer(Entity_A, Entity_B) :-
	scenographer(Entity_A, Entity_C),
	scenographer(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_drainage_basin(Entity_A, Entity_B) :-
	drainage_basin(Entity_A, Entity_C),
	drainage_basin(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_trophy_awarded(Entity_A, Entity_B) :-
	trophy_awarded(Entity_A, Entity_C),
	trophy_awarded(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_squadron_embarked(Entity_A, Entity_B) :-
	squadron_embarked(Entity_A, Entity_C),
	squadron_embarked(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_identity_of_object_in_context(Entity_A, Entity_B) :-
	identity_of_object_in_context(Entity_A, Entity_C),
	identity_of_object_in_context(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_ictv_virus_genome_composition(Entity_A, Entity_B) :-
	ictv_virus_genome_composition(Entity_A, Entity_C),
	ictv_virus_genome_composition(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_premiere_type(Entity_A, Entity_B) :-
	premiere_type(Entity_A, Entity_C),
	premiere_type(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_representation_of(Entity_A, Entity_B) :-
	representation_of(Entity_A, Entity_C),
	representation_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_location_of_first_performance(Entity_A, Entity_B) :-
	location_of_first_performance(Entity_A, Entity_C),
	location_of_first_performance(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_identity_of_subject_in_context(Entity_A, Entity_B) :-
	identity_of_subject_in_context(Entity_A, Entity_C),
	identity_of_subject_in_context(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_partition_table_type(Entity_A, Entity_B) :-
	partition_table_type(Entity_A, Entity_C),
	partition_table_type(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_reservoir_created(Entity_A, Entity_B) :-
	reservoir_created(Entity_A, Entity_C),
	reservoir_created(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_appears_in_the_form_of(Entity_A, Entity_B) :-
	appears_in_the_form_of(Entity_A, Entity_C),
	appears_in_the_form_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_constraint_scope(Entity_A, Entity_B) :-
	constraint_scope(Entity_A, Entity_C),
	constraint_scope(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_geomorphological_unit(Entity_A, Entity_B) :-
	geomorphological_unit(Entity_A, Entity_C),
	geomorphological_unit(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_title_page_number(Entity_A, Entity_B) :-
	title_page_number(Entity_A, Entity_C),
	title_page_number(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_produced_sound(Entity_A, Entity_B) :-
	produced_sound(Entity_A, Entity_C),
	produced_sound(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_animal_breed(Entity_A, Entity_B) :-
	animal_breed(Entity_A, Entity_C),
	animal_breed(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_is_proceedings_from(Entity_A, Entity_B) :-
	is_proceedings_from(Entity_A, Entity_C),
	is_proceedings_from(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_hydrated_form_of(Entity_A, Entity_B) :-
	hydrated_form_of(Entity_A, Entity_C),
	hydrated_form_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_biological_phase(Entity_A, Entity_B) :-
	biological_phase(Entity_A, Entity_C),
	biological_phase(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_boundary(Entity_A, Entity_B) :-
	has_boundary(Entity_A, Entity_C),
	has_boundary(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_storage_device(Entity_A, Entity_B) :-
	storage_device(Entity_A, Entity_C),
	storage_device(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_commanded_by(Entity_A, Entity_B) :-
	commanded_by(Entity_A, Entity_C),
	commanded_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_dam(Entity_A, Entity_B) :-
	dam(Entity_A, Entity_C),
	dam(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_season_starts(Entity_A, Entity_B) :-
	season_starts(Entity_A, Entity_C),
	season_starts(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_make_up_artist(Entity_A, Entity_B) :-
	make_up_artist(Entity_A, Entity_C),
	make_up_artist(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_sets_environment_variable(Entity_A, Entity_B) :-
	sets_environment_variable(Entity_A, Entity_C),
	sets_environment_variable(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_reads_environment_variable(Entity_A, Entity_B) :-
	reads_environment_variable(Entity_A, Entity_C),
	reads_environment_variable(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_technical_element_score(Entity_A, Entity_B) :-
	technical_element_score(Entity_A, Entity_C),
	technical_element_score(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_deductions_in_figure_skating_(Entity_A, Entity_B) :-
	deductions_in_figure_skating_(Entity_A, Entity_C),
	deductions_in_figure_skating_(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_program_component_score(Entity_A, Entity_B) :-
	program_component_score(Entity_A, Entity_C),
	program_component_score(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_total_fertility_rate(Entity_A, Entity_B) :-
	total_fertility_rate(Entity_A, Entity_C),
	total_fertility_rate(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_development_of_anatomical_structure(Entity_A, Entity_B) :-
	development_of_anatomical_structure(Entity_A, Entity_C),
	development_of_anatomical_structure(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_research_intervention(Entity_A, Entity_B) :-
	research_intervention(Entity_A, Entity_C),
	research_intervention(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_permitted_food_additive(Entity_A, Entity_B) :-
	permitted_food_additive(Entity_A, Entity_C),
	permitted_food_additive(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_maximum_food_additive_use_level(Entity_A, Entity_B) :-
	maximum_food_additive_use_level(Entity_A, Entity_C),
	maximum_food_additive_use_level(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_isoschizomer(Entity_A, Entity_B) :-
	isoschizomer(Entity_A, Entity_C),
	isoschizomer(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_neoschizomer(Entity_A, Entity_B) :-
	neoschizomer(Entity_A, Entity_C),
	neoschizomer(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_records(Entity_A, Entity_B) :-
	number_of_records(Entity_A, Entity_C),
	number_of_records(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_symbolizes(Entity_A, Entity_B) :-
	symbolizes(Entity_A, Entity_C),
	symbolizes(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_segmental_innervation(Entity_A, Entity_B) :-
	segmental_innervation(Entity_A, Entity_C),
	segmental_innervation(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_court(Entity_A, Entity_B) :-
	court(Entity_A, Entity_C),
	court(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_time_index(Entity_A, Entity_B) :-
	time_index(Entity_A, Entity_C),
	time_index(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_broader_concept(Entity_A, Entity_B) :-
	broader_concept(Entity_A, Entity_C),
	broader_concept(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_season(Entity_A, Entity_B) :-
	season(Entity_A, Entity_C),
	season(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_players_in_region(Entity_A, Entity_B) :-
	number_of_players_in_region(Entity_A, Entity_C),
	number_of_players_in_region(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_century_breaks(Entity_A, Entity_B) :-
	century_breaks(Entity_A, Entity_C),
	century_breaks(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_dialect_of(Entity_A, Entity_B) :-
	dialect_of(Entity_A, Entity_C),
	dialect_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_isocaudomer(Entity_A, Entity_B) :-
	isocaudomer(Entity_A, Entity_C),
	isocaudomer(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_calculated_from(Entity_A, Entity_B) :-
	calculated_from(Entity_A, Entity_C),
	calculated_from(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_safety_classification_and_labelling(Entity_A, Entity_B) :-
	safety_classification_and_labelling(Entity_A, Entity_C),
	safety_classification_and_labelling(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_may_prevent_disease(Entity_A, Entity_B) :-
	may_prevent_disease(Entity_A, Entity_C),
	may_prevent_disease(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_classification_of_the_best_at_metas_volantes(Entity_A, Entity_B) :-
	classification_of_the_best_at_metas_volantes(Entity_A, Entity_C),
	classification_of_the_best_at_metas_volantes(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_prerequisite(Entity_A, Entity_B) :-
	prerequisite(Entity_A, Entity_C),
	prerequisite(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_relevant_qualification(Entity_A, Entity_B) :-
	relevant_qualification(Entity_A, Entity_C),
	relevant_qualification(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_derivative_work(Entity_A, Entity_B) :-
	derivative_work(Entity_A, Entity_C),
	derivative_work(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_test_method(Entity_A, Entity_B) :-
	test_method(Entity_A, Entity_C),
	test_method(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_clubs(Entity_A, Entity_B) :-
	number_of_clubs(Entity_A, Entity_C),
	number_of_clubs(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_in_opposition_to(Entity_A, Entity_B) :-
	in_opposition_to(Entity_A, Entity_C),
	in_opposition_to(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_complies_with(Entity_A, Entity_B) :-
	complies_with(Entity_A, Entity_C),
	complies_with(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_special_rank(Entity_A, Entity_B) :-
	special_rank(Entity_A, Entity_C),
	special_rank(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_assessment(Entity_A, Entity_B) :-
	assessment(Entity_A, Entity_C),
	assessment(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_test_score(Entity_A, Entity_B) :-
	test_score(Entity_A, Entity_C),
	test_score(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_activity_policy_in_this_place(Entity_A, Entity_B) :-
	activity_policy_in_this_place(Entity_A, Entity_C),
	activity_policy_in_this_place(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_choral_conductor(Entity_A, Entity_B) :-
	choral_conductor(Entity_A, Entity_C),
	choral_conductor(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_gens(Entity_A, Entity_B) :-
	gens(Entity_A, Entity_C),
	gens(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_lighting_designer(Entity_A, Entity_B) :-
	lighting_designer(Entity_A, Entity_C),
	lighting_designer(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_representations(Entity_A, Entity_B) :-
	number_of_representations(Entity_A, Entity_C),
	number_of_representations(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_sound_designer(Entity_A, Entity_B) :-
	sound_designer(Entity_A, Entity_C),
	sound_designer(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_talk_show_guest(Entity_A, Entity_B) :-
	talk_show_guest(Entity_A, Entity_C),
	talk_show_guest(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_ghs_hazard_pictogram(Entity_A, Entity_B) :-
	ghs_hazard_pictogram(Entity_A, Entity_C),
	ghs_hazard_pictogram(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_ghs_hazard_statement(Entity_A, Entity_B) :-
	ghs_hazard_statement(Entity_A, Entity_C),
	ghs_hazard_statement(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_ghs_precautionary_statement(Entity_A, Entity_B) :-
	ghs_precautionary_statement(Entity_A, Entity_C),
	ghs_precautionary_statement(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_abstentions(Entity_A, Entity_B) :-
	number_of_abstentions(Entity_A, Entity_C),
	number_of_abstentions(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_spoilt_votes(Entity_A, Entity_B) :-
	number_of_spoilt_votes(Entity_A, Entity_C),
	number_of_spoilt_votes(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_blank_votes(Entity_A, Entity_B) :-
	number_of_blank_votes(Entity_A, Entity_C),
	number_of_blank_votes(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_towards(Entity_A, Entity_B) :-
	towards(Entity_A, Entity_C),
	towards(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_supervisory_board_member(Entity_A, Entity_B) :-
	supervisory_board_member(Entity_A, Entity_C),
	supervisory_board_member(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_fastest_lap(Entity_A, Entity_B) :-
	fastest_lap(Entity_A, Entity_C),
	fastest_lap(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_member_of_cabinet(Entity_A, Entity_B) :-
	member_of_cabinet(Entity_A, Entity_C),
	member_of_cabinet(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_patronym_or_matronym_for_this_person(Entity_A, Entity_B) :-
	patronym_or_matronym_for_this_person(Entity_A, Entity_C),
	patronym_or_matronym_for_this_person(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_modified_version_of(Entity_A, Entity_B) :-
	modified_version_of(Entity_A, Entity_C),
	modified_version_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_wind_speed(Entity_A, Entity_B) :-
	wind_speed(Entity_A, Entity_C),
	wind_speed(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_operating_temperature(Entity_A, Entity_B) :-
	operating_temperature(Entity_A, Entity_C),
	operating_temperature(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_non_operating_temperature(Entity_A, Entity_B) :-
	non_operating_temperature(Entity_A, Entity_C),
	non_operating_temperature(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_service_life(Entity_A, Entity_B) :-
	service_life(Entity_A, Entity_C),
	service_life(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_french_standard_size_for_oil_paintings(Entity_A, Entity_B) :-
	french_standard_size_for_oil_paintings(Entity_A, Entity_C),
	french_standard_size_for_oil_paintings(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_boiler_pressure(Entity_A, Entity_B) :-
	boiler_pressure(Entity_A, Entity_C),
	boiler_pressure(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_presented_in(Entity_A, Entity_B) :-
	presented_in(Entity_A, Entity_C),
	presented_in(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_fault(Entity_A, Entity_B) :-
	fault(Entity_A, Entity_C),
	fault(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_member_of_the_crew_of(Entity_A, Entity_B) :-
	member_of_the_crew_of(Entity_A, Entity_C),
	member_of_the_crew_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_nature_of_statement(Entity_A, Entity_B) :-
	nature_of_statement(Entity_A, Entity_C),
	nature_of_statement(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_grammatical_gender(Entity_A, Entity_B) :-
	has_grammatical_gender(Entity_A, Entity_C),
	has_grammatical_gender(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_grammatical_person(Entity_A, Entity_B) :-
	has_grammatical_person(Entity_A, Entity_C),
	has_grammatical_person(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_assistant_director(Entity_A, Entity_B) :-
	assistant_director(Entity_A, Entity_C),
	assistant_director(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_possible_medical_findings(Entity_A, Entity_B) :-
	possible_medical_findings(Entity_A, Entity_C),
	possible_medical_findings(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_suggests_the_existence_of(Entity_A, Entity_B) :-
	suggests_the_existence_of(Entity_A, Entity_C),
	suggests_the_existence_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_evaluation(Entity_A, Entity_B) :-
	has_evaluation(Entity_A, Entity_C),
	has_evaluation(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_evaluation_of(Entity_A, Entity_B) :-
	evaluation_of(Entity_A, Entity_C),
	evaluation_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_greater_than(Entity_A, Entity_B) :-
	greater_than(Entity_A, Entity_C),
	greater_than(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_less_than(Entity_A, Entity_B) :-
	less_than(Entity_A, Entity_C),
	less_than(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_item_for_this_sense(Entity_A, Entity_B) :-
	item_for_this_sense(Entity_A, Entity_C),
	item_for_this_sense(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_season_of_club_or_team(Entity_A, Entity_B) :-
	season_of_club_or_team(Entity_A, Entity_C),
	season_of_club_or_team(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_coastline(Entity_A, Entity_B) :-
	coastline(Entity_A, Entity_C),
	coastline(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_igac_rating(Entity_A, Entity_B) :-
	igac_rating(Entity_A, Entity_C),
	igac_rating(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_kavi_rating(Entity_A, Entity_B) :-
	kavi_rating(Entity_A, Entity_C),
	kavi_rating(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_established_from_medical_condition(Entity_A, Entity_B) :-
	established_from_medical_condition(Entity_A, Entity_C),
	established_from_medical_condition(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_vehicles_per_thousand_people(Entity_A, Entity_B) :-
	vehicles_per_thousand_people(Entity_A, Entity_C),
	vehicles_per_thousand_people(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_grammatical_gender(Entity_A, Entity_B) :-
	grammatical_gender(Entity_A, Entity_C),
	grammatical_gender(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_conjugation_class(Entity_A, Entity_B) :-
	conjugation_class(Entity_A, Entity_C),
	conjugation_class(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_officialized_by(Entity_A, Entity_B) :-
	officialized_by(Entity_A, Entity_C),
	officialized_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_output_device(Entity_A, Entity_B) :-
	output_device(Entity_A, Entity_C),
	output_device(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_imda_rating(Entity_A, Entity_B) :-
	imda_rating(Entity_A, Entity_C),
	imda_rating(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_adapted_by(Entity_A, Entity_B) :-
	adapted_by(Entity_A, Entity_C),
	adapted_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_topographic_map(Entity_A, Entity_B) :-
	topographic_map(Entity_A, Entity_C),
	topographic_map(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_stroke_count(Entity_A, Entity_B) :-
	stroke_count(Entity_A, Entity_C),
	stroke_count(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_conjugation_class(Entity_A, Entity_B) :-
	has_conjugation_class(Entity_A, Entity_C),
	has_conjugation_class(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_chromosome_count(Entity_A, Entity_B) :-
	chromosome_count(Entity_A, Entity_C),
	chromosome_count(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_prime_factor(Entity_A, Entity_B) :-
	prime_factor(Entity_A, Entity_C),
	prime_factor(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_pronunciation_variety(Entity_A, Entity_B) :-
	pronunciation_variety(Entity_A, Entity_C),
	pronunciation_variety(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_reading_pattern_of_han_character(Entity_A, Entity_B) :-
	reading_pattern_of_han_character(Entity_A, Entity_C),
	reading_pattern_of_han_character(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_medical_evacuation_to(Entity_A, Entity_B) :-
	medical_evacuation_to(Entity_A, Entity_C),
	medical_evacuation_to(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_sports_competition_competed_at(Entity_A, Entity_B) :-
	sports_competition_competed_at(Entity_A, Entity_C),
	sports_competition_competed_at(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_grade_of_kanji(Entity_A, Entity_B) :-
	grade_of_kanji(Entity_A, Entity_C),
	grade_of_kanji(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_surname_for_other_gender(Entity_A, Entity_B) :-
	surname_for_other_gender(Entity_A, Entity_C),
	surname_for_other_gender(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_radical(Entity_A, Entity_B) :-
	radical(Entity_A, Entity_C),
	radical(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_residual_stroke_count(Entity_A, Entity_B) :-
	residual_stroke_count(Entity_A, Entity_C),
	residual_stroke_count(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_type_locality_biology_(Entity_A, Entity_B) :-
	type_locality_biology_(Entity_A, Entity_C),
	type_locality_biology_(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_display_technology(Entity_A, Entity_B) :-
	display_technology(Entity_A, Entity_C),
	display_technology(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_property_scope(Entity_A, Entity_B) :-
	property_scope(Entity_A, Entity_C),
	property_scope(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_jockey(Entity_A, Entity_B) :-
	jockey(Entity_A, Entity_C),
	jockey(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_attested_in(Entity_A, Entity_B) :-
	attested_in(Entity_A, Entity_C),
	attested_in(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_revival_or_touring_version_of(Entity_A, Entity_B) :-
	revival_or_touring_version_of(Entity_A, Entity_C),
	revival_or_touring_version_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_angular_diameter(Entity_A, Entity_B) :-
	angular_diameter(Entity_A, Entity_C),
	angular_diameter(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_laps_completed(Entity_A, Entity_B) :-
	laps_completed(Entity_A, Entity_C),
	laps_completed(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_school_district(Entity_A, Entity_B) :-
	school_district(Entity_A, Entity_C),
	school_district(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_jma_seismic_intensity_scale(Entity_A, Entity_B) :-
	jma_seismic_intensity_scale(Entity_A, Entity_C),
	jma_seismic_intensity_scale(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_permanent_resident_of(Entity_A, Entity_B) :-
	permanent_resident_of(Entity_A, Entity_C),
	permanent_resident_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_pattern(Entity_A, Entity_B) :-
	has_pattern(Entity_A, Entity_C),
	has_pattern(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_han_character_in_this_lexeme(Entity_A, Entity_B) :-
	han_character_in_this_lexeme(Entity_A, Entity_C),
	han_character_in_this_lexeme(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_tone_or_pitch_accent_class(Entity_A, Entity_B) :-
	tone_or_pitch_accent_class(Entity_A, Entity_C),
	tone_or_pitch_accent_class(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_position_of_accent_nucleus(Entity_A, Entity_B) :-
	position_of_accent_nucleus(Entity_A, Entity_C),
	position_of_accent_nucleus(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_position_of_devoiced_vowel(Entity_A, Entity_B) :-
	position_of_devoiced_vowel(Entity_A, Entity_C),
	position_of_devoiced_vowel(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_viewers_listeners(Entity_A, Entity_B) :-
	number_of_viewers_listeners(Entity_A, Entity_C),
	number_of_viewers_listeners(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_signum(Entity_A, Entity_B) :-
	signum(Entity_A, Entity_C),
	signum(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_research_measurement(Entity_A, Entity_B) :-
	research_measurement(Entity_A, Entity_C),
	research_measurement(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_model_year(Entity_A, Entity_B) :-
	model_year(Entity_A, Entity_C),
	model_year(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_reference_value(Entity_A, Entity_B) :-
	reference_value(Entity_A, Entity_C),
	reference_value(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_lower_limit(Entity_A, Entity_B) :-
	lower_limit(Entity_A, Entity_C),
	lower_limit(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_upper_limit(Entity_A, Entity_B) :-
	upper_limit(Entity_A, Entity_C),
	upper_limit(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_grants(Entity_A, Entity_B) :-
	grants(Entity_A, Entity_C),
	grants(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_section_number(Entity_A, Entity_B) :-
	section_number(Entity_A, Entity_C),
	section_number(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_cjkv_variant_character(Entity_A, Entity_B) :-
	cjkv_variant_character(Entity_A, Entity_C),
	cjkv_variant_character(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_ultimate_tensile_strength(Entity_A, Entity_B) :-
	ultimate_tensile_strength(Entity_A, Entity_C),
	ultimate_tensile_strength(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_tensile_modulus_of_elasticity(Entity_A, Entity_B) :-
	tensile_modulus_of_elasticity(Entity_A, Entity_C),
	tensile_modulus_of_elasticity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_position_of_nasal_sonant(Entity_A, Entity_B) :-
	position_of_nasal_sonant(Entity_A, Entity_C),
	position_of_nasal_sonant(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_hardness(Entity_A, Entity_B) :-
	hardness(Entity_A, Entity_C),
	hardness(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_accredited_by(Entity_A, Entity_B) :-
	accredited_by(Entity_A, Entity_C),
	accredited_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_toughness(Entity_A, Entity_B) :-
	toughness(Entity_A, Entity_C),
	toughness(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_unicode_block(Entity_A, Entity_B) :-
	unicode_block(Entity_A, Entity_C),
	unicode_block(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_fanqie(Entity_A, Entity_B) :-
	fanqie(Entity_A, Entity_C),
	fanqie(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_horizontal_depth(Entity_A, Entity_B) :-
	horizontal_depth(Entity_A, Entity_C),
	horizontal_depth(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_valency(Entity_A, Entity_B) :-
	valency(Entity_A, Entity_C),
	valency(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_yield_strength(Entity_A, Entity_B) :-
	yield_strength(Entity_A, Entity_C),
	yield_strength(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_hangul_of_a_chinese_character(Entity_A, Entity_B) :-
	hangul_of_a_chinese_character(Entity_A, Entity_C),
	hangul_of_a_chinese_character(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_passive_voice(Entity_A, Entity_B) :-
	passive_voice(Entity_A, Entity_C),
	passive_voice(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_registration_district(Entity_A, Entity_B) :-
	registration_district(Entity_A, Entity_C),
	registration_district(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_expressed_in(Entity_A, Entity_B) :-
	expressed_in(Entity_A, Entity_C),
	expressed_in(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_coefficient_of_friction(Entity_A, Entity_B) :-
	coefficient_of_friction(Entity_A, Entity_C),
	coefficient_of_friction(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_arrests(Entity_A, Entity_B) :-
	number_of_arrests(Entity_A, Entity_C),
	number_of_arrests(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_invasive_to(Entity_A, Entity_B) :-
	invasive_to(Entity_A, Entity_C),
	invasive_to(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_microstructure(Entity_A, Entity_B) :-
	microstructure(Entity_A, Entity_C),
	microstructure(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_normalized_unicode_character(Entity_A, Entity_B) :-
	normalized_unicode_character(Entity_A, Entity_C),
	normalized_unicode_character(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_works_accessible_online(Entity_A, Entity_B) :-
	number_of_works_accessible_online(Entity_A, Entity_C),
	number_of_works_accessible_online(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_poisson_s_ratio(Entity_A, Entity_B) :-
	poisson_s_ratio(Entity_A, Entity_C),
	poisson_s_ratio(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_moisture_absorption(Entity_A, Entity_B) :-
	moisture_absorption(Entity_A, Entity_C),
	moisture_absorption(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_platform_faces(Entity_A, Entity_B) :-
	number_of_platform_faces(Entity_A, Entity_C),
	number_of_platform_faces(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_relative_humidity(Entity_A, Entity_B) :-
	relative_humidity(Entity_A, Entity_C),
	relative_humidity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_class_of_station(Entity_A, Entity_B) :-
	class_of_station(Entity_A, Entity_C),
	class_of_station(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_located_in_the_ecclesiastical_territorial_entity(Entity_A, Entity_B) :-
	located_in_the_ecclesiastical_territorial_entity(Entity_A, Entity_C),
	located_in_the_ecclesiastical_territorial_entity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_fatigue_limit(Entity_A, Entity_B) :-
	fatigue_limit(Entity_A, Entity_C),
	fatigue_limit(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_type_of_water_supply(Entity_A, Entity_B) :-
	type_of_water_supply(Entity_A, Entity_C),
	type_of_water_supply(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_pitting_resistance_equivalent_number(Entity_A, Entity_B) :-
	pitting_resistance_equivalent_number(Entity_A, Entity_C),
	pitting_resistance_equivalent_number(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_prisoner_count(Entity_A, Entity_B) :-
	prisoner_count(Entity_A, Entity_C),
	prisoner_count(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_risk_factor(Entity_A, Entity_B) :-
	risk_factor(Entity_A, Entity_C),
	risk_factor(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_railway_traffic_side(Entity_A, Entity_B) :-
	railway_traffic_side(Entity_A, Entity_C),
	railway_traffic_side(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_bulk_modulus(Entity_A, Entity_B) :-
	bulk_modulus(Entity_A, Entity_C),
	bulk_modulus(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_compressive_strength(Entity_A, Entity_B) :-
	compressive_strength(Entity_A, Entity_C),
	compressive_strength(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_glass_transition_temperature(Entity_A, Entity_B) :-
	glass_transition_temperature(Entity_A, Entity_C),
	glass_transition_temperature(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_linear_thermal_expansion_coefficient(Entity_A, Entity_B) :-
	linear_thermal_expansion_coefficient(Entity_A, Entity_C),
	linear_thermal_expansion_coefficient(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_shear_modulus(Entity_A, Entity_B) :-
	shear_modulus(Entity_A, Entity_C),
	shear_modulus(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_thermal_diffusivity(Entity_A, Entity_B) :-
	thermal_diffusivity(Entity_A, Entity_C),
	thermal_diffusivity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_relative_permittivity(Entity_A, Entity_B) :-
	relative_permittivity(Entity_A, Entity_C),
	relative_permittivity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_relative_permeability(Entity_A, Entity_B) :-
	relative_permeability(Entity_A, Entity_C),
	relative_permeability(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_flexural_strength(Entity_A, Entity_B) :-
	flexural_strength(Entity_A, Entity_C),
	flexural_strength(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_dissipation_factor(Entity_A, Entity_B) :-
	dissipation_factor(Entity_A, Entity_C),
	dissipation_factor(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_electrical_resistivity(Entity_A, Entity_B) :-
	electrical_resistivity(Entity_A, Entity_C),
	electrical_resistivity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_flexural_modulus(Entity_A, Entity_B) :-
	flexural_modulus(Entity_A, Entity_C),
	flexural_modulus(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_heat_deflection_temperature(Entity_A, Entity_B) :-
	heat_deflection_temperature(Entity_A, Entity_C),
	heat_deflection_temperature(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_tear_resistance(Entity_A, Entity_B) :-
	tear_resistance(Entity_A, Entity_C),
	tear_resistance(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_shear_strength(Entity_A, Entity_B) :-
	shear_strength(Entity_A, Entity_C),
	shear_strength(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_samples_from_work(Entity_A, Entity_B) :-
	samples_from_work(Entity_A, Entity_C),
	samples_from_work(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_force(Entity_A, Entity_B) :-
	force(Entity_A, Entity_C),
	force(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_abrasion_resistance(Entity_A, Entity_B) :-
	abrasion_resistance(Entity_A, Entity_C),
	abrasion_resistance(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_requires_grammatical_feature(Entity_A, Entity_B) :-
	requires_grammatical_feature(Entity_A, Entity_C),
	requires_grammatical_feature(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_ideographic_description_sequences(Entity_A, Entity_B) :-
	ideographic_description_sequences(Entity_A, Entity_C),
	ideographic_description_sequences(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_editor_in_chief(Entity_A, Entity_B) :-
	editor_in_chief(Entity_A, Entity_C),
	editor_in_chief(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_narrative_role(Entity_A, Entity_B) :-
	narrative_role(Entity_A, Entity_C),
	narrative_role(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_stage_crew_member(Entity_A, Entity_B) :-
	stage_crew_member(Entity_A, Entity_C),
	stage_crew_member(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_program_committee_member(Entity_A, Entity_B) :-
	has_program_committee_member(Entity_A, Entity_C),
	has_program_committee_member(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_osi_model_layer_location(Entity_A, Entity_B) :-
	osi_model_layer_location(Entity_A, Entity_C),
	osi_model_layer_location(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_elongation_at_break(Entity_A, Entity_B) :-
	elongation_at_break(Entity_A, Entity_C),
	elongation_at_break(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_state_of_conservation(Entity_A, Entity_B) :-
	state_of_conservation(Entity_A, Entity_C),
	state_of_conservation(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_state_of_use(Entity_A, Entity_B) :-
	state_of_use(Entity_A, Entity_C),
	state_of_use(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_admission_rate(Entity_A, Entity_B) :-
	admission_rate(Entity_A, Entity_C),
	admission_rate(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_is_retracted_by(Entity_A, Entity_B) :-
	is_retracted_by(Entity_A, Entity_C),
	is_retracted_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_majority_opinion_by(Entity_A, Entity_B) :-
	majority_opinion_by(Entity_A, Entity_C),
	majority_opinion_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_seed(Entity_A, Entity_B) :-
	seed(Entity_A, Entity_C),
	seed(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_political_coalition(Entity_A, Entity_B) :-
	political_coalition(Entity_A, Entity_C),
	political_coalition(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_status_in_the_red_list_of_threatened_species_in_the_czech_republic(Entity_A, Entity_B) :-
	status_in_the_red_list_of_threatened_species_in_the_czech_republic(Entity_A, Entity_C),
	status_in_the_red_list_of_threatened_species_in_the_czech_republic(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_item_inherits_statement_from(Entity_A, Entity_B) :-
	item_inherits_statement_from(Entity_A, Entity_C),
	item_inherits_statement_from(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_model_item(Entity_A, Entity_B) :-
	model_item(Entity_A, Entity_C),
	model_item(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_perfume_note(Entity_A, Entity_B) :-
	perfume_note(Entity_A, Entity_C),
	perfume_note(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_place_of_devotion(Entity_A, Entity_B) :-
	place_of_devotion(Entity_A, Entity_C),
	place_of_devotion(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_video_designer(Entity_A, Entity_B) :-
	video_designer(Entity_A, Entity_C),
	video_designer(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_projection_designer(Entity_A, Entity_B) :-
	projection_designer(Entity_A, Entity_C),
	projection_designer(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_mode_of_derivation(Entity_A, Entity_B) :-
	mode_of_derivation(Entity_A, Entity_C),
	mode_of_derivation(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_work_hardening_strain(Entity_A, Entity_B) :-
	work_hardening_strain(Entity_A, Entity_C),
	work_hardening_strain(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_tuition_fee(Entity_A, Entity_B) :-
	tuition_fee(Entity_A, Entity_C),
	tuition_fee(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_foreign_transaction_fee(Entity_A, Entity_B) :-
	foreign_transaction_fee(Entity_A, Entity_C),
	foreign_transaction_fee(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_trading_fee(Entity_A, Entity_B) :-
	trading_fee(Entity_A, Entity_C),
	trading_fee(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_account_charge_subscription_fee(Entity_A, Entity_B) :-
	account_charge_subscription_fee(Entity_A, Entity_C),
	account_charge_subscription_fee(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_borrowing_rate(Entity_A, Entity_B) :-
	borrowing_rate(Entity_A, Entity_C),
	borrowing_rate(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_interest_rate(Entity_A, Entity_B) :-
	interest_rate(Entity_A, Entity_C),
	interest_rate(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_jma_magnitude(Entity_A, Entity_B) :-
	jma_magnitude(Entity_A, Entity_C),
	jma_magnitude(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_paradigm_class(Entity_A, Entity_B) :-
	paradigm_class(Entity_A, Entity_C),
	paradigm_class(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_inflection_class(Entity_A, Entity_B) :-
	has_inflection_class(Entity_A, Entity_C),
	has_inflection_class(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_creates_lexeme_type(Entity_A, Entity_B) :-
	creates_lexeme_type(Entity_A, Entity_C),
	creates_lexeme_type(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_limiting_oxygen_index(Entity_A, Entity_B) :-
	limiting_oxygen_index(Entity_A, Entity_C),
	limiting_oxygen_index(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_plot_expanded_in(Entity_A, Entity_B) :-
	plot_expanded_in(Entity_A, Entity_C),
	plot_expanded_in(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_vicat_softening_point(Entity_A, Entity_B) :-
	vicat_softening_point(Entity_A, Entity_C),
	vicat_softening_point(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_depicted_part(Entity_A, Entity_B) :-
	depicted_part(Entity_A, Entity_C),
	depicted_part(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_reference_vocabulary(Entity_A, Entity_B) :-
	reference_vocabulary(Entity_A, Entity_C),
	reference_vocabulary(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_medierådet_rating(Entity_A, Entity_B) :-
	medierådet_rating(Entity_A, Entity_C),
	medierådet_rating(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_annual_number_of_weddings(Entity_A, Entity_B) :-
	annual_number_of_weddings(Entity_A, Entity_C),
	annual_number_of_weddings(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_carbon_footprint(Entity_A, Entity_B) :-
	carbon_footprint(Entity_A, Entity_C),
	carbon_footprint(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_attenuation_coefficient(Entity_A, Entity_B) :-
	attenuation_coefficient(Entity_A, Entity_C),
	attenuation_coefficient(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_compressive_modulus_of_elasticity(Entity_A, Entity_B) :-
	compressive_modulus_of_elasticity(Entity_A, Entity_C),
	compressive_modulus_of_elasticity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_kit_supplier(Entity_A, Entity_B) :-
	kit_supplier(Entity_A, Entity_C),
	kit_supplier(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_category_for_films_in_this_language(Entity_A, Entity_B) :-
	category_for_films_in_this_language(Entity_A, Entity_C),
	category_for_films_in_this_language(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_distributary(Entity_A, Entity_B) :-
	distributary(Entity_A, Entity_C),
	distributary(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_water_footprint(Entity_A, Entity_B) :-
	water_footprint(Entity_A, Entity_C),
	water_footprint(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_applies_to_people(Entity_A, Entity_B) :-
	applies_to_people(Entity_A, Entity_C),
	applies_to_people(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_flexural_strain_at_break(Entity_A, Entity_B) :-
	flexural_strain_at_break(Entity_A, Entity_C),
	flexural_strain_at_break(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_expression_gesture_or_body_pose(Entity_A, Entity_B) :-
	expression_gesture_or_body_pose(Entity_A, Entity_C),
	expression_gesture_or_body_pose(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_inep_igc_continuous_score(Entity_A, Entity_B) :-
	inep_igc_continuous_score(Entity_A, Entity_C),
	inep_igc_continuous_score(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_permeability(Entity_A, Entity_B) :-
	permeability(Entity_A, Entity_C),
	permeability(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_embodied_energy(Entity_A, Entity_B) :-
	embodied_energy(Entity_A, Entity_C),
	embodied_energy(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_biobased_content_weight_percentage(Entity_A, Entity_B) :-
	biobased_content_weight_percentage(Entity_A, Entity_C),
	biobased_content_weight_percentage(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_location_of_sense_usage(Entity_A, Entity_B) :-
	location_of_sense_usage(Entity_A, Entity_C),
	location_of_sense_usage(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_dramaturge(Entity_A, Entity_B) :-
	dramaturge(Entity_A, Entity_C),
	dramaturge(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_coach_of_sports_team(Entity_A, Entity_B) :-
	coach_of_sports_team(Entity_A, Entity_C),
	coach_of_sports_team(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_beer_bitterness(Entity_A, Entity_B) :-
	beer_bitterness(Entity_A, Entity_C),
	beer_bitterness(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_beer_color(Entity_A, Entity_B) :-
	beer_color(Entity_A, Entity_C),
	beer_color(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_inep_igc_discrete_grade(Entity_A, Entity_B) :-
	inep_igc_discrete_grade(Entity_A, Entity_C),
	inep_igc_discrete_grade(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_clinical_trial_phase(Entity_A, Entity_B) :-
	clinical_trial_phase(Entity_A, Entity_C),
	clinical_trial_phase(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_uses_capitalization_for(Entity_A, Entity_B) :-
	uses_capitalization_for(Entity_A, Entity_C),
	uses_capitalization_for(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_category_for_members_of_a_team(Entity_A, Entity_B) :-
	category_for_members_of_a_team(Entity_A, Entity_C),
	category_for_members_of_a_team(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_chord_progression(Entity_A, Entity_B) :-
	chord_progression(Entity_A, Entity_C),
	chord_progression(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_season_ends(Entity_A, Entity_B) :-
	season_ends(Entity_A, Entity_C),
	season_ends(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_volunteers(Entity_A, Entity_B) :-
	number_of_volunteers(Entity_A, Entity_C),
	number_of_volunteers(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_running_mate(Entity_A, Entity_B) :-
	running_mate(Entity_A, Entity_C),
	running_mate(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_research_site(Entity_A, Entity_B) :-
	research_site(Entity_A, Entity_C),
	research_site(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_quotes_work(Entity_A, Entity_B) :-
	quotes_work(Entity_A, Entity_C),
	quotes_work(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_reference_has_role(Entity_A, Entity_B) :-
	reference_has_role(Entity_A, Entity_C),
	reference_has_role(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_tautomer_of(Entity_A, Entity_B) :-
	tautomer_of(Entity_A, Entity_C),
	tautomer_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_category_for_eponymous_categories(Entity_A, Entity_B) :-
	category_for_eponymous_categories(Entity_A, Entity_C),
	category_for_eponymous_categories(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_language_style(Entity_A, Entity_B) :-
	language_style(Entity_A, Entity_C),
	language_style(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_ratified_by(Entity_A, Entity_B) :-
	ratified_by(Entity_A, Entity_C),
	ratified_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_funding_scheme(Entity_A, Entity_B) :-
	funding_scheme(Entity_A, Entity_C),
	funding_scheme(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_heat_treating(Entity_A, Entity_B) :-
	heat_treating(Entity_A, Entity_C),
	heat_treating(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_copyright_status(Entity_A, Entity_B) :-
	copyright_status(Entity_A, Entity_C),
	copyright_status(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_level_of_description(Entity_A, Entity_B) :-
	level_of_description(Entity_A, Entity_C),
	level_of_description(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_real_estate_developer(Entity_A, Entity_B) :-
	real_estate_developer(Entity_A, Entity_C),
	real_estate_developer(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_collection_creator(Entity_A, Entity_B) :-
	collection_creator(Entity_A, Entity_C),
	collection_creator(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_digital_representation_of(Entity_A, Entity_B) :-
	digital_representation_of(Entity_A, Entity_C),
	digital_representation_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_narrative_age(Entity_A, Entity_B) :-
	narrative_age(Entity_A, Entity_C),
	narrative_age(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_right_ascension(Entity_A, Entity_B) :-
	right_ascension(Entity_A, Entity_C),
	right_ascension(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_declination(Entity_A, Entity_B) :-
	declination(Entity_A, Entity_C),
	declination(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_epoch(Entity_A, Entity_B) :-
	epoch(Entity_A, Entity_C),
	epoch(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_galactic_longitude(Entity_A, Entity_B) :-
	galactic_longitude(Entity_A, Entity_C),
	galactic_longitude(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_galactic_latitude(Entity_A, Entity_B) :-
	galactic_latitude(Entity_A, Entity_C),
	galactic_latitude(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_demonym_of(Entity_A, Entity_B) :-
	demonym_of(Entity_A, Entity_C),
	demonym_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_specific_rotation(Entity_A, Entity_B) :-
	specific_rotation(Entity_A, Entity_C),
	specific_rotation(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_concentration(Entity_A, Entity_B) :-
	concentration(Entity_A, Entity_C),
	concentration(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_copyright_representative(Entity_A, Entity_B) :-
	copyright_representative(Entity_A, Entity_C),
	copyright_representative(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_advertises(Entity_A, Entity_B) :-
	advertises(Entity_A, Entity_C),
	advertises(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_colorist(Entity_A, Entity_B) :-
	colorist(Entity_A, Entity_C),
	colorist(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_reports_periodicity(Entity_A, Entity_B) :-
	reports_periodicity(Entity_A, Entity_C),
	reports_periodicity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_urban_population(Entity_A, Entity_B) :-
	urban_population(Entity_A, Entity_C),
	urban_population(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_rural_population(Entity_A, Entity_B) :-
	rural_population(Entity_A, Entity_C),
	rural_population(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_closest_approach(Entity_A, Entity_B) :-
	closest_approach(Entity_A, Entity_C),
	closest_approach(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_official_color(Entity_A, Entity_B) :-
	official_color(Entity_A, Entity_C),
	official_color(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_member_category(Entity_A, Entity_B) :-
	member_category(Entity_A, Entity_C),
	member_category(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_works_in_the_collection(Entity_A, Entity_B) :-
	has_works_in_the_collection(Entity_A, Entity_C),
	has_works_in_the_collection(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_rightsstatements_org_statement_according_to_source_website(Entity_A, Entity_B) :-
	rightsstatements_org_statement_according_to_source_website(Entity_A, Entity_C),
	rightsstatements_org_statement_according_to_source_website(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_day_of_regular_release(Entity_A, Entity_B) :-
	day_of_regular_release(Entity_A, Entity_C),
	day_of_regular_release(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_euler_characteristic(Entity_A, Entity_B) :-
	euler_characteristic(Entity_A, Entity_C),
	euler_characteristic(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_lyrics(Entity_A, Entity_B) :-
	has_lyrics(Entity_A, Entity_C),
	has_lyrics(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_maintenance_method(Entity_A, Entity_B) :-
	maintenance_method(Entity_A, Entity_C),
	maintenance_method(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_cbfc_rating(Entity_A, Entity_B) :-
	cbfc_rating(Entity_A, Entity_C),
	cbfc_rating(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_does_not_have_characteristic(Entity_A, Entity_B) :-
	does_not_have_characteristic(Entity_A, Entity_C),
	does_not_have_characteristic(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_drag_coefficient(Entity_A, Entity_B) :-
	drag_coefficient(Entity_A, Entity_C),
	drag_coefficient(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_illiterate_population(Entity_A, Entity_B) :-
	illiterate_population(Entity_A, Entity_C),
	illiterate_population(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_literate_population(Entity_A, Entity_B) :-
	literate_population(Entity_A, Entity_C),
	literate_population(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_total_goals_in_career(Entity_A, Entity_B) :-
	total_goals_in_career(Entity_A, Entity_C),
	total_goals_in_career(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_stall_speed(Entity_A, Entity_B) :-
	stall_speed(Entity_A, Entity_C),
	stall_speed(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_expression_of(Entity_A, Entity_B) :-
	expression_of(Entity_A, Entity_C),
	expression_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_role_in_modeling(Entity_A, Entity_B) :-
	has_role_in_modeling(Entity_A, Entity_C),
	has_role_in_modeling(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_observed_in(Entity_A, Entity_B) :-
	observed_in(Entity_A, Entity_C),
	observed_in(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_phenotype(Entity_A, Entity_B) :-
	has_phenotype(Entity_A, Entity_C),
	has_phenotype(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_type_of_front_suspension(Entity_A, Entity_B) :-
	type_of_front_suspension(Entity_A, Entity_C),
	type_of_front_suspension(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_type_of_rear_suspension(Entity_A, Entity_B) :-
	type_of_rear_suspension(Entity_A, Entity_C),
	type_of_rear_suspension(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_multi_channel_network(Entity_A, Entity_B) :-
	multi_channel_network(Entity_A, Entity_C),
	multi_channel_network(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_total_shots_in_career(Entity_A, Entity_B) :-
	total_shots_in_career(Entity_A, Entity_C),
	total_shots_in_career(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_total_points_in_career(Entity_A, Entity_B) :-
	total_points_in_career(Entity_A, Entity_C),
	total_points_in_career(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_total_assists_in_career(Entity_A, Entity_B) :-
	total_assists_in_career(Entity_A, Entity_C),
	total_assists_in_career(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_penalty_minutes_in_career(Entity_A, Entity_B) :-
	penalty_minutes_in_career(Entity_A, Entity_C),
	penalty_minutes_in_career(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_career_plus_minus_rating(Entity_A, Entity_B) :-
	career_plus_minus_rating(Entity_A, Entity_C),
	career_plus_minus_rating(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_key_performance_indicator(Entity_A, Entity_B) :-
	key_performance_indicator(Entity_A, Entity_C),
	key_performance_indicator(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_inscription_mentions(Entity_A, Entity_B) :-
	inscription_mentions(Entity_A, Entity_C),
	inscription_mentions(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_taxon_especially_protected_in_area(Entity_A, Entity_B) :-
	taxon_especially_protected_in_area(Entity_A, Entity_C),
	taxon_especially_protected_in_area(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_words(Entity_A, Entity_B) :-
	number_of_words(Entity_A, Entity_C),
	number_of_words(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_league_system(Entity_A, Entity_B) :-
	league_system(Entity_A, Entity_C),
	league_system(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_endowment(Entity_A, Entity_B) :-
	endowment(Entity_A, Entity_C),
	endowment(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_highest_break(Entity_A, Entity_B) :-
	highest_break(Entity_A, Entity_C),
	highest_break(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_maximum_temperature_record(Entity_A, Entity_B) :-
	maximum_temperature_record(Entity_A, Entity_C),
	maximum_temperature_record(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_study_or_design_for(Entity_A, Entity_B) :-
	study_or_design_for(Entity_A, Entity_C),
	study_or_design_for(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_general_material_designation(Entity_A, Entity_B) :-
	general_material_designation(Entity_A, Entity_C),
	general_material_designation(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_capacity_factor(Entity_A, Entity_B) :-
	capacity_factor(Entity_A, Entity_C),
	capacity_factor(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_chvrs_classification(Entity_A, Entity_B) :-
	chvrs_classification(Entity_A, Entity_C),
	chvrs_classification(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_rcq_classification(Entity_A, Entity_B) :-
	rcq_classification(Entity_A, Entity_C),
	rcq_classification(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_first_attested_from(Entity_A, Entity_B) :-
	first_attested_from(Entity_A, Entity_C),
	first_attested_from(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_sentences(Entity_A, Entity_B) :-
	number_of_sentences(Entity_A, Entity_C),
	number_of_sentences(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_football_money_league_rank(Entity_A, Entity_B) :-
	football_money_league_rank(Entity_A, Entity_C),
	football_money_league_rank(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_approach_angle(Entity_A, Entity_B) :-
	approach_angle(Entity_A, Entity_C),
	approach_angle(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_departure_angle(Entity_A, Entity_B) :-
	departure_angle(Entity_A, Entity_C),
	departure_angle(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_linear_reference(Entity_A, Entity_B) :-
	linear_reference(Entity_A, Entity_C),
	linear_reference(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_data_transfer_speed(Entity_A, Entity_B) :-
	data_transfer_speed(Entity_A, Entity_C),
	data_transfer_speed(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_music_video(Entity_A, Entity_B) :-
	music_video(Entity_A, Entity_C),
	music_video(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_commons_quality_assessment(Entity_A, Entity_B) :-
	commons_quality_assessment(Entity_A, Entity_C),
	commons_quality_assessment(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_polling_stations(Entity_A, Entity_B) :-
	number_of_polling_stations(Entity_A, Entity_C),
	number_of_polling_stations(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_exposure_time(Entity_A, Entity_B) :-
	exposure_time(Entity_A, Entity_C),
	exposure_time(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_supported_sports_team(Entity_A, Entity_B) :-
	supported_sports_team(Entity_A, Entity_C),
	supported_sports_team(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_iso_speed(Entity_A, Entity_B) :-
	iso_speed(Entity_A, Entity_C),
	iso_speed(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_f_number(Entity_A, Entity_B) :-
	f_number(Entity_A, Entity_C),
	f_number(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_minimum_wage(Entity_A, Entity_B) :-
	minimum_wage(Entity_A, Entity_C),
	minimum_wage(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_hospital_beds(Entity_A, Entity_B) :-
	number_of_hospital_beds(Entity_A, Entity_C),
	number_of_hospital_beds(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_taxon_found_at_location(Entity_A, Entity_B) :-
	taxon_found_at_location(Entity_A, Entity_C),
	taxon_found_at_location(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_calligrapher(Entity_A, Entity_B) :-
	calligrapher(Entity_A, Entity_C),
	calligrapher(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_feed_in_tariff(Entity_A, Entity_B) :-
	feed_in_tariff(Entity_A, Entity_C),
	feed_in_tariff(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_student_organization_of(Entity_A, Entity_B) :-
	student_organization_of(Entity_A, Entity_C),
	student_organization_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_emergency_services(Entity_A, Entity_B) :-
	emergency_services(Entity_A, Entity_C),
	emergency_services(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_average_speed(Entity_A, Entity_B) :-
	average_speed(Entity_A, Entity_C),
	average_speed(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_written_for(Entity_A, Entity_B) :-
	has_written_for(Entity_A, Entity_C),
	has_written_for(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_motif_represents(Entity_A, Entity_B) :-
	motif_represents(Entity_A, Entity_C),
	motif_represents(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_solar_irradiance(Entity_A, Entity_B) :-
	solar_irradiance(Entity_A, Entity_C),
	solar_irradiance(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_effective_temperature(Entity_A, Entity_B) :-
	effective_temperature(Entity_A, Entity_C),
	effective_temperature(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_target_muscle(Entity_A, Entity_B) :-
	target_muscle(Entity_A, Entity_C),
	target_muscle(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_historical_region(Entity_A, Entity_B) :-
	historical_region(Entity_A, Entity_C),
	historical_region(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_writing_language(Entity_A, Entity_B) :-
	writing_language(Entity_A, Entity_C),
	writing_language(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_match_interval(Entity_A, Entity_B) :-
	match_interval(Entity_A, Entity_C),
	match_interval(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_microarchitecture(Entity_A, Entity_B) :-
	microarchitecture(Entity_A, Entity_C),
	microarchitecture(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_literacy_rate(Entity_A, Entity_B) :-
	literacy_rate(Entity_A, Entity_C),
	literacy_rate(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_era_name(Entity_A, Entity_B) :-
	era_name(Entity_A, Entity_C),
	era_name(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_seconded_by(Entity_A, Entity_B) :-
	seconded_by(Entity_A, Entity_C),
	seconded_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_moved_by(Entity_A, Entity_B) :-
	moved_by(Entity_A, Entity_C),
	moved_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_animator(Entity_A, Entity_B) :-
	animator(Entity_A, Entity_C),
	animator(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_video_system(Entity_A, Entity_B) :-
	video_system(Entity_A, Entity_C),
	video_system(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_online_access_status(Entity_A, Entity_B) :-
	online_access_status(Entity_A, Entity_C),
	online_access_status(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_narrative_motif(Entity_A, Entity_B) :-
	narrative_motif(Entity_A, Entity_C),
	narrative_motif(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_review_of(Entity_A, Entity_B) :-
	review_of(Entity_A, Entity_C),
	review_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_scandinavian_middle_family_name(Entity_A, Entity_B) :-
	scandinavian_middle_family_name(Entity_A, Entity_C),
	scandinavian_middle_family_name(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_imprimatur_granted_by(Entity_A, Entity_B) :-
	imprimatur_granted_by(Entity_A, Entity_C),
	imprimatur_granted_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_surface_gravity(Entity_A, Entity_B) :-
	surface_gravity(Entity_A, Entity_C),
	surface_gravity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_chassis(Entity_A, Entity_B) :-
	chassis(Entity_A, Entity_C),
	chassis(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_enemy(Entity_A, Entity_B) :-
	enemy(Entity_A, Entity_C),
	enemy(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_mod_of(Entity_A, Entity_B) :-
	mod_of(Entity_A, Entity_C),
	mod_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_typing_discipline(Entity_A, Entity_B) :-
	typing_discipline(Entity_A, Entity_C),
	typing_discipline(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_shrinkage(Entity_A, Entity_B) :-
	shrinkage(Entity_A, Entity_C),
	shrinkage(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_specific_absorption_rate(Entity_A, Entity_B) :-
	specific_absorption_rate(Entity_A, Entity_C),
	specific_absorption_rate(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_surface_roughness(Entity_A, Entity_B) :-
	surface_roughness(Entity_A, Entity_C),
	surface_roughness(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_related_category(Entity_A, Entity_B) :-
	related_category(Entity_A, Entity_C),
	related_category(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_start_grade(Entity_A, Entity_B) :-
	start_grade(Entity_A, Entity_C),
	start_grade(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_inverse_label_item(Entity_A, Entity_B) :-
	inverse_label_item(Entity_A, Entity_C),
	inverse_label_item(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_end_grade(Entity_A, Entity_B) :-
	end_grade(Entity_A, Entity_C),
	end_grade(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_location_of_the_point_of_view(Entity_A, Entity_B) :-
	location_of_the_point_of_view(Entity_A, Entity_C),
	location_of_the_point_of_view(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_opinion_joined_by(Entity_A, Entity_B) :-
	opinion_joined_by(Entity_A, Entity_C),
	opinion_joined_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_acknowledged(Entity_A, Entity_B) :-
	acknowledged(Entity_A, Entity_C),
	acknowledged(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_copyright_exemption(Entity_A, Entity_B) :-
	copyright_exemption(Entity_A, Entity_C),
	copyright_exemption(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_significant_place(Entity_A, Entity_B) :-
	significant_place(Entity_A, Entity_C),
	significant_place(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_manner_of_inhumane_treatment(Entity_A, Entity_B) :-
	manner_of_inhumane_treatment(Entity_A, Entity_C),
	manner_of_inhumane_treatment(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_cases_consolidated(Entity_A, Entity_B) :-
	cases_consolidated(Entity_A, Entity_C),
	cases_consolidated(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_typically_sells(Entity_A, Entity_B) :-
	typically_sells(Entity_A, Entity_C),
	typically_sells(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_noun_class(Entity_A, Entity_B) :-
	noun_class(Entity_A, Entity_C),
	noun_class(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_does_not_have_effect(Entity_A, Entity_B) :-
	does_not_have_effect(Entity_A, Entity_C),
	does_not_have_effect(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_substitute_director_manager(Entity_A, Entity_B) :-
	substitute_director_manager(Entity_A, Entity_C),
	substitute_director_manager(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_school_class(Entity_A, Entity_B) :-
	school_class(Entity_A, Entity_C),
	school_class(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_ordeal_by(Entity_A, Entity_B) :-
	ordeal_by(Entity_A, Entity_C),
	ordeal_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_access_restriction_status(Entity_A, Entity_B) :-
	access_restriction_status(Entity_A, Entity_C),
	access_restriction_status(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_degree_of_difficulty(Entity_A, Entity_B) :-
	degree_of_difficulty(Entity_A, Entity_C),
	degree_of_difficulty(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_color_produced(Entity_A, Entity_B) :-
	color_produced(Entity_A, Entity_C),
	color_produced(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_computer_performance(Entity_A, Entity_B) :-
	computer_performance(Entity_A, Entity_C),
	computer_performance(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_use_restriction_status(Entity_A, Entity_B) :-
	use_restriction_status(Entity_A, Entity_C),
	use_restriction_status(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_cumulative_elevation_gain(Entity_A, Entity_B) :-
	cumulative_elevation_gain(Entity_A, Entity_C),
	cumulative_elevation_gain(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_climbing_route(Entity_A, Entity_B) :-
	climbing_route(Entity_A, Entity_C),
	climbing_route(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_decimal_digits(Entity_A, Entity_B) :-
	number_of_decimal_digits(Entity_A, Entity_C),
	number_of_decimal_digits(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_oflc_classification(Entity_A, Entity_B) :-
	oflc_classification(Entity_A, Entity_C),
	oflc_classification(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_amount_cataloged(Entity_A, Entity_B) :-
	amount_cataloged(Entity_A, Entity_C),
	amount_cataloged(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_content_descriptor(Entity_A, Entity_B) :-
	content_descriptor(Entity_A, Entity_C),
	content_descriptor(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_educational_stage(Entity_A, Entity_B) :-
	educational_stage(Entity_A, Entity_C),
	educational_stage(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_worn_by(Entity_A, Entity_B) :-
	worn_by(Entity_A, Entity_C),
	worn_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_infix(Entity_A, Entity_B) :-
	infix(Entity_A, Entity_C),
	infix(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_item_disputed_by(Entity_A, Entity_B) :-
	item_disputed_by(Entity_A, Entity_C),
	item_disputed_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_fineness(Entity_A, Entity_B) :-
	fineness(Entity_A, Entity_C),
	fineness(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_graph_radius(Entity_A, Entity_B) :-
	graph_radius(Entity_A, Entity_C),
	graph_radius(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_style_of_karate(Entity_A, Entity_B) :-
	style_of_karate(Entity_A, Entity_C),
	style_of_karate(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_gender_educated(Entity_A, Entity_B) :-
	gender_educated(Entity_A, Entity_C),
	gender_educated(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_minimum_temperature_record(Entity_A, Entity_B) :-
	minimum_temperature_record(Entity_A, Entity_C),
	minimum_temperature_record(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_glacier_status(Entity_A, Entity_B) :-
	glacier_status(Entity_A, Entity_C),
	glacier_status(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_processor_threads(Entity_A, Entity_B) :-
	number_of_processor_threads(Entity_A, Entity_C),
	number_of_processor_threads(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_reason_for_preferred_rank(Entity_A, Entity_B) :-
	reason_for_preferred_rank(Entity_A, Entity_C),
	reason_for_preferred_rank(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_graph_diameter(Entity_A, Entity_B) :-
	graph_diameter(Entity_A, Entity_C),
	graph_diameter(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_orientation(Entity_A, Entity_B) :-
	orientation(Entity_A, Entity_C),
	orientation(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_key_col(Entity_A, Entity_B) :-
	key_col(Entity_A, Entity_C),
	key_col(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_variety_of_lexeme_form_or_sense(Entity_A, Entity_B) :-
	variety_of_lexeme_form_or_sense(Entity_A, Entity_C),
	variety_of_lexeme_form_or_sense(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_source_of_file(Entity_A, Entity_B) :-
	source_of_file(Entity_A, Entity_C),
	source_of_file(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_grammatical_aspect(Entity_A, Entity_B) :-
	grammatical_aspect(Entity_A, Entity_C),
	grammatical_aspect(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_comorbidity(Entity_A, Entity_B) :-
	comorbidity(Entity_A, Entity_C),
	comorbidity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_audio_system(Entity_A, Entity_B) :-
	audio_system(Entity_A, Entity_C),
	audio_system(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_election_called_by(Entity_A, Entity_B) :-
	election_called_by(Entity_A, Entity_C),
	election_called_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_landscape_architect(Entity_A, Entity_B) :-
	landscape_architect(Entity_A, Entity_C),
	landscape_architect(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_charge_conjugation_quantum_number(Entity_A, Entity_B) :-
	charge_conjugation_quantum_number(Entity_A, Entity_C),
	charge_conjugation_quantum_number(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_statement_is_regarded_as_spoiler_for(Entity_A, Entity_B) :-
	statement_is_regarded_as_spoiler_for(Entity_A, Entity_C),
	statement_is_regarded_as_spoiler_for(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_category_for_the_interior_of_the_item(Entity_A, Entity_B) :-
	category_for_the_interior_of_the_item(Entity_A, Entity_C),
	category_for_the_interior_of_the_item(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_ifco_rating(Entity_A, Entity_B) :-
	ifco_rating(Entity_A, Entity_C),
	ifco_rating(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_wildlife_protection_act_1972_india_schedule(Entity_A, Entity_B) :-
	wildlife_protection_act_1972_india_schedule(Entity_A, Entity_C),
	wildlife_protection_act_1972_india_schedule(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_age_estimated_by_a_dating_method(Entity_A, Entity_B) :-
	age_estimated_by_a_dating_method(Entity_A, Entity_C),
	age_estimated_by_a_dating_method(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_primary_note(Entity_A, Entity_B) :-
	primary_note(Entity_A, Entity_C),
	primary_note(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_secondary_note(Entity_A, Entity_B) :-
	secondary_note(Entity_A, Entity_C),
	secondary_note(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_cites_appendix(Entity_A, Entity_B) :-
	cites_appendix(Entity_A, Entity_C),
	cites_appendix(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_supervised_by(Entity_A, Entity_B) :-
	supervised_by(Entity_A, Entity_C),
	supervised_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_covered_period(Entity_A, Entity_B) :-
	covered_period(Entity_A, Entity_C),
	covered_period(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_file_page(Entity_A, Entity_B) :-
	file_page(Entity_A, Entity_C),
	file_page(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_generalization_of(Entity_A, Entity_B) :-
	generalization_of(Entity_A, Entity_C),
	generalization_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_litter_size(Entity_A, Entity_B) :-
	litter_size(Entity_A, Entity_C),
	litter_size(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_legislative_committee(Entity_A, Entity_B) :-
	legislative_committee(Entity_A, Entity_C),
	legislative_committee(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_copyright_status_as_a_creator(Entity_A, Entity_B) :-
	copyright_status_as_a_creator(Entity_A, Entity_C),
	copyright_status_as_a_creator(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_serving_temperature(Entity_A, Entity_B) :-
	serving_temperature(Entity_A, Entity_C),
	serving_temperature(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_egg_incubation_period(Entity_A, Entity_B) :-
	egg_incubation_period(Entity_A, Entity_C),
	egg_incubation_period(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_military_unit(Entity_A, Entity_B) :-
	military_unit(Entity_A, Entity_C),
	military_unit(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_exonerated_of(Entity_A, Entity_B) :-
	exonerated_of(Entity_A, Entity_C),
	exonerated_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_category_for_ship_name(Entity_A, Entity_B) :-
	category_for_ship_name(Entity_A, Entity_C),
	category_for_ship_name(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_heading(Entity_A, Entity_B) :-
	heading(Entity_A, Entity_C),
	heading(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_category_for_files_created_with_program(Entity_A, Entity_B) :-
	category_for_files_created_with_program(Entity_A, Entity_C),
	category_for_files_created_with_program(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_period_of_lactation(Entity_A, Entity_B) :-
	period_of_lactation(Entity_A, Entity_C),
	period_of_lactation(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_aperture(Entity_A, Entity_B) :-
	aperture(Entity_A, Entity_C),
	aperture(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_category_for_maps(Entity_A, Entity_B) :-
	category_for_maps(Entity_A, Entity_C),
	category_for_maps(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_reviews_ratings(Entity_A, Entity_B) :-
	number_of_reviews_ratings(Entity_A, Entity_C),
	number_of_reviews_ratings(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_merged_into(Entity_A, Entity_B) :-
	merged_into(Entity_A, Entity_C),
	merged_into(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_gained_territory_from(Entity_A, Entity_B) :-
	gained_territory_from(Entity_A, Entity_C),
	gained_territory_from(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_gave_up_territory_to(Entity_A, Entity_B) :-
	gave_up_territory_to(Entity_A, Entity_C),
	gave_up_territory_to(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_business_model(Entity_A, Entity_B) :-
	business_model(Entity_A, Entity_C),
	business_model(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_form_of_creative_work(Entity_A, Entity_B) :-
	form_of_creative_work(Entity_A, Entity_C),
	form_of_creative_work(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_associated_electoral_district(Entity_A, Entity_B) :-
	associated_electoral_district(Entity_A, Entity_C),
	associated_electoral_district(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_historic_county(Entity_A, Entity_B) :-
	historic_county(Entity_A, Entity_C),
	historic_county(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_food_energy(Entity_A, Entity_B) :-
	food_energy(Entity_A, Entity_C),
	food_energy(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_depicted_format(Entity_A, Entity_B) :-
	depicted_format(Entity_A, Entity_C),
	depicted_format(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_endorsed_by(Entity_A, Entity_B) :-
	endorsed_by(Entity_A, Entity_C),
	endorsed_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_ordered_by(Entity_A, Entity_B) :-
	ordered_by(Entity_A, Entity_C),
	ordered_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_research_subject_recruitment_status(Entity_A, Entity_B) :-
	research_subject_recruitment_status(Entity_A, Entity_C),
	research_subject_recruitment_status(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_footedness(Entity_A, Entity_B) :-
	footedness(Entity_A, Entity_C),
	footedness(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_recoveries(Entity_A, Entity_B) :-
	number_of_recoveries(Entity_A, Entity_C),
	number_of_recoveries(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_medical_tests(Entity_A, Entity_B) :-
	number_of_medical_tests(Entity_A, Entity_C),
	number_of_medical_tests(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_livertox_likelihood_score(Entity_A, Entity_B) :-
	livertox_likelihood_score(Entity_A, Entity_C),
	livertox_likelihood_score(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_size_designation(Entity_A, Entity_B) :-
	size_designation(Entity_A, Entity_C),
	size_designation(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_perpetrator(Entity_A, Entity_B) :-
	perpetrator(Entity_A, Entity_C),
	perpetrator(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_victim(Entity_A, Entity_B) :-
	victim(Entity_A, Entity_C),
	victim(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_organized_response_related_to_outbreak(Entity_A, Entity_B) :-
	organized_response_related_to_outbreak(Entity_A, Entity_C),
	organized_response_related_to_outbreak(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_country_of_registry(Entity_A, Entity_B) :-
	country_of_registry(Entity_A, Entity_C),
	country_of_registry(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_hospitalized_cases(Entity_A, Entity_B) :-
	number_of_hospitalized_cases(Entity_A, Entity_C),
	number_of_hospitalized_cases(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_symbol_of(Entity_A, Entity_B) :-
	symbol_of(Entity_A, Entity_C),
	symbol_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_donations(Entity_A, Entity_B) :-
	donations(Entity_A, Entity_C),
	donations(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_network_bands(Entity_A, Entity_B) :-
	network_bands(Entity_A, Entity_C),
	network_bands(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_bus(Entity_A, Entity_B) :-
	bus(Entity_A, Entity_C),
	bus(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_recommended_unit_of_measurement(Entity_A, Entity_B) :-
	recommended_unit_of_measurement(Entity_A, Entity_C),
	recommended_unit_of_measurement(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_eligible_recipient(Entity_A, Entity_B) :-
	eligible_recipient(Entity_A, Entity_C),
	eligible_recipient(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_tournament_format(Entity_A, Entity_B) :-
	tournament_format(Entity_A, Entity_C),
	tournament_format(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_dialect_of_computer_language(Entity_A, Entity_B) :-
	dialect_of_computer_language(Entity_A, Entity_C),
	dialect_of_computer_language(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_located_in_statistical_territorial_entity(Entity_A, Entity_B) :-
	located_in_statistical_territorial_entity(Entity_A, Entity_C),
	located_in_statistical_territorial_entity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_hardiness_of_plant(Entity_A, Entity_B) :-
	hardiness_of_plant(Entity_A, Entity_C),
	hardiness_of_plant(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_hardiness_zone(Entity_A, Entity_B) :-
	hardiness_zone(Entity_A, Entity_C),
	hardiness_zone(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_voting_system(Entity_A, Entity_B) :-
	voting_system(Entity_A, Entity_C),
	voting_system(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_supported_metadata(Entity_A, Entity_B) :-
	supported_metadata(Entity_A, Entity_C),
	supported_metadata(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_tilt(Entity_A, Entity_B) :-
	tilt(Entity_A, Entity_C),
	tilt(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_is_metaclass_for(Entity_A, Entity_B) :-
	is_metaclass_for(Entity_A, Entity_C),
	is_metaclass_for(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_lighting(Entity_A, Entity_B) :-
	lighting(Entity_A, Entity_C),
	lighting(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_type_of_age_limit(Entity_A, Entity_B) :-
	type_of_age_limit(Entity_A, Entity_C),
	type_of_age_limit(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_nominal_share_capital(Entity_A, Entity_B) :-
	nominal_share_capital(Entity_A, Entity_C),
	nominal_share_capital(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_field_of_training(Entity_A, Entity_B) :-
	field_of_training(Entity_A, Entity_C),
	field_of_training(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_curriculum_topics(Entity_A, Entity_B) :-
	curriculum_topics(Entity_A, Entity_C),
	curriculum_topics(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_living_people_protection_class(Entity_A, Entity_B) :-
	living_people_protection_class(Entity_A, Entity_C),
	living_people_protection_class(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_position_in_biological_sequence(Entity_A, Entity_B) :-
	position_in_biological_sequence(Entity_A, Entity_C),
	position_in_biological_sequence(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_parish_church(Entity_A, Entity_B) :-
	parish_church(Entity_A, Entity_C),
	parish_church(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_grouping(Entity_A, Entity_B) :-
	has_grouping(Entity_A, Entity_C),
	has_grouping(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_sorting(Entity_A, Entity_B) :-
	has_sorting(Entity_A, Entity_C),
	has_sorting(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_column(Entity_A, Entity_B) :-
	has_column(Entity_A, Entity_C),
	has_column(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_funder(Entity_A, Entity_B) :-
	funder(Entity_A, Entity_C),
	funder(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_intended_subject_of_deprecated_statement(Entity_A, Entity_B) :-
	intended_subject_of_deprecated_statement(Entity_A, Entity_C),
	intended_subject_of_deprecated_statement(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_democracy_index(Entity_A, Entity_B) :-
	democracy_index(Entity_A, Entity_C),
	democracy_index(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_principal_investigator(Entity_A, Entity_B) :-
	principal_investigator(Entity_A, Entity_C),
	principal_investigator(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_file_page_offset(Entity_A, Entity_B) :-
	file_page_offset(Entity_A, Entity_C),
	file_page_offset(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_strike_tone(Entity_A, Entity_B) :-
	strike_tone(Entity_A, Entity_C),
	strike_tone(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_entry_receptor(Entity_A, Entity_B) :-
	entry_receptor(Entity_A, Entity_C),
	entry_receptor(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_estimated_value(Entity_A, Entity_B) :-
	estimated_value(Entity_A, Entity_C),
	estimated_value(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_media_franchise(Entity_A, Entity_B) :-
	media_franchise(Entity_A, Entity_C),
	media_franchise(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_study_type(Entity_A, Entity_B) :-
	study_type(Entity_A, Entity_C),
	study_type(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_branches(Entity_A, Entity_B) :-
	number_of_branches(Entity_A, Entity_C),
	number_of_branches(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_references_work_tradition_or_theory(Entity_A, Entity_B) :-
	references_work_tradition_or_theory(Entity_A, Entity_C),
	references_work_tradition_or_theory(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_use_with_property_value(Entity_A, Entity_B) :-
	use_with_property_value(Entity_A, Entity_C),
	use_with_property_value(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_prompt_when_missing(Entity_A, Entity_B) :-
	prompt_when_missing(Entity_A, Entity_C),
	prompt_when_missing(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_offset_from_vertical(Entity_A, Entity_B) :-
	offset_from_vertical(Entity_A, Entity_C),
	offset_from_vertical(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_open_data_portal(Entity_A, Entity_B) :-
	open_data_portal(Entity_A, Entity_C),
	open_data_portal(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_theorised_by(Entity_A, Entity_B) :-
	theorised_by(Entity_A, Entity_C),
	theorised_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_set_in_environment(Entity_A, Entity_B) :-
	set_in_environment(Entity_A, Entity_C),
	set_in_environment(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_academic_appointment(Entity_A, Entity_B) :-
	academic_appointment(Entity_A, Entity_C),
	academic_appointment(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_version_control_system(Entity_A, Entity_B) :-
	version_control_system(Entity_A, Entity_C),
	version_control_system(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_interactive_elements(Entity_A, Entity_B) :-
	interactive_elements(Entity_A, Entity_C),
	interactive_elements(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_course(Entity_A, Entity_B) :-
	course(Entity_A, Entity_C),
	course(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_peak_bagging_classification(Entity_A, Entity_B) :-
	peak_bagging_classification(Entity_A, Entity_C),
	peak_bagging_classification(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_public_transport_stop(Entity_A, Entity_B) :-
	public_transport_stop(Entity_A, Entity_C),
	public_transport_stop(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_descriptive_solubility(Entity_A, Entity_B) :-
	descriptive_solubility(Entity_A, Entity_C),
	descriptive_solubility(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_energy_consumption_per_transaction(Entity_A, Entity_B) :-
	energy_consumption_per_transaction(Entity_A, Entity_C),
	energy_consumption_per_transaction(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_content_partnership_category(Entity_A, Entity_B) :-
	content_partnership_category(Entity_A, Entity_C),
	content_partnership_category(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_van_der_waals_constant_a(Entity_A, Entity_B) :-
	van_der_waals_constant_a(Entity_A, Entity_C),
	van_der_waals_constant_a(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_van_der_waals_constant_b(Entity_A, Entity_B) :-
	van_der_waals_constant_b(Entity_A, Entity_C),
	van_der_waals_constant_b(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_bti_governance_index(Entity_A, Entity_B) :-
	bti_governance_index(Entity_A, Entity_C),
	bti_governance_index(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_bti_status_index(Entity_A, Entity_B) :-
	bti_status_index(Entity_A, Entity_C),
	bti_status_index(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_ofsted_inspection_rating(Entity_A, Entity_B) :-
	ofsted_inspection_rating(Entity_A, Entity_C),
	ofsted_inspection_rating(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_height_of_center_of_mass(Entity_A, Entity_B) :-
	height_of_center_of_mass(Entity_A, Entity_C),
	height_of_center_of_mass(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_vietnamese_middle_name(Entity_A, Entity_B) :-
	vietnamese_middle_name(Entity_A, Entity_C),
	vietnamese_middle_name(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_heraldic_attitude(Entity_A, Entity_B) :-
	heraldic_attitude(Entity_A, Entity_C),
	heraldic_attitude(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_tala(Entity_A, Entity_B) :-
	tala(Entity_A, Entity_C),
	tala(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_raga(Entity_A, Entity_B) :-
	raga(Entity_A, Entity_C),
	raga(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_recording_location(Entity_A, Entity_B) :-
	recording_location(Entity_A, Entity_C),
	recording_location(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_front_and_back_matter(Entity_A, Entity_B) :-
	front_and_back_matter(Entity_A, Entity_C),
	front_and_back_matter(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_external_auditor(Entity_A, Entity_B) :-
	external_auditor(Entity_A, Entity_C),
	external_auditor(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_ride_height(Entity_A, Entity_B) :-
	ride_height(Entity_A, Entity_C),
	ride_height(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_category_for_the_exterior_of_the_item(Entity_A, Entity_B) :-
	category_for_the_exterior_of_the_item(Entity_A, Entity_C),
	category_for_the_exterior_of_the_item(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_axle_track(Entity_A, Entity_B) :-
	axle_track(Entity_A, Entity_C),
	axle_track(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_oakeshott_typology(Entity_A, Entity_B) :-
	oakeshott_typology(Entity_A, Entity_C),
	oakeshott_typology(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_construction_point(Entity_A, Entity_B) :-
	construction_point(Entity_A, Entity_C),
	construction_point(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_turning_radius(Entity_A, Entity_B) :-
	turning_radius(Entity_A, Entity_C),
	turning_radius(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_hill_size(Entity_A, Entity_B) :-
	hill_size(Entity_A, Entity_C),
	hill_size(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_bibliography(Entity_A, Entity_B) :-
	bibliography(Entity_A, Entity_C),
	bibliography(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_opening_time(Entity_A, Entity_B) :-
	opening_time(Entity_A, Entity_C),
	opening_time(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_closing_time(Entity_A, Entity_B) :-
	closing_time(Entity_A, Entity_C),
	closing_time(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_engine_displacement(Entity_A, Entity_B) :-
	engine_displacement(Entity_A, Entity_C),
	engine_displacement(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_expansion_of(Entity_A, Entity_B) :-
	expansion_of(Entity_A, Entity_C),
	expansion_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_netflix_maturity_rating(Entity_A, Entity_B) :-
	netflix_maturity_rating(Entity_A, Entity_C),
	netflix_maturity_rating(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_character_designer(Entity_A, Entity_B) :-
	character_designer(Entity_A, Entity_C),
	character_designer(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_negative_votes(Entity_A, Entity_B) :-
	number_of_negative_votes(Entity_A, Entity_C),
	number_of_negative_votes(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_support_votes(Entity_A, Entity_B) :-
	number_of_support_votes(Entity_A, Entity_C),
	number_of_support_votes(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_x_offset(Entity_A, Entity_B) :-
	x_offset(Entity_A, Entity_C),
	x_offset(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_y_offset(Entity_A, Entity_B) :-
	y_offset(Entity_A, Entity_C),
	y_offset(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_social_media_followers(Entity_A, Entity_B) :-
	social_media_followers(Entity_A, Entity_C),
	social_media_followers(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_fandom(Entity_A, Entity_B) :-
	fandom(Entity_A, Entity_C),
	fandom(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_census(Entity_A, Entity_B) :-
	has_census(Entity_A, Entity_C),
	has_census(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_parallel_street(Entity_A, Entity_B) :-
	parallel_street(Entity_A, Entity_C),
	parallel_street(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_ritual_object(Entity_A, Entity_B) :-
	ritual_object(Entity_A, Entity_C),
	ritual_object(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_rooms(Entity_A, Entity_B) :-
	number_of_rooms(Entity_A, Entity_C),
	number_of_rooms(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_permits(Entity_A, Entity_B) :-
	permits(Entity_A, Entity_C),
	permits(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_prohibits(Entity_A, Entity_B) :-
	prohibits(Entity_A, Entity_C),
	prohibits(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_economy_of_topic(Entity_A, Entity_B) :-
	economy_of_topic(Entity_A, Entity_C),
	economy_of_topic(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_check_in_time(Entity_A, Entity_B) :-
	check_in_time(Entity_A, Entity_C),
	check_in_time(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_check_out_time(Entity_A, Entity_B) :-
	check_out_time(Entity_A, Entity_C),
	check_out_time(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_die_axis(Entity_A, Entity_B) :-
	die_axis(Entity_A, Entity_C),
	die_axis(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_annual_average_daily_traffic(Entity_A, Entity_B) :-
	annual_average_daily_traffic(Entity_A, Entity_C),
	annual_average_daily_traffic(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_maximum_current(Entity_A, Entity_B) :-
	maximum_current(Entity_A, Entity_C),
	maximum_current(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_birth_rate(Entity_A, Entity_B) :-
	birth_rate(Entity_A, Entity_C),
	birth_rate(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_port_calls(Entity_A, Entity_B) :-
	port_calls(Entity_A, Entity_C),
	port_calls(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_dedicated_heritage_entity(Entity_A, Entity_B) :-
	dedicated_heritage_entity(Entity_A, Entity_C),
	dedicated_heritage_entity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_defining_mutations(Entity_A, Entity_B) :-
	defining_mutations(Entity_A, Entity_C),
	defining_mutations(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_digitised_by(Entity_A, Entity_B) :-
	digitised_by(Entity_A, Entity_C),
	digitised_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_for_color_scheme(Entity_A, Entity_B) :-
	for_color_scheme(Entity_A, Entity_C),
	for_color_scheme(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_parent(Entity_A, Entity_B) :-
	parent(Entity_A, Entity_C),
	parent(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_epithet(Entity_A, Entity_B) :-
	epithet(Entity_A, Entity_C),
	epithet(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_attraction_to(Entity_A, Entity_B) :-
	attraction_to(Entity_A, Entity_C),
	attraction_to(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_hairstyle_hairlength(Entity_A, Entity_B) :-
	hairstyle_hairlength(Entity_A, Entity_C),
	hairstyle_hairlength(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_poverty_incidence(Entity_A, Entity_B) :-
	poverty_incidence(Entity_A, Entity_C),
	poverty_incidence(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_facial_hair(Entity_A, Entity_B) :-
	facial_hair(Entity_A, Entity_C),
	facial_hair(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_identity_element(Entity_A, Entity_B) :-
	identity_element(Entity_A, Entity_C),
	identity_element(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_mathematical_inverse(Entity_A, Entity_B) :-
	mathematical_inverse(Entity_A, Entity_C),
	mathematical_inverse(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_operator(Entity_A, Entity_B) :-
	has_operator(Entity_A, Entity_C),
	has_operator(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_marker(Entity_A, Entity_B) :-
	has_marker(Entity_A, Entity_C),
	has_marker(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_hong_kong_film_rating(Entity_A, Entity_B) :-
	hong_kong_film_rating(Entity_A, Entity_C),
	hong_kong_film_rating(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_indexed_in_bibliographic_review(Entity_A, Entity_B) :-
	indexed_in_bibliographic_review(Entity_A, Entity_C),
	indexed_in_bibliographic_review(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_taxpayers(Entity_A, Entity_B) :-
	number_of_taxpayers(Entity_A, Entity_C),
	number_of_taxpayers(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_points_goals_attempted(Entity_A, Entity_B) :-
	number_of_points_goals_attempted(Entity_A, Entity_C),
	number_of_points_goals_attempted(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_water_area(Entity_A, Entity_B) :-
	water_area(Entity_A, Entity_C),
	water_area(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_mtrcb_rating(Entity_A, Entity_B) :-
	mtrcb_rating(Entity_A, Entity_C),
	mtrcb_rating(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_power_consumption_index(Entity_A, Entity_B) :-
	power_consumption_index(Entity_A, Entity_C),
	power_consumption_index(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_heating_energy_consumption_index(Entity_A, Entity_B) :-
	heating_energy_consumption_index(Entity_A, Entity_C),
	heating_energy_consumption_index(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_elspa_rating(Entity_A, Entity_B) :-
	elspa_rating(Entity_A, Entity_C),
	elspa_rating(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_kunya(Entity_A, Entity_B) :-
	kunya(Entity_A, Entity_C),
	kunya(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_category_for_the_view_from_the_item(Entity_A, Entity_B) :-
	category_for_the_view_from_the_item(Entity_A, Entity_C),
	category_for_the_view_from_the_item(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_artistic_director(Entity_A, Entity_B) :-
	artistic_director(Entity_A, Entity_C),
	artistic_director(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_compatible_with(Entity_A, Entity_B) :-
	compatible_with(Entity_A, Entity_C),
	compatible_with(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_graph_girth(Entity_A, Entity_B) :-
	graph_girth(Entity_A, Entity_C),
	graph_girth(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_category_for_the_view_of_the_item(Entity_A, Entity_B) :-
	category_for_the_view_of_the_item(Entity_A, Entity_C),
	category_for_the_view_of_the_item(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_liturgical_rank(Entity_A, Entity_B) :-
	liturgical_rank(Entity_A, Entity_C),
	liturgical_rank(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_ccc_classification(Entity_A, Entity_B) :-
	ccc_classification(Entity_A, Entity_C),
	ccc_classification(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_solution_to(Entity_A, Entity_B) :-
	solution_to(Entity_A, Entity_C),
	solution_to(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_archaeological_site_of(Entity_A, Entity_B) :-
	archaeological_site_of(Entity_A, Entity_C),
	archaeological_site_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_subdivision_of_this_unit(Entity_A, Entity_B) :-
	subdivision_of_this_unit(Entity_A, Entity_C),
	subdivision_of_this_unit(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_character_type(Entity_A, Entity_B) :-
	character_type(Entity_A, Entity_C),
	character_type(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_derived_from_organism_type(Entity_A, Entity_B) :-
	derived_from_organism_type(Entity_A, Entity_C),
	derived_from_organism_type(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_applicable_stated_in_value(Entity_A, Entity_B) :-
	applicable_stated_in_value(Entity_A, Entity_C),
	applicable_stated_in_value(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_aid_beneficiaries(Entity_A, Entity_B) :-
	number_of_aid_beneficiaries(Entity_A, Entity_C),
	number_of_aid_beneficiaries(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_bamid_film_rating(Entity_A, Entity_B) :-
	bamid_film_rating(Entity_A, Entity_C),
	bamid_film_rating(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_vaccinations(Entity_A, Entity_B) :-
	number_of_vaccinations(Entity_A, Entity_C),
	number_of_vaccinations(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_commons_media_contributed_by(Entity_A, Entity_B) :-
	commons_media_contributed_by(Entity_A, Entity_C),
	commons_media_contributed_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_first_family_name_in_portuguese_name(Entity_A, Entity_B) :-
	first_family_name_in_portuguese_name(Entity_A, Entity_C),
	first_family_name_in_portuguese_name(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_time_played(Entity_A, Entity_B) :-
	time_played(Entity_A, Entity_C),
	time_played(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_thesis_committee_member(Entity_A, Entity_B) :-
	thesis_committee_member(Entity_A, Entity_C),
	thesis_committee_member(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_at_bats(Entity_A, Entity_B) :-
	number_of_at_bats(Entity_A, Entity_C),
	number_of_at_bats(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_hits(Entity_A, Entity_B) :-
	number_of_hits(Entity_A, Entity_C),
	number_of_hits(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_bases_on_balls(Entity_A, Entity_B) :-
	bases_on_balls(Entity_A, Entity_C),
	bases_on_balls(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_runs_batted_in(Entity_A, Entity_B) :-
	runs_batted_in(Entity_A, Entity_C),
	runs_batted_in(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_letterer(Entity_A, Entity_B) :-
	letterer(Entity_A, Entity_C),
	letterer(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_sensors(Entity_A, Entity_B) :-
	sensors(Entity_A, Entity_C),
	sensors(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_set_during_recurring_event(Entity_A, Entity_B) :-
	set_during_recurring_event(Entity_A, Entity_C),
	set_during_recurring_event(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_stolen_bases(Entity_A, Entity_B) :-
	stolen_bases(Entity_A, Entity_C),
	stolen_bases(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_doubles_hit(Entity_A, Entity_B) :-
	doubles_hit(Entity_A, Entity_C),
	doubles_hit(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_triples_hit(Entity_A, Entity_B) :-
	triples_hit(Entity_A, Entity_C),
	triples_hit(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_supplement_to(Entity_A, Entity_B) :-
	supplement_to(Entity_A, Entity_C),
	supplement_to(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_seismic_classification(Entity_A, Entity_B) :-
	seismic_classification(Entity_A, Entity_C),
	seismic_classification(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_reissue_of(Entity_A, Entity_B) :-
	reissue_of(Entity_A, Entity_C),
	reissue_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_staking_percentage(Entity_A, Entity_B) :-
	staking_percentage(Entity_A, Entity_C),
	staking_percentage(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_affiliated_worker_organisation(Entity_A, Entity_B) :-
	affiliated_worker_organisation(Entity_A, Entity_C),
	affiliated_worker_organisation(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_demographics_of_topic(Entity_A, Entity_B) :-
	demographics_of_topic(Entity_A, Entity_C),
	demographics_of_topic(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_assessment_outcome(Entity_A, Entity_B) :-
	assessment_outcome(Entity_A, Entity_C),
	assessment_outcome(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_music_transcriber(Entity_A, Entity_B) :-
	music_transcriber(Entity_A, Entity_C),
	music_transcriber(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_subsidy(Entity_A, Entity_B) :-
	subsidy(Entity_A, Entity_C),
	subsidy(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_inverse_agonist_of(Entity_A, Entity_B) :-
	inverse_agonist_of(Entity_A, Entity_C),
	inverse_agonist_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_egapro_gender_equality_index(Entity_A, Entity_B) :-
	egapro_gender_equality_index(Entity_A, Entity_C),
	egapro_gender_equality_index(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_transitivity(Entity_A, Entity_B) :-
	transitivity(Entity_A, Entity_C),
	transitivity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_script_style(Entity_A, Entity_B) :-
	script_style(Entity_A, Entity_C),
	script_style(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_gedong_kirtya_classification(Entity_A, Entity_B) :-
	gedong_kirtya_classification(Entity_A, Entity_C),
	gedong_kirtya_classification(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_graphical_element(Entity_A, Entity_B) :-
	has_graphical_element(Entity_A, Entity_C),
	has_graphical_element(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_does_not_have_cause(Entity_A, Entity_B) :-
	does_not_have_cause(Entity_A, Entity_C),
	does_not_have_cause(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_trade_union_membership_rate(Entity_A, Entity_B) :-
	trade_union_membership_rate(Entity_A, Entity_C),
	trade_union_membership_rate(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_personal_library_at(Entity_A, Entity_B) :-
	personal_library_at(Entity_A, Entity_C),
	personal_library_at(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_ph_value(Entity_A, Entity_B) :-
	ph_value(Entity_A, Entity_C),
	ph_value(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_field_of_usage(Entity_A, Entity_B) :-
	field_of_usage(Entity_A, Entity_C),
	field_of_usage(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_artist_files_at(Entity_A, Entity_B) :-
	artist_files_at(Entity_A, Entity_C),
	artist_files_at(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_degrees_day(Entity_A, Entity_B) :-
	degrees_day(Entity_A, Entity_C),
	degrees_day(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_counterpart_position(Entity_A, Entity_B) :-
	counterpart_position(Entity_A, Entity_C),
	counterpart_position(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_earned_run_average(Entity_A, Entity_B) :-
	earned_run_average(Entity_A, Entity_C),
	earned_run_average(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_official_podcast(Entity_A, Entity_B) :-
	official_podcast(Entity_A, Entity_C),
	official_podcast(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_diel_cycle(Entity_A, Entity_B) :-
	diel_cycle(Entity_A, Entity_C),
	diel_cycle(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_intended_background_color(Entity_A, Entity_B) :-
	intended_background_color(Entity_A, Entity_C),
	intended_background_color(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_type_of_lens(Entity_A, Entity_B) :-
	type_of_lens(Entity_A, Entity_C),
	type_of_lens(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_oral_history_at(Entity_A, Entity_B) :-
	oral_history_at(Entity_A, Entity_C),
	oral_history_at(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_district_heating_grid(Entity_A, Entity_B) :-
	district_heating_grid(Entity_A, Entity_C),
	district_heating_grid(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_personality_trait_of_fictional_character(Entity_A, Entity_B) :-
	personality_trait_of_fictional_character(Entity_A, Entity_C),
	personality_trait_of_fictional_character(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_not_found_in(Entity_A, Entity_B) :-
	not_found_in(Entity_A, Entity_C),
	not_found_in(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_named_place_on_map(Entity_A, Entity_B) :-
	named_place_on_map(Entity_A, Entity_C),
	named_place_on_map(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_consequence_of_text(Entity_A, Entity_B) :-
	consequence_of_text(Entity_A, Entity_C),
	consequence_of_text(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_voted_on_by(Entity_A, Entity_B) :-
	voted_on_by(Entity_A, Entity_C),
	voted_on_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_qualis_rank(Entity_A, Entity_B) :-
	qualis_rank(Entity_A, Entity_C),
	qualis_rank(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_delta_of(Entity_A, Entity_B) :-
	delta_of(Entity_A, Entity_C),
	delta_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_taxon_range(Entity_A, Entity_B) :-
	taxon_range(Entity_A, Entity_C),
	taxon_range(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_replacement_value(Entity_A, Entity_B) :-
	replacement_value(Entity_A, Entity_C),
	replacement_value(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_announced_at(Entity_A, Entity_B) :-
	announced_at(Entity_A, Entity_C),
	announced_at(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_request_signatories(Entity_A, Entity_B) :-
	number_of_request_signatories(Entity_A, Entity_C),
	number_of_request_signatories(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_translation_of(Entity_A, Entity_B) :-
	translation_of(Entity_A, Entity_C),
	translation_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_symbol_represents(Entity_A, Entity_B) :-
	symbol_represents(Entity_A, Entity_C),
	symbol_represents(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_syntactic_dependency_head_relationship(Entity_A, Entity_B) :-
	syntactic_dependency_head_relationship(Entity_A, Entity_C),
	syntactic_dependency_head_relationship(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_setlist(Entity_A, Entity_B) :-
	setlist(Entity_A, Entity_C),
	setlist(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_classification_of_the_functions_of_government(Entity_A, Entity_B) :-
	classification_of_the_functions_of_government(Entity_A, Entity_C),
	classification_of_the_functions_of_government(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_uefa_stadium_category(Entity_A, Entity_B) :-
	uefa_stadium_category(Entity_A, Entity_C),
	uefa_stadium_category(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_remix_of(Entity_A, Entity_B) :-
	remix_of(Entity_A, Entity_C),
	remix_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_container(Entity_A, Entity_B) :-
	container(Entity_A, Entity_C),
	container(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_release_of(Entity_A, Entity_B) :-
	release_of(Entity_A, Entity_C),
	release_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_grac_rating(Entity_A, Entity_B) :-
	grac_rating(Entity_A, Entity_C),
	grac_rating(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_created_for(Entity_A, Entity_B) :-
	created_for(Entity_A, Entity_C),
	created_for(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_candomblé_nation(Entity_A, Entity_B) :-
	candomblé_nation(Entity_A, Entity_C),
	candomblé_nation(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_nztcs_conservation_status(Entity_A, Entity_B) :-
	nztcs_conservation_status(Entity_A, Entity_C),
	nztcs_conservation_status(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_mexican_video_game_rating_category(Entity_A, Entity_B) :-
	mexican_video_game_rating_category(Entity_A, Entity_C),
	mexican_video_game_rating_category(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_app_store_age_rating(Entity_A, Entity_B) :-
	app_store_age_rating(Entity_A, Entity_C),
	app_store_age_rating(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_music_created_for(Entity_A, Entity_B) :-
	music_created_for(Entity_A, Entity_C),
	music_created_for(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_issuing_agent_of_work(Entity_A, Entity_B) :-
	issuing_agent_of_work(Entity_A, Entity_C),
	issuing_agent_of_work(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_evacuated(Entity_A, Entity_B) :-
	number_of_evacuated(Entity_A, Entity_C),
	number_of_evacuated(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_template_populates_category(Entity_A, Entity_B) :-
	template_populates_category(Entity_A, Entity_C),
	template_populates_category(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_tries_marked(Entity_A, Entity_B) :-
	number_of_tries_marked(Entity_A, Entity_C),
	number_of_tries_marked(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_madhhab(Entity_A, Entity_B) :-
	madhhab(Entity_A, Entity_C),
	madhhab(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_dissertation_program(Entity_A, Entity_B) :-
	dissertation_program(Entity_A, Entity_C),
	dissertation_program(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_critical_catalogue(Entity_A, Entity_B) :-
	critical_catalogue(Entity_A, Entity_C),
	critical_catalogue(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_predicate_for(Entity_A, Entity_B) :-
	predicate_for(Entity_A, Entity_C),
	predicate_for(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_thematic_relation(Entity_A, Entity_B) :-
	has_thematic_relation(Entity_A, Entity_C),
	has_thematic_relation(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_illustrative_content(Entity_A, Entity_B) :-
	illustrative_content(Entity_A, Entity_C),
	illustrative_content(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_isotopically_modified_form_of(Entity_A, Entity_B) :-
	isotopically_modified_form_of(Entity_A, Entity_C),
	isotopically_modified_form_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_excitation_energy(Entity_A, Entity_B) :-
	excitation_energy(Entity_A, Entity_C),
	excitation_energy(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_term_in_higher_taxon(Entity_A, Entity_B) :-
	term_in_higher_taxon(Entity_A, Entity_C),
	term_in_higher_taxon(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_train_melody(Entity_A, Entity_B) :-
	train_melody(Entity_A, Entity_C),
	train_melody(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_death_rate(Entity_A, Entity_B) :-
	death_rate(Entity_A, Entity_C),
	death_rate(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_specific_impulse_by_weight(Entity_A, Entity_B) :-
	specific_impulse_by_weight(Entity_A, Entity_C),
	specific_impulse_by_weight(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_protective_marking(Entity_A, Entity_B) :-
	protective_marking(Entity_A, Entity_C),
	protective_marking(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_itunes_genre(Entity_A, Entity_B) :-
	itunes_genre(Entity_A, Entity_C),
	itunes_genre(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_type_host(Entity_A, Entity_B) :-
	type_host(Entity_A, Entity_C),
	type_host(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_triples(Entity_A, Entity_B) :-
	number_of_triples(Entity_A, Entity_C),
	number_of_triples(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_facilitates_flow_of(Entity_A, Entity_B) :-
	facilitates_flow_of(Entity_A, Entity_C),
	facilitates_flow_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_next_level_in_hierarchy(Entity_A, Entity_B) :-
	next_level_in_hierarchy(Entity_A, Entity_C),
	next_level_in_hierarchy(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_individual_of_taxon(Entity_A, Entity_B) :-
	individual_of_taxon(Entity_A, Entity_C),
	individual_of_taxon(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_associated_cadastral_district(Entity_A, Entity_B) :-
	associated_cadastral_district(Entity_A, Entity_C),
	associated_cadastral_district(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_admission_yield_rate(Entity_A, Entity_B) :-
	admission_yield_rate(Entity_A, Entity_C),
	admission_yield_rate(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_corruption_perceptions_index(Entity_A, Entity_B) :-
	corruption_perceptions_index(Entity_A, Entity_C),
	corruption_perceptions_index(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_category_for_honorary_citizens_of_entity(Entity_A, Entity_B) :-
	category_for_honorary_citizens_of_entity(Entity_A, Entity_C),
	category_for_honorary_citizens_of_entity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_hotel_rating(Entity_A, Entity_B) :-
	hotel_rating(Entity_A, Entity_C),
	hotel_rating(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_dpi_for_original_size(Entity_A, Entity_B) :-
	dpi_for_original_size(Entity_A, Entity_C),
	dpi_for_original_size(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_director_of_publication(Entity_A, Entity_B) :-
	director_of_publication(Entity_A, Entity_C),
	director_of_publication(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_dpi_for_a4_printing(Entity_A, Entity_B) :-
	dpi_for_a4_printing(Entity_A, Entity_C),
	dpi_for_a4_printing(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_time_in_the_pouch(Entity_A, Entity_B) :-
	time_in_the_pouch(Entity_A, Entity_C),
	time_in_the_pouch(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_semantic_gender(Entity_A, Entity_B) :-
	semantic_gender(Entity_A, Entity_C),
	semantic_gender(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_lanes(Entity_A, Entity_B) :-
	number_of_lanes(Entity_A, Entity_C),
	number_of_lanes(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_computational_complexity(Entity_A, Entity_B) :-
	computational_complexity(Entity_A, Entity_C),
	computational_complexity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_created_during(Entity_A, Entity_B) :-
	created_during(Entity_A, Entity_C),
	created_during(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_trained_by(Entity_A, Entity_B) :-
	trained_by(Entity_A, Entity_C),
	trained_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_identifies(Entity_A, Entity_B) :-
	identifies(Entity_A, Entity_C),
	identifies(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_documentation_files_at(Entity_A, Entity_B) :-
	documentation_files_at(Entity_A, Entity_C),
	documentation_files_at(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_maintains_linking_to(Entity_A, Entity_B) :-
	maintains_linking_to(Entity_A, Entity_C),
	maintains_linking_to(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_academic_calendar_type(Entity_A, Entity_B) :-
	academic_calendar_type(Entity_A, Entity_C),
	academic_calendar_type(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_taxonomic_treatment(Entity_A, Entity_B) :-
	taxonomic_treatment(Entity_A, Entity_C),
	taxonomic_treatment(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_co_applicant(Entity_A, Entity_B) :-
	co_applicant(Entity_A, Entity_C),
	co_applicant(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_applicant(Entity_A, Entity_B) :-
	applicant(Entity_A, Entity_C),
	applicant(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_type_of_a_register_in_germany(Entity_A, Entity_B) :-
	type_of_a_register_in_germany(Entity_A, Entity_C),
	type_of_a_register_in_germany(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_notable_role(Entity_A, Entity_B) :-
	notable_role(Entity_A, Entity_C),
	notable_role(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_athletics_program(Entity_A, Entity_B) :-
	athletics_program(Entity_A, Entity_C),
	athletics_program(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_teachers(Entity_A, Entity_B) :-
	number_of_teachers(Entity_A, Entity_C),
	number_of_teachers(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_certification(Entity_A, Entity_B) :-
	has_certification(Entity_A, Entity_C),
	has_certification(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_choreography_for(Entity_A, Entity_B) :-
	choreography_for(Entity_A, Entity_C),
	choreography_for(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_surface(Entity_A, Entity_B) :-
	has_surface(Entity_A, Entity_C),
	has_surface(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_per_capita_income(Entity_A, Entity_B) :-
	per_capita_income(Entity_A, Entity_C),
	per_capita_income(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_blood_donors(Entity_A, Entity_B) :-
	number_of_blood_donors(Entity_A, Entity_C),
	number_of_blood_donors(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_official_observer_status_in_organisation(Entity_A, Entity_B) :-
	official_observer_status_in_organisation(Entity_A, Entity_C),
	official_observer_status_in_organisation(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_web_interface_software(Entity_A, Entity_B) :-
	web_interface_software(Entity_A, Entity_C),
	web_interface_software(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_medically_indicated_in_case_of(Entity_A, Entity_B) :-
	medically_indicated_in_case_of(Entity_A, Entity_C),
	medically_indicated_in_case_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_conferences(Entity_A, Entity_B) :-
	number_of_conferences(Entity_A, Entity_C),
	number_of_conferences(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_pole_positions(Entity_A, Entity_B) :-
	pole_positions(Entity_A, Entity_C),
	pole_positions(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_place_of_disappearance(Entity_A, Entity_B) :-
	place_of_disappearance(Entity_A, Entity_C),
	place_of_disappearance(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_reports_to(Entity_A, Entity_B) :-
	reports_to(Entity_A, Entity_C),
	reports_to(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_podium_finishes(Entity_A, Entity_B) :-
	podium_finishes(Entity_A, Entity_C),
	podium_finishes(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_likes(Entity_A, Entity_B) :-
	number_of_likes(Entity_A, Entity_C),
	number_of_likes(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_dislikes(Entity_A, Entity_B) :-
	number_of_dislikes(Entity_A, Entity_C),
	number_of_dislikes(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_comments(Entity_A, Entity_B) :-
	number_of_comments(Entity_A, Entity_C),
	number_of_comments(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_rack_system(Entity_A, Entity_B) :-
	rack_system(Entity_A, Entity_C),
	rack_system(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_medals(Entity_A, Entity_B) :-
	number_of_medals(Entity_A, Entity_C),
	number_of_medals(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_exhibited_creator(Entity_A, Entity_B) :-
	exhibited_creator(Entity_A, Entity_C),
	exhibited_creator(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_applies_to_work(Entity_A, Entity_B) :-
	applies_to_work(Entity_A, Entity_C),
	applies_to_work(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_featured_track_s_(Entity_A, Entity_B) :-
	featured_track_s_(Entity_A, Entity_C),
	featured_track_s_(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_raw_material_processed(Entity_A, Entity_B) :-
	raw_material_processed(Entity_A, Entity_C),
	raw_material_processed(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_references(Entity_A, Entity_B) :-
	number_of_references(Entity_A, Entity_C),
	number_of_references(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_franchisor(Entity_A, Entity_B) :-
	franchisor(Entity_A, Entity_C),
	franchisor(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_government_debt_to_gdp_ratio(Entity_A, Entity_B) :-
	government_debt_to_gdp_ratio(Entity_A, Entity_C),
	government_debt_to_gdp_ratio(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_ionic_radius(Entity_A, Entity_B) :-
	ionic_radius(Entity_A, Entity_C),
	ionic_radius(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_introduced_in(Entity_A, Entity_B) :-
	introduced_in(Entity_A, Entity_C),
	introduced_in(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_class_of_non_item_property_value(Entity_A, Entity_B) :-
	class_of_non_item_property_value(Entity_A, Entity_C),
	class_of_non_item_property_value(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_finisher(Entity_A, Entity_B) :-
	finisher(Entity_A, Entity_C),
	finisher(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_dance_style(Entity_A, Entity_B) :-
	dance_style(Entity_A, Entity_C),
	dance_style(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_declination_component_of_proper_motion(Entity_A, Entity_B) :-
	declination_component_of_proper_motion(Entity_A, Entity_C),
	declination_component_of_proper_motion(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_right_ascension_component_of_proper_motion(Entity_A, Entity_B) :-
	right_ascension_component_of_proper_motion(Entity_A, Entity_C),
	right_ascension_component_of_proper_motion(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_distributed_from(Entity_A, Entity_B) :-
	distributed_from(Entity_A, Entity_C),
	distributed_from(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_reblogs(Entity_A, Entity_B) :-
	number_of_reblogs(Entity_A, Entity_C),
	number_of_reblogs(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_charge_number(Entity_A, Entity_B) :-
	charge_number(Entity_A, Entity_C),
	charge_number(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_similarweb_ranking(Entity_A, Entity_B) :-
	similarweb_ranking(Entity_A, Entity_C),
	similarweb_ranking(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_in_operation_on_service(Entity_A, Entity_B) :-
	in_operation_on_service(Entity_A, Entity_C),
	in_operation_on_service(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_coordination_number(Entity_A, Entity_B) :-
	coordination_number(Entity_A, Entity_C),
	coordination_number(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_orchestrator(Entity_A, Entity_B) :-
	orchestrator(Entity_A, Entity_C),
	orchestrator(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_preceding_halt_on_service(Entity_A, Entity_B) :-
	preceding_halt_on_service(Entity_A, Entity_C),
	preceding_halt_on_service(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_following_halt_on_service(Entity_A, Entity_B) :-
	following_halt_on_service(Entity_A, Entity_C),
	following_halt_on_service(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_number_of_housing_units(Entity_A, Entity_B) :-
	number_of_housing_units(Entity_A, Entity_C),
	number_of_housing_units(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_last_entry(Entity_A, Entity_B) :-
	last_entry(Entity_A, Entity_C),
	last_entry(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_fastest_laps(Entity_A, Entity_B) :-
	fastest_laps(Entity_A, Entity_C),
	fastest_laps(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_inker(Entity_A, Entity_B) :-
	inker(Entity_A, Entity_C),
	inker(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_penciller(Entity_A, Entity_B) :-
	penciller(Entity_A, Entity_C),
	penciller(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_contains_the_statistical_territorial_entity(Entity_A, Entity_B) :-
	contains_the_statistical_territorial_entity(Entity_A, Entity_C),
	contains_the_statistical_territorial_entity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_recordist(Entity_A, Entity_B) :-
	recordist(Entity_A, Entity_C),
	recordist(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_spoken_by(Entity_A, Entity_B) :-
	spoken_by(Entity_A, Entity_C),
	spoken_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_foliage_type(Entity_A, Entity_B) :-
	foliage_type(Entity_A, Entity_C),
	foliage_type(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_counts_instances_of(Entity_A, Entity_B) :-
	counts_instances_of(Entity_A, Entity_C),
	counts_instances_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_contraindicated_in_case_of(Entity_A, Entity_B) :-
	contraindicated_in_case_of(Entity_A, Entity_C),
	contraindicated_in_case_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_harvested_organism_s_(Entity_A, Entity_B) :-
	harvested_organism_s_(Entity_A, Entity_C),
	harvested_organism_s_(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_kfcb_classification_kenya_(Entity_A, Entity_B) :-
	kfcb_classification_kenya_(Entity_A, Entity_C),
	kfcb_classification_kenya_(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_crossing_number(Entity_A, Entity_B) :-
	crossing_number(Entity_A, Entity_C),
	crossing_number(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_grammatical_person(Entity_A, Entity_B) :-
	grammatical_person(Entity_A, Entity_C),
	grammatical_person(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_grammatical_number(Entity_A, Entity_B) :-
	grammatical_number(Entity_A, Entity_C),
	grammatical_number(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_won_sets(Entity_A, Entity_B) :-
	won_sets(Entity_A, Entity_C),
	won_sets(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_annotator(Entity_A, Entity_B) :-
	annotator(Entity_A, Entity_C),
	annotator(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_alphabetical_index(Entity_A, Entity_B) :-
	alphabetical_index(Entity_A, Entity_C),
	alphabetical_index(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_recorded_participant(Entity_A, Entity_B) :-
	recorded_participant(Entity_A, Entity_C),
	recorded_participant(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_collection_items_at(Entity_A, Entity_B) :-
	collection_items_at(Entity_A, Entity_C),
	collection_items_at(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_build_system(Entity_A, Entity_B) :-
	build_system(Entity_A, Entity_C),
	build_system(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_tiratge(Entity_A, Entity_B) :-
	tiratge(Entity_A, Entity_C),
	tiratge(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_fruit_color(Entity_A, Entity_B) :-
	fruit_color(Entity_A, Entity_C),
	fruit_color(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_biological_vector(Entity_A, Entity_B) :-
	has_biological_vector(Entity_A, Entity_C),
	has_biological_vector(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_list_item(Entity_A, Entity_B) :-
	list_item(Entity_A, Entity_C),
	list_item(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_is_a_number_of(Entity_A, Entity_B) :-
	is_a_number_of(Entity_A, Entity_C),
	is_a_number_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_grading_system(Entity_A, Entity_B) :-
	grading_system(Entity_A, Entity_C),
	grading_system(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_camera_lens(Entity_A, Entity_B) :-
	camera_lens(Entity_A, Entity_C),
	camera_lens(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_image_processor(Entity_A, Entity_B) :-
	image_processor(Entity_A, Entity_C),
	image_processor(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_minimum_focusing_distance(Entity_A, Entity_B) :-
	minimum_focusing_distance(Entity_A, Entity_C),
	minimum_focusing_distance(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_sampling_rate(Entity_A, Entity_B) :-
	sampling_rate(Entity_A, Entity_C),
	sampling_rate(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_image_stabilizer(Entity_A, Entity_B) :-
	image_stabilizer(Entity_A, Entity_C),
	image_stabilizer(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_service_options(Entity_A, Entity_B) :-
	service_options(Entity_A, Entity_C),
	service_options(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_travel_advisory_category(Entity_A, Entity_B) :-
	travel_advisory_category(Entity_A, Entity_C),
	travel_advisory_category(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_does_not_use(Entity_A, Entity_B) :-
	does_not_use(Entity_A, Entity_C),
	does_not_use(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_member_of_roman_tribe(Entity_A, Entity_B) :-
	member_of_roman_tribe(Entity_A, Entity_C),
	member_of_roman_tribe(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_happy_planet_index_score(Entity_A, Entity_B) :-
	happy_planet_index_score(Entity_A, Entity_C),
	happy_planet_index_score(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_digital_equivalent_of(Entity_A, Entity_B) :-
	digital_equivalent_of(Entity_A, Entity_C),
	digital_equivalent_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_stamp_perforation(Entity_A, Entity_B) :-
	stamp_perforation(Entity_A, Entity_C),
	stamp_perforation(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_inequality_adjusted_human_development_index(Entity_A, Entity_B) :-
	inequality_adjusted_human_development_index(Entity_A, Entity_C),
	inequality_adjusted_human_development_index(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_transcribed_by(Entity_A, Entity_B) :-
	transcribed_by(Entity_A, Entity_C),
	transcribed_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_norwegian_media_rating(Entity_A, Entity_B) :-
	norwegian_media_rating(Entity_A, Entity_C),
	norwegian_media_rating(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_colocated_with(Entity_A, Entity_B) :-
	colocated_with(Entity_A, Entity_C),
	colocated_with(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_student_retention_rate(Entity_A, Entity_B) :-
	student_retention_rate(Entity_A, Entity_C),
	student_retention_rate(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_handled_mitigated_or_managed_by(Entity_A, Entity_B) :-
	handled_mitigated_or_managed_by(Entity_A, Entity_C),
	handled_mitigated_or_managed_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_holds_diplomatic_passport_of(Entity_A, Entity_B) :-
	holds_diplomatic_passport_of(Entity_A, Entity_C),
	holds_diplomatic_passport_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_iconically_alludes_to(Entity_A, Entity_B) :-
	iconically_alludes_to(Entity_A, Entity_C),
	iconically_alludes_to(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_time_of_periapsis(Entity_A, Entity_B) :-
	time_of_periapsis(Entity_A, Entity_C),
	time_of_periapsis(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_matched_by_identifier_from(Entity_A, Entity_B) :-
	matched_by_identifier_from(Entity_A, Entity_C),
	matched_by_identifier_from(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_alternate_universe_counterpart(Entity_A, Entity_B) :-
	alternate_universe_counterpart(Entity_A, Entity_C),
	alternate_universe_counterpart(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_visited_by(Entity_A, Entity_B) :-
	visited_by(Entity_A, Entity_C),
	visited_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_beforehand_owned_by(Entity_A, Entity_B) :-
	beforehand_owned_by(Entity_A, Entity_C),
	beforehand_owned_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_afterward_owned_by(Entity_A, Entity_B) :-
	afterward_owned_by(Entity_A, Entity_C),
	afterward_owned_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_solubility_product_constant(Entity_A, Entity_B) :-
	solubility_product_constant(Entity_A, Entity_C),
	solubility_product_constant(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_funded_by_grant(Entity_A, Entity_B) :-
	funded_by_grant(Entity_A, Entity_C),
	funded_by_grant(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_quality_is_the_result_of_process(Entity_A, Entity_B) :-
	quality_is_the_result_of_process(Entity_A, Entity_C),
	quality_is_the_result_of_process(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_first_performance_by(Entity_A, Entity_B) :-
	first_performance_by(Entity_A, Entity_C),
	first_performance_by(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_record_of(Entity_A, Entity_B) :-
	record_of(Entity_A, Entity_C),
	record_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_type_of_document_s_held(Entity_A, Entity_B) :-
	type_of_document_s_held(Entity_A, Entity_C),
	type_of_document_s_held(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_autosuggest_value(Entity_A, Entity_B) :-
	autosuggest_value(Entity_A, Entity_C),
	autosuggest_value(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_median_household_income(Entity_A, Entity_B) :-
	median_household_income(Entity_A, Entity_C),
	median_household_income(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_verdict(Entity_A, Entity_B) :-
	verdict(Entity_A, Entity_C),
	verdict(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_appears_before_phonological_feature(Entity_A, Entity_B) :-
	appears_before_phonological_feature(Entity_A, Entity_C),
	appears_before_phonological_feature(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_appears_after_phonological_feature(Entity_A, Entity_B) :-
	appears_after_phonological_feature(Entity_A, Entity_C),
	appears_after_phonological_feature(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_tournament_type(Entity_A, Entity_B) :-
	tournament_type(Entity_A, Entity_C),
	tournament_type(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_heir_or_beneficiary(Entity_A, Entity_B) :-
	has_heir_or_beneficiary(Entity_A, Entity_C),
	has_heir_or_beneficiary(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_towing_capacity(Entity_A, Entity_B) :-
	towing_capacity(Entity_A, Entity_C),
	towing_capacity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_learning_outcome(Entity_A, Entity_B) :-
	learning_outcome(Entity_A, Entity_C),
	learning_outcome(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_tribe(Entity_A, Entity_B) :-
	tribe(Entity_A, Entity_C),
	tribe(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_state_of_transmission(Entity_A, Entity_B) :-
	state_of_transmission(Entity_A, Entity_C),
	state_of_transmission(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_type_of_musical_notation(Entity_A, Entity_B) :-
	type_of_musical_notation(Entity_A, Entity_C),
	type_of_musical_notation(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_demo_of(Entity_A, Entity_B) :-
	demo_of(Entity_A, Entity_C),
	demo_of(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_who_aware_classification(Entity_A, Entity_B) :-
	who_aware_classification(Entity_A, Entity_C),
	who_aware_classification(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_fonds(Entity_A, Entity_B) :-
	fonds(Entity_A, Entity_C),
	fonds(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_parent_form_of_an_active_substance(Entity_A, Entity_B) :-
	parent_form_of_an_active_substance(Entity_A, Entity_C),
	parent_form_of_an_active_substance(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_red_list_of_south_african_plants_conservation_status(Entity_A, Entity_B) :-
	red_list_of_south_african_plants_conservation_status(Entity_A, Entity_C),
	red_list_of_south_african_plants_conservation_status(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_stated_in_source_according_to(Entity_A, Entity_B) :-
	stated_in_source_according_to(Entity_A, Entity_C),
	stated_in_source_according_to(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_torino_scale(Entity_A, Entity_B) :-
	torino_scale(Entity_A, Entity_C),
	torino_scale(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_counterexample(Entity_A, Entity_B) :-
	counterexample(Entity_A, Entity_C),
	counterexample(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_battery_life(Entity_A, Entity_B) :-
	battery_life(Entity_A, Entity_C),
	battery_life(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_underlying_structure_s_(Entity_A, Entity_B) :-
	underlying_structure_s_(Entity_A, Entity_C),
	underlying_structure_s_(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_working_memory_type(Entity_A, Entity_B) :-
	working_memory_type(Entity_A, Entity_C),
	working_memory_type(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_production_manager(Entity_A, Entity_B) :-
	production_manager(Entity_A, Entity_C),
	production_manager(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_simulates(Entity_A, Entity_B) :-
	simulates(Entity_A, Entity_C),
	simulates(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_philippine_middle_name(Entity_A, Entity_B) :-
	philippine_middle_name(Entity_A, Entity_C),
	philippine_middle_name(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_clerked_for(Entity_A, Entity_B) :-
	clerked_for(Entity_A, Entity_C),
	clerked_for(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_environmental_performance_index(Entity_A, Entity_B) :-
	environmental_performance_index(Entity_A, Entity_C),
	environmental_performance_index(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_age_of_onset_of_sexual_maturity(Entity_A, Entity_B) :-
	age_of_onset_of_sexual_maturity(Entity_A, Entity_C),
	age_of_onset_of_sexual_maturity(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_civil_rank(Entity_A, Entity_B) :-
	civil_rank(Entity_A, Entity_C),
	civil_rank(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_has_cabinet(Entity_A, Entity_B) :-
	has_cabinet(Entity_A, Entity_C),
	has_cabinet(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_isced_field(Entity_A, Entity_B) :-
	isced_field(Entity_A, Entity_C),
	isced_field(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_appeals_to(Entity_A, Entity_B) :-
	appeals_to(Entity_A, Entity_C),
	appeals_to(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_phonographic_copyright(Entity_A, Entity_B) :-
	phonographic_copyright(Entity_A, Entity_C),
	phonographic_copyright(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_is_invariant_under(Entity_A, Entity_B) :-
	is_invariant_under(Entity_A, Entity_C),
	is_invariant_under(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_graduation_rate(Entity_A, Entity_B) :-
	graduation_rate(Entity_A, Entity_C),
	graduation_rate(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_normal_graduation_time(Entity_A, Entity_B) :-
	normal_graduation_time(Entity_A, Entity_C),
	normal_graduation_time(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_multiplier_of_normal_graduation_time(Entity_A, Entity_B) :-
	multiplier_of_normal_graduation_time(Entity_A, Entity_C),
	multiplier_of_normal_graduation_time(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_top_scorer(Entity_A, Entity_B) :-
	top_scorer(Entity_A, Entity_C),
	top_scorer(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_filial_church(Entity_A, Entity_B) :-
	filial_church(Entity_A, Entity_C),
	filial_church(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_television_judge(Entity_A, Entity_B) :-
	television_judge(Entity_A, Entity_C),
	television_judge(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_thesaurus_s_main_topic(Entity_A, Entity_B) :-
	thesaurus_s_main_topic(Entity_A, Entity_C),
	thesaurus_s_main_topic(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_thesaurus_combines_topics(Entity_A, Entity_B) :-
	thesaurus_combines_topics(Entity_A, Entity_C),
	thesaurus_combines_topics(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_topic_s_main_thesaurus(Entity_A, Entity_B) :-
	topic_s_main_thesaurus(Entity_A, Entity_C),
	topic_s_main_thesaurus(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_rug_style(Entity_A, Entity_B) :-
	rug_style(Entity_A, Entity_C),
	rug_style(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

same_performing_organization(Entity_A, Entity_B) :-
	performing_organization(Entity_A, Entity_C),
	performing_organization(Entity_B, Entity_D),
	Entity_A \= Entity_B,
	Entity_C == Entity_D.

