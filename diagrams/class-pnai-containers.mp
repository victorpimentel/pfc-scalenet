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
  iClassNameOnly.foreColor := (.9, 1, .8);
  iClassNameOnly.iName.iFont.name := "phvb";

  ClassName.Session("Session");

  Class.ContainerDimensions("ContainerDimensions")
    ("+offsetX: int", "+offsetY: int", "+width: int", "+height: int")
    ("+ContainerDimensions(x: int, y: int, w: int, h: int)",
    "+setSize(x: int, y: int, w: int, h: int): void",
    "+copy(dim: ContainerDimensions): void",
    "+toStyles(parent: Element): Object",
    "+toPercentageStyles(): Object");

  AbstractClass.Container("Container <<Options, Events>>")
    ("+name: String", "+element: Element", "+dim: ContainerDimensions",
    "+slots: Slot[0..*]", "+options.title: String", "+options.className: String", 
    "+options.parentName: String", "+options.enabled: bool",
    "+options.imageSrcEnabled: String", "+options.imageSrcDisabled: String",
    "+options.draggable: bool")
    ("#Container(name:String,dim:ContDim,options:Object)",
    "+createHTMLContainer(): void",
    "+createMobileHTMLContainer(): void",
    "#initSlots(dim: ContainerDimensions): void",
    "+enable(): void",
    "+disable(): void",
    "+makeDraggable(): void",
    "+makeResizable(): void",
    "+pack(windowResize: bool): void",
    "+attachSession(session: Session): void",
    "+detachSession(session: Session): void",
    "+dispose(): void",
    "+toElement(): Element");

  Class.Slot("Slot")
    ("+session: int", "+dim: ContainerDimensions")
	("+Slot(x: int, y: int, w: int, h: int)");

  Class.TV("TV")
    ("+slots: Slot[4]", "+options.className = 'device'",
    "+options.parentName = 'devices-list'")
    ("+TV(name:String,dim:ContDim,options:Object)");

  Class.PDA("PDA")
    ("+slots: Slot[2]", "+options.className = 'device'",
    "+options.parentName = 'devices-list'")
    ("+PDA(name:String,dim:ContDim,options:Object)");

  Class.NB("NB")
    ("+slots: Slot[4]", "+options.className = 'device'",
    "+options.parentName = 'devices-list'")
    ("+NB(name:String,dim:ContDim,options:Object)");

  Class.Trash("Trash")
    ("+slots: Slot[0]", "+options.className = 'trash'",
    "+options.parentName = 'devices-list'", "+options.draggable = false")
    ("+Trash(name:String,dim:ContDim,options:Object)");

  Class.DeviceList("DeviceList <<Class.Occlude>>")
    ("+devices: Hash", "+element: Element")
    ("+DeviceList(element: Element)",
    "+addDevices(items: Object[]): void",
    "+addMobileDevices(items: Object[]): void",
    "+get(name: String): Container",
    "+deleteDevice(name: String): void",
    "+calculateGrid(items: int): int[2]",
    "+packContainers(): void");

  Class.Buddy("Buddy")
    ("+slots: Slot[2]", "+options.className = 'buddy'",
    "+options.parentName = 'buddies-list'", "+options.draggable = false")
    ("+Buddy(name: String, options: Object)",
    "+setOnline(): void",
    "+setOffline(): void");

  Class.BuddyList("BuddyList <<Class.Occlude>>")
    ("+buddies: Hash", "+element: Element")
    ("+BuddyList(element: Element)",
    "+addBuddy(name: String, options: Options): void",
    "+get(name: String): Buddy",
    "+deleteBuddy(name: String): void");

  Package.ScaleNet("ScaleNet")
    (Container, Slot, ContainerDimensions, TV, PDA, NB, Trash,
    DeviceList, Session, Buddy, BuddyList);

  topToBottom(.65cm)(DeviceList, Container, Slot, ContainerDimensions);
  topToBottom.right(1cm)(Trash, TV, PDA, NB);
  topToBottom(1cm)(NB, Session, Buddy, BuddyList);
  leftToRight.top(2cm)(DeviceList, Trash);

  drawObjects(ScaleNet);

  clink(aggregation)(Container, DeviceList);
  clink(aggregation)(Buddy, BuddyList);
  clink(aggregation)(Slot, Container);
  link(aggregation)(pathStepX(Container.se + (0, 25), BuddyList.w, 15));

  clink(inheritance)(TV, Container);
  clink(inheritance)(PDA, Container);
  clink(inheritance)(NB, Container);
  clink(inheritance)(Trash, Container);
  clink(inheritance)(Buddy, Container);

  clink(dependency)(Container, Session);
  clink(dependency)(Slot, ContainerDimensions);
  link(dependency)(Container.s - (85, 0) -- ContainerDimensions.n - (85, 0));

endfig;

end;