input metauml;

beginfig(1);

  iComponent.foreColor := (.9, .8, .8);
  iComponent.iNameStack.iPict.iFont.name := "phvb";
  iStereo.iFont.name := "phvr";
  iStereo.iFont.scale := 1;

  Component.SIPClient("SIP Client")();
  Component.JavaApplet("Java Applet")();
  Component.WebInterface("Web Interface")(JavaApplet);
  Component.UserDevice("User Device")(WebInterface, SIPClient);

  Component.PersonalDB("Personal DB")();
  Component.OSGI("OSGi")();
  Component.AS("Application Server")(PersonalDB, OSGI);

  Component.HSSDB("HSS DB")();
  Component.SSCON("SSCON")();
  Component.IMSServer("IMS Server")();
  Component.IMSCore("IMS Core")(IMSServer, HSSDB, SSCON);

  leftToRight(1.5cm)(SIPClient, WebInterface);

  topToBottom(1.5cm)(PersonalDB, OSGI);

  leftToRight(1.5cm)(HSSDB, SSCON);
  topToBottom(1.5cm)(HSSDB, IMSServer);

  leftToRight(1.5cm)(IMSCore, AS);
  topToBottom.right(1.5cm)(AS, UserDevice);

  drawObjects(IMSCore, AS, UserDevice);

  link(dependency)(HSSDB.e -- SSCON.w);
  item(iStereo)("MySQL")(obj.s = .5[HSSDB.e,SSCON.w] + (0, .25cm));

  link(dependency)(.5[HSSDB.s,IMSServer.n] -- HSSDB.s);
  link(dependency)(.5[HSSDB.s,IMSServer.n] -- IMSServer.n);
  item(iStereo)("Diameter")(obj.w = .5[HSSDB.s,IMSServer.n]);

  link(dependency)(.5[IMSServer.s,SIPClient.nw] -- IMSServer.s);
  link(dependency)(.5[IMSServer.s,SIPClient.nw] -- SIPClient.nw);
  item(iStereo)("SIP")(obj.w = .45[IMSServer.s,SIPClient.nw] + (.1cm, .1cm));

  link(dependency)(.5[SSCON.s,SIPClient.n] -- SSCON.s);
  link(dependency)(.5[SSCON.s,SIPClient.n] -- SIPClient.n);
  item(iStereo)("SIP")(obj.w = .55[SSCON.s,SIPClient.n]);

  link(dependency)(SSCON.e -- PersonalDB.w);
  item(iStereo)("MySQL")(obj.s = .5[SSCON.e,PersonalDB.w] + (0, .25cm));

  link(dependency)(PersonalDB.s -- OSGI.n);
  item(iStereo)("MySQL")(obj.w = .5[PersonalDB.s,OSGI.n]);

  link(dependency)(OSGI.w -- SSCON.se);
  item(iStereo)("UDP")(obj.w = .75[OSGI.w,SSCON.se] + (.1cm, .1cm));

  link(dependency)(.5[OSGI.s,WebInterface.n] -- OSGI.s);
  link(dependency)(.5[OSGI.s,WebInterface.n] -- WebInterface.n);
  item(iStereo)("TCP")(obj.w = .45[OSGI.s,WebInterface.n]);

endfig;

end;