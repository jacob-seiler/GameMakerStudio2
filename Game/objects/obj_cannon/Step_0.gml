switch (state) {
	case states.idle: break;
	case states.moving: break;
	case states.charge: cannon_charge(); break;
	case states.attack: cannon_attack(); break;
	case states.cooldown: cannon_cooldown(); break;
}