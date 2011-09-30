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
  iAbstractClass.foreColor := (.9, 1, .8);
  iAbstractClass.iName.iFont.name := "phvbo";
  iAbstractClass.iAttributeStack.iPict.iFont.name := "phvr";
  iAbstractClass.iMethodStack.iPict.iFont.name := "phvr";
  iAbstractClass.iAttributeStack.spacing := 12;
  iAbstractClass.iMethodStack.spacing := 12;

  AbstractClass.Options("Options")
    ("+options: Object")
    ("+setOptions(options: Object): void");

  AbstractClass.Occlude("Class.Occlude")
    ("property: String", "+occluded: Class")
    ("+occlude(): bool");

  Class.ModelSession("Session")
    ("+options.id: String", "+options.type: String", "+options.name: String", "+options.icon: String",
	"+options.owner: String", "+options.initiator: String", "+options.impi: String", "+options.impu: String",
	"+options.active: bool")
    ("+Session(options: Object)",
    "+getIcon(): String",
    "+equals(other: Device): bool",
    "+toNetworkString(): String",
    "+fromString(s: String): void");

  Class.ModelRequest("Request")
    ("+options.uid: String", "+options.tid: String", "+options.event: String", "+options.sid: String",
	"+options.stype: String", "+options.sname: String", "+options.sicon: String", "+options.source: String",
	"+options.destination: String", "+options.result: String", "+options.incoming: bool")
    ("+Request(options: Object)",
    "+isAnswer(): bool",
    "+isOKAnswer(): bool",
    "+reset(): void",
    "+toNetworkString(): String",
    "+fromString(s: String): void");

  Class.ModelDevice("Device")
    ("+options.impi: String", "+options.impu: String", "+options.online: bool")
    ("+Device(options: Object)",
    "+differentStatus(other: Device): bool",
    "+equals(other: Device): bool",
    "+toNetworkString(): String",
    "+fromString(s: String): void");

  Class.ModelBuddy("Buddy")
    ("+options.id: int", "+options.name: String", "+options.online: bool")
    ("+Buddy(options: Object)",
    "+differentStatus(other: Buddy): bool",
    "+equals(other: Buddy): bool",
    "+toNetworkString(): String",
    "+fromString(s: String): void");

  Class.AppletNotifier("AppletNotifier")
    ("+options.method: String", "+options.sid: int", "+options.source: String",
	"+options.target: String")
    ("+AppletNotifier(options: Object)");

  Class.BackendLink("BackendLink")
    ("-client: APE.Client", "-socket: APE.core.TCPSocket", "+options.uid: String",
	"+options.host: String", "+options.port: int")
    ("+BackendLink(options: Object)",
    "+sendRequest(msg: String): void",
    "-handleData(data: String): void",
    "+duplicateSession(sid: String, source: String, target: String): void",
    "+handoverSession(sid: String, source: String, target: String): void",
    "+deleteSession(sid: String, source: String): void");

  Class.PendingAction("PendingAction")
    ("+element: Element", "+method: String", "+sid: String",
	"+target: String")
    ("+PendingAction(element: Element)",
    "+update(sid: String, source: String, target: String): void");

  Class.Window("Window")
    ("+ScaleNet.myIMPI: String", "+ScaleNet.version: String",
     "+ScaleNet.desktop: bool", "+ScaleNet.mobile: bool", "+ScaleNet.debug: bool",
     "+ScaleNet.zIndex: int", "+ScaleNet.host: String", "+ScaleNet.port: int",
     "+ScaleNet.sessions: SessionList", "+ScaleNet.contents: ContentList",
     "+ScaleNet.devices: DeviceList", "+ScaleNet.buddies: BuddyList",
     "+ScaleNet.backend: BackendLink", "+ScaleNet.pending: PendingAction",
     "+ScaleNet.menu: PopupMenu", "+ScaleNet.panel: InfoPanel",
     "+ScaleNet.drawer: Drawer", "+ScaleNet.bartab: BarTab",
     "+ScaleNet.scroll: iScroll")
    ("+newSession(id: String, type: String, name: String,",
    "+    owner: String, initiator: String, impi: String,",
    "+    impu: String, isOwn: String): void",
    "+deleteSession(id: String, type: String,",
    "+    name: String, owner: String, initiator: String,",
    "+    imp: Stringi, impu: String): void",
    "+updateDevice(impu: String, online: String): void",
    "+deleteDevice(impu: String): void",
    "+updateBuddy(impu: String, online: String): void",
    "+deleteBuddy(impu: String): void");

  Package.ScaleNet("ScaleNet")
	(AppletNotifier, BackendLink, PendingAction);
  Package.Model("ScaleNet.Model")
	(ModelRequest, ModelSession, ModelDevice, ModelBuddy);

  leftToRight(1cm)(ModelRequest, ModelSession);
  topToBottom(1cm)(ModelRequest, ModelBuddy);
  leftToRight(2cm)(ModelBuddy, ModelDevice);
  topToBottom(1cm)(Model, Options);

  ScaleNet.ne = Options.se + (0, -25);

  topToBottom(2cm)(BackendLink, AppletNotifier, PendingAction);
  leftToRight(1cm)(ScaleNet, Window);
  topToBottom(1cm)(Window, Occlude);

  drawObjects(ScaleNet, Model, Options, Window, Occlude);

  clink(inheritance)(ModelRequest, Options);
  clink(inheritance)(ModelSession, Options);
  clink(inheritance)(ModelBuddy, Options);
  clink(inheritance)(ModelDevice, Options);
  clink(inheritance)(AppletNotifier, Options);
  clink(inheritance)(BackendLink, Options);
  clink(inheritance)(PendingAction, Occlude);

  clink(associationUni)(AppletNotifier, BackendLink);
  clink(associationUni)(AppletNotifier, PendingAction);
  clink(associationUni)(Window, BackendLink);
  clink(associationUni)(Window, PendingAction);

  link(associationUni)
	(pathStepX(BackendLink.w + (0, -10), ModelRequest.w, -40));
  link(associationUni)
	(pathStepX(BackendLink.w + (0, 10), ModelBuddy.w, -20));
  link(associationUni)
	(pathStepX(BackendLink.e + (0, 50), ModelSession.e, 140));
  pair PointA;
  pair PointB;
  PointA := BackendLink.e + (0, 60);
  PointB := ModelDevice.s + (20, 0);
  link(associationUni)(pathManhattanX(PointA, PointB));

endfig;

end;