/// @description implements the dead animation for enemies
enabled = true;

Enable = function () {
	enabled = true;
	image_alpha = 1;
}

Disable = function () {
	enabled = false;
	alarm[1] = 1;
	moveX = 0;
	moveY = 0;
}

activeAnimation = -1;
sequenceLayer = -1;
activeSequence = -1;

StartAnimation = function (_sequence, _sprite) {
	activeAnimation = _sequence;
	sequenceLayer = layer
	activeSequence = layer_sequence_create(sequenceLayer, x, y, _sequence);
	_seq=layer_sequence_get_instance(activeSequence)
	_seq.sequence.tracks[0].keyframes[0].channels[0].spriteIndex = _sprite
	layer_sequence_xscale(activeSequence, image_xscale);
	layer_sequence_yscale(activeSequence, image_yscale);
	Disable()
}

CheckAnimation = function () {
	if (activeSequence == undefined) return;
	
	if (layer_sequence_is_finished(activeSequence)) {
		layer_sequence_destroy(activeSequence);
		
		activeAnimation = -1;
		activeSequence = -1;
		sequenceLayer = -1;
		
		instance_destroy(self)

	}
}
