Design and Development of a Web-Based GUI for ScaleNet
======================================================

Proyecto Fin de Carrera (Master Thesis-like) of Víctor Pimentel Rodríguez.

Build process
-------------

You will most likely fail if you try to compile this.
First, you need to generate the diagrams:

    ./compile-diagrams.sh

Next, you should build it using `latexmk.pl` (I used the TextMate LaTeX bundle), and it will take a while:

    latexmk -pdf

Alternatively, you can use `pdflatex`, `bibtex`, `makeindex`, a sonic screwdriver… but you need to run the commands several times.
And you will fail anyway because this has only been tried on TexLive and several packages and fonts need to be installed.

Abstract
--------

Many aspects of our everyday life have been drastically affected by the Internet. As society becomes accustomed to the possibilities of working online, habits change accordingly. Traditional applications that are executed natively on the user’s machine are gradually becoming web applications running remotely.

Meanwhile on the client, browsers are steadily improving to become powerful development platforms. This improvement has led to the emergence of highly complex web applications based on HTML, CSS and JavaScript, distributing significant processing loads to the client. At the same time, you get flexible interfaces able to adapt to very different devices.

This thesis documents the development of an advanced web application whose purpose is to control the playback of multimedia content across multiple devices. This application was completed in collaboration with Deutsche Telekom AG, during a six-month stay in Berlin as part of the Erasmus Placement in 2010.

This application is part of the ScaleNet project (2005-2009), a Next Generation Network (NGN) aimed at a system that provides a scalable, cost effective and efficient integration of different wireless and wireline access technologies. The developed component, the Personal Network Administration Interface (PNAI), is only a small part of ScaleNet that serves as an example application on this network.

Although the interface for these operations already existed, a complete redesign was requested to integrate more functionality and to provide a more pleasant user experience. In addition to the primary interface for desktop computers, this document also covers the development of a mobile web interface for modern touch devices.