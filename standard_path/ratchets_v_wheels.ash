# During the McGuffin quest it's better to go after the tomb ratchets if you have high item drop.
# But it's better to go after crumbling wheels if you have high non-combat.
# This will vary from run to run, so which is better for you right now?

# Wheel base chance: 15% per adventure.
    # Approximately 67 adventures to get 10 with no modifiers.
# Ratcher base chance: 33% of getting the tomb rat, 20 % drop rate
    # Approximately 150 adventures to get 10 with no modifiers.

# It is expected that you will run this script once the control room is unlocked, so you
# will have already applied all -combat and +item bonuses.

# TODO return -combat and +item with just equipment changes, and full modifiers.
float wheel_chance_per_adv() {
    float wheel_chance = (100 - (85 + combat_rate_modifier()));
    return wheel_chance;
}

float ratchet_chance_per_adv() {
    # NOTE: Tomb ratchets cannot be pickocketed so we're excluding that chance.
    float rat_chance = 1.0 / 3.0;
    if(have_skill($skill[Transcendent Olfaction]) || have_familiar($familiar[Nosy Nose])){
        rat_chance = 3.0 / 5.0;
    }
    float ratchet_drop_chance = 0.2 * (1 + item_drop_modifier()/100);
    float ratchet_chance = ratchet_drop_chance * rat_chance;
    return ratchet_chance * 100;
}

float ratchet_w_banish() {
    float rat_chance = 2.0 / 3.0;
    if(have_skill($skill[Transcendent Olfaction]) || have_familiar($familiar[Nosy Nose])){
        rat_chance = 4.0 / 5.0;
    }
    float ratchet_drop_chance = 0.2 * (1 + item_drop_modifier()/100);
    float ratchet_chance = ratchet_drop_chance * rat_chance;
    return ratchet_chance * 100;
}

float ratchet_w_banish2() {
    float ratchet_drop_chance = 0.2 * (1 + item_drop_modifier()/100);
    float ratchet_chance = ratchet_drop_chance;
    return ratchet_chance * 100;
}

void main() {
    print("Wheel chance per adventure: " + wheel_chance_per_adv() + "%");
    print("Ratchet chance per adventure: " + to_string(ratchet_chance_per_adv(), "%.1f") + "%");
    print("If you can banish one monster your ratchet chance is " + to_string(ratchet_w_banish(), "%.1f") + "%");
    print("If you can banish two monsters your ratchet chance is " + to_string(ratchet_w_banish2(), "%.1f") + "%");
    print("You also have " + item_amount($item[Tangle of rat tails]) + " tangle(s) of rat tails.");
}