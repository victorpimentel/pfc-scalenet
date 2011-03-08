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

  Class.ContainerList("ContainerList")()
    ("+setItem(name: String, container: Container): void",
    "+getItem(name: String): Container",
    "+removeItem(name: String): void");

  AbstractClass.Container("Container")
    ("+name: String", "+x: int", "+y: int",
    "+width: int", "+height: int", "#enabled: bool",
    "#imageSrcEnabled: String", "#imageSrcDisabled: String",
    "#div: Element", "#slots: Slot[0..*]")
    ("#Container(name:String,x:int,y:int,w:int,h:int):void",
    "#initSlots(xOff: int, yOff: int): void",
    "+enable(): void",
    "+disable(): void",
    "+attachSession(session: Session): void",
    "+detachSession(session: Session): void");

  Class.Slot("Slot")
    ("+x: int", "+y: int", "+session: String", "+item: String")();

  Class.SessionList("SessionList")()
    ("+setItem(id: String, session: Session): void",
    "+getItem(id: String): Session",
    "+removeItem(id: String): void");

  AbstractClass.Session("Session")
    ("+id: String", "+name: String", "+type: String", "+impi: String",
    "+impu: String", "+initiator: String", "+owner: String",
    "+isOwn: bool", "+x: int", "+y: int", "+width: int", "+height: int",
    "+imageSrc: String", "+div: Element", "+parent: String")
    ("#Session(type:String,name:String,id:String):void",
    "+moveto(parent: String, x: int, y: int): void",
    "+remove(): void");

  Class.TV("TV")
    ("+name = 'tv'", "-slots: Slot[4]")
    ("+TV(x: int, y: int, w: int, h: int): void");

  Class.PDA("PDA")
    ("+name = 'mda'", "-slots: Slot[2]")
    ("+TV(x: int, y: int, w: int, h: int): void");

  Class.NB("NB")
    ("+name = 'laptop'", "-slots: Slot[4]")
    ("+TV(x: int, y: int, w: int, h: int): void");

  Class.Trash("Trash")
    ("+name = 'trash'", "-slots: Slot[0]")
    ("+TV(x: int, y: int, w: int, h: int): void");

  Class.Buddy("Buddy")
    ("+id: int", "+sid: int", "-slots: Slot[2]")
    ("+Buddy(id: int, sid: int): void",
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
    ("+VideoSession(id:String,name:String,own:bool):void");

  Class.AudioSession("AudioSession")
    ("+type = 'audio'")
    ("+AudioSession(id:String,name:String,own:bool):void");

  topToBottom(1cm)(ContainerList, Container, Slot);
  topToBottom(1cm)(SessionList, Session);
  topToBottom(1cm)(TV, PDA, NB, Trash, Buddy, BuddyList, VideoSession,
  AudioSession);
  leftToRight(2cm)(ContainerList, TV);
  SessionList.n = ContainerList.n + (0, -16cm);

  drawObjects(ContainerList, Container, Slot, SessionList, Session);
  drawObjects(TV, PDA, NB, Trash, Buddy, BuddyList,
  VideoSession, AudioSession);

  clink(aggregation)(Container, ContainerList);
  clink(aggregation)(Buddy, BuddyList);
  clink(aggregation)(Session, SessionList);

  clink(aggregation)(Slot, Container);
  clink(aggregation)(Slot, BuddyList);

  clink(inheritance)(TV, Container);
  clink(inheritance)(PDA, Container);
  clink(inheritance)(NB, Container);
  clink(inheritance)(Trash, Container);
  clink(inheritance)(Buddy, Container);

  clink(inheritance)(VideoSession, Session);
  clink(inheritance)(AudioSession, Session);

%  clink(dependency)(Slot, Session);
%  clink(dependency)(Container, Session);

  link(dependency)(pathManhattanX(Slot.w, Session.nw + (0.35cm, 0)));
  link(dependency)(pathManhattanY(Container.sw, Session.nw));

endfig;

end;