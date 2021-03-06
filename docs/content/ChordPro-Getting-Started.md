---
title: "Getting started with ChordPro"
description: "Getting started with ChordPro"
---

# Getting started with ChordPro

For a good understanding it is important to know that ChordPro is basically a file transformation program. It reads a file containing lyrics and chords according to the ChordPro File Standard, and produces a neatly formatted PDF document that you can view and print.

When you start the `wxchordpro` program it will therefore show a _File Open_ dialog where you can designate an existing ChordPro file.

* If you have one, select it and its contents will be shown in a new window.
* If you don't have one, press `Cancel` and an empty window will be shown. From the menu bar, choose `Help` > `Insert song example`. A small song will appear in the editor window.

From the menu bar, choose `File` > `Preview`. If all goes well, a preview window will open showing the formatted PDF document. From the preview window you can print and save the PDF document.

Note that you need to have a PDF file viewer application installed, and the system must be configured to use this viewer to open files with `.pdf` extension.

If you are familiar with working on the command line, the basic command to use is:

`chordpro mysong.cho`

This will process `mysong.cho` and produce the PDF document `mysong.pdf`.

`chordpro --help` will give you a list of options that you can pass to the `chordpro` command.

More information can be found in the [User Guide]({{< relref "Using-ChordPro" >}}).