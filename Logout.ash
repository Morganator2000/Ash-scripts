#Things I want to do when logging out

#Overdrink maybe
#pick from garden if "ripe"

void main () {
	use(1, $item[circle drum]);
	use(1, $item[fishy pipe]);
	use(1, $item[red and green rain stick]);
	use(1, $item[portable steam unit]);
	use_skill(1, $skill[Summon Carrot]);
	use_skill(3, $skill[Feel Disappointed]);
	use_skill(3, $skill[Feel Excitement]);
	use_skill(3, $skill[Feel Lonely]);
	use_skill(3, $skill[Feel Nervous]);
	use_skill(3, $skill[Feel Peaceful]);
	cli_execute("try; numberology 69");

	visit_url("place.php?whichplace=monorail&action=monorail_lyle");
	cli_execute("try; telescope high"); 
	if(friars_available() && get_property("friarsBlessingReceived")!="true"){
		cli_execute("friars familiar");
   	}
	cli_execute("swim sprints");
	cli_execute("ballpit");
	cli_execute("maximize pool skill");
	cli_execute("pool 3");
	cli_execute("pool 3");
	cli_execute("pool 3");
	cli_execute("try; teatree royaltea"); 
	cli_execute("try; hatter All-Hallow's Steve's fright wig"); 
	cli_execute("try; fortune buff item"); 
	cli_execute("try; concert d");
	cli_execute("try; concert w");

	#go underwater
	print("Going underwater", "blue");
	equip($item[old SCUBA tank]);
	equip($item[das boot]);
	cli_execute("try; mom stats");
	cli_execute("try; skate band shell");
	cli_execute("try; skate merry-go-round");
	cli_execute("try; skate eels");

	print("Now summoning dice... repeatedly", "blue");

	int rests_used=get_property("timesRested").to_int();
	int rests_left=total_free_rests()-rests_used;
	int visits_left = 3 - get_property("nunsVisits").to_int();
	boolean shower = to_boolean(get_property("_aprilShower"));
	#summon dice, while also using mp restores
	while(my_mp() >= mp_cost($skill[Summon Dice]) || rests_left > 0 || visits_left > 0 || !shower) {
		while(my_mp() >= mp_cost($skill[Summon Dice])) {
			use_skill(1, $skill[Summon Dice]);
		}
		while(my_mp() < mp_cost($skill[Summon Dice]) && (rests_left > 0 || visits_left > 0 || !shower)) {
			use(1, $item[eternal car battery]);
			while(my_mp() < mp_cost($skill[Summon Dice]) && rests_left > 0) {
				cli_execute("rest");
				--rests_left;
			}
			while(my_mp() < mp_cost($skill[Summon Dice]) && visits_left > 0) {
				cli_execute("try; nuns mp");
				--visits_left;
			}
			while(my_mp() < mp_cost($skill[Summon Dice]) && !shower ){
				cli_execute("shower hot");
				shower = true;
			}
		} 
	}
	#end by maximizing adventures
	cli_execute("maximize adv");
}