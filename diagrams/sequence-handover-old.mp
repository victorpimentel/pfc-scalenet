input metauml;

beginfig(1);

  iClassNameOnly.foreColor := (.9, .8, .8);
  iClassNameOnly.iName.iFont.name := "phvb";
  iStereo.iFont.name := "phvr";
  iStereo.iFont.scale := 1;
  ClassInfoCopy.Flow(iClassNameOnly);
  Flow.iName.fixedWidth := .24cm;

  EClass.WebInterface(iClassNameOnly)("Web Interface")()();
  EClass.JavaApplet(iClassNameOnly)("Java Applet")()();
  EClass.OSGI(iClassNameOnly)("OSGi")()();
  EClass.PersonalDB(iClassNameOnly)("Personal DB")()();
  EClass.SSCON(iClassNameOnly)("SSCON")()();
  EClass.AS(iClassNameOnly)("Application Server")()();
  EClass.ClientA(iClassNameOnly)("Client A")()();
  EClass.ClientB(iClassNameOnly)("Client B")()();

  leftToRight(.5cm)(WebInterface, JavaApplet, OSGI, PersonalDB, SSCON, AS,
  ClientA, ClientB);
  drawObjects(WebInterface, JavaApplet, OSGI, PersonalDB, SSCON, AS,
  ClientA, ClientB);

  link(dashedLink)(ClientA.s -- ClientA.s + (0, -30cm));
  link(dashedLink)(ClientB.s -- ClientB.s + (0, -30cm));
  link(dashedLink)(WebInterface.s -- WebInterface.s + (0, -30cm));
  link(dashedLink)(JavaApplet.s -- JavaApplet.s + (0, -30cm));
  link(dashedLink)(OSGI.s -- OSGI.s + (0, -30cm));
  link(dashedLink)(PersonalDB.s -- PersonalDB.s + (0, -30cm));
  link(dashedLink)(SSCON.s -- SSCON.s + (0, -30cm));
  link(dashedLink)(AS.s -- AS.s + (0, -30cm));

  Flow.foreColor := (.95, .95, .8);
  Flow.iName.fixedHeight := 17cm - 2;
  EClass.FirstFlow(Flow)("")()();
  FirstFlow.n = ClientA.s + (0, -1cm);
  drawObjects(FirstFlow);

  link(associationUni)(AS.s + (0, -1cm) -- FirstFlow.nw);
  item(iStereo)("Video stream")(obj.s = .4[AS.s,ClientA.s] + (0, -1cm));

  Begin.begin;
  begin.c = WebInterface.n + (-1cm, -3cm) - (0, 1);
  drawObjects(begin);

  Flow.foreColor := (.65, .85, .95);
  Flow.iName.fixedHeight := 4.75cm - 2;
  EClass.SecondFlow(Flow)("")()();
  SecondFlow.n = WebInterface.s + (0, -2cm);
  drawObjects(SecondFlow);

  link(associationUni)(begin.c -- SecondFlow.nw);
  item(iStereo)("Drag&Drop")(obj.s = .5[begin.c,SecondFlow.n + (-1cm, .5cm)]);

  Flow.iName.fixedHeight := 3cm - 2;
  EClass.SecondFlowB(Flow)("")()();
  SecondFlowB.n = JavaApplet.s + (0, -3cm);
  drawObjects(SecondFlowB);

  link(associationUni)(SecondFlow.ne + (0, -1cm) -- SecondFlowB.nw);
  item(iStereo)("handover()")
  (obj.s = .45[SecondFlow.ne + (0, -1cm),SecondFlowB.nw]);

  link(dependency)(SecondFlowB.sw -- SecondFlow.ne - (0, 4cm));

  Flow.iName.fixedHeight := 3.75cm - 2;
  EClass.SecondFlowC(Flow)("")()();
  SecondFlowC.n = OSGI.s + (0, -4cm);
  drawObjects(SecondFlowC);

  link(associationUni)(SecondFlowB.ne + (0, -1cm) -- SecondFlowC.nw);
  item(iStereo)("TCP(1)")
  (obj.s = .45[SecondFlowB.ne + (0, -1cm),SecondFlowC.nw]);

  link(dependency)(SecondFlowC.nw - (0, 1cm) -- SecondFlowB.ne - (0, 2cm));

  Flow.iName.fixedHeight := 3.75cm - 2;
  EClass.SecondFlowD(Flow)("")()();
  SecondFlowD.n = SSCON.s + (0, -6cm);
  drawObjects(SecondFlowD);

  link(associationUni)(SecondFlowC.ne + (0, -2cm) -- SecondFlowD.nw);
  item(iStereo)("UDP(1)")
  (obj.s = .3[SecondFlowC.ne + (0, -2cm),SecondFlowD.nw]);

  link(dependency)(SecondFlowD.nw - (0, 1cm) -- SecondFlowC.ne - (0, 3cm));

  Flow.iName.fixedHeight := 15.75cm - 2;
  EClass.SecondFlowE(Flow)("")()();
  SecondFlowE.n = ClientA.s - (.24cm, 8cm);
  drawObjects(SecondFlowE);

  link(associationUni)(SecondFlowD.ne + (0, -2cm) -- SecondFlowE.nw);
  item(iStereo)("SIP(1)")
  (obj.s = .35[SecondFlowD.ne + (0, -2cm),SecondFlowE.nw]);

  link(dependency)(SecondFlowE.nw - (0, 1cm) -- SecondFlowD.ne - (0, 3cm));

  Flow.iName.fixedHeight := 2.75cm - 2;
  EClass.SecondFlowF(Flow)("")()();
  SecondFlowF.n = AS.s + (0, -10cm);
  drawObjects(SecondFlowF);

  link(associationUni)(SecondFlowE.nw + (0, -2cm) -- SecondFlowF.ne);
  item(iStereo)("SIP(2)")
  (obj.s = .45[SecondFlowE.nw + (0, -2cm),SecondFlowF.ne]);

  link(dependency)(SecondFlowF.ne - (0, 1cm) -- SecondFlowE.nw - (0, 3cm));

  Flow.iName.fixedHeight := 18cm - 2;
  Flow.foreColor := (.95, .95, .8);
  EClass.FirstFlowB(Flow)("")()();
  FirstFlowB.n = ClientB.s + (0cm, -12cm);
  drawObjects(FirstFlowB);

  link(associationUni)(SecondFlowF.ne + (0, -2cm) -- FirstFlowB.nw);
  item(iStereo)("Video stream")
  (obj.s = .25[SecondFlowF.ne + (0, -2cm),FirstFlowB.nw]);

  Flow.foreColor := (.65, .85, .95);
  Flow.iName.fixedHeight := 2.75cm - 2;
  EClass.ThirdFlow(Flow)("")()();
  ThirdFlow.n = ClientB.s - (.24cm, 13cm);
  drawObjects(ThirdFlow);

  Flow.iName.fixedHeight := 3.75cm - 2;
  EClass.ThirdFlowB(Flow)("")()();
  ThirdFlowB.n = SSCON.s - (0, 14cm);
  drawObjects(ThirdFlowB);

  link(associationUni)(ThirdFlow.nw + (0, -1cm) -- ThirdFlowB.ne);
  item(iStereo)("SIP(3)")
  (obj.s = .5[ThirdFlow.nw + (0, -1cm),ThirdFlowB.ne]);

  link(dependency)(ThirdFlowB.ne - (0, 1cm) -- ThirdFlow.nw - (0, 2cm));

  Flow.iName.fixedHeight := 3.75cm - 2;
  EClass.ThirdFlowC(Flow)("")()();
  ThirdFlowC.n = PersonalDB.s - (0, 16cm);
  drawObjects(ThirdFlowC);

  link(associationUni)(ThirdFlowB.nw + (0, -2cm) -- ThirdFlowC.ne);
  item(iStereo)("MySQL")
  (obj.s = .5[ThirdFlowB.nw + (0, -2cm),ThirdFlowC.ne]);

  link(dependency)(ThirdFlowC.ne - (0, 1cm) -- ThirdFlowB.nw - (0, 3cm));

  Flow.iName.fixedHeight := 3.75cm - 2;
  EClass.ThirdFlowD(Flow)("")()();
  ThirdFlowD.n = OSGI.s - (0, 18cm);
  drawObjects(ThirdFlowD);

  link(associationUni)(ThirdFlowC.nw + (0, -2cm) -- ThirdFlowD.ne);
  item(iStereo)("MySQL")
  (obj.s = .5[ThirdFlowC.nw + (0, -2cm),ThirdFlowD.ne]);

  link(dependency)(ThirdFlowD.ne - (0, 1cm) -- ThirdFlowC.nw - (0, 3cm));

  Flow.iName.fixedHeight := 3.75cm - 2;
  EClass.ThirdFlowE(Flow)("")()();
  ThirdFlowE.n = JavaApplet.s - (0, 20cm);
  drawObjects(ThirdFlowE);

  link(associationUni)(ThirdFlowD.nw + (0, -2cm) -- ThirdFlowE.ne);
  item(iStereo)("TCP(2)")
  (obj.s = .5[ThirdFlowD.nw + (0, -2cm),ThirdFlowE.ne]);

  link(dependency)(ThirdFlowE.ne - (0, 1cm) -- ThirdFlowD.nw - (0, 3cm));

  Flow.iName.fixedHeight := 1cm - 2;
  EClass.ThirdFlowF(Flow)("")()();
  ThirdFlowF.n = WebInterface.s - (0, 22cm);
  drawObjects(ThirdFlowF);

  link(associationUni)(ThirdFlowE.nw + (0, -2cm) -- ThirdFlowF.ne);
  item(iStereo)("newSession()")
  (obj.s = .5[ThirdFlowE.nw + (0, -1.5cm),ThirdFlowF.ne]);

  link(dependency)(ThirdFlowF.ne - (0, 1cm) -- ThirdFlowE.nw - (0, 3cm));

  Flow.iName.fixedHeight := 2.75cm - 2;
  EClass.SecondFlowG(Flow)("")()();
  SecondFlowG.n = AS.s + (0, -16cm);
  drawObjects(SecondFlowG);

  link(associationUni)(SecondFlowE.nw + (0, -8cm) -- SecondFlowG.ne);
  item(iStereo)("SIP(4)")
  (obj.s = .45[SecondFlowE.nw + (0, -8cm),SecondFlowG.ne]);

  link(dependency)(SecondFlowG.ne - (0, 1cm) -- SecondFlowE.nw - (0, 9cm));

  link(associationUni)(SecondFlowG.ne - (0, 2cm) -- FirstFlow.sw);
  item(iStereo)("Stop stream")
  (obj.s = .45[SecondFlowG.ne - (0, 2cm),FirstFlow.sw]);

  Flow.iName.fixedHeight := 3.75cm - 2;
  EClass.SecondFlowH(Flow)("")()();
  SecondFlowH.n = SSCON.s + (0, -19cm);
  drawObjects(SecondFlowH);

  link(associationUni)(SecondFlowE.nw + (0, -11cm) -- SecondFlowH.ne);
  item(iStereo)("SIP(5)")
  (obj.s = .3[SecondFlowE.nw + (0, -11cm),SecondFlowH.ne]);

  link(dependency)(SecondFlowH.ne - (0, 1cm) -- SecondFlowE.nw - (0, 12cm));

  Flow.iName.fixedHeight := 3.75cm - 2;
  EClass.SecondFlowI(Flow)("")()();
  SecondFlowI.n = PersonalDB.s - (0, 21cm);
  drawObjects(SecondFlowI);

  link(associationUni)(SecondFlowH.nw + (0, -2cm) -- SecondFlowI.ne);
  item(iStereo)("MySQL")
  (obj.s = .5[SecondFlowH.nw + (0, -2cm),SecondFlowI.ne]);

  link(dependency)(SecondFlowI.ne - (0, 1cm) -- SecondFlowH.nw - (0, 3cm));

  Flow.iName.fixedHeight := 3.75cm - 2;
  EClass.SecondFlowJ(Flow)("")()();
  SecondFlowJ.n = OSGI.s - (0, 23cm);
  drawObjects(SecondFlowJ);

  link(associationUni)(SecondFlowI.nw + (0, -2cm) -- SecondFlowJ.ne);
  item(iStereo)("MySQL")
  (obj.s = .5[SecondFlowI.nw + (0, -2cm),SecondFlowJ.ne]);

  link(dependency)(SecondFlowJ.ne - (0, 1cm) -- SecondFlowI.nw - (0, 3cm));

  Flow.iName.fixedHeight := 3.75cm - 2;
  EClass.SecondFlowK(Flow)("")()();
  SecondFlowK.n = JavaApplet.s - (0, 25cm);
  drawObjects(SecondFlowK);

  link(associationUni)(SecondFlowJ.nw + (0, -2cm) -- SecondFlowK.ne);
  item(iStereo)("TCP(3)")
  (obj.s = .5[SecondFlowJ.nw + (0, -2cm),SecondFlowK.ne]);

  link(dependency)(SecondFlowK.ne - (0, 1cm) -- SecondFlowJ.nw - (0, 3cm));

  Flow.iName.fixedHeight := 1cm - 2;
  EClass.SecondFlowL(Flow)("")()();
  SecondFlowL.n = WebInterface.s - (0, 27cm);
  drawObjects(SecondFlowL);

  link(associationUni)(SecondFlowK.nw + (0, -2cm) -- SecondFlowL.ne);
  item(iStereo)("deleteSession()")
  (obj.s = .5[SecondFlowK.nw + (0, -1.5cm),SecondFlowL.ne]);

  link(dependency)(SecondFlowL.ne - (0, 1cm) -- SecondFlowK.nw - (0, 3cm));

endfig;

end;