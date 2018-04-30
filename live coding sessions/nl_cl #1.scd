~ppl = ["casper", "felipe", "tony", "joana", "darien", "marije", "anne", "aike", "biyi", "jip", "kayleigh", "zeger", "giovanni", "corne", "michael","tomer"];


x= Pshuf(~ppl,inf).asStream;

(
~timer = Tdef('timer', {
	loop{
x.next.postln;
x.next.postln;

		180.do { arg i;
		//i.postln;
			if ( i%11 == 0 ){
				{ SinOsc.ar( (i+40)*40.midicps ) * 5 * EnvGen.kr( Env.perc, doneAction: 2 ); }.play;
			};
			if ( i%7 == 0 ){
				{ SinOsc.ar( (i+1) * 50 ) * 5 * EnvGen.kr( Env.perc, doneAction: 2 ); }.play;
			};

		1.wait;
	}
}})
)

// mic voice changer thing
Ndef(\voice, {2*PitchShift.ar(SoundIn.ar(0), 0.2, LFTri.kr(1/10).range(0.2, 2))}).play(1,1);

Ndef(\voice2, {2*PitchShift.ar(In.ar(3), 0.2, LFTri.kr(1/10).range(0.2, 2))}).play(0,1);

// ....
~timer.play



(
Ndef(\thing2, { BPF.ar(WhiteNoise.ar(Saw.kr(5).range(0,2),Saw.kr(0.1).range(100, 356))*2)*0
}).play(1);
)

~endGroup = Group.tail(s);
(
Ndef(\makeSilence, {
	var in = In.ar(0, 2);
	var silence = (TRand.kr(0, 1, Impulse.kr(1))>0.2);
	ReplaceOut.ar(0, in*silence*0.2);
}).play(group: ~endGroup);
)


Ndef(\bass, {
	var sig=SinOsc.ar(20);
	sig}).play([0, 1]);






{SinOsc.ar(220)*SinOsc.kr(0.1).range(0, 356)}.play



1002


~fireworks = Buffer.read(s, "/Users/narcodeb/Desktop/ /Spiegel Raadzel/sounds/fireworks.wav");

(
SynthDef(\sampler, {
	var sig;
	sig = PlayBuf.ar(2, ~fireworks.bufnum);
	Out.ar(0, sig*3);
}).add;

)

b = Synth(\sampler);
b.free;



s.sendMsg("