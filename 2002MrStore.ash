void main() {
# TODO: spend mr. store 2002 credits
	if(item_amount($item[2002 Mr. Store Catalog]) > 0) {
		string store_page = visit_url("shop.php?whichshop=mrstore2002");
		# You have 3 Mr. Store 2002 Credits
		int credits = 0;
		if(contains_text(store_page, "You have 0 Mr. Store 2002 Credits")) {
			abort("No more Mr. Store 2002 credits");
		} else {
			matcher credit_matcher = create_matcher("You have (\\d+) Mr. Store", store_page);
			if (credit_matcher.find()) {
				credits = to_int(credit_matcher.group(1));
			}
		}
		item [13] store_items;
		store_items[0] = $item[Spooky VHS Tape]; # shop.php?whichshop=mrstore2002&action=buyitem&quantity=1&whichrow=1379&pwd
		store_items[1] = $item[&quot;I survived Y2K&quot; T-Shirt]; # shop.php?whichshop=mrstore2002&action=buyitem&quantity=1&whichrow=1378&pwd
		store_items[2] = $item[Letter from Carrie Bradshaw];
		store_items[3] = $item[pro skateboard];
		store_items[4] = $item[Mr. Accessaturday];
		store_items[5] = $item[Meat Butler];
		store_items[6] = $item[Loathing Idol Microphone]; # shop.php?whichshop=mrstore2002&action=buyitem&quantity=1&whichrow=1384&pwd
		store_items[7] = $item[Charter: Nellyville];
		store_items[8] = $item[Manual of Secret Door Detection];
		store_items[9] = $item[Flash Liquidizer Ultra Dousing Accessory];
		store_items[10] = $item[Amulet of Perpetual Darkness];
		store_items[11] = $item[Giant black monolith];
		store_items[12] = $item[Crimbo cookie sheet];

		# First off, I like the Loathing Idol Microphone and use it a lot in 
		# aftercore, so I'm grabbing one of those for myself.
		if(credits > 0) {
			visit_url("shop.php?whichshop=mrstore2002&action=buyitem&quantity=1&whichrow=1384&pwd");
		}

		# Then if I have anything left I want the most profitable item.
		item most_profitable = $item[Spooky VHS Tape];
		for i from 1 to 12 by 1 {
			if(mall_price(store_items[i]) > mall_price(most_profitable)) {
				most_profitable = store_items[i];
			}
		}
		while(credits > 0) {
			string item_string = "shop.php?whichshop=mrstore2002&action=buyitem&quantity=1&whichrow=" + 
			visit_url("shop.php?whichshop=mrstore2002&action=buyitem&quantity=1&whichrow=1384&pwd");
			--credits;
		}

	}
}
	