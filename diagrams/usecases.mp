
input metauml;

beginfig(1);

  iUsecase.foreColor := (.82, .93, .82);
  iUsecase.iNameStack.iPict.iFont.name := "phvr";
  iActor.iNameStack.iPict.iFont.name := "phvb";
  iNote.iStack.iPict.iFont.name := "phvr";

  Actor.user("User");
  Actor.buddy("Buddy");
  Usecase.start("Start a session*");
  Usecase.strop("Stop a session");
  Usecase.copy("Copy a session");
  Usecase.transfer("Transfer a session");
  Usecase.startA("Start a session**", "on a device");
  Usecase.startB("Start a session**", "on a buddy");
  Usecase.stropA("Stop a session", "of a device");
  Usecase.stropB("Stop a session", "of a buddy");
  Usecase.copyA("Copy a session", "to a device");
  Usecase.copyB("Copy a session", "to a buddy");
  Usecase.transferA("Transfer a session", "to a device");
  Usecase.transferB("Transfer a session", "to a buddy");
  Note.note("Only if the", "user owns", "the session.");
  start.info.foreColor := (.9, .83, .92);
  startA.info.foreColor := (1, .8, .85);
  startB.info.foreColor := (1, .8, .85);
  note.info.foreColor := (1, 1, .8);

  topToBottom(3cm)(start, strop, copy, transfer);
  topToBottom(0.6cm)(startA, startB, stropA, stropB,
    copyA, copyB, transferA, transferB);
  start.c = user.c + (4cm, 7cm);
  startA.c = user.c + (8cm, 8cm);
  buddy.c = user.c + (12.5cm, -2cm);
  note.c = user.c + (12.5cm, 4cm);

  drawObjects(user, buddy, note);
  drawObjects(start, strop, copy, transfer);
  drawObjects(startA, startB, stropA, stropB);
  drawObjects(copyA, copyB, transferA, transferB);

  clink(association)(user.human, start);
  clink(association)(user.human, strop);
  clink(association)(user.human, copy);
  clink(association)(user.human, transfer);
  clink(inheritance)(startA, start);
  clink(inheritance)(startB, start);
  clink(inheritance)(stropA, strop);
  clink(inheritance)(stropB, strop);
  clink(inheritance)(copyA, copy);
  clink(inheritance)(copyB, copy);
  clink(inheritance)(transferA, transfer);
  clink(inheritance)(transferB, transfer);
  link(association)(buddy.n -- startB.e);
  link(association)(buddy.human.nw -- stropB.e);
  link(association)(buddy.human.w -- copyB.e);
  link(association)(buddy.s -- transferB.e);
  link(dashedLink)(note.nw -- startB.e);
  link(dashedLink)(note.sw -- stropB.e);
  link(dashedLink)(note.s -- copyB.e);
  link(dashedLink)(note.s -- transferB.e);

endfig;

end;
