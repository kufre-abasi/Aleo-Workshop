program moovbootcamp_voice_kufre.aleo;

record Voice:
    owner as address.private;
    receiver as address.private;
    msg as u128.private;
    hash_msg as u128.private;

record CoBind:
    owner as address.private;
    hash_owner as field.private;
    receiver as address.private;
    bind_hash as field.private;

struct Messaging:
    messenger as field;
    total_messages as u64;


mapping voice_msg:
	key as field.public;
	value as Messaging.public;


function send_voice:
    input r0 as address.private;
    input r1 as address.private;
    input r2 as u128.private;
    input r3 as field.private;
    hash.bhp256 r2 into r4 as u128;
    is.eq self.caller r0 into r5;
    assert.eq r5 true;
    assert.neq self.caller r1;
    hash.bhp256 r0 into r6 as field;
    hash.bhp256 r1 into r7 as field;
    add r6 r7 into r8;
    cast r0 r1 r2 r4 into r9 as Voice.record;
    async send_voice r0 r4 into r10;
    output r9 as Voice.record;
    output r10 as moovbootcamp_voice_kufre.aleo/send_voice.future;

finalize send_voice:
    input r0 as address.public;
    input r1 as u128.public;
    hash.bhp256 r0 into r2 as field;
    cast r2 0u64 into r3 as Messaging;
    get.or_use voice_msg[r2] r3 into r4;
    add r4.total_messages 1u64 into r5;
    cast r2 r5 into r6 as Messaging;
    set r6 into voice_msg[r2];



function combine_hash_owner_receiver:
    input r0 as address.private;
    input r1 as address.private;
    assert.eq r0 self.caller;
    hash.bhp256 r0 into r2 as field;
    hash.bhp256 r1 into r3 as field;
    add r2 r3 into r4;
    cast r0 r2 r1 r4 into r5 as CoBind.record;
    output r5 as CoBind.record;
