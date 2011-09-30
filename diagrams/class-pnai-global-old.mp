input metauml;

beginfig(1);

  iClass.foreColor := (.9, 1, 1);
  iClass.iName.iFont.name := "phvb";
  iClass.iAttributeStack.iPict.iFont.name := "phvr";
  iClass.iMethodStack.iPict.iFont.name := "phvr";
  iClass.iAttributeStack.spacing := 12;
  iClass.iMethodStack.spacing := 12;
  iClassNameOnly.foreColor := (.9, 1, .8);
  iClassNameOnly.iName.iFont.name := "phvb";

  ClassName.Hash("Hash");
  ClassName.PendingAction("PendingAction");
  ClassName.BuddyList("BuddyList");
  ClassName.Container("Container");
  ClassName.Session("Session");
  ClassName.Buddy("Buddy");
  ClassName.TV("TV");
  ClassName.PDA("PDA");
  ClassName.NB("NB");
  ClassName.Trash("Trash");
  ClassName.VideoSession("VideoSession");
  ClassName.AudioSession("AudioSession");

  Class.Window("Window")
    ("+myIMPI: String", "+pendingAction: PendingAction",
	"+containerList: Hash", "+sessionList: Hash", "+buddyList: BuddyList",
	"+draggedSession: Session", "+sourceContainer: Container",
	"+targetContainer: Container")
  	("+notifyApplet(method: String, sid: String, source: String, target: String): void",
  	"+newSession(id: String, type: String, name: String, owner: String,",
	"+    initiator: String, impi: String, impu: String, isOwn: String): void",
  	"+deleteSession(id: String, type: String, name: String, owner: String,",
  	"+    initiator: String, imp: Stringi, impu: String): void",
  	"+updateDevice(impu: String, online: String): void",
  	"+deleteDevice(impu: String): void",
  	"+updateBuddy(impu: String, online: String): void",
  	"+deleteBuddy(impu: String): void",
  	"+resultOK(tid: String, sid: String): void",
  	"+resultNotOK(tid: String, sid: String): void",
  	"+inContainer(name: String, x: int, y: int): Container",
  	"+getContainer(x: int, y: int): Container",
  	"+showPopup(x: int, y: int): void",
  	"+hidePopup(): void",
  	"+perfomHandover(): void",
  	"+perfomDuplication(): void",
  	"+cancelAction(): void",
  	"+my_DropFunc(): void",
  	"+showInfo(msg: String, time: int): void",
  	"+showErrorInfo(msg: String, time: int): void",
  	"+hideInfo(): void");

  topToBottom.left(1cm)(PendingAction, Hash, Session, VideoSession,
	AudioSession, BuddyList, Buddy);
  leftToRight(1cm)(Container, TV, PDA, NB, Trash, Buddy);
  leftToRight.bottom(1cm)(Window, BuddyList);

  drawObjects(Window);
  drawObjects(PendingAction, Hash, BuddyList, Container, Session, Buddy,
	TV, PDA, NB, Trash, VideoSession, AudioSession);

  clink(dependency)(Window, PendingAction);
  clink(dependency)(Window, Hash);
  clink(dependency)(Window, BuddyList);
  clink(dependency)(Window, Container);
  clink(dependency)(Window, Session);
  clink(dependency)(Window, Buddy);
  clink(dependency)(Window, TV);
  clink(dependency)(Window, PDA);
  clink(dependency)(Window, NB);
  clink(dependency)(Window, Trash);
  clink(dependency)(Window, VideoSession);
  clink(dependency)(Window, AudioSession);

endfig;

end;