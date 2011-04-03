input metauml;

beginfig(1);

  iClass.foreColor := (.9, 1, 1);
  iClass.iName.iFont.name := "phvb";
  iClass.iAttributeStack.iPict.iFont.name := "phvr";
  iClass.iMethodStack.iPict.iFont.name := "phvr";
  iClass.iAttributeStack.spacing := 12;
  iClass.iMethodStack.spacing := 12;
  iAbstractClass.foreColor := (.9, 1, .8);
  iAbstractClass.iName.iFont.name := "phvbo";
  iAbstractClass.iAttributeStack.iPict.iFont.name := "phvr";
  iAbstractClass.iMethodStack.iPict.iFont.name := "phvr";
  iAbstractClass.iAttributeStack.spacing := 12;
  iAbstractClass.iMethodStack.spacing := 12;

  AbstractClass.Container("Container")
    ("+name: String", "+x: int", "+y: int",
    "+width: int", "+height: int", "#enabled: bool",
    "#imageSrcEnabled: String", "#imageSrcDisabled: String",
    "#div: Element", "#slots: Slot[0..*]")
    ("#Container(name:String,x:int,y:int,w:int,h:int)",
    "#initSlots(xOff: int, yOff: int): void",
    "+enable(): void",
    "+disable(): void",
    "+attachSession(session: Session): void",
    "+detachSession(session: Session): void");

  Class.Slot("Slot")
    ("+x: int", "+y: int", "+session: String", "+item: String")
	("+Slot(x: int, y: int)");

  AbstractClass.Session("Session")
    ("+id: String", "+name: String", "+type: String", "+impi: String",
    "+impu: String", "+initiator: String", "+owner: String",
    "+isOwn: bool", "+x: int", "+y: int", "+width: int", "+height: int",
    "+imageSrc: String", "+div: Element", "+parent: String")
    ("#Session(type:String,name:String,id:String)",
    "+moveto(parent: String, x: int, y: int): void",
    "+remove(): void");

  Class.TV("TV")
    ("+name = 'tv'", "-slots: Slot[4]")
    ("+TV(x: int, y: int, w: int, h: int)");

  Class.PDA("PDA")
    ("+name = 'mda'", "-slots: Slot[2]")
    ("+PDA(x: int, y: int, w: int, h: int)");

  Class.NB("NB")
    ("+name = 'laptop'", "-slots: Slot[4]")
    ("+NB(x: int, y: int, w: int, h: int)");

  Class.Trash("Trash")
    ("+name = 'trash'", "-slots: Slot[0]")
    ("+Trash(x: int, y: int, w: int, h: int)");

  Class.Buddy("Buddy")
    ("+id: int", "+sid: int", "-slots: Slot[2]")
    ("+Buddy(id: int, sid: int)",
    "-moveto(x: int, y: int): void",
    "+setOnline(): void",
    "+setOffline(): void",
    "+remove(): void");

  Class.BuddyList("BuddyList")
    ("-buddies: Hash", "-x: int", "-y: int", "-width: int", "-height: int",
    "-slots: Slot[8]", "-div: Element")
    ("+show(x: int, y: int, w: int, h: int): void",
    "+addBuddy(buddy: Buddy): void",
    "+getBuddy(buddy: Buddy): Container",
    "+deleteBuddy(id: int): void");

  Class.VideoSession("VideoSession")
    ("+type = 'video'")
    ("+VideoSession(id:String,name:String,own:bool)");

  Class.AudioSession("AudioSession")
    ("+type = 'audio'")
    ("+AudioSession(id:String,name:String,own:bool)");

  Class.Hash("Hash")
    ("+length: int", "-items: Array")
  	("+setItem(key: String, value: Object): void",
  	"+getItem(key: String): Object",
  	"+removeItem(key: String): void",
  	"+hasItem(key: String): bool");

  Class.PendingAction("PendingAction")
	("+method: String", "+sid: String", "+target: String")
  	("+PendingAction(method: String, sid: String, target: String)");

  topToBottom(.65cm)(PendingAction, Container, Slot, Session,
	VideoSession, AudioSession);
  topToBottom(1cm)(Trash, TV, PDA, NB, Buddy, BuddyList, Hash);
  leftToRight.top(2cm)(PendingAction, Trash);

  drawObjects(Container, Slot, Session, VideoSession, AudioSession,
	PendingAction);
  drawObjects(TV, PDA, NB, Trash, Buddy, BuddyList, Hash);

  clink(aggregation)(Buddy, BuddyList);
  clink(aggregation)(Slot, Container);
  link(aggregation)(pathStepX(Slot.e, BuddyList.nw + (0, -25), 90));

  clink(inheritance)(TV, Container);
  clink(inheritance)(PDA, Container);
  clink(inheritance)(NB, Container);
  clink(inheritance)(Trash, Container);
  clink(inheritance)(Buddy, Container);

  clink(inheritance)(VideoSession, Session);
  link(inheritance)(pathStepX(AudioSession.w, Session.w, -20));

  link(dependency)
	(.5[Container.sw + (32, 0),Session.nw + (30, 0)] -- Session.nw + (30, 0));
  link(dependency)
	(.5[Container.sw + (32, 0),Session.nw + (30, 0)] -- Container.sw + (32, 0));
  clink(dependency)(BuddyList, Hash);

endfig;

end;