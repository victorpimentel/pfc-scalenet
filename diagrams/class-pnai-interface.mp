input metauml;

beginfig(1);

  iClass.foreColor := (.9, 1, 1);
  iClass.iName.iFont.name := "phvb";
  iClass.iAttributeStack.iPict.iFont.name := "phvr";
  iClass.iMethodStack.iPict.iFont.name := "phvr";
  iClass.iAttributeStack.spacing := 12;
  iClass.iMethodStack.spacing := 12;
  iPackage.foreColor := (1, .95, .9);
  iPackage.iNameStack.iPict.iFont.name := "phvr";
  iClassNameOnly.foreColor := (.9, 1, .8);
  iClassNameOnly.iName.iFont.name := "phvb";

  ClassName.Session("Session");
  ClassName.Container("Container");
  ClassName.AppletNotifier("AppletNotifier");
  ClassName.Growl("Growl");
  ClassName.IScroll("iScroll");

  Class.PopupMenu("PopupMenu <<Class.Occlude>>")
    ("+element: Element")
    ("+PopupMenu(element: Element)",
    "+show(session: Session, targetId: int, event: Event): void",
    "+hide(): void",
    "+requestHandover(session: Session, targetId: int): void",
    "+requestDuplication(session: Session, targetId: int): void",
    "+requestDeletion(session: Session): void",
    "+selectDestination(session: Session, callback: Function): void",
    "+toElement(): Element");

  Class.InfoPanel("InfoPanel <<Chain>>")
    ("+element: Element", "+block: Element", "-i: int")
    ("+InfoPanel()",
    "+show(message: String, type: String,",
    "+    timeout: String, checkTimeout: Function): void",
    "+hide(clearTimeout: bool): void",
    "+timeoutReached(): void");

  Class.Drawer("Drawer <<Class.Occlude>>")
    ("+element: Element", "+mainContent: Element", "+handler: Element",
    "+collapsed: false", "+width: String")
    ("+Drawer(element: Element, mainContent: Element, handler: Element)",
    "+show(session: Session, targetId: int, event: Event): void",
    "+prepareTabs(): void",
    "+makeResizable(): void",
    "+toggle(): void",
    "+show(): void",
    "+hide(): void",
    "+setWidth(width: int, remember: bool): void",
    "+update(): void",
    "+fixAnimation(): Element");

  Class.BarTab("BarTab <<Class.Occlude>>")
    ("+element: Element", "+state: String")
    ("+BarTab(element: Element)",
    "+show(session: Session, targetId: int,",
    "+    event: Event): void",
    "+prepareTabs(): void",
    "+changeTab(tabName: String): void",
    "+setHeight(): void");

  Package.ScaleNet("ScaleNet")
    (PopupMenu, InfoPanel, Drawer, BarTab, Session, Container, AppletNotifier);

  topToBottom(.65cm)(PopupMenu, Drawer);
  leftToRight(1cm)(InfoPanel, BarTab);
  InfoPanel.ne = Drawer.s + (10, -20);
  Container.s = PopupMenu.n + (0, 20);
  leftToRight(1cm)(Session, Container, AppletNotifier);
  Growl.n = InfoPanel.s - (0, 20);
  IScroll.n = BarTab.s - (0, 20);

  drawObjects(ScaleNet, Growl, IScroll);

  clink(dependency)(PopupMenu, Session);
  clink(dependency)(PopupMenu, Container);
  clink(dependency)(PopupMenu, AppletNotifier);
  clink(dependency)(InfoPanel, Growl);
  clink(dependency)(BarTab, IScroll);

endfig;

end;