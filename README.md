Developing a Heavy Client-Side Web Application: ScaleNet
===

Proyecto Fin de Carrera de Víctor Pimentel Rodríguez.

Master Thesis of Víctor Pimentel Rodríguez.

Build process
===

Build using latexmk.pl:

    latexmk -pdf

Alternatively, you can use pdflatex and bibtex, but you need to run the
commands several times following this order:

    pdflatex pfc
    bibtex pfc
    pdflatex pfc
    pdflatex pfc

Abstract
===

Many aspects of our everyday life has been drastically affected by the Internet. As society becomes accustomed to the possibilities of working online, habits change accordingly. Traditional applications that are executed natively on the user’s machine are gradually becoming web applications running remotely.

Meanwhile on the client, browsers are steadily improving to become powerful development platforms. This improvement has led to the emer- gence of highly complex web applications based on HTML, CSS and JavaScript, distributing significant processing loads to the client. At the same time, you get flexible interfaces able to adapt to very different devices.

This thesis documents the development of an advanced web application whose purpose is to control the playback of multimedia content across multiple devices. This application was completed in collaboration with Deutsche Telekom AG, during a six-month stay in Berlin as part of the Erasmus Placement in 2010.

This application is part of the ScaleNet project (2005-2009), a next- generation network aimed at a system that provides a scalable, cost effective and efficient integration of different wireless and wireline access tech- nologies. The developed component, the Personal Network Administration Interface (PNAI), is only a small part of ScaleNet that serves as an example application on this network.

Although the interface for these operations already exist, a complete redesign was requested to integrate more functionality and to provide a more pleasant user experience. In addition to the primary interface for desktop computers, this document also covers the development of a mobile web interface for modern touch devices.