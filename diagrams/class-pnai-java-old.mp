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

  Class.ModelSession("Session")
    ("+id: String", "+type: String", "+name: String", "-icon: String",
	"+owner: String", "+initiator: String", "+impi: String", "+impu: String",
	"+active: bool")
    ("+Session(id: String, owner: String, type: String, name: String): void",
    "+getIcon(): String",
    "+equals(obj: Object): bool",
    "+toString(): String",
    "+_fromString_(s: String): Session");

  Class.ModelRequest("Request")
    ("+uid: String", "+tid: String", "+event: String", "+sid: String",
	"+stype: String", "+sname: String", "+sicon: String", "+source: String",
	"+destination: String", "+result: String", "+incoming: bool")
    ("+Request(incoming: bool): void",
    "+isAnswer(): bool",
    "+isOKAnswer(): bool",
    "+toString(): String",
    "+parse(line: String): void");

  Class.ModelDevice("Device")
    ("+impi: String", "+impu: String", "+online: bool")
    ("+Device(impi: String, impu: String, online: bool): void",
    "+differentStatus(d: Device): bool",
    "+equals(obj: Object): bool",
    "+toString(): String",
    "+_fromString_(s: String): Device");

  Class.ModelBuddy("Buddy")
    ("+id: int", "+name: String", "+online: bool")
    ("+Buddy(id: int, name: String, online: bool): void",
    "+differentStatus(buddy: Buddy): bool",
    "+equals(object: Object): bool",
    "+toString(): String",
    "+_fromString_(s: String): Buddy");

  Class.ScalenetApplet("ScalenetApplet")
    ("+userID: String", "+serverHost: String", "+serverPort: int",
	"+backendLink: BackendLink")
    ("+duplicateSession(sid: String, source: String, target: String): void",
    "+handoverSession(sid: String, source: String, target: String): void",
    "+deleteSession(sid: String, source: String): void",
    "+handleBackendData(data: String): void");

  Class.BackendLink("BackendLink")
    ("-clientThread: Thread", "-socket: Socket", "-writer: BufferedWriter",
	"-applet: ScalenetApplet")
    ("+BackendLink(applet: ScalenetApplet, userID: String, host: String, port: String): void",
    "-init(userID: String, host: String, port: String): void",
    "+stop(): void",
    "+sendRequest(msg: String): void",
    "-handleData(data: String): void");

  Package.Applet("de.telekom.labs.sc.scalenet.applet")
	(ScalenetApplet,BackendLink);
  Package.Model("de.telekom.labs.sc.scalenet.model")
	(ModelRequest, ModelSession, ModelDevice, ModelBuddy);

  leftToRight(1cm)(ModelRequest, ModelSession);
  topToBottom(1cm)(ModelRequest, ModelBuddy);
  topToBottom(1cm)(ModelSession, ModelDevice);
  topToBottom(1cm)(Model, Applet);
  topToBottom(1cm)(ScalenetApplet, BackendLink);

  drawObjects(Applet, Model);

  clink(association)(ScalenetApplet, BackendLink);

  link(associationUni)
	(pathStepX(ScalenetApplet.w + (0, -10), ModelRequest.w, -130));
  pair PointA;
  pair PointB;
  PointA := ScalenetApplet.w + (0, 10);
  PointB := ModelBuddy.s + (-70, 0);
  link(associationUni)(pathManhattanX(PointA, PointB));
  link(associationUni)
	(pathStepX(ScalenetApplet.e + (0, -10), ModelSession.e, 130));
  PointA := ScalenetApplet.e + (0, 10);
  PointB := ModelDevice.s + (65, 0);
  link(associationUni)(pathManhattanX(PointA, PointB));

endfig;

end;