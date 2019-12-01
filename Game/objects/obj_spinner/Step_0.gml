switch (state) {
	case states.idle: break;
	case states.moving: break;
	case states.charge: spinner_charge(); break;
	case states.attack: spinner_attack(); break;
	case states.cooldown: spinner_cooldown(); break;
}