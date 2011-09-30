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

  ClassName.Container("Container");
  ClassName.PopupMenu("PopupMenu");
  ClassName.InfoPanel("InfoPanel");
  ClassName.BarTab("BarTab");

  AbstractClass.Session("Session <<Options>>")
    ("+id: int", "+element: Element", "+dim: ContainerDimensions",
    "+options.name: String", "+options.type: String", "+options.impi: String",
    "+options.impu: String", "+options.initiator: String", "+options.owner: String",
    "+options.isOwn: bool", "+options.imageSrc: String", "+options.parentName: String")
    ("#Session(id: int, options: Object)",
    "+moveto(parentName: String, dim: ContDim): void",
    "+createHTMLContainer(): void",
    "+createMobileHTMLContainer(): void",
    "+makeDraggable(): void",
    "+dropInto(element: Element, container: Element,",
    "+    event: Event): void",
    "+makeClickable(): void",
    "+dispose(): void",
    "+toElement(): Element");

  Class.VideoSession("VideoSession")
    ("+type = 'video'")
    ("+VideoSession(id: int, options: Object)");

  Class.AudioSession("AudioSession")
    ("+type = 'audio'")
    ("+AudioSession(id: int, options: Object)");

  Class.SessionList("SessionList")
    ("+sessions: Hash")
    ("+SessionList()",
    "+addSession(id: int, type: String, options: Object): void",
    "+get(id: int): Session",
    "+deleteSession(id: int): void");

  Class.Content("Content <<Options>>")
    ("+element: Element", "+options.id: String", "+options.title: String",
    "+options.type: String", "+options.img: String", "+options.desc: String",
    "+options.price: String", "+options.link: String", "+options.ajaxlink: String")
    ("+Content(options: Object)",
    "+createHTMLContainer(): void",
    "+createMobileHTMLContainer(): void",
    "+makeDraggable(): void",
    "+dropInto(element: Element, container: Element,",
    "+    event: Event): void");

  Class.ContentList("ContentList <<Class.Occlude>>")
    ("+contents: Hash", "+element: Element", "defaultImpu: String", "url: String")
    ("+ContentList(element: Element, url: String)",
    "+createHTMLCategories(): void",
    "+loadContent(url: String): void",
    "+prepareAccordion(): void",
    "+addContent(options: Object): Content",
    "+get(id: String): Session",
    "+deleteContent(id: String): void");

  Package.ScaleNet("ScaleNet")
    (Session, VideoSession, AudioSession, SessionList, Content, ContentList,
    Container, PopupMenu, InfoPanel, BarTab);

  topToBottom(1cm)(Session, Content, InfoPanel);
  topToBottom(1cm)(VideoSession, AudioSession, SessionList, Container,
    PopupMenu, ContentList);
  leftToRight.top(2cm)(Session, VideoSession);
  leftToRight(3cm)(InfoPanel, BarTab);

  drawObjects(ScaleNet);

  clink(aggregation)(Session, SessionList);
  clink(aggregation)(Content, ContentList);

  clink(inheritance)(VideoSession, Session);
  clink(inheritance)(AudioSession, Session);

  clink(dependency)(Session, Container);
  clink(dependency)(Session, PopupMenu);
  clink(dependency)(Content, PopupMenu);
  clink(dependency)(Content, InfoPanel);
  clink(dependency)(Content, BarTab);
  clink(dependency)(Content, SessionList);

endfig;

end;