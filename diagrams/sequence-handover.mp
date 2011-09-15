input metauml;

beginfig(1);

  iClassNameOnly.foreColor := (.9, .8, .8);
  iClassNameOnly.iName.iFont.name := "phvb";
  iStereo.iFont.name := "phvr";
  iStereo.iFont.scale := 1;
  ClassInfoCopy.Flow(iClassNameOnly);
  Flow.iName.fixedWidth := .24cm;

  EClass.WebInterface(iClassNameOnly)("Web Interface")()();
  EClass.APEJSF(iClassNameOnly)("APE JSF")()();
  EClass.APE(iClassNameOnly)("APE Server")()();
  EClass.OSGI(iClassNameOnly)("OSGi")()();

  leftToRight(2.5cm)(WebInterface, APEJSF, APE, OSGI);
  drawObjects(WebInterface, APEJSF, APE, OSGI);

  link(dashedLink)(WebInterface.s -- WebInterface.s + (0, -27cm));
  link(dashedLink)(APEJSF.s -- APEJSF.s + (0, -27cm));
  link(dashedLink)(APE.s -- APE.s + (0, -27cm));
  link(dashedLink)(OSGI.s -- OSGI.s + (0, -27cm));

  Begin.begin;
  begin.c = WebInterface.n + (-1cm, -3cm) - (0, 1);
  drawObjects(begin);

  Flow.foreColor := (.85, .65, .85);
  Flow.iName.fixedHeight := 2.75cm - 2;
  EClass.ZerothFlow(Flow)("")()();
  ZerothFlow.n = APEJSF.s + (0, -1cm);
  drawObjects(ZerothFlow);

  Flow.iName.fixedHeight := 2.75cm - 2;
  EClass.ZerothFlowB(Flow)("")()();
  ZerothFlowB.n = APE.s + (0, -1cm);
  drawObjects(ZerothFlowB);

  link(associationUni)(APEJSF.s + (0, -1cm) -- ZerothFlowB.nw);
  item(iStereo)("CONNECT")(obj.s = .4[APEJSF.s,APE.s] + (0, -1cm));
  link(associationUni)(ZerothFlow.se -- ZerothFlowB.sw);
  item(iStereo)("Close")
  (obj.s = .45[ZerothFlow.se,ZerothFlowB.sw]);

  Flow.iName.fixedHeight := 8.5cm - 2;
  EClass.ZerothFlowC(Flow)("")()();
  ZerothFlowC.n = APEJSF.s + (0, -4.25cm);
  drawObjects(ZerothFlowC);

  Flow.iName.fixedHeight := 8.5cm - 2;
  EClass.ZerothFlowD(Flow)("")()();
  ZerothFlowD.n = APE.s + (0, -4.25cm);
  drawObjects(ZerothFlowD);

  link(associationUni)(ZerothFlowC.ne -- ZerothFlowD.nw);
  item(iStereo)("CMD(1)")
  (obj.s = .45[ZerothFlowC.ne,ZerothFlowD.nw]);

  link(dependency)(ZerothFlowD.sw -- ZerothFlowC.se);
  item(iStereo)("RAW(1)")
  (obj.s = .45[ZerothFlowD.sw,ZerothFlowC.se]);

  Flow.iName.fixedHeight := 6.5cm - 2;
  EClass.ZerothFlowE(Flow)("")()();
  ZerothFlowE.n = APEJSF.s + (0, -13.25cm);
  drawObjects(ZerothFlowE);

  Flow.iName.fixedHeight := 6.5cm - 2;
  EClass.ZerothFlowF(Flow)("")()();
  ZerothFlowF.n = APE.s + (0, -13.25cm);
  drawObjects(ZerothFlowF);

  link(associationUni)(ZerothFlowE.ne -- ZerothFlowF.nw);
  item(iStereo)("CMD(2)")
  (obj.s = .45[ZerothFlowE.ne,ZerothFlowF.nw]);

  link(dependency)(ZerothFlowF.sw -- ZerothFlowE.se);
  item(iStereo)("RAW(2)")
  (obj.s = .45[ZerothFlowF.sw,ZerothFlowE.se]);

  Flow.iName.fixedHeight := 5.5cm - 2;
  EClass.ZerothFlowG(Flow)("")()();
  ZerothFlowG.n = APEJSF.s + (0, -20.25cm);
  drawObjects(ZerothFlowG);

  Flow.iName.fixedHeight := 5.5cm - 2;
  EClass.ZerothFlowH(Flow)("")()();
  ZerothFlowH.n = APE.s + (0, -20.25cm);
  drawObjects(ZerothFlowH);

  link(associationUni)(ZerothFlowG.ne -- ZerothFlowH.nw);
  item(iStereo)("CMD(3)")
  (obj.s = .45[ZerothFlowG.ne,ZerothFlowH.nw]);

  Flow.foreColor := (.65, .85, .95);
  Flow.iName.fixedHeight := 3.75cm - 2;
  EClass.SecondFlow(Flow)("")()();
  SecondFlow.n = WebInterface.s + (0, -2cm);
  drawObjects(SecondFlow);

  link(associationUni)(begin.c -- SecondFlow.nw);
  item(iStereo)("Drag&Drop")(obj.s = .5[begin.c,SecondFlow.n + (-1cm, .5cm)]);

  Flow.iName.fixedHeight := 2cm - 2;
  EClass.SecondFlowB(Flow)("")()();
  SecondFlowB.n = APEJSF.s - (.24cm, 3cm);
  drawObjects(SecondFlowB);

  link(associationUni)(SecondFlow.ne + (0, -1cm) -- SecondFlowB.nw);
  item(iStereo)("handover()")
  (obj.s = .45[SecondFlow.ne + (0, -1cm),SecondFlowB.nw]);

  link(dependency)(SecondFlowB.sw -- SecondFlow.ne - (0, 3cm));

  Flow.iName.fixedHeight := 4.75cm - 2;
  EClass.SecondFlowC(Flow)("")()();
  SecondFlowC.n = APE.s + (.24cm, -4.75cm);
  drawObjects(SecondFlowC);

  Flow.iName.fixedHeight := 2.75cm - 2;
  EClass.SecondFlowD(Flow)("")()();
  SecondFlowD.n = OSGI.s + (0, -5.75cm);
  drawObjects(SecondFlowD);

  link(associationUni)(SecondFlowC.ne + (0, -1cm) -- SecondFlowD.nw);
  item(iStereo)("TCP(1)")
  (obj.s = .45[SecondFlowC.ne + (0, -1cm),SecondFlowD.nw]);

  link(dependency)(SecondFlowD.sw -- SecondFlowC.ne - (0, 3.75cm));

  Flow.iName.fixedHeight := 3.75cm - 2;
  EClass.ThirdFlowD(Flow)("")()();
  ThirdFlowD.n = OSGI.s - (0, 11cm);
  drawObjects(ThirdFlowD);

  Flow.iName.fixedHeight := 3.75cm - 2;
  EClass.ThirdFlowE(Flow)("")()();
  ThirdFlowE.n = APE.s + (.24cm, -12cm);
  drawObjects(ThirdFlowE);

  link(associationUni)(ThirdFlowD.nw + (0, -1cm) -- ThirdFlowE.ne);
  item(iStereo)("TCP(2)")
  (obj.s = .5[ThirdFlowD.nw + (0, -1cm),ThirdFlowE.ne]);

  link(dependency)(ThirdFlowE.ne - (0, 2cm) -- ThirdFlowD.nw - (0, 3cm));

  Flow.iName.fixedHeight := 2.75cm - 2;
  EClass.ThirdFlowF(Flow)("")()();
  ThirdFlowF.n = APEJSF.s - (0.24cm, 14cm);
  drawObjects(ThirdFlowF);

  Flow.iName.fixedHeight := 1cm - 2;
  EClass.ThirdFlowG(Flow)("")()();
  ThirdFlowG.n = WebInterface.s - (0, 15cm);
  drawObjects(ThirdFlowG);

  link(associationUni)(ThirdFlowF.nw + (0, -1cm) -- ThirdFlowG.ne);
  item(iStereo)("newSession()")
  (obj.s = .5[ThirdFlowF.nw + (0, -1cm),ThirdFlowG.ne]);

  link(dependency)(ThirdFlowG.ne - (0, 1cm) -- ThirdFlowF.nw - (0, 2cm));

  Flow.iName.fixedHeight := 3.75cm - 2;
  EClass.SecondFlowJ(Flow)("")()();
  SecondFlowJ.n = OSGI.s - (0, 18cm);
  drawObjects(SecondFlowJ);

  Flow.iName.fixedHeight := 3.75cm - 2;
  EClass.SecondFlowK(Flow)("")()();
  SecondFlowK.n = APE.s + (.24cm, -19cm);
  drawObjects(SecondFlowK);

  link(associationUni)(SecondFlowJ.nw + (0, -1cm) -- SecondFlowK.ne);
  item(iStereo)("TCP(3)")
  (obj.s = .5[SecondFlowJ.nw + (0, -1cm),SecondFlowK.ne]);

  link(dependency)(SecondFlowK.ne - (0, 2cm) -- SecondFlowJ.nw - (0, 3cm));

  Flow.iName.fixedHeight := 2.75cm - 2;
  EClass.SecondFlowL(Flow)("")()();
  SecondFlowL.n = APEJSF.s - (0.24cm, 21cm);
  drawObjects(SecondFlowL);

  Flow.iName.fixedHeight := 1cm - 2;
  EClass.SecondFlowM(Flow)("")()();
  SecondFlowM.n = WebInterface.s - (0, 22cm);
  drawObjects(SecondFlowM);

  link(associationUni)(SecondFlowL.nw + (0, -1cm) -- SecondFlowM.ne);
  item(iStereo)("deleteSession()")
  (obj.s = .5[SecondFlowL.nw + (0, -1cm),SecondFlowM.ne]);

  link(dependency)(SecondFlowM.ne - (0, 1cm) -- SecondFlowL.nw - (0, 2cm));

endfig;

end;