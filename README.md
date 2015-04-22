# The JHipster Mini-Book

This is an awesome book. It's written in AsciiDoc that compiles to HTML, PDF, & epub3 using the Asciidoctor Gradle plugin.

## Building

To convert the AsciiDoc to HTML, PDF, & epub3, invoke the 'asciidoctor' goal with the following command:
```
$ ./gradlew asciidoctor
```

* Open _build/asciidoc/epub3/book.epub_  in your browser to see the generated epub file.
* Open _build/asciidoc/html5/book.html_ in your browser to see the generated HTML file.
* Open _build/asciidoc/pdf/book.pdf_ in your browser to see the generated PDF file.

## Sweet Authoring Experience
If you'd like a very pleasant authoring experience, the project provides build files that make it possible. First of all,
you'll need to run the above `gradlew` command once. After running it once, you can run `./gradlew watch` to watch for any changes
and recompile files as you save them. 

To have a similar awesome experience (watch and auto-reload), please install and configure the following dependencies on your machine:

* [Git](http://git-scm.com/): [The Github Guide to Installing Git](https://help.github.com/articles/set-up-git/) is a good source of information.
* [Node.js](https://nodejs.org/): Node allows you to run JavaScript programs that simplify web development.

After installing Node, you should be able to run the following command to install development tools (like [BrowserSync](http://www.browsersync.io/)). You will only need to run this command when dependencies change in package.json.
```
#!shell
npm install
```
This project use [Grunt](http://gruntjs.com/) as the client-code build system. You can install the `grunt` command-line tool globally with:
```
#!shell
npm install -g grunt-cli
```
Now you can run the following `grunt` command to create a blissful development experience where your browser auto-refreshes when files change on your hard drive.
```
#!shell
grunt serve
```